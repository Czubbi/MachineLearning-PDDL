(define (problem depotprob14) (:domain depots)
(:objects
	depot0 depot1 depot2 depot3 depot4 depot5 depot6 depot7 depot8 depot9 depot10 depot11 depot12 depot13 depot14 depot15 depot16 depot17 - Depot
	distributor0 distributor1 distributor2 distributor3 distributor4 distributor5 distributor6 distributor7 distributor8 distributor9 distributor10 distributor11 distributor12 distributor13 distributor14 distributor15 distributor16 distributor17 - Distributor
	truck0 truck1 truck2 truck3 truck4 truck5 truck6 truck7 truck8 truck9 truck10 truck11 truck12 truck13 truck14 truck15 - Truck
	pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 pallet8 pallet9 pallet10 pallet11 pallet12 pallet13 pallet14 pallet15 pallet16 pallet17 pallet18 pallet19 pallet20 pallet21 pallet22 pallet23 pallet24 pallet25 pallet26 pallet27 pallet28 pallet29 pallet30 pallet31 pallet32 pallet33 pallet34 pallet35 - Pallet
	crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14 crate15 crate16 crate17 crate18 crate19 crate20 crate21 crate22 crate23 crate24 crate25 crate26 crate27 crate28 crate29 crate30 crate31 crate32 crate33 crate34 crate35 crate36 crate37 crate38 crate39 crate40 crate41 crate42 crate43 crate44 crate45 crate46 crate47 crate48 crate49 crate50 crate51 crate52 crate53 crate54 crate55 - Crate
	hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 hoist6 hoist7 hoist8 hoist9 hoist10 hoist11 hoist12 hoist13 hoist14 hoist15 hoist16 hoist17 hoist18 hoist19 hoist20 hoist21 hoist22 hoist23 hoist24 hoist25 hoist26 hoist27 hoist28 hoist29 hoist30 hoist31 hoist32 hoist33 hoist34 hoist35 - Hoist)
(:init
	(at pallet0 depot0)
	(clear crate36)
	(at pallet1 depot1)
	(clear crate53)
	(at pallet2 depot2)
	(clear pallet2)
	(at pallet3 depot3)
	(clear crate22)
	(at pallet4 depot4)
	(clear crate34)
	(at pallet5 depot5)
	(clear crate55)
	(at pallet6 depot6)
	(clear crate41)
	(at pallet7 depot7)
	(clear crate54)
	(at pallet8 depot8)
	(clear crate14)
	(at pallet9 depot9)
	(clear pallet9)
	(at pallet10 depot10)
	(clear pallet10)
	(at pallet11 depot11)
	(clear crate33)
	(at pallet12 depot12)
	(clear crate11)
	(at pallet13 depot13)
	(clear crate46)
	(at pallet14 depot14)
	(clear crate12)
	(at pallet15 depot15)
	(clear pallet15)
	(at pallet16 depot16)
	(clear pallet16)
	(at pallet17 depot17)
	(clear crate44)
	(at pallet18 distributor0)
	(clear crate16)
	(at pallet19 distributor1)
	(clear crate28)
	(at pallet20 distributor2)
	(clear crate47)
	(at pallet21 distributor3)
	(clear crate20)
	(at pallet22 distributor4)
	(clear pallet22)
	(at pallet23 distributor5)
	(clear crate42)
	(at pallet24 distributor6)
	(clear pallet24)
	(at pallet25 distributor7)
	(clear crate52)
	(at pallet26 distributor8)
	(clear crate26)
	(at pallet27 distributor9)
	(clear crate30)
	(at pallet28 distributor10)
	(clear pallet28)
	(at pallet29 distributor11)
	(clear pallet29)
	(at pallet30 distributor12)
	(clear crate51)
	(at pallet31 distributor13)
	(clear crate27)
	(at pallet32 distributor14)
	(clear pallet32)
	(at pallet33 distributor15)
	(clear pallet33)
	(at pallet34 distributor16)
	(clear crate50)
	(at pallet35 distributor17)
	(clear crate49)
	(at truck0 distributor16)
	(at truck1 depot17)
	(at truck2 distributor14)
	(at truck3 depot16)
	(at truck4 distributor1)
	(at truck5 distributor10)
	(at truck6 distributor16)
	(at truck7 distributor10)
	(at truck8 distributor2)
	(at truck9 distributor16)
	(at truck10 distributor8)
	(at truck11 distributor8)
	(at truck12 distributor4)
	(at truck13 depot10)
	(at truck14 depot2)
	(at truck15 depot11)
	(at hoist0 depot0)
	(available hoist0)
	(at hoist1 depot1)
	(available hoist1)
	(at hoist2 depot2)
	(available hoist2)
	(at hoist3 depot3)
	(available hoist3)
	(at hoist4 depot4)
	(available hoist4)
	(at hoist5 depot5)
	(available hoist5)
	(at hoist6 depot6)
	(available hoist6)
	(at hoist7 depot7)
	(available hoist7)
	(at hoist8 depot8)
	(available hoist8)
	(at hoist9 depot9)
	(available hoist9)
	(at hoist10 depot10)
	(available hoist10)
	(at hoist11 depot11)
	(available hoist11)
	(at hoist12 depot12)
	(available hoist12)
	(at hoist13 depot13)
	(available hoist13)
	(at hoist14 depot14)
	(available hoist14)
	(at hoist15 depot15)
	(available hoist15)
	(at hoist16 depot16)
	(available hoist16)
	(at hoist17 depot17)
	(available hoist17)
	(at hoist18 distributor0)
	(available hoist18)
	(at hoist19 distributor1)
	(available hoist19)
	(at hoist20 distributor2)
	(available hoist20)
	(at hoist21 distributor3)
	(available hoist21)
	(at hoist22 distributor4)
	(available hoist22)
	(at hoist23 distributor5)
	(available hoist23)
	(at hoist24 distributor6)
	(available hoist24)
	(at hoist25 distributor7)
	(available hoist25)
	(at hoist26 distributor8)
	(available hoist26)
	(at hoist27 distributor9)
	(available hoist27)
	(at hoist28 distributor10)
	(available hoist28)
	(at hoist29 distributor11)
	(available hoist29)
	(at hoist30 distributor12)
	(available hoist30)
	(at hoist31 distributor13)
	(available hoist31)
	(at hoist32 distributor14)
	(available hoist32)
	(at hoist33 distributor15)
	(available hoist33)
	(at hoist34 distributor16)
	(available hoist34)
	(at hoist35 distributor17)
	(available hoist35)
	(at crate0 depot4)
	(on crate0 pallet4)
	(at crate1 depot6)
	(on crate1 pallet6)
	(at crate2 depot17)
	(on crate2 pallet17)
	(at crate3 depot17)
	(on crate3 crate2)
	(at crate4 distributor12)
	(on crate4 pallet30)
	(at crate5 depot6)
	(on crate5 crate1)
	(at crate6 depot3)
	(on crate6 pallet3)
	(at crate7 depot5)
	(on crate7 pallet5)
	(at crate8 depot1)
	(on crate8 pallet1)
	(at crate9 distributor0)
	(on crate9 pallet18)
	(at crate10 distributor16)
	(on crate10 pallet34)
	(at crate11 depot12)
	(on crate11 pallet12)
	(at crate12 depot14)
	(on crate12 pallet14)
	(at crate13 distributor1)
	(on crate13 pallet19)
	(at crate14 depot8)
	(on crate14 pallet8)
	(at crate15 distributor8)
	(on crate15 pallet26)
	(at crate16 distributor0)
	(on crate16 crate9)
	(at crate17 distributor8)
	(on crate17 crate15)
	(at crate18 distributor5)
	(on crate18 pallet23)
	(at crate19 distributor9)
	(on crate19 pallet27)
	(at crate20 distributor3)
	(on crate20 pallet21)
	(at crate21 depot13)
	(on crate21 pallet13)
	(at crate22 depot3)
	(on crate22 crate6)
	(at crate23 distributor2)
	(on crate23 pallet20)
	(at crate24 depot11)
	(on crate24 pallet11)
	(at crate25 depot1)
	(on crate25 crate8)
	(at crate26 distributor8)
	(on crate26 crate17)
	(at crate27 distributor13)
	(on crate27 pallet31)
	(at crate28 distributor1)
	(on crate28 crate13)
	(at crate29 distributor12)
	(on crate29 crate4)
	(at crate30 distributor9)
	(on crate30 crate19)
	(at crate31 depot5)
	(on crate31 crate7)
	(at crate32 depot17)
	(on crate32 crate3)
	(at crate33 depot11)
	(on crate33 crate24)
	(at crate34 depot4)
	(on crate34 crate0)
	(at crate35 distributor5)
	(on crate35 crate18)
	(at crate36 depot0)
	(on crate36 pallet0)
	(at crate37 depot13)
	(on crate37 crate21)
	(at crate38 distributor2)
	(on crate38 crate23)
	(at crate39 depot7)
	(on crate39 pallet7)
	(at crate40 depot1)
	(on crate40 crate25)
	(at crate41 depot6)
	(on crate41 crate5)
	(at crate42 distributor5)
	(on crate42 crate35)
	(at crate43 distributor16)
	(on crate43 crate10)
	(at crate44 depot17)
	(on crate44 crate32)
	(at crate45 distributor16)
	(on crate45 crate43)
	(at crate46 depot13)
	(on crate46 crate37)
	(at crate47 distributor2)
	(on crate47 crate38)
	(at crate48 depot1)
	(on crate48 crate40)
	(at crate49 distributor17)
	(on crate49 pallet35)
	(at crate50 distributor16)
	(on crate50 crate45)
	(at crate51 distributor12)
	(on crate51 crate29)
	(at crate52 distributor7)
	(on crate52 pallet25)
	(at crate53 depot1)
	(on crate53 crate48)
	(at crate54 depot7)
	(on crate54 crate39)
	(at crate55 depot5)
	(on crate55 crate31)
)

(:goal (and
		(on crate0 pallet11)
		(on crate1 pallet33)
		(on crate2 crate25)
		(on crate3 pallet20)
		(on crate4 pallet4)
		(on crate5 crate33)
		(on crate6 pallet31)
		(on crate7 pallet14)
		(on crate8 crate3)
		(on crate9 crate51)
		(on crate10 pallet15)
		(on crate11 crate7)
		(on crate12 crate24)
		(on crate13 pallet17)
		(on crate14 crate45)
		(on crate15 crate19)
		(on crate16 pallet5)
		(on crate18 pallet1)
		(on crate19 crate20)
		(on crate20 pallet0)
		(on crate22 crate30)
		(on crate23 pallet10)
		(on crate24 pallet12)
		(on crate25 pallet21)
		(on crate26 crate13)
		(on crate27 crate11)
		(on crate29 pallet24)
		(on crate30 pallet25)
		(on crate31 pallet7)
		(on crate32 pallet35)
		(on crate33 pallet23)
		(on crate35 pallet18)
		(on crate37 crate40)
		(on crate39 crate18)
		(on crate40 crate10)
		(on crate41 pallet16)
		(on crate42 pallet6)
		(on crate43 crate8)
		(on crate44 crate32)
		(on crate45 crate16)
		(on crate46 crate2)
		(on crate48 crate23)
		(on crate49 pallet29)
		(on crate50 pallet27)
		(on crate51 crate14)
		(on crate52 crate15)
		(on crate54 pallet28)
		(on crate55 pallet34)
	)
))
