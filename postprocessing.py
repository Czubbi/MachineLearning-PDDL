
from typing import Set

# rule_str = "turn_to (?s, ?d_new, ?d_prev) :- goal:have_image(?fv0, _);goal:pointing(?s, ?fv0);ini:pointing(_, ?fv0)."
# head, body = rule_str.split(":-")

COUNT = 'count'

def get_free_variables(body_str):
    """Returns a set of free variables and wildcards in the body of a rule."""
    all_args_from_body = set()

    predicates = body_str.split(";")
    predicates_wo_prefix = [predicate.split(":")[-1] for predicate in predicates]
    for pred in predicates_wo_prefix:
        args = pred.replace(" ", "").replace(".", "").replace(")","").split('(')[1].split(',')

        for arg in args:
            if arg == '_' or arg.startswith('?fv'):
                all_args_from_body.add(arg)

    return all_args_from_body

def get_count_rules(rule_str) -> Set[str]:
    """
    Evaluate a single rule to create extra rules using the count predicate on the free variables:
        Example:
            rule_str = head :- P(fv0, fv1, fv2, _)
            Creates 4 new rules:
                head :- P(fv0, fv1, fv2);count(fv0)
                head :- P(fv0, fv1, fv2);count(fv1)
                head :- P(fv0, fv1, fv2);count(fv2)
                head :- P(fv0, fv1, fv2);count(_)

    If no free variables present in the rule then an empty set is returned
    """
    rules = set()
    _, body_str = rule_str.split(":-")
    free_variables = get_free_variables(body_str)
    
    for fv in free_variables:
        new_predicate = f";count:count({fv})."
        rules.add(rule_str.replace(".", new_predicate))
    
    return rules


def generate_extra_rules(rules_file:str):
    """Generate new file with extra rules using the add_counts function."""
    new_file_name = rules_file.split(".")[0] + "_count.csv"
    all_new_rules = set()

    with open(rules_file, "r") as f:
        rules = f.readlines()

        # Iterate over basic rules
        for r in rules:
            r = r.replace("\n", "")
            if r =='':
                break
            rules_with_counts = get_count_rules(r)  # get new rules
            all_new_rules.update(rules_with_counts)
            print(f'Evaluated rule: {r}')
    
    with open(new_file_name, "w") as f:
        for r in all_new_rules:
            f.write(r +'\n')

    # print(all_new_rules)

generate_extra_rules("test.csv")