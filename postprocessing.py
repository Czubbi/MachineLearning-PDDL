
from typing import Set

ONBOARD_0 = "_on_i"
ONBOARD_1 = "_on_s"
SUPPORTS_0 = "_supp_i"
SUPPORTS_1 = "_supp_m"
POINTING_0 = "_point_s"
POINTING_1 = "_point_d"
POWER_AVAIL_0 = "_pa_s"
POWER_ON_0 = "_po_i" 
CALIBRATED_0 = "_cali_i"
HAVE_IMAGE_0 = "_hi_d"
HAVE_IMAGE_1 = "_hi_m"
CALIBRATING_TARGET_0 = "_ct_i"
CALIBRATING_TARGET_1 = "_ct_d"



PREDICATES_SETUP = {
    "on_board":
        {
            0: ONBOARD_0, 1: ONBOARD_1
        },
    "supports":
        {
            0: SUPPORTS_0, 1: SUPPORTS_1
        },
    "pointing":
        {
            0: POINTING_0, 1: POINTING_1
        },
    "power_avail":
        {
            0: POWER_AVAIL_0,
        },
    "power_on":
        {
            0: POWER_ON_0, 
        },
    "calibrated":
        {
            0: CALIBRATED_0
        },
    "have_image":
        {
            0: HAVE_IMAGE_0, 1: HAVE_IMAGE_1
        },
    "calibration_target":
        {
            0: CALIBRATING_TARGET_0, 1: CALIBRATING_TARGET_1
        },
}   
COUNT = 'count'

def get_free_variables(body_str):
    """Returns a set of free variables and wildcards in the body of a rule."""
    all_args_from_body = set()

    predicates = body_str.split(";")
    predicates_wo_prefix = [predicate.split(":")[-1] for predicate in predicates]
    for pred in predicates_wo_prefix:
        args = pred.replace(" ", "").replace(".", "").replace(")","").split('(')[1].split(',')

        for arg in args:
            print(f"This is the arg: {arg}")
            if arg.startswith(' '):
                raise Exception(f'Argument {arg} starts with a space')
            if arg.startswith('?fv') or arg.startswith('_'):
                all_args_from_body.add(arg)

    return all_args_from_body

def get_count_rules(body_str) -> Set[str]:
    """
    Evaluate a single rule to create extra rules using the count predicate on the free variables:
        Example:
            rule_str = head :- P(fv0, fv1, fv2, _)
            Creates 4 new rules:
                P(fv0, fv1, fv2);count(fv0)
                P(fv0, fv1, fv2);count(fv1)
                P(fv0, fv1, fv2);count(fv2)

    If no free variables present in the rule then an empty set is returned
    """
    rules = set()
    free_variables = get_free_variables(body_str)
    
    for fv in free_variables:
        new_predicate = f";count:count({fv})."
        rules.add(body_str.replace(".", new_predicate))
    
    return rules


def generate_extra_rules(rules_file:str):
    """Generate new file with extra rules using the add_counts function."""
    new_file_name = rules_file.split(".")[0] + "_count.csv"
    all_new_rules = set()

    with open(rules_file, "r") as f:
        rules = f.readlines()

        # Substitude underscores with named variables
        for r in rules:
            r = r.replace("\n", "")
            if r =='':
                break
            head, body_str = r.split(":-")
            new_rule_body = replace_underscores(body_str)
            new_rule = get_count_rules(new_rule_body)

            all_new_rules.update(new_rule)
        
        rules_with_counts = get_count_rules(r)  # get new rules
        all_new_rules.update(rules_with_counts)
        print(f'Evaluated rule: {r}')
    
    with open(new_file_name, "w") as f:
        for r in all_new_rules:
            f.write(r +'\n')

def replace_underscores(body_str):
    predicates = body_str.split(';')
    new_rule = ''
    underscore_args = set()
    for p in predicates:
        current_setup = PREDICATES_SETUP[p.split(':')[1].split('(')[0]]
        print(f'The predicate {p} has the following setup: {current_setup}')
        prefix, suffix = p.strip('.').split(':')  # suffix = calibration_target(_, ?fv0)
        predicate_name, arguments_str = suffix.split('(')  # predicate name = calibration_target, arguments = _, ?fv0)
        arguments = arguments_str.strip(')').split(',')  # arguments = [_, ?fv0]
        new_arguments = []
        for i, arg in enumerate(arguments):
            arg = arg.strip(' ')
            if arg == '_':
                new_arguments = new_arguments + [current_setup[i]]
            else:
                new_arguments = new_arguments + [arg]
        # rebuild the predicate
        new_predicate =f"{prefix}:{predicate_name}({', '.join(new_arguments)})"
        new_rule = new_rule + new_predicate + ';'
        print('new_predicate: ', new_predicate)

    new_rule = new_rule[:-1]+'.'
    return new_rule




generate_extra_rules("test.csv")