	const_def 2 ; object constants

AcroporaPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CreepyLady:
;	checkcoins 1
;	ifequal HAVE_MORE, .skip
	faceplayer
;	opentext
	givepoke RAICHU, 100
;	givepoke MEW, 80
;	closetext
;	givecoins 9999
;	giveitem MASTER_BALL
;	giveitem MEGAVITAMIN
;	giveitem RARE_CANDY
	loadwildmon SUICUNE, 100
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
;	winlosstext CoinText, CoinText
;	loadtrainer POKEMON_PROF, TEST
	startbattle
	reloadmapafterbattle
	end
	
.skip
	opentext
	writetext CoinText
	special DisplayCoinCaseBalance
	waitbutton
	closetext
	end
	

AcroporaPokecenter1FNurseScript:
	jumpstd pokecenternurse

CoinText:
	text "Coins."
	done

AcroporaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ACROPORA_CITY, 2
	warp_event  4,  7, ACROPORA_CITY, 1
	warp_event  0,  7, POKECENTER_2F, 1	

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcroporaPokecenter1FNurseScript, -1
;	object_event  6,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CreepyLady, -1
