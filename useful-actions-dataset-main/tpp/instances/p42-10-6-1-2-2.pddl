; Domain designed by Alfonso Gerevini and Alessandro Saetti
; This file has been automatically generated by the generator available from
; http://zeus.ing.unibs.it/ipc-5/generators/index.html

(define (problem TPP)
(:domain TPP-Propositional)
(:objects
	goods1 goods2 goods3 goods4 goods5 goods6 goods7 goods8 goods9 goods10 - goods
	truck1 - truck
	market1 market2 market3 market4 market5 market6 - market
	depot1 depot2 - depot
	level0 level1 level2 - level)

(:init
	(next level1 level0)
	(next level2 level1)
	(ready-to-load goods1 market1 level0)
	(ready-to-load goods1 market2 level0)
	(ready-to-load goods1 market3 level0)
	(ready-to-load goods1 market4 level0)
	(ready-to-load goods1 market5 level0)
	(ready-to-load goods1 market6 level0)
	(ready-to-load goods2 market1 level0)
	(ready-to-load goods2 market2 level0)
	(ready-to-load goods2 market3 level0)
	(ready-to-load goods2 market4 level0)
	(ready-to-load goods2 market5 level0)
	(ready-to-load goods2 market6 level0)
	(ready-to-load goods3 market1 level0)
	(ready-to-load goods3 market2 level0)
	(ready-to-load goods3 market3 level0)
	(ready-to-load goods3 market4 level0)
	(ready-to-load goods3 market5 level0)
	(ready-to-load goods3 market6 level0)
	(ready-to-load goods4 market1 level0)
	(ready-to-load goods4 market2 level0)
	(ready-to-load goods4 market3 level0)
	(ready-to-load goods4 market4 level0)
	(ready-to-load goods4 market5 level0)
	(ready-to-load goods4 market6 level0)
	(ready-to-load goods5 market1 level0)
	(ready-to-load goods5 market2 level0)
	(ready-to-load goods5 market3 level0)
	(ready-to-load goods5 market4 level0)
	(ready-to-load goods5 market5 level0)
	(ready-to-load goods5 market6 level0)
	(ready-to-load goods6 market1 level0)
	(ready-to-load goods6 market2 level0)
	(ready-to-load goods6 market3 level0)
	(ready-to-load goods6 market4 level0)
	(ready-to-load goods6 market5 level0)
	(ready-to-load goods6 market6 level0)
	(ready-to-load goods7 market1 level0)
	(ready-to-load goods7 market2 level0)
	(ready-to-load goods7 market3 level0)
	(ready-to-load goods7 market4 level0)
	(ready-to-load goods7 market5 level0)
	(ready-to-load goods7 market6 level0)
	(ready-to-load goods8 market1 level0)
	(ready-to-load goods8 market2 level0)
	(ready-to-load goods8 market3 level0)
	(ready-to-load goods8 market4 level0)
	(ready-to-load goods8 market5 level0)
	(ready-to-load goods8 market6 level0)
	(ready-to-load goods9 market1 level0)
	(ready-to-load goods9 market2 level0)
	(ready-to-load goods9 market3 level0)
	(ready-to-load goods9 market4 level0)
	(ready-to-load goods9 market5 level0)
	(ready-to-load goods9 market6 level0)
	(ready-to-load goods10 market1 level0)
	(ready-to-load goods10 market2 level0)
	(ready-to-load goods10 market3 level0)
	(ready-to-load goods10 market4 level0)
	(ready-to-load goods10 market5 level0)
	(ready-to-load goods10 market6 level0)
	(stored goods1 level0)
	(stored goods2 level0)
	(stored goods3 level0)
	(stored goods4 level0)
	(stored goods5 level0)
	(stored goods6 level0)
	(stored goods7 level0)
	(stored goods8 level0)
	(stored goods9 level0)
	(stored goods10 level0)
	(loaded goods1 truck1 level0)
	(loaded goods2 truck1 level0)
	(loaded goods3 truck1 level0)
	(loaded goods4 truck1 level0)
	(loaded goods5 truck1 level0)
	(loaded goods6 truck1 level0)
	(loaded goods7 truck1 level0)
	(loaded goods8 truck1 level0)
	(loaded goods9 truck1 level0)
	(loaded goods10 truck1 level0)
	(connected market1 market2)
	(connected market1 market3)
	(connected market1 market4)
	(connected market1 market5)
	(connected market2 market1)
	(connected market2 market3)
	(connected market2 market4)
	(connected market2 market6)
	(connected market3 market1)
	(connected market3 market2)
	(connected market3 market4)
	(connected market3 market6)
	(connected market4 market1)
	(connected market4 market2)
	(connected market4 market3)
	(connected market5 market1)
	(connected market5 market6)
	(connected market6 market2)
	(connected market6 market3)
	(connected market6 market5)
	(connected depot1 market1)
	(connected market1 depot1)
	(connected depot2 market1)
	(connected market1 depot2)
	(on-sale goods1 market1 level1)
	(on-sale goods2 market1 level1)
	(on-sale goods3 market1 level1)
	(on-sale goods4 market1 level0)
	(on-sale goods5 market1 level1)
	(on-sale goods6 market1 level0)
	(on-sale goods7 market1 level0)
	(on-sale goods8 market1 level1)
	(on-sale goods9 market1 level1)
	(on-sale goods10 market1 level1)
	(on-sale goods1 market2 level0)
	(on-sale goods2 market2 level1)
	(on-sale goods3 market2 level1)
	(on-sale goods4 market2 level1)
	(on-sale goods5 market2 level0)
	(on-sale goods6 market2 level0)
	(on-sale goods7 market2 level1)
	(on-sale goods8 market2 level0)
	(on-sale goods9 market2 level1)
	(on-sale goods10 market2 level0)
	(on-sale goods1 market3 level1)
	(on-sale goods2 market3 level0)
	(on-sale goods3 market3 level0)
	(on-sale goods4 market3 level0)
	(on-sale goods5 market3 level0)
	(on-sale goods6 market3 level1)
	(on-sale goods7 market3 level1)
	(on-sale goods8 market3 level1)
	(on-sale goods9 market3 level0)
	(on-sale goods10 market3 level1)
	(on-sale goods1 market4 level0)
	(on-sale goods2 market4 level0)
	(on-sale goods3 market4 level0)
	(on-sale goods4 market4 level1)
	(on-sale goods5 market4 level1)
	(on-sale goods6 market4 level1)
	(on-sale goods7 market4 level0)
	(on-sale goods8 market4 level0)
	(on-sale goods9 market4 level0)
	(on-sale goods10 market4 level0)
	(on-sale goods1 market5 level0)
	(on-sale goods2 market5 level0)
	(on-sale goods3 market5 level0)
	(on-sale goods4 market5 level0)
	(on-sale goods5 market5 level0)
	(on-sale goods6 market5 level0)
	(on-sale goods7 market5 level0)
	(on-sale goods8 market5 level0)
	(on-sale goods9 market5 level0)
	(on-sale goods10 market5 level0)
	(on-sale goods1 market6 level0)
	(on-sale goods2 market6 level0)
	(on-sale goods3 market6 level0)
	(on-sale goods4 market6 level0)
	(on-sale goods5 market6 level0)
	(on-sale goods6 market6 level0)
	(on-sale goods7 market6 level0)
	(on-sale goods8 market6 level0)
	(on-sale goods9 market6 level0)
	(on-sale goods10 market6 level0)
	(at truck1 depot2))

(:goal (and
	(stored goods1 level2)
	(stored goods2 level2)
	(stored goods3 level1)
	(stored goods4 level2)
	(stored goods5 level2)
	(stored goods6 level1)
	(stored goods7 level1)
	(stored goods8 level1)
	(stored goods9 level2)
	(stored goods10 level1)))

)
