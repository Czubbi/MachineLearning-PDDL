# turn_to (?s, ?d_prev, ?d_new) :- ini:power_avail(_);ini:pointing(?s, ?d_new).
(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	satellite2 - satellite
	satellite3 - satellite
	instrument2 - instrument
	instrument3 - instrument
	instrument55 - instrument
	thermograph0 - mode
	image1 - mode
	Star1 - direction
	Star2 - direction
	Star4 - direction
	GroundStation3 - direction
	GroundStation0 - direction
	Planet5 - direction
)
(:init

	(pointing satellite0 planet5)
	(power_avail satellite2)
	(power_avail satellite3)
	(power_avail satellite3)
	(power_avail satellite1)
)
(:goal (and
	(have_image Planet5 image1)
))

)
