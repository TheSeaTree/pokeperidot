	const_def 2 ; object constants
	const MAHOGANYDEPTSTOREB1F_POKE_BALL1
	const MAHOGANYDEPTSTOREB1F_POKE_BALL2
	const MAHOGANYDEPTSTOREB1F_POKE_BALL3
	const MAHOGANYDEPTSTOREB1F_POKE_BALL4
	const MAHOGANYDEPTSTOREB1F_BLACK_BELT1
	const MAHOGANYDEPTSTOREB1F_BLACK_BELT2
	const MAHOGANYDEPTSTOREB1F_BLACK_BELT3
	const MAHOGANYDEPTSTOREB1F_MACHOP

MahoganyDeptStoreB1F_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .ClearBoxes
	callback MAPCALLBACK_NEWMAP, .Unblock

.ClearBoxes:
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue .GotCardKey
	jump .Continue

.GotCardKey:
	changeblock 16, 4, $0d ; floor
	jump .Continue

.Continue:
	checkevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	iftrue .Layout2
	checkevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	iftrue .Layout3
	changeblock 10, 8, $0d ; floor
	return

.Layout2:
	changeblock 4, 10, $0d ; floor
	return

.Layout3:
	changeblock 10, 12, $0d ; floor
	return

.Unblock:
	clearevent EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
	return

MahoganyDeptStoreB1FBlackBelt1Script:
	jumptextfaceplayer MahoganyDeptStoreB1FBlackBelt1Text

MahoganyDeptStoreB1FBlackBelt2Script:
	jumptextfaceplayer MahoganyDeptStoreB1FBlackBelt2Text

MahoganyDeptStoreB1FBlackBelt3Script:
	jumptextfaceplayer MahoganyDeptStoreB1FBlackBelt3Text

MahoganyDeptStoreB1FMachopScript:
	opentext
	writetext MahoganyDeptStoreB1FMachokeText
	cry MACHOKE
	waitbutton
	closetext
	end

MahoganyDeptStoreB1FEther:
	itemball ETHER

MahoganyDeptStoreB1FAmuletCoin:
	itemball AMULET_COIN

MahoganyDeptStoreB1FBurnHeal:
	itemball BURN_HEAL

MahoganyDeptStoreB1FUltraBall:
	itemball ULTRA_BALL

MahoganyDeptStoreB1FBlackBelt1Text:
	text "Hey, kid! You're"
	line "holding us up!"

	para "Our policy is to"
	line "work behind the"

	para "scenes where no"
	line "one can see us!"
	done

MahoganyDeptStoreB1FBlackBelt2Text:
	text "I lose my passion"
	line "for work if some-"
	cont "one's watching."

	para "Come on, kid,"
	line "scoot!"
	done

MahoganyDeptStoreB1FBlackBelt3Text:
	text "Oohah! Oohah!"

	para "The stuff on the"
	line "ground's junk."

	para "Take it if you"
	line "want it!"
	done

MahoganyDeptStoreB1FMachokeText:
	text "MACHOKE: Maaacho!"
	done

MahoganyDeptStoreB1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 17,  2, GOLDENROD_UNDERGROUND_WAREHOUSE, 3
	warp_event  9,  4, MAHOGNAY_DEPT_STORE_ELEVATOR, 1
	warp_event 10,  4, MAHOGANY_DEPT_STORE_ELEVATOR, 2

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	object_event 10, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MahoganyDeptStoreB1FEther, EVENT_GOLDENROD_DEPT_STORE_B1F_ETHER
	object_event 14,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MahoganyDeptStoreB1FAmuletCoin, EVENT_GOLDENROD_DEPT_STORE_B1F_AMULET_COIN
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MahoganyDeptStoreB1FBurnHeal, EVENT_GOLDENROD_DEPT_STORE_B1F_BURN_HEAL
	object_event 15, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MahoganyDeptStoreB1FUltraBall, EVENT_GOLDENROD_DEPT_STORE_B1F_ULTRA_BALL
	object_event  9, 10, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStoreB1FBlackBelt1Script, -1
	object_event  4,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStoreB1FBlackBelt2Script, -1
	object_event  6, 13, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStoreB1FBlackBelt3Script, -1
	object_event  7,  7, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyDeptStoreB1FMachopScript, -1
