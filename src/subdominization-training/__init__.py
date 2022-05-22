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