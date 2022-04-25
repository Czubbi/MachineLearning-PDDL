(define (problem strips-sat-x-1)
(:domain satellite)
(:objects
	satellite0 - satellite
	instrument0 - instrument
	instrument1 - instrument
	instrument2 - instrument
	instrument3 - instrument
	satellite1 - satellite
	instrument4 - instrument
	instrument5 - instrument
	satellite2 - satellite
	instrument6 - instrument
	instrument7 - instrument
	instrument8 - instrument
	satellite3 - satellite
	instrument9 - instrument
	instrument10 - instrument
	instrument11 - instrument
	instrument12 - instrument
	spectrograph0 - mode
	thermograph3 - mode
	spectrograph2 - mode
	thermograph1 - mode
	Star13 - direction
	Star6 - direction
	GroundStation0 - direction
	GroundStation10 - direction
	GroundStation1 - direction
	Star7 - direction
	GroundStation4 - direction
	GroundStation11 - direction
	Star12 - direction
	Star8 - direction
	GroundStation5 - direction
	GroundStation2 - direction
	GroundStation9 - direction
	GroundStation14 - direction
	GroundStation3 - direction
	Star15 - direction
	Star16 - direction
	Star17 - direction
	Star18 - direction
)
(:init
	(supports instrument0 spectrograph0)
	(supports instrument0 thermograph3)
	(calibration_target instrument0 Star6)
	(calibration_target instrument0 GroundStation11)
	(supports instrument1 thermograph3)
	(supports instrument1 spectrograph0)
	(supports instrument1 thermograph1)
	(calibration_target instrument1 Star6)
	(calibration_target instrument1 GroundStation0)
	(calibration_target instrument1 Star8)
	(calibration_target instrument1 GroundStation3)
	(supports instrument2 thermograph1)
	(supports instrument2 spectrograph2)
	(supports instrument2 spectrograph0)
	(calibration_target instrument2 Star7)
	(supports instrument3 thermograph3)
	(supports instrument3 spectrograph2)
	(supports instrument3 spectrograph0)
	(calibration_target instrument3 Star12)
	(calibration_target instrument3 GroundStation0)
	(calibration_target instrument3 GroundStation9)
	(calibration_target instrument3 GroundStation4)
	(calibration_target instrument3 GroundStation5)
	(on_board instrument0 satellite0)
	(on_board instrument1 satellite0)
	(on_board instrument2 satellite0)
	(on_board instrument3 satellite0)
	(power_avail satellite0)
	(pointing satellite0 GroundStation9)
	(supports instrument4 thermograph1)
	(supports instrument4 thermograph3)
	(calibration_target instrument4 Star13)
	(calibration_target instrument4 GroundStation2)
	(calibration_target instrument4 GroundStation9)
	(calibration_target instrument4 Star6)
	(calibration_target instrument4 GroundStation1)
	(supports instrument5 thermograph1)
	(calibration_target instrument5 Star8)
	(calibration_target instrument5 GroundStation11)
	(calibration_target instrument5 GroundStation9)
	(calibration_target instrument5 GroundStation5)
	(calibration_target instrument5 Star13)
	(on_board instrument4 satellite1)
	(on_board instrument5 satellite1)
	(power_avail satellite1)
	(pointing satellite1 Star6)
	(supports instrument6 thermograph3)
	(calibration_target instrument6 GroundStation11)
	(calibration_target instrument6 Star7)
	(calibration_target instrument6 Star13)
	(calibration_target instrument6 Star6)
	(supports instrument7 thermograph1)
	(supports instrument7 spectrograph2)
	(calibration_target instrument7 Star13)
	(calibration_target instrument7 GroundStation4)
	(calibration_target instrument7 GroundStation14)
	(calibration_target instrument7 Star6)
	(supports instrument8 spectrograph2)
	(supports instrument8 thermograph3)
	(calibration_target instrument8 GroundStation0)
	(calibration_target instrument8 Star6)
	(calibration_target instrument8 GroundStation2)
	(calibration_target instrument8 GroundStation14)
	(calibration_target instrument8 GroundStation4)
	(on_board instrument6 satellite2)
	(on_board instrument7 satellite2)
	(on_board instrument8 satellite2)
	(power_avail satellite2)
	(pointing satellite2 GroundStation5)
	(supports instrument9 spectrograph2)
	(calibration_target instrument9 GroundStation9)
	(calibration_target instrument9 GroundStation10)
	(calibration_target instrument9 GroundStation11)
	(calibration_target instrument9 Star12)
	(supports instrument10 thermograph1)
	(calibration_target instrument10 Star7)
	(calibration_target instrument10 GroundStation1)
	(calibration_target instrument10 GroundStation9)
	(supports instrument11 thermograph1)
	(supports instrument11 thermograph3)
	(calibration_target instrument11 Star8)
	(calibration_target instrument11 Star12)
	(calibration_target instrument11 GroundStation11)
	(calibration_target instrument11 GroundStation14)
	(calibration_target instrument11 GroundStation4)
	(supports instrument12 thermograph1)
	(supports instrument12 spectrograph2)
	(supports instrument12 thermograph3)
	(calibration_target instrument12 GroundStation3)
	(calibration_target instrument12 GroundStation14)
	(calibration_target instrument12 GroundStation9)
	(calibration_target instrument12 GroundStation2)
	(calibration_target instrument12 GroundStation5)
	(on_board instrument9 satellite3)
	(on_board instrument10 satellite3)
	(on_board instrument11 satellite3)
	(on_board instrument12 satellite3)
	(power_avail satellite3)
	(pointing satellite3 GroundStation1)
)
(:goal (and
	(pointing satellite2 GroundStation2)
	(have_image Star15 spectrograph0)
	(have_image Star16 thermograph1)
	(have_image Star17 thermograph3)
	(have_image Star18 spectrograph0)
))

)
