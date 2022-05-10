#! /usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function

from collections import defaultdict
import itertools
from typing import List
from pddl_parser import parsing_functions
from pddl_parser import lisp_parser
import argparse
import copy
import os
import pddl

try:
    # Python 3.x
    from builtins import open as file_open
except ImportError:
    # Python 2.x
    from codecs import open as file_open

def parse_pddl_file(type, filename):
    try:
        # The builtin open function is shadowed by this module's open function.
        # We use the Latin-1 encoding (which allows a superset of ASCII, of the
        # Latin-* encodings and of UTF-8) to allow special characters in
        # comments. In all other parts, we later validate that only ASCII is
        # used.
        return lisp_parser.parse_nested_list(file_open(filename,
                                                       encoding='ISO-8859-1'))
    except IOError as e:
        raise SystemExit("Error: Could not read file: %s\nReason: %s." %
                         (e.filename, e))
    except lisp_parser.ParseError as e:
        raise SystemExit("Error: Could not parse %s file: %s\nReason: %s." %
                         (type, filename, e))


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
               return sub_type (suptype, t2)
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


def read_runs_folder(runs_folder):
     ini_predicates = set()
     goal_predicates = set()
     for task_run in sorted(os.listdir(runs_folder)):
          if not os.path.isfile('{}/{}/{}'.format(runs_folder, task_run, 'sas_plan')):
               continue

          domain_filename = '{}/{}/{}'.format(runs_folder, task_run, "domain.pddl")
          task_filename = '{}/{}/{}'.format(runs_folder, task_run, "problem.pddl")
          
          domain_pddl = parse_pddl_file("domain", domain_filename)
          task_pddl = parse_pddl_file("task", task_filename)
          task = parsing_functions.parse_task(domain_pddl, task_pddl)

          
          ini_predicates.update([p.predicate for p in task.init if type(p) != pddl.Assign])
          goal_predicates.update([p.predicate for p in task.goal.parts])

     return ini_predicates, goal_predicates

class PartiallyInstantiatedPredicateList:
     def __repr__(self) -> str:
          return f"PartiallyInstantiatedPredicateList(\
action_name={self.action_schema.name},\
predicate_list={self.predicate_list},\
free_variables={self.free_variables})"\



     # Example of action_scheme, [(p.name, combination)], a.parameters)
     # action_scheme = <Action 'turn_to'>,
     # predicate_list = [('on_board', ('_', '?s'))],
     # params = [<TypedObject ?s: satellite>, <TypedObject ?d_new: direction>, <TypedObject ?d_prev: direction>]

     def __init__(self, action_schema, predicate_list, params, free_vars = []):

          self.action_schema = action_schema
          self.parameters = copy.deepcopy(params)
          print(f'Free vars: {free_vars}')

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

     def get_rules(self, predicates_ini, predicates_goal):
          rules = []
          # print(f'This is the action: {a}')
          # print(f'predicates_ini: {predicates_ini}')
          # print(f'predicates_goal: {predicates_goal}')
          # print(f'Predicate list: {self.predicate_list}')

          # We are only making combinations that are restricted by presence of some predicate in either ini or goal setup
          # As shown below, have_image is only present in the goal so there is no need to make combinations that include it in the ini
          # Therefore all combination that start will ini will for sure not make sense
          # Example
               # predicates_ini: {'on_board', '=', 'power_avail', 'calibration_target', 'pointing', 'supports'}
               # predicates_goal: {'pointing', 'have_image'}
               # Predicate list: [('have_image', ('?fv0', '?m')), ('pointing', ('?fv1', '?fv0')), ('pointing', ('?fv1', '_'))]
               # Skipped: ('ini', 'ini', 'ini')
               # Skipped: ('ini', 'ini', 'goal')
               # Skipped: ('ini', 'goal', 'ini')
               # Skipped: ('ini', 'goal', 'goal')
               # Used: ('goal', 'ini', 'ini')
               # Used: ('goal', 'ini', 'goal')
               # Used: ('goal', 'goal', 'ini')
               # Used: ('goal', 'goal', 'goal')

          for combination in itertools.product(*[["ini", "goal"] for x in self.predicate_list]):

               if not all ([(combination[i] == "ini" and pred[0] in predicates_ini) or (combination[i] == "goal" and pred[0] in predicates_goal)  for (i, pred) in enumerate(self.predicate_list)]):
                    continue
               
               # Add either ini: or goal: to the predicates according to current combination, 
               #  e.g if (ini, ini, goal) then 1st and 2nd predicate start with ini and 3rd with goal
               rule_text_list = ["{}:{}({})".format(combination[i], pred[0], ", ".join(pred[1])) for (i, pred) in enumerate(self.predicate_list)]
               # print(f'rule_text_list: {rule_text_list}')
               if len(set (rule_text_list)) == len(rule_text_list):
                    rules.append(Rule(self.action_schema, ";".join(rule_text_list)))
          return rules
     
     def extend(self, predicates: List[pddl.predicates.Predicate], constants, type_dict):
          res = []
          # print("############################################################################################")
          # print(f'Action schema: {self.action_schema}')
          # print(f'All predicates {predicates}')
          # print(f'Local predicate list {self.predicate_list}')
          # print(f'Free variables {self.free_variables}')
          # print("############################################################################################")

          # Add a free variable in some of the predicates
          for p_index, pred in enumerate (self.predicate_list):
               print(f'The predicate {pred}')
               original_predicate = [p for p in predicates if p.name == pred[0]] [0]
               # Example
                    # pred = 'pointing', ('?s', '_')
                    # last_predicate = pointing(?s: satellite, ?d: direction)

               # We iterate over the arguments of the predicate
               # Example
                    # Iter 0: '?s'
                    # Iter 1: '_'
               for i, arg in enumerate(pred[1]):
                    print(f'Argument {arg}')
                    if arg == "_":
                         # Use the index of the current argument to retrieve the actual argument from the original_predicate object
                         # if we have pointing('_'...) we want to find pointing(?s: satellite...)
                         mandatory_argument = original_predicate.arguments[i]
                         mandatory_argument.name = "?fv%d" % len(self.free_variables)
                         new_args = list(pred[1])  # copy pred[1]
                         print(f'new_args: {new_args}')
                         # We replace the "_" with the new free variable name
                         # Example
                              # new_args = ('?s', '_') --> before
                              # new_args = ('?s', '?fv0') --> after
                         new_args[i] = mandatory_argument.name

                         new_p_list = self.predicate_list[:p_index] + self.predicate_list[p_index+1:]
                         new_p_list.append((pred[0], tuple(new_args)) )
                         
                         # As free_variables is defined in constructor and is an object, it will be shared among all objects and behave as a class variable
                         for pre in get_predicate_combinations_with_mandatory_parameter(predicates, constants, type_dict, self.parameters, mandatory_argument):
                              res.append(PartiallyInstantiatedPredicateList(self.action_schema, new_p_list + [pre], self.parameters, self.free_variables + [mandatory_argument] ))

          # Reuse a free variable
          for fv in self.free_variables:
               for pre in get_predicate_combinations_with_mandatory_parameter(predicates, constants, type_dict, self.parameters, fv):
                         res.append(PartiallyInstantiatedPredicateList(self.action_schema, self.predicate_list + [pre], self.parameters, self.free_variables ))

          for r in res:
               print(r)
          # input("dawaj jazda")
          return res

     def __eq__ (self, other):
          return self.predicate_list == other.predicate_list

     def __hash__(self):
          return hash(tuple(self.predicate_list))

          

def get_predicate_combinations (predicates, constants, type_dict,  parameters):
     """
     parameters(of the action): [<TypedObject ?s: satellite>, <TypedObject ?d_new: direction>, <TypedObject ?d_prev: direction>]

     
     predicates: [on_board(?i: instrument, ?s: satellite), supports(?i: instrument, ?m: mode),
                  pointing(?s: satellite, ?d: direction),  power_avail(?s: satellite), power_on(?i: instrument)
                  calibrated(?i: instrument), have_image(?d: direction, ?m: mode), calibration_target(?i: instrument, ?d: direction)]

     """
     # print('Getting predicate combinations')
     # print(f'Predicates: {predicates}')
     # print(f'Constants: {constants}')
     # print(f'Type dict: {type_dict}')
     # print(f'Parameters: {parameters}')

     predicate_combinations = set()
     for p in predicates:
          # print(f'looking at {p}')  # p.arguments: [<TypedObject ?i: instrument>, <TypedObject ?s: satellite>]


          # _ is a wildcard if the parameter present in the current predicate is not present in the action
          # If the parameter is present both in the action and current predicate then the name is simply the name of the parameter e.g "d_new?"
          # Example:
                    # action: [turn_to (?s, ?d_new, ?d_prev)    
                    # predicate: on_board(?i: instrument, ?s: satellite)
                    # valid_arguments_parameters: [['_'], ['_', '?s']]

          valid_arguments_parameters = [["_"] + [x.name for x in parameters if type_matches(type_dict, x.type_name, arg.type_name)] for arg in p.arguments]
          valid_arguments_constants = [["_"] + [x.name for x in constants if type_matches(type_dict, x.type_name, arg.type_name)] for arg in p.arguments]

          # Example for combination 
               # action = [turn_to (?s, ?d_new, ?d_prev)
               # predicate = pointing(?s: satellite, ?d: direction)
               # valid_arguments_parameters = [['_', '?s'], ['_', '?d_new', '?d_prev']]
               # Combination: ('_', '_')
               # Combination: ('_', '?d_new')
               # Combination: ('_', '?d_prev')
               # Combination: ('?s', '_')
               # Combination: ('?s', '?d_new')
               # Combination: ('?s', '?d_prev')
               
          for combination in itertools.product(*valid_arguments_parameters):
               # print(f'Combination: {combination}')
               if set(combination) == set("_"):
                    continue

               valid_arguments = [[x] if x != "_" else valid_arguments_constants[i] for (i, x) in enumerate (combination)]
               for combination in itertools.product(*valid_arguments):

                    # Example of a, [(p.name, combination)], a.parameters)
                    # a = <Action 'turn_to'> 
                    # list of tuples of [(p.name, combination)] = [('on_board', ('_', '?s'))] 
                    # [<TypedObject ?s: satellite>, <TypedObject ?d_new: direction>, <TypedObject ?d_prev: direction>]

                    predicate_combinations.add(PartiallyInstantiatedPredicateList(a, [(p.name, combination)], a.parameters))                        

     return predicate_combinations

if __name__ == "__main__":

    argparser = argparse.ArgumentParser()
    argparser.add_argument("domain", type=argparse.FileType('r'), help="Domain file")
    argparser.add_argument("--store_rules", type=argparse.FileType('w'), help="Results file")
    argparser.add_argument("--rule_size", type=int, help="Maximum rule size", default=1)
    argparser.add_argument("--num_rules", type=int, help="Maximum rule size", default=100000000)
    argparser.add_argument("--runs", help="path to the runs folders")
    
    options = argparser.parse_args()

    domain_pddl = lisp_parser.parse_nested_list(options.domain)
    
    domain_name, domain_requirements, types, type_dict, constants, predicates, predicate_dict, functions, actions, axioms = parsing_functions.parse_domain_pddl(domain_pddl)

    predicates = [p for p in predicates if p.name != "="]
   

    if options.store_rules:
         frules = options.store_rules

    if options.runs:
         predicates_ini, predicates_goal = read_runs_folder(options.runs)
    else:
          predicates_ini = set([p.name for p in predicates])
          predicates_goal = predicates_ini
          
    for a in actions:
          # print(f'Action: {a}, {a.parameters}')
          # print(f'Predicates: {predicates}')
          rules = get_equality_rules (type_dict, a)
          # print(f'Equality rules: {rules}')
          predicate_combinations = list(get_predicate_combinations(predicates, constants, type_dict, a.parameters))
          for pred in predicate_combinations:
               # print(f'Predicate combination: {pred}')
          # input('Basic Partially initialized predicates finished')
          i = 1
          while True:
              new_rules = [rule for predcom in predicate_combinations for rule in predcom.get_rules(predicates_ini, predicates_goal) ]
              rules += new_rules

              i += 1
              if len(rules) > options.num_rules or i > options.rule_size:
                  break

              predicate_combinations = set([pre for p in predicate_combinations for pre in p.extend(predicates, constants, type_dict)])
          #     print('finished extending')
          #     print(f'Predicate combinations: {predicate_combinations}')
                    
          if options.store_rules:
               options.store_rules.write("\n".join(map(str, rules)) + "\n")
          else:
               print("\n".join(map(str, rules)))








