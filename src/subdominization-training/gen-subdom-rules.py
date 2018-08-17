#! /usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function

from collections import defaultdict
import itertools

from pddl_parser import parsing_functions
from pddl_parser import lisp_parser
import argparse
import copy

class Rule:
     def __init__ (self, action_schema, rule):
         self.action_schema = action_schema
         parameters = [x.name for x in action_schema.parameters]
         self.head = "{} ({})".format(action_schema.name, ", ".join(parameters))
         self.body = [rule]


     def __repr__(self):
         return "{} :- {}.".format(self.head, ", ".join(self.body))


def partition(collection):
    if len(collection) == 1:
        yield [ collection ]
        return

    first = collection[0]
    for smaller in partition(collection[1:]):
        # insert `first` in each of the subpartition's subsets
        for n, subset in enumerate(smaller):
            yield smaller[:n] + [[ first ] + subset]  + smaller[n+1:]
        # put `first` in its own subset 
        yield [ [ first ] ] + smaller

def type_matches (type_dict, type1, type2):
     def sub_type (t1, t2):
          if t1 == t2:
               return True

          suptype = type_dict [t1].basetype_name
          if suptype:
               return sub_type (suptype, type2)
          return False
     
     return sub_type (type1, type2) or sub_type (type2, type1)

def get_equality_rules(type_dict, action_schema):
    parameter_pairs = [(a.name, b.name) for (a, b) in itertools.combinations (action_schema.parameters, 2) if type_matches(type_dict, a.type_name, b.type_name)]
    rules = []
    for argpair in parameter_pairs:
                rules.append(Rule(action_schema, "equal:(%s, %s)" % argpair))

    return rules

     
def get_predicate_combinations_with_mandatory_parameter (predicates, constants, type_dict, parameters, mandatory_parameter):
     predicate_combinations = []
     for p in predicates:
          valid_positions_mandatory = [i for (i, arg) in enumerate(p.arguments) if type_matches(type_dict, mandatory_parameter.type_name, arg.type_name)]

          for pos in valid_positions_mandatory:
               valid_arguments_parameters = [[mandatory_parameter.name] if i == pos else ( ["_"] + [x.name for x in parameters if type_matches(type_dict, x.type_name, arg.type_name)]) for (i, arg) in enumerate(p.arguments)]
               valid_arguments_constants = [["_"] + [x.name for x in constants if type_matches(type_dict, x.type_name, arg.type_name)] for arg in p.arguments]
               for combination in itertools.product(*valid_arguments_parameters):
                    if set(combination) == set("_"):
                         continue

                    valid_arguments = [[x] if x != "_" else valid_arguments_constants[i] for (i, x) in enumerate (combination)]
                    for combination in itertools.product(*valid_arguments):
                         predicate_combinations.append((p.name, combination))
                    
     return predicate_combinations



class PartiallyInstantiatedPredicateList:    
     def __init__(self, action_schema, predicate_list, params, free_vars = []):
          self.action_schema = copy.deepcopy(action_schema)
          self.parameters = copy.deepcopy(params)

          if len (free_vars) > 1:
               self.free_variables = []
               self.predicate_list = []
               fv_renaming = {}
               fvid = 0
               for p in sorted(predicate_list):
                    new_args = []
                    for arg in p[1]:
                         if arg in fv_renaming:
                              new_args.append(fv_renaming[arg])
                         elif arg.startswith("?fv"):
                              new_name = "?fv{}".format(fvid)
                              fv_renaming[arg] = new_name
                              old_fv = [f for f in free_vars if f.name == arg]
                              assert(len(old_fv) == 1)
                              new_fv = copy.deepcopy(old_fv[0])
                              new_fv.name = new_name
                              self.free_variables.append(new_fv)
                              fvid += 1
                              new_args.append(new_name)
                         else:
                              new_args.append(arg)
                         
                    self.predicate_list.append((p[0], tuple(new_args)))                         
          else:
               self.predicate_list = copy.deepcopy(sorted(predicate_list))
               self.free_variables = copy.deepcopy(free_vars)

          assert (len(self.predicate_list) == len(predicate_list))


          for fv in self.free_variables:
               assert (sum([1 for p, args in self.predicate_list if fv.name in list(args)]) > 1) 

     def get_rules(self):
          rules = []
          for combination in itertools.product(*[["ini", "goal"] for x in self.predicate_list]):

               rule_text_list = ["{}:{}({})".format(combination[i], pred[0], ", ".join(pred[1])) for (i, pred) in enumerate(self.predicate_list)]
               if len(set (rule_text_list)) == len(rule_text_list):
                    rules.append(Rule(self.action_schema, ";".join(rule_text_list)))

          return rules

     def extend(self, predicates, constants, type_dict):
          res = []
          
          # Add a free variable in some of the predicates
          for p_index, pred in enumerate (self.predicate_list):
               last_predicate = [p for p in predicates if p.name == pred[0]] [0]
               for i, arg in enumerate(pred[1]):
                    if arg == "_":
                         mandatory_argument = last_predicate.arguments[i]
                         mandatory_argument.name = "?fv%d" % len(self.free_variables)
                         new_args = list(pred[1])
                         new_args[i] = mandatory_argument.name
                         new_p_list = self.predicate_list[:p_index] + self.predicate_list[p_index+1:]
                         new_p_list.append((pred[0], tuple(new_args)) )
                         for pre in get_predicate_combinations_with_mandatory_parameter(predicates, constants, type_dict, self.parameters, mandatory_argument):
                              res.append(PartiallyInstantiatedPredicateList(self.action_schema, new_p_list + [pre], self.parameters, self.free_variables + [mandatory_argument] ))

          # Reuse a free variable
          for fv in self.free_variables:
               for pre in get_predicate_combinations_with_mandatory_parameter(predicates, constants, type_dict, self.parameters, fv):
                         res.append(PartiallyInstantiatedPredicateList(self.action_schema, self.predicate_list + [pre], self.parameters, self.free_variables ))


          return res

     def __eq__ (self, other):
          return self.predicate_list == other.predicate_list

     def __hash__(self):
          return hash(tuple(self.predicate_list))

          

def get_predicate_combinations (predicates, constants, type_dict,  parameters):
     predicate_combinations = set()
     for p in predicates:          
          valid_arguments_parameters = [["_"] + [x.name for x in parameters if type_matches(type_dict, x.type_name, arg.type_name)] for arg in p.arguments]
          valid_arguments_constants = [["_"] + [x.name for x in constants if type_matches(type_dict, x.type_name, arg.type_name)] for arg in p.arguments]
          for combination in itertools.product(*valid_arguments_parameters):
               if set(combination) == set("_"):
                    continue

               valid_arguments = [[x] if x != "_" else valid_arguments_constants[i] for (i, x) in enumerate (combination)]
               for combination in itertools.product(*valid_arguments):
                    predicate_combinations.add(PartiallyInstantiatedPredicateList(a, [(p.name, combination)], a.parameters))                        
                    
     return predicate_combinations

if __name__ == "__main__":


    argparser = argparse.ArgumentParser()
    argparser.add_argument("domain", type=argparse.FileType('r'), help="Domain file")
    argparser.add_argument("--store_rules", type=argparse.FileType('w'), help="Results file")
    argparser.add_argument("--rule_size", type=int, help="Maximum rule size", default=1)

    options = argparser.parse_args()

    domain_pddl = lisp_parser.parse_nested_list(options.domain)
    
    domain_name, domain_requirements, types, type_dict, constants, predicates, predicate_dict, functions, actions, axioms = parsing_functions.parse_domain_pddl(domain_pddl)

    
    predicates = [p for p in predicates if p.name != "="]
   

    if options.store_rules:
         frules = options.store_rules
         
    for a in actions:
          print ("Generate candidate rules for action %s" % a.name)

          predicate_combinations = list(get_predicate_combinations(predicates, constants, type_dict, a.parameters))

          new_predicate_combinations = predicate_combinations
          for i in range (2, options.rule_size+1):
               new_predicate_combinations = set([pre for p in new_predicate_combinations for pre in p.extend(predicates, constants, type_dict)])
               predicate_combinations += list(new_predicate_combinations)
          
          rules = get_equality_rules (type_dict, a) + [rule for predcom in predicate_combinations for rule in predcom.get_rules() ]

                    
          if options.store_rules:
               options.store_rules.write("\n".join(map(str, rules)) + "\n")
          else:
               print("\n".join(map(str, rules)))


          print (len(rules))
          print()


        

