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
	mode1 - mode
	mode2 - mode
	mode3 - mode
	mode4 - mode
	Star1 - direction
	Star2 - direction
	Star4 - direction
	GroundStation3 - direction
	GroundStation0 - direction
	Planet5 - direction
)
(:init
	(supports instrument0 mode3)
	(supports instrument2 mode2)
	(supports instrument1 mode1)
	(supports instrument1 mode2)
	(supports instrument3 mode1)
	(power_on instrument0)
	(power_on instrument2)
	(power_on instrument3)

	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)


	(supports instrument1 mode3)

	(pointing satellite0 Star2)


)
(:goal (and
	(have_image Planet5 image1)
	(pointing satellite0 Star1)
))

)
