(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	satellite1 - satellite
	instrument2 - instrument
	instrument3 - instrument
	satellite2 - satellite
	instrument4 - instrument
	infrared0 - mode
	image2 - mode
	spectrograph3 - mode
	infrared1 - mode
	GroundStation2 - direction
	GroundStation4 - direction
	GroundStation0 - direction
	GroundStation1 - direction
	GroundStation3 - direction
	Planet5 - direction
	Star6 - direction
	Star7 - direction
	Star8 - direction
	Planet9 - direction
	Planet10 - direction
	Star11 - direction
)
(:init
	(supports instrument0 spectrograph3)
	(supports instrument0 infrared1)
	(supports instrument0 image2)
	(calibration_target instrument0 GroundStation0)
	(supports instrument1 spectrograph3)
	(supports instrument1 image2)
	(calibration_target instrument1 GroundStation3)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(power_avail satellite0)
	(pointing satellite0 Planet9)
	(supports instrument2 infrared1)
	(calibration_target instrument2 GroundStation3)
	(supports instrument3 spectrograph3)
	(supports instrument3 image2)
	(supports instrument3 infrared0)
	(calibration_target instrument3 GroundStation1)
	(on_board instrument2 satellite1)
	(on_board instrument3 satellite1)
	(power_avail satellite1)
	(pointing satellite1 GroundStation2)
	(supports instrument4 infrared1)
	(calibration_target instrument4 GroundStation3)
	(on_board instrument4 satellite2)
	(power_avail satellite2)
	(pointing satellite2 GroundStation4)
)
(:goal (and
	(pointing satellite2 GroundStation1)
	(have_image Planet5 image2)
	(have_image Star6 infrared0)
	(have_image Star7 image2)
	(have_image Star8 infrared0)
	(have_image Planet10 image2)
	(have_image Star11 spectrograph3)
))

)
