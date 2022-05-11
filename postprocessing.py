
import pytest
from itertools import product

# rule_str = "turn_to (?s, ?d_new, ?d_prev) :- goal:have_image(?fv0, _);goal:pointing(?s, ?fv0);ini:pointing(_, ?fv0)."
# head, body = rule_str.split(":-")

COUNT = 'count'

def get_free_variables(body_str):
    all_args_from_body = set()

    predicates = body_str.split(";")
    predicates_wo_prefix = [predicate.split(":")[-1] for predicate in predicates]
    for pred in predicates_wo_prefix:
        args = pred.replace(" ", "").replace(".", "").replace(")","").split('(')[1].split(',')

        for arg in args:
            if arg == '_' or arg.startswith('?fv'):
                all_args_from_body.add(arg)

    return all_args_from_body

def add_counts(rule_str):
    rules = set()
    # rule_str = "turn_to (?s, ?d_new, ?d_prev) :- goal:have_image(?fv0, _);goal:pointing(?s, ?fv0);ini:pointing(_, ?fv0)."
    free_variables = get_free_variables(rule_str)
    
    for fv in free_variables:
        new_predicate = f";count({fv})."
        rules.add(rule_str.replace(".", new_predicate))
    
    return rules
        
# for r in add_counts():
#     print(r)



@pytest.mark.parametrize("body_str, expected", [
    # Correct order
    (
        "goal:have_image(?fv0, _);goal:pointing(?s, ?fv0);ini:pointing(_, ?fv0).", 
        set(["?fv0","_"])
    ),
    # No order
    (
        "goal:have_image(?fv0, _);goal:pointing(?s, ?fv0);ini:pointing(_, ?fv0).", 
        set(["_", "?fv0"])
    ),
    # No order

    (
        "goal:have_image(?fv0, _);goal:pointing(?s, ?fv0);ini:pointing(_, ?fv0).", 
        set(["_","?fv0"])
    ),

    # Correct order
    (
        "ini:turn_to(?fv1, ?fv2);goal:pointing(?fv3, ?fv0);ini:pointing(_, ?d).", 
        set(['?fv1', '?fv2', '?fv3', '?fv0', '_'])
    ),

    # Correct order
    (
        "ini:pointing(_, ?d).", 
        set(['_'])
    ),
    # Empty
    (
        "ini:pointing(?a, ?d).", 
        set()
    ),

])
def test_get_args(body_str, expected):
    assert get_free_variables(body_str) == expected

@pytest.mark.parametrize("body_str, expected", [
    (
        "ini:calibration_target(_, ?fv0);goal:have_image(?fv0, _);goal:pointing(?s, ?fv0).",
        set([
            "ini:calibration_target(_, ?fv0);goal:have_image(?fv0, _);goal:pointing(?s, ?fv0);count(?fv0).",
            "ini:calibration_target(_, ?fv0);goal:have_image(?fv0, _);goal:pointing(?s, ?fv0);count(_).",
        ])
    )
])
def test_add_counts(body_str, expected):
    assert add_counts(body_str) == expected
    # a = 1
    # b = 2
    # assert set([a,b]) == set([b,a])
