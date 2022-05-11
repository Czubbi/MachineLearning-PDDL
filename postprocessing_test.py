
import pytest
from postprocessing import get_free_variables, get_count_rules

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
    ),
    # No free variables or wildcards
    (
        "ini:calibration_target(?a, ?b);goal:have_image(?a, ?b);goal:pointing(?b, ?a).",
        set([])
    ),
    # 1 free variable
    (
        "ini:calibration_target(?fv0, ?b);goal:have_image(?a, ?b);goal:pointing(?b, ?a).",
        set(["ini:calibration_target(?fv0, ?b);goal:have_image(?a, ?b);goal:pointing(?b, ?a);count(?fv0)."])
    )
])
def test_add_counts(body_str, expected):
    assert get_count_rules(body_str) == expected
    # a = 1
    # b = 2
    # assert set([a,b]) == set([b,a])
