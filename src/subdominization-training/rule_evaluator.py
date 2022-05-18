from collections import defaultdict
import itertools
from tkinter import N
import pddl
import logging
import copy
from typing import List, Union, Dict
import pprint


def valid_values(variables, values, variable_domains):
    # , "Error: {} {}".format(str(variables), str(values)))
    assert (len(variables) == len(values))
    return all(values[i] in variable_domains[var] for i, var in enumerate(variables))


class FreeVariableConstraint:
    def __repr__(self) -> str:
        return f'FVC(action_arguements:{self.action_arguments},  fv:{self.free_variables} cv:{self.compliant_values}, pred:{self.predicate})'

    def __init__(self, action_arguments_rule, free_variables, compliant_values, predicate="eliminate"):
        self.predicate = predicate
        self.action_arguments = action_arguments_rule
        self.free_variables = free_variables
        self.compliant_values = compliant_values

    def action_args_domains(self):
        domains = {}
        for arg in self.action_arguments:
            domains[arg] = set()

        for values in self.compliant_values:
            for i, arg in enumerate(self.action_arguments):
                domains[arg].add(values[i])
        return domains

    def get_free_variable_domains(self):
        domains = {}
        for arg in self.free_variables:
            domains[arg] = set()

        for values in self.compliant_values:
            for i, arg in enumerate(self.free_variables):
                domains[arg].add(values[len(self.action_arguments):][i])

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

    def evaluate(self, arguments, free_var_values=None):
        # print constriant
        # print(f'Evaluating {self}\n with Action arguments {arguments}')
        values = tuple(map(lambda x: arguments[x],  self.action_arguments))

        # print(f'###########This is the action argument: {values} #######')
        size_a = len(values)
        result = []
        for cv in self.compliant_values:
            # print(f'This is the cv: {cv}')
            first_slice = cv[:size_a]
            second_slice = cv[size_a:]
            # print(f'first slice: {first_slice}')
            # print(f'second slice: {second_slice}')
            if values == first_slice:
                # print('slices are the same')
                result.append(second_slice)
        # print(f'Constraint result: {set(result)}')
        return set(result)


class Constraint:
    def __repr__(self) -> str:
        return f'Constraint(action_arguements:{self.action_arguments},  cv:{self.compliant_values},  fv:{self.free_variables})'

    def __init__(self, action_arguments_rule, compliant_values):
        self.action_arguments = action_arguments_rule
        self.compliant_values = compliant_values
        self.free_variables = []

    def action_args_domains(self):
        domains = {}
        for arg in self.action_arguments:
            domains[arg] = set()

        for values in self.compliant_values:
            for i, arg in enumerate(self.action_arguments):
                domains[arg].add(values[i])
        return domains

    def get_free_variable_domains(self):
        return {}

    def update(self, free_variable_domains, action_argument_domains):
        new_set = set([x for x in self.compliant_values if valid_values(
            self.action_arguments, x, action_argument_domains)])
        if new_set != self.compliant_values:
            self.compliant_values = new_set
            return True
        return False

    def evaluate(self, arguments):
        raise Exception('Calling non free variable evaluate')
        print(f"Current constraint arguments: {arguments}")
        values = tuple(map(lambda x: arguments[x],  self.action_arguments))
        print(f"THESE ARE THE VALUES FROM THE action arguments: {values}")
        print(
            f"THESE ARE THE VALUES FROM THE compliant values: {self.compliant_values}")
        res = values in self.compliant_values

        print(f"the old result:", res)
        input("Press Enter to continue...")
        return res


def evaluate_inigoal_rule(predicate, fact_list):
    def eval_constants(fact, constants):
        for (i, val) in constants:
            if fact.args[i] != val:
                return False
        return True
    compliant_values = set()

    predicate_name, arguments = predicate.split("(")
    arguments = arguments.replace(")", "").replace(
        "\n", "").replace(".", "").replace(" ", "").split(",")
    # Get all arguments starting from ?
    valid_arguments = tuple(set([a for a in arguments if a.startswith("?")]))
    constants = [(i, val) for (i, val) in enumerate(arguments)
                 if val != "_" and not val.startswith("?")]
    # constants = [(i, val) for (i, val) in enumerate(arguments) if not val.startswith("_") and not val.startswith("?")]
    positions_argument = {}

    for a in valid_arguments:
        positions_argument[a] = [
            i for (i, v) in enumerate(arguments) if v == a]

    # print(f'predicate: {predicate}')
    # print(f'Valid arguments: {valid_arguments}')
    # print("positions_argument:", positions_argument)

    # We are filtrating _ from the arguments
    # Example of valid arguments: ['?d_prev', '?fv0']
    arguments = valid_arguments
    # Example of a fact: <Atom calibration_target(instrument0, star4)>
    for fact in fact_list:

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

                # Add the corresponding object from a fact
                values.append(fact.args[positions_argument[a][0]])

            #     print(f'values: {values}')

            if len(values) == len(arguments):
                compliant_values.add(tuple(values))
    # print(f'compliant_values: {compliant_values}')
    # print(f"Compliant values: {compliant_values} \n")
    # print(f"Arguments: {arguments}")
    # input("Finished iterationg all facts")
    return arguments, compliant_values


class RuleEval:
    """One rule eval is created for many equal heads"""

    def __repr__(self) -> str:
        return f"""RuleEval(text={self.text}; memorized_doms={self.memorized_domains}; action_arg_doms={self.action_argument_domains})"""

    def __init__(self, rule_text, task: pddl.Task):
        self.wildcard_values = defaultdict(lambda: defaultdict(set))
        self.count_fv = rule_text.split('count:count')[1].strip(
            '(').strip().strip('.)')  # get the element which we count on
        # print(task.predicates[0].arguments[0].name)
        # self.init_wildcard_vals(task)

        # print("#################################################")
        # print(f'Buildint constraints for this rule: {rule_text}')
        # print("#################################################")

        self.text = rule_text.replace('\n', '')
        head, body = rule_text.split(":-")
        self.action_schema, action_arguments = head.split(" (")
        self.constraints: List[Union[Constraint, FreeVariableConstraint]] = []
        # WE need to keep whatever we want to count as a special free variable that we will not eliminate.
        # This is because we want it to be a part of the evaluation (action_argument_domains)
        action_arguments = action_arguments.replace(")", "").replace(
            "\n", "").replace(".", "").replace(" ", "").split(",")
        # TODO we can either treat the thing we count as Action argumnet or we can during the elemination process as the last one
        self.action_arguments = action_arguments
        # This will be used to retrieve the count values for each of the free variables
        self.memorized_domains = None
        for predicate in body.split(";"):
            #     print("#######################")
            #     print(f'Evaluating a predicate {predicate}')
            #     print("#######################")

            predicate_type, predicate = predicate.split(":")
            predicate_type = predicate_type.strip()
        #     print(predicate_type)
        #     input('wait')

            if predicate_type == "ini":
                arguments, compliant_values = evaluate_inigoal_rule(
                    predicate, task.init)
            elif predicate_type == "goal":
                arguments, compliant_values = evaluate_inigoal_rule(
                    predicate, task.goal.parts)
            elif predicate_type == "equal":
                arguments = tuple(predicate[1:predicate.find(')')].split(", "))
                compliant_values = set()
                accepted_types = set()
                action_schema = list(
                    filter(lambda a: a.name == self.action_schema, task.actions))[0]
                argument_types = set(
                    [p.type_name for p in action_schema.parameters if p.name in arguments])
                # TODO : Support super types in equality rules
                compliant_values = set([tuple([o.name for a in arguments])
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

            action_arguments_rule = tuple(map(lambda x: action_arguments.index(
                x),  filter(lambda x: x in action_arguments, arguments)))
            # e.g empty or ('?fv0',)
            free_variables = tuple(
                filter(lambda x: x not in action_arguments, arguments))
        #     print(f'these are the free variables: {free_variables}')
            #input('Free variables inside the RuleEval class')
            if len(free_variables) == 0:
                self.constraints.append(Constraint(
                    action_arguments_rule, compliant_values))
            else:

                # First sequence are the arguments that are in the action_arguments, second sequence are the arguments that are not in the action_arguments (free variables)
                # Example:
                # action_arguments: ['?s', '?d_new', '?d_prev']
                # arguments = ('?s', '?fv0')
                # first tuple (Inside arguments) = (0,)
                # second tuple (Outside arguments) = (1,)
                # pos = (0, 1)
                # Side note: The order of arguments is random and can be both ('?s', '?fv0') and ('?fv0', '?s')

                pos = tuple(filter(lambda i: arguments[i] in action_arguments, range(len(
                    arguments)))) + tuple(filter(lambda i: arguments[i] not in action_arguments, range(len(arguments))))
                # print(f'pos {pos}')  # (1,0)

                # print(f'compliant values before: {compliant_values}')
                compliant_values = list(
                    map(lambda x: tuple([x[i] for i in pos]), compliant_values))
                # print('#########')
                # print(f'compliant values after: {list(compliant_values)}')
                # print(f'action_arguments_rule {action_arguments_rule}')
                # print(f'free variables: {free_variables}')
                # print('#########')
                # print(f"Free variables: {free_variables}")
                self.constraints.append(FreeVariableConstraint(
                    action_arguments_rule, free_variables, compliant_values, predicate))

                # input('self constraints FVC')

        # print('--------------------------------')
        # for c in self.constraints:
            # print(c, '\n')
        # input("added basic constraint")

        self.set_domain()
        # print(self.free_variable_domains)  #

        while self.free_variable_domains:
            self.eliminate_free_variable()

    def init_wildcard_vals(self, task: pddl.Task):
        init = task.init
        goal = task.goal.parts
        predicates = task.predicates
        predicate_map = {}
        for p in predicates:
            predicate_map[p.name] = p

        for fact in init:
            if fact.predicate == '=':
                continue
            predicate: pddl.Predicate = predicate_map[fact.predicate]
            predicate_arguments = predicate.arguments
            for i, arg in enumerate(fact.args):
                # print(predicate.arguments[i].name)
                current_argument = predicate.arguments[i].name.replace(
                    '?', '_')
                # print(current_argument)
                # input('from init wildcards')
                self.wildcard_values[predicate.name][current_argument].add(arg)

        # print('Finished')
        # pprint.pprint(self.wildcard_values)
        # input('wait')

    def eliminate_free_variable(self):
        # Example {'?fv0': {'image1'}}
        #     print(self.free_variable_domains)

        # pop all but the one we are going to count
        fv, old_domain = self.free_variable_domains.popitem()
        if fv == self.count_fv:
            if len(self.free_variable_domains) == 0:
                return
            fv2, old_domain2 = self.free_variable_domains.popitem()
            self.free_variable_domains[fv] = old_domain
            fv, old_domain = fv2, old_domain2

        # print(f'fv: {fv}')
        # print(f'old_domain: {old_domain}')
        # Get all constraints for this RuleEval object that use this the fv

        old_constraints = [
            c for c in self.constraints if fv in c.free_variables]

        new_action_arguments = list(
            set.union(*[set(c.action_arguments) for c in old_constraints]))
        new_free_variables = set.union(
            *[set(c.free_variables) for c in old_constraints])
        # print(f'new_action_arguments: {new_action_arguments}')
        #     print(f'BEFORE new_free_variables: {new_free_variables}')
        new_free_variables.remove(fv)
        new_free_variables = list(new_free_variables)

        pos_fv = [len(c.action_arguments) + c.free_variables.index(fv)
                  for c in old_constraints]
        #     print(f'pos_fv: {pos_fv}')
        #     input('elimiate stop?')

        new_compliant_values = set()

        for val in old_domain:
            constraints_tuples = [set([tup for tup in c.compliant_values if tup[pos_fv[i]] == val])
                                  for i, c in enumerate(old_constraints)]

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
                        new_tuple[arg] = combination[i][len(
                            c.action_arguments) + j]
                    if conflict:
                        break

                if conflict:
                    continue

                new_tuple = tuple([new_tuple[arg] for arg in new_action_arguments] + [
                                  new_tuple[arg] for arg in new_free_variables])
                new_compliant_values.add(new_tuple)

        if new_free_variables:
            new_constraint = FreeVariableConstraint(
                new_action_arguments, new_free_variables, new_compliant_values)
        else:
            new_constraint = Constraint(
                new_action_arguments, new_compliant_values)

        self.constraints = [
            c for c in self.constraints if fv not in c.free_variables] + [new_constraint]
        #     for c in self.constraints:
        #          print(c)
        #     input('eliminate stop?')

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
        """
        This function gets all the values that can be replacted under Free variables and the corresponding action arguments
        so that it match the contraint of the rule - intersaction of allowed values"""
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
                    self.free_variable_domains[fv] = values
                else:
                    self.free_variable_domains[fv] = self.free_variable_domains[fv].intersection(
                        values)
                # print(f'Self. Free variables domain: {self.free_variable_domains}')
                # input("##done free variable domain##")
            for (arg, values) in constraint.action_args_domains().items():
                # print("##Action args domains##")
                # print(f'arg: {arg}')
                # print(f'values: {values}')
                if arg not in self.action_argument_domains:
                    self.action_argument_domains[arg] = values
                else:
                    self.action_argument_domains[arg] = self.action_argument_domains[arg].intersection(
                        values)
                # print(f'Self. action args domains: {self.action_argument_domains}')
                # input("##done free args domain##")

            # print(self.text)
            # print(self.constraints)
            # input("Finished a constraint")

    def evaluate(self, arguments, is_count_rule=True):

        if self.free_variable_domains:
            raise("We have fv_doms")
            # for fv_values in itertools.product(*[valueset for x, valueset in self.free_variable_domains.items()]):
            return 0

        if is_count_rule:
            return self.evaluate_count_rules(arguments)

        for c in self.constraints:
            if not c.evaluate(arguments):
                return False
        return True

    def evaluate_count_rules(self, arguments):
        res = set()
        is_first_constraint = True  # we need to do this else the intersection will be empty
        for c in self.constraints:
            if is_first_constraint:
                res = c.evaluate(arguments)
                is_first_constraint = False
            else:
                res = res.intersection(c.evaluate(arguments))
        return len(res)


class RulesEvaluator:
    def __init__(self, rule_text, task):
        # This is a dictioray of rules, with the key being the action name
        self.rules: Dict[str, List[RuleEval]] = defaultdict(list)
        for l in rule_text:
            re = RuleEval(l, task)
        #     print(f"Rule eval for {l}\n{re}")
            self.rules[re.action_schema].append(re)

    def eliminate_rules(self, rules_text):
        for a in self.rules:
            self.rules[a] = [rule for rule in self.rules[a]
                             if rule.text not in rules_text]

    def evaluate(self, action_name, arguments):
        # input('start evaluating')
        # logging.info(f'Evaluate {action_name} with arguments {arguments}')
        # logging.info(f'Rules: {self.rules[action_name][0]}')
        # print(f'Evaluate {action_name} with arguments {arguments}')
        # print(f'Rules: {self.rules[action_name]}')
        res = []
        for rule in self.rules[action_name]:
            # print(f'evaluating a rule {rule}')
            # print(f"The rule constraints: {rule.constraints}")
            evaluated_rule_result = rule.evaluate(
                arguments, rule)
            res.append(evaluated_rule_result)
        # res = [rule.evaluate(arguments) for rule in  self.rules[action_name]]
        return res

    def get_all_rules(self):
        return [rule.text for (schema, rules) in self.rules.items() for rule in rules]


# ;	# pierwsza
# ;	i1 : m3      | i1
# ;	i2 : m1, m2  | i2 i3 i4
# ;	i3 : m2		 | i2 i3
# ;	i4 : m1		 | i2 i4

# ;	# druga
# ;	m1 : i2, i4
# ;	m2 : i3 i2
# ;	m3 : i1


# (define (problem strips-sat-x-1)
# (:domain satellite)
# (:objects
# 	satellite0 - satellite
# 	instrument0 - instrument
# 	instrument1 - instrument
# 	satellite1 - satellite
# 	satellite2 - satellite
# 	satellite3 - satellite
# 	instrument2 - instrument
# 	instrument3 - instrument
# 	instrument4 - instrument
# 	mode1 - mode
# 	mode2 - mode
# 	mode3 - mode
# 	mode4 - mode
# 	Star1 - direction
# 	Star2 - direction
# 	Star4 - direction
# 	GroundStation3 - direction
# 	GroundStation0 - direction
# 	Planet5 - direction
# )
# (:init
# 	(supports instrument1 mode3)
# 	(supports instrument3 mode2)
# 	(supports instrument2 mode1)
# 	(supports instrument2 mode2)
# 	(supports instrument4 mode1)
# 	(power_on instrument1)
# 	(power_on instrument2)
# 	(power_on instrument3)
# 	(power_on instrument4)
# 	(calibrated instrument1)
# 	(on_board instrument1 satellite0)
# 	(on_board instrument2 satellite0)
# 	(on_board instrument3 satellite1)
# 	(on_board instrument4 satellite1)

# )
# (:goal (and
# 	(have_image Planet5 image1)
# ))

# )

# switch_off (?i, ?s) :- ini:supports(?i, ?fv0);ini:supports(?fv1, ?fv0);ini:on_board(?fv1, ?s);count:count(?fv1).


# action_arguments = ['instrument0', 'satellite0']
# cv = {('satellite1', 'instrument3'), ('satellite1', 'instrument4'), ('satellite0', 'instrument2'), ('satellite0', 'instrument1')}
# fv = ('?fv1',)
# FVC_action_arguments_position = (1,)
# THESE ARE used from the action to evaluate the constraint: ('satellite0',)
# Constraint compliant values: {('satellite1', 'instrument3'), ('satellite1', 'instrument4'), ('satellite0', 'instrument2'), ('satellite0', 'instrument1')}
# # {'instrument1', 'instrument2'}
# main_tuple = (1, 2, 3, 4, 5)
# subtuple = (1, 2, 6, 7, 8)

# if set(subtuple) <= set(main_tuple):
#     print('subtuple is part of the main tuple')

# ixi mapping to ixi
# self_cv2_double = {
#     ('instrument1', 'instrument1', 'instrument3', 'instrument3'),  # i3 i3
#     ('instrument1', 'instrument1', 'instrument1', 'instrument1'),  # i1 i1
#     ('instrument1', 'instrument2', 'instrument2', 'instrument1')  # i2 i1
# }


# self_cv1_double = {
#     ('instrument1', 'instrument2', 'satellite3'),  # s3
#     ('instrument1', 'instrument2', 'satellite4'),  # s4
#     ('instrument3', 'instrument3', 'satellite3'),  # s3
# }

# actions_double = [
#     {'instrument1', 'instrument2'},  # cv1: s3, cv2: (i2 i1)
#     {'instrument2', 'instrument1'},  # cv1 empty, cv2: ()
#     {'instrument3', 'instrument3'},  # cv1 s4, cv2: ()
# ]


# actions_single = [
#     {'instrument1'},
#     {'instrument2'},
#     {'instrument3'}
# ]

# self_cv1_single = {
#     ('instrument1', 'instrument2', 'satellite3'),  # i2 s3
#     ('instrument1', 'instrument3', 'satellite3'),  # i3 s3
#     ('instrument2', 'instrument3', 'satellite3'),  # i3 s3
#     ('instrument2', 'instrument3', 'satellite3'),  # i3 s3
# }
# self_cv2_single = {
#     ('instrument1', 'instrument2', 'satellite3'),  # i2 s3
#     ('instrument2', 'instrument2', 'satellite4'),  # i2 s4
#     ('instrument3', 'instrument3', 'satellite3'),  # i3 s3
# }

# results = {}
# for action_argument in actions_single:
#         action_argument=tuple(action_argument)
#         print(f'###########This is the action argument: {action_argument} #######')
#         size_a = len(action_argument)
#         result = []
#         for cv in self_cv1_single:
#                 print(f'This is the cv: {cv}')
#                 first_slice = cv[:size_a]
#                 second_slice = cv[size_a:]
#                 print(f'first slice: {first_slice}')
#                 print(f'second slice: {second_slice}')
#                 if action_argument == first_slice:
#                         print('slices are the same')
#                         result.append(second_slice)
#                 # input('continue?')
#         results[action_argument] = set(result)

# import pprint

# pprint.pprint(results)
