
from typing import Set
import argparse

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
            # print(f"This is the arg: {arg}")
            if arg.startswith(' '):
                raise Exception(f'Argument {arg} starts with a space')
            if arg.startswith('?fv') or arg.startswith('_'):
                all_args_from_body.add(arg)

    return all_args_from_body

def get_count_rules(body_str, head) -> Set[str]:
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
        rules.add(head+':-'+body_str.replace(".", new_predicate)+ "\n")
    
    return rules


def generate_extra_rules(rules_file:str, output_file=None):
    """Generate new file with extra rules using the add_counts function."""
    if output_file:
        new_file_name = output_file
    else:
        new_file_name = rules_file.split(".")[0] + "_count.csv"
    

    with open(rules_file, "r") as f:
        rules = f.readlines()
        new_rules = set()

        # Substitude underscores with named variables
        for r in sorted(rules):

            # print(F"the rule is: {r}")
            # input('continue ')
            r = r.replace("\n", "")
            if r =='':
                break
            head, body_str = r.split(":-")
            bodies_with_undescores = replace_underscores(body_str)
            # print(f"Underscore: {bodies_with_undescores}")
            if not bodies_with_undescores:
                continue
            bodies_with_count = get_count_rules(bodies_with_undescores, head)

            new_rules.update(bodies_with_count)
        
            # print(f'Evaluated rule: {r}')

        new_rules = sorted(new_rules)
        with open(new_file_name, "w") as f:
            for rule in new_rules:
                # print(f"Saving body {rule}")

                f.write(rule)
        return new_rules

def replace_underscores(body_str):
    # print('body_str: ', body_str)
    predicates = body_str.split(';')
    new_rule = ''
    max_fv = -1
    for p in predicates:
        prefix, suffix = p.strip('.').split(':')  # suffix = calibration_target(_, ?fv0)
        predicate_name, arguments_str = suffix.split('(')  # predicate name = calibration_target, arguments = _, ?fv0)
        arguments = arguments_str.strip(')').split(',')  # arguments = [_, ?fv0]
        for arg in arguments:
            arg = arg.strip()
            if arg.startswith('?fv'):
                fv_val = arg.split('fv')[1]
                max_fv = max(max_fv, int(fv_val))
    max_fv += 1
    # print(f'Max fv: {max_fv}')
    for p in predicates:
        # print(f"This is the predicate: {p}")
        predicate_key = p.split(':')[1].split('(')[0]
        # print(bytes(predicate_key, 'utf-8'))
        if predicate_key == '':
            return None
        current_setup = PREDICATES_SETUP[p.split(':')[1].split('(')[0]]
        prefix, suffix = p.strip('.').split(':')  # suffix = calibration_target(_, ?fv0)
        predicate_name, arguments_str = suffix.split('(')  # predicate name = calibration_target, arguments = _, ?fv0)
        arguments = arguments_str.strip(')').split(',')  # arguments = [_, ?fv0]
        new_arguments = []
        for i, arg in enumerate(arguments):
            # print(f'Argument: {arg}')
            
            # input(123)
            arg = arg.strip(' ')
            if arg == '_':
                new_arguments.append(f'?fv{max_fv}')
                max_fv +=1
            else:
                new_arguments.append(arg)
            # print(f'New Arguments: {new_arguments}')
        # rebuild the predicate
        new_predicate =f"{prefix}:{predicate_name}({', '.join(new_arguments)})"
        new_rule = new_rule + new_predicate + ';'

    new_rule = new_rule[:-1]+'.'
    return new_rule


# import bz2
# import os
# folder_name = 'useful-actions-dataset-main/satellite/runs/optimal/00our'
# file_name = 'all_operators.bz2'
# file_path = os.path.join(folder_name, file_name)

# compressed_file = bz2.compress(open('all_operators', "rb").read())
# with open(file_path, 'wb') as f:
#     f.write(compressed_file)




# if main then parse argument called file_name and execute code from below
if __name__ == "__main__":
    argparser = argparse.ArgumentParser()
    argparser.add_argument("--input-file", type=str, required=True, help="path to basic rules")
    argparser.add_argument("--output-file", type=str, required=True, help="path to save count rules")
    args = argparser.parse_args()

    binary_rules_file = args.input_file
    output_file_name = args.output_file
    generate_extra_rules(binary_rules_file, output_file_name)
