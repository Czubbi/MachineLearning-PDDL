from collections import defaultdict
import itertools
from tkinter import N
import pddl
import logging
from typing import List, Union

def  valid_values(variables, values, variable_domains):
        assert (len (variables) == len(values))#, "Error: {} {}".format(str(variables), str(values)))
        return all(values[i] in variable_domains[var] for i, var in  enumerate (variables))


class FreeVariableConstraint:
        def __repr__(self) -> str:
                return f'FVC(action_arguements:{self.action_arguments},  fv:{self.free_variables} cv:{self.compliant_values})'
        def __init__(self, action_arguments_rule, free_variables, compliant_values):
                self.action_arguments = action_arguments_rule
                self.free_variables = free_variables
                self.compliant_values = compliant_values

        def action_args_domains (self):
                domains = {}
                for arg in self.action_arguments:
                        domains[arg] = set()
                        
                for values in self.compliant_values:
                        for i, arg in enumerate(self.action_arguments):
                                domains[arg].add (values[i])
                return domains

        def get_free_variable_domains(self):
                domains = {}
                for arg in self.free_variables:
                        domains[arg] = set()
                        
                for values in self.compliant_values:
                        for i, arg in enumerate(self.free_variables):
                                domains[arg].add (values[len(self.action_arguments):][i])
                
                return domains

        def update(self, free_variable_domains, action_argument_domains):
                new_set = set([x for x in self.compliant_values if valid_values(self.action_arguments, x[:len(self.action_arguments)], action_argument_domains)
                               and valid_values(self.free_variables, x[len(self.action_arguments):], free_variable_domains)])

                # for x in self.compliant_values:
                #         if x not in new_set:
                #                 print "Eliminated", x
                #                 print free_variable_domains
                #                 print action_argument_domains
                                
                if new_set != self.compliant_values:
                        self.compliant_values = new_set
                        return True
                return False        

        def evaluate(self, arguments, free_var_values):
                values = tuple(map(lambda x : arguments[x],  self.action_arguments)) + tuple(map(lambda x : free_var_values[x],  self.free_variables))
                return values in self.compliant_values

class Constraint:
        def __repr__(self) -> str:
                return f'Constraint(action_arguements:{self.action_arguments},  cv:{self.compliant_values},  fv:{self.free_variables})'
        def __init__(self, action_arguments_rule, compliant_values):
                self.action_arguments = action_arguments_rule
                self.compliant_values = compliant_values
                self.free_variables = []

        def action_args_domains (self):
                domains = {}
                for arg in self.action_arguments:
                        domains[arg] = set()
                        
                for values in self.compliant_values:
                        for i, arg in enumerate(self.action_arguments):
                                domains[arg].add (values[i])
                return domains

        def get_free_variable_domains(self):
                return {}

        def update(self, free_variable_domains, action_argument_domains):
                new_set = set([x for x in self.compliant_values if valid_values(self.action_arguments, x, action_argument_domains)])
                if new_set != self.compliant_values:
                        self.compliant_values = new_set
                        return True
                return False        

        def evaluate(self, arguments):
                print(f"EVALUATING INSIDE A CONSTRAINT: {arguments}")
                values = tuple(map(lambda x : arguments[x],  self.action_arguments))
                print(f"THESE ARE THE VALUES FROM THE action arguments: {values}")
                print(f"THESE ARE THE VALUES FROM THE compliant values: {self.compliant_values}")
                res = values in self.compliant_values
                our_count = 
                print(f"the result", res)
                input("Press Enter to continue...")
                return res
                
        
def evaluate_inigoal_rule(predicate, fact_list):
        def eval_constants(fact, constants):
            for (i, val) in constants:
                if fact.args[i] != val:
                    return False
            return True
        compliant_values = set()
            
        predicate_name, arguments  = predicate.split("(")
        arguments = arguments.replace(")", "").replace("\n", "").replace(".", "").replace(" ", "").split(",")
        valid_arguments = tuple(set([a for a in arguments if a.startswith("?")]))  # Get all arguments starting from ?
        constants = [(i, val) for (i, val) in enumerate(arguments) if val != "_" and not val.startswith("?")]
        positions_argument = {}


        for a in valid_arguments:
            positions_argument[a] = [i for (i, v) in enumerate(arguments) if v == a]

        print(f'predicate: {predicate}')
        print(f'Valid arguments: {valid_arguments}')
        print("positions_argument:", positions_argument)

        # We are filtrating _ from the arguments
                # Example of valid arguments: ['?d_prev', '?fv0']
        arguments = valid_arguments
        for fact in fact_list:  # Example of a fact: <Atom calibration_target(instrument0, star4)>
        
            if type(fact) != pddl.Assign and fact.predicate == predicate_name and eval_constants(fact, constants): 
                # print("####")
                # print(f'fact: {fact}')
                # print("####")

                values = []
                for a in arguments:
                #     print(f"Evaluating an argument: {a} \n")
                    # This loop goes over all the indicies of a in the position arguments
                    # Usually it returns a list with one element
                        # But if we have a following rule: evaluate_inigoal_rule: P(?fv0, ?fv0, ?d_prev)
                        # position_argument['?fv0'] = [0, 1]
                    
                #     our_set = set([fact.args[p] for p in positions_argument[a]])
                #     print(f"Our set: {our_set} \n")

                    # This brakes in the case where a single object in the predicate is used in multiple places and 
                    # When looking up its indicies in the fact it returns more than 1 element
                    # This is due to the fact that a single object from predicate cannot have multiple values even if present on
                    # multiple indicies 
                        # Example where this brake would be hit
                        # evaluate_inigoal_rule: P(?d_new, ?d_new)
                        # positions_argument: {'?d_new': [0,1]}
                        # Evaluating a fact: Atom have_image(planet5, image1) 
                        # Evaluating an argument: ?d_new 
                        # The set: {'planet5','image1'} 

                    if len(set([fact.args[p] for p in positions_argument[a]])) > 1:
                        break

                    values.append(fact.args[positions_argument[a][0]])  # Add the corresponding object from a fact
                    
                    print(f'values: {values}')
                

                if len(values) == len(arguments):
                    compliant_values.add(tuple(values))
                    print(f'compliant_values: {compliant_values}')
        # print(f"Compliant values: {compliant_values} \n") 
        # print(f"Arguments: {arguments}")
        # input("Finished iterationg all facts")
        return arguments, compliant_values


class RuleEval:
    """One rule eval is created for many equal heads"""
    def __repr__(self) -> str:
        return f"""RuleEval(fv_doms={self.free_variable_domains}; action_arg_doms={self.action_argument_domains})"""
    def __init__(self, rule_text, task: pddl.Task):
        self.our_rule_text = rule_text

        # print("#################################################")
        # print(f'Evaluating this rule: {rule_text}')
        # print("#################################################")

        self.text = rule_text.replace('\n','')
        head, body = rule_text.split(":-")
        self.action_schema, action_arguments = head.split(" (")
        self.constraints: List[Union[Constraint,FreeVariableConstraint]] = []
        action_arguments = action_arguments.replace(")", "").replace("\n", "").replace(".", "").replace(" ", "").split(",")
        self.action_arguments = action_arguments
        for predicate in body.split(";"):
            print("#######################")
            print(f'Evaluating a predicate {predicate}')
            print("#######################")

            predicate_type, predicate = predicate.split(":")
            predicate_type = predicate_type.strip()

            if predicate_type == "ini":
                arguments, compliant_values = evaluate_inigoal_rule (predicate, task.init)                        
            elif predicate_type == "goal":
                arguments, compliant_values = evaluate_inigoal_rule (predicate, task.goal.parts)                
            elif predicate_type == "equal":
                arguments = tuple(predicate[1:predicate.find(')')].split(", "))
                compliant_values = set()
                accepted_types = set()
                action_schema = list(filter(lambda a : a.name == self.action_schema, task.actions))[0]
                argument_types = set([p.type_name for p in action_schema.parameters if p.name in arguments])
                # TODO : Support super types in equality rules
                compliant_values = set([tuple ([o.name for a in arguments])
                                        for o in task.objects if o.type_name in argument_types])
            elif predicate_type == "count":
                continue
            else:
                 print("Error: unknown rule ", predicate_type, predicate)
                 exit()
            

            # This map will map elements from arguments to indicies of their first occurence in action_arguments
            # Example:               0         1       2
                # action argument = ['?s', '?d_new', '?d_prev']
                # arguments = ('?d_new', '?d_prev')
                # action_arguments_rule = (1, 2)

            action_arguments_rule = tuple(map(lambda x : action_arguments.index(x),  filter(lambda x : x in action_arguments, arguments)))
            free_variables = tuple (filter(lambda x : x not in action_arguments, arguments))  # e.g empty or ('?fv0',)
        #     print(f'these are the free variables: {free_variables}')
            #input('Free variables inside the RuleEval class')
            if len(free_variables) == 0:
                self.constraints.append(Constraint(action_arguments_rule, compliant_values))
            else:

                # First sequence are the arguments that are in the action_arguments, second sequence are the arguments that are not in the action_arguments (free variables)
                # Example:
                        # action_arguments: ['?s', '?d_new', '?d_prev']
                        # arguments = ('?s', '?fv0')
                        # first tuple (Inside arguments) = (0,)
                        # second tuple (Outside arguments) = (1,)
                        # pos = (0, 1)
                # Side note: The order of arguments is random and can be both ('?s', '?fv0') and ('?fv0', '?s')

                pos = tuple(filter(lambda i : arguments[i] in action_arguments, range(len(arguments)))) + tuple(filter(lambda i : arguments[i] not in action_arguments, range(len(arguments))))
                # print(f'pos {pos}')  # (1,0)

                # print(f'compliant values before: {compliant_values}')
                compliant_values = list(map(lambda x : tuple ([x[i] for i in pos]), compliant_values))
                # print('#########')
                # print(f'compliant values after: {list(compliant_values)}')
                # print(f'action_arguments_rule {action_arguments_rule}')
                # print(f'free variables: {free_variables}')
                # print('#########')

                self.constraints.append(FreeVariableConstraint(action_arguments_rule, free_variables, compliant_values))

        for s in self.constraints:
                print(s)
        # input("added constraint")

        self.set_domain()
        print(self.free_variable_domains)
        # input('before while')
        while self.free_variable_domains:
                self.eliminate_free_variable()


    def eliminate_free_variable(self):
            # Example {'?fv0': {'image1'}}
            fv, old_domain = self.free_variable_domains.popitem()
        #     print(f'fv: {fv}')
        #     print(f'old_domain: {old_domain}')
            # Get all constraints for this RuleEval object that use this the fv
            old_constraints = [c for c in self.constraints if fv in c.free_variables]
        #     print(f"old_constraints: {old_constraints}")

            new_action_arguments = list(set.union(*[set(c.action_arguments) for c in old_constraints]))
            new_free_variables = set.union(*[set(c.free_variables) for c in old_constraints])
        #     print(f'new_action_arguments: {new_action_arguments}')
        #     print(f'BEFORE new_free_variables: {new_free_variables}')
            new_free_variables.remove(fv)
            new_free_variables = list(new_free_variables)
        #     print(f'AFTER new_free_variables: {new_free_variables}')


            pos_fv = [len(c.action_arguments) + c.free_variables.index(fv) for c in old_constraints]
        #     print(f'pos_fv: {pos_fv}')
        #     input('elimiate stop?')

            new_compliant_values = set()

            for val in old_domain:
                    constraints_tuples  = [set([tup for tup in c.compliant_values if tup[pos_fv[i]] == val]) for i, c in enumerate(old_constraints)]
                    print(f'constraints_tuples: {constraints_tuples}')
                #     input('constraints_tuples stop?')
                    for combination in itertools.product(*constraints_tuples):
                            new_tuple = {}
                            conflict = False
                            for i, c in enumerate(old_constraints):
                                    for j, arg in enumerate(c.action_arguments):
                                            if arg in new_tuple and new_tuple[arg] != combination[i][j]:
                                                    conflict = True
                                                    break
                                            new_tuple[arg] = combination[i][j]
                                    if conflict: 
                                             break
                                    for j, arg in enumerate(c.free_variables):
                                            if arg == fv:
                                                    continue
                                            if arg in new_tuple and new_tuple[arg] != combination[i][len(c.action_arguments) + j]:
                                                    conflict = True
                                                    break
                                            new_tuple[arg] = combination[i][len(c.action_arguments) + j]
                                    if conflict: 
                                            break
                                     
                                    
                            if conflict:
                                    continue

                            new_tuple = tuple([new_tuple[arg] for arg in new_action_arguments] + [new_tuple[arg] for arg in new_free_variables])
                            new_compliant_values.add(new_tuple)
                    

            if new_free_variables:
                    new_constraint = FreeVariableConstraint(new_action_arguments, new_free_variables, new_compliant_values)
            else:
                    new_constraint = Constraint(new_action_arguments, new_compliant_values)

            self.constraints = [c for c in self.constraints if fv not in c.free_variables] + [new_constraint]
            
    def set_domain(self):
        self.action_argument_domains = {}
        self.free_variable_domains = {}

        self.update_domain()

        changes = True
        while changes:
                changes = False
                for r in self.constraints:
                        if r.update(self.free_variable_domains, self.action_argument_domains):
                                changes = True
                if changes:
                        self.update_domain()

    def update_domain(self):
            for constraint in self.constraints:
                # This loop will not run for the Contraint objects but only for the FreeVariableConstraint objects
                # if isinstance(constraint, FreeVariableConstraint):
                #    print(f'Looking at FVC: {constraint}')
                #    print(f'Self. Free variables domain: {self.free_variable_domains}')

                for (fv, values) in constraint.get_free_variable_domains().items():
                        # print("##Free variable domains##")
                        # print(f'fv: {fv}')
                        # print(f'values: {values}')
                        if fv not in self.free_variable_domains:
                            self.free_variable_domains [fv] = values
                        else:
                            self.free_variable_domains [fv] = self.free_variable_domains [fv].intersection(values)
                        # print(f'Self. Free variables domain: {self.free_variable_domains}')
                        # input("##done free variable domain##")
                for (arg, values) in constraint.action_args_domains().items():
                        # print("##Action args domains##")
                        # print(f'arg: {arg}')
                        # print(f'values: {values}')
                        if arg not in self.action_argument_domains:
                            self.action_argument_domains [arg] = values
                        else:
                            self.action_argument_domains [arg] = self.action_argument_domains [arg].intersection(values)
                        # print(f'Self. action args domains: {self.action_argument_domains}')
                        # input("##done free args domain##")

            
        #print (self.text, self.constraints)

    def evaluate(self, arguments):
        if self.free_variable_domains:
                #for fv_values in itertools.product(*[valueset for x, valueset in self.free_variable_domains.items()]):
                return 0
        else:
                for c in self.constraints:
                        if not c.evaluate(arguments):
                                return 0
                      
                #print (action.name, "valid according to", self.text)
                #print ("Evaluate", self.text, action, 1)
                return 1
    
class RulesEvaluator:
    def __init__(self, rule_text, task):
        self.rules = defaultdict(list)  # This is a dictioray of rules, with the key being the action name
        for l in rule_text:
            re = RuleEval(l, task)
            print("0000000000000000000000000000000000000000000000000000000000000000000000")
            print(f"Rule eval for {l}\n{re.constraints}")
            input('siema siema')
            self.rules[re.action_schema].append(re)
               
    def eliminate_rules(self, rules_text):
        for a in self.rules:
            self.rules[a] = [rule for rule in self.rules[a] if rule.text not in rules_text]
            
    def evaluate(self, action_name, arguments):
        
        # logging.info(f'Evaluate {action_name} with arguments {arguments}')
        # logging.info(f'Rules: {self.rules[action_name][0]}')
        print(f'Evaluate {action_name} with arguments {arguments}')
        # print(f'Rules: {self.rules[action_name]}')
        res = [rule.evaluate(arguments) for rule in  self.rules[action_name]]
        print(f'The result: {res}')
        input ('Evaluation finished, continue?')
        return res 

    def get_all_rules (self):
        return [rule.text for (schema, rules)  in self.rules.items() for rule in rules]
