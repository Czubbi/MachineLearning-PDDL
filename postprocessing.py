
from typing import Set
import pytest
from itertools import product

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

def add_counts(rule_str) -> Set[str]:
    """
    Creates extra rules out of the free variables(1 rule per 1 Fv) and appends predicate counts to the body.
    If no free variables then an empty set is returned
    """
    rules = set()
    free_variables = get_free_variables(rule_str)
    
    for fv in free_variables:
        new_predicate = f";count({fv})."
        rules.add(rule_str.replace(".", new_predicate))
    
    return rules