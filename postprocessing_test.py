
import pytest
from postprocessing import get_free_variables, get_count_rules, replace_underscores
from postprocessing import (
    POINTING_0,
    POINTING_1,
    SUPPORTS_0,SUPPORTS_1,
    ONBOARD_0,ONBOARD_1,POWER_AVAIL_0,
    POWER_ON_0,CALIBRATED_0,HAVE_IMAGE_0,HAVE_IMAGE_1,CALIBRATING_TARGET_0,CALIBRATING_TARGET_1)

@pytest.mark.parametrize("body_str, expected", [
    # Correct order
    (
        f"goal:have_image(?fv0, {HAVE_IMAGE_1});goal:pointing(?s, ?fv0);ini:pointing({POINTING_0}, ?fv0).", 
        set(["?fv0",HAVE_IMAGE_1,POINTING_0])
    ),
    # No order
    (
        f"goal:have_image(?fv0, {HAVE_IMAGE_1});goal:pointing(?s, ?fv0);ini:pointing({POINTING_0}, ?fv0).", 
        set([HAVE_IMAGE_1,POINTING_0, "?fv0"])
    ),
    # No order

    (
        f"goal:have_image(?fv0, {HAVE_IMAGE_1});goal:pointing(?s, ?fv0);ini:pointing({POINTING_0}, ?fv0).", 
        set([HAVE_IMAGE_1,POINTING_0,"?fv0"])
    ),

    # Correct order
    (
        f"ini:turn_to(?fv1, ?fv2);goal:pointing(?fv3, ?fv0);ini:pointing({POINTING_0}, {POINTING_1}).", 
        set(['?fv1', '?fv2', '?fv3', '?fv0', POINTING_0, POINTING_1])
    ),

    # Correct order
    (
        f"ini:pointing({POINTING_0}, ?d).", 
        set([POINTING_0])
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
        f"ini:calibration_target({CALIBRATING_TARGET_0}, ?fv0);goal:have_image(?fv0, {HAVE_IMAGE_1});goal:pointing(?s, ?fv0).",
        set([
            f"ini:calibration_target({CALIBRATING_TARGET_0}, ?fv0);goal:have_image(?fv0, {HAVE_IMAGE_1});goal:pointing(?s, ?fv0);count:count(?fv0).",
            f"ini:calibration_target({CALIBRATING_TARGET_0}, ?fv0);goal:have_image(?fv0, {HAVE_IMAGE_1});goal:pointing(?s, ?fv0);count:count({CALIBRATING_TARGET_0}).",
            f"ini:calibration_target({CALIBRATING_TARGET_0}, ?fv0);goal:have_image(?fv0, {HAVE_IMAGE_1});goal:pointing(?s, ?fv0);count:count({HAVE_IMAGE_1}).",

        ])
    ),
    (    # Only Wildcards
        f"ini:calibration_target({CALIBRATING_TARGET_0}, ?d);goal:have_image(?d, {HAVE_IMAGE_1});goal:pointing(?s, ?d).",
        set([
            f"ini:calibration_target({CALIBRATING_TARGET_0}, ?d);goal:have_image(?d, {HAVE_IMAGE_1});goal:pointing(?s, ?d);count:count({CALIBRATING_TARGET_0}).",
            f"ini:calibration_target({CALIBRATING_TARGET_0}, ?d);goal:have_image(?d, {HAVE_IMAGE_1});goal:pointing(?s, ?d);count:count({HAVE_IMAGE_1}).",

        ])
    ),
    # No free variables
    (
        "ini:calibration_target(?a, ?b);goal:have_image(?a, ?b);goal:pointing(?b, ?a).",
        set([])
    ),
    # 1 free variable
    (
        "ini:calibration_target(?fv0, ?b);goal:have_image(?a, ?b);goal:pointing(?b, ?a).",
        set(["ini:calibration_target(?fv0, ?b);goal:have_image(?a, ?b);goal:pointing(?b, ?a);count:count(?fv0)."])
    )
])
def test_add_counts(body_str, expected):
    assert get_count_rules(body_str) == expected




# Dynamically load from the problem number of certain objects for a given predicate
@pytest.mark.parametrize("body_str, expected", [
    (
        "ini:calibration_target(_, ?fv0);goal:have_image(?fv0, _);goal:pointing(?s, ?fv0).",
        f"ini:calibration_target({CALIBRATING_TARGET_0}, ?fv0);goal:have_image(?fv0, {HAVE_IMAGE_1});goal:pointing(?s, ?fv0)."
    ),
    (
        "ini:calibration_target(?i, _);goal:have_image(_, ?m);goal:pointing(?s, ?fv0).",
        f"ini:calibration_target(?i, {CALIBRATING_TARGET_1});goal:have_image({HAVE_IMAGE_0}, ?m);goal:pointing(?s, ?fv0)."
    ),
    (
        "ini:calibration_target(_, _);goal:have_image(?d, ?m);goal:pointing(?fv0, ?fv1).",
        f"ini:calibration_target({CALIBRATING_TARGET_0}, {CALIBRATING_TARGET_1});goal:have_image(?d, ?m);goal:pointing(?fv0, ?fv1).",
    ),
    (
        "ini:power_avail(_).",
        f"ini:power_avail({POWER_AVAIL_0})."
    ),
    (
        "ini:power_avail(?s).",
        f"ini:power_avail(?s)."
    )

])
def test_replace_underscores(body_str, expected):
    assert replace_underscores(body_str) == expected


# @pytest.mark.parametrize("body_str, expected",[
#     (
#         "ini:calibration_target(_, ?fv0);goal:have_image(?fv0, _);goal:pointing(?s, ?fv0).",
#         "ini:calibration_target(_instrument, ?fv0);goal:have_image(?fv0, _mode);goal:pointing(?s, ?fv0).",
#     ),
#     (
#         "ini:power_avail(_);ini:supports(?fv0, _);goal:pointing(?s, ?fv0).",
#         "ini:calibration_target(_, ?fv0);goal:have_image(?fv0, _);goal:pointing(?s, ?fv0);count(?fv0).",
#     ),
#     (
#         "ini:calibration_target(_, ?fv0);goal:have_image(?fv0, _);goal:pointing(?s, ?fv0).",
#         "ini:calibration_target(_, ?fv0);goal:have_image(?fv0, _);goal:pointing(?s, ?fv0);count(_).",
#     ),
# ])
#     )
# ])
# def test_rename_underscores()