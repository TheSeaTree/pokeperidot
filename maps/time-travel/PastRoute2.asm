	const_def 2 ; object constants
	const PASTROUTE2_OFFICER
	const PASTROUTE2_SUPER_NERD
	const PASTROUTE2_YOUNGSTER
	const PASTROUTE2_LASS
	const PASTROUTE2_POKEFANM
	const PASTROUTE2_POKEFANF
	const PASTROUTE2_CELEBI

PastRoute2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerOfficerTommy:
	trainer OFFICER, TOMMY, EVENT_BEAT_BEAUTY_VIOLET, OfficerTommyText, OfficerTommyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext OfficerTommyAfterText
	waitbutton
	closetext
	end

TrainerSuperNerdConnor:
	trainer SUPER_NERD, CONNOR, EVENT_BEAT_SUPER_NERD_CONNOR, SuperNerdConnorText, SuperNerdConnorWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdConnorAfterText
	waitbutton
	closetext
	end

TrainerSchoolboyJasper:
	trainer SCHOOLBOY, JASPER, EVENT_BEAT_SCHOOLBOY_JASPER, SchoolboyJasperText, SchoolboyJasperWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJasperAfterText
	waitbutton
	closetext
	end

TrainerPicnickerJennie:
	trainer PICNICKER, JENNIE, EVENT_BEAT_PICNICKER_JENNIE, PicnickerJennieText, PicnickerJennieWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerJennieAfterText
	waitbutton
	closetext
	end

TrainerPokefanMBradley:
	trainer POKEFANM, BRADLEY, EVENT_BEAT_POKEFANM_BRADLEY, PokefanMBradleyText, PokefanMBradleyWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanMBradleyAfterText
	waitbutton
	closetext
	end

TrainerPokefanFPatricia:
	trainer POKEFANF, PATRICIA, EVENT_BEAT_POKEFANF_PATRICIA, PokefanFPatriciaText, PokefanFPatriciaWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanFPatriciaAfterText
	waitbutton
	closetext
	end

CelebiBoss2:
	scall CelebiBoss3Intro
	loadwildmon CELEBI, 18
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	playsound SFX_WARP_TO
	applymovement PASTROUTE2_CELEBI, PastRoute2CelebiTeleportMovement
	setevent EVENT_HIDE_AND_SEEK_CELEBI_3
	clearevent EVENT_HIDE_AND_SEEK_CELEBI_4
	disappear PASTROUTE2_CELEBI
	waitsfx
	jumpstd bosscelebibattle

CelebiBoss3Intro:
	jumpstd bosscelebiintro
	end

PastRoute2CelebiTeleportMovement:
	hide_person
	step_sleep 2
	show_person
	step_sleep 2
	hide_person
	step_sleep 2
	show_person
	step_sleep 2
	hide_person
	step_sleep 2
	show_person
	step_sleep 2
	hide_person
	step_end

OfficerTommyText:
OfficerTommyWinText:
OfficerTommyAfterText:

SuperNerdConnorText:
SuperNerdConnorWinText:
SuperNerdConnorAfterText:

SchoolboyJasperText:
SchoolboyJasperWinText:
SchoolboyJasperAfterText:

PicnickerJennieText:
PicnickerJennieWinText:
PicnickerJennieAfterText:

PokefanMBradleyText:
PokefanMBradleyWinText:
PokefanMBradleyAfterText:

PokefanFPatriciaText:
PokefanFPatriciaWinText:
PokefanFPatriciaAfterText:
	text ""
	done

PastRoute2HiddenMiracleBerry:
	hiddenitem MIRACLEBERRY, EVENT_ROUTE_2_PAST_HIDDEN_MIRACLEBERRY

PastRoute2HiddenEnergyRoot:
	hiddenitem ENERGY_ROOT, EVENT_ROUTE_2_PAST_HIDDEN_ENERGY_ROOT

PastRoute2HiddenMysteryBerry:
	hiddenitem MYSTERYBERRY, EVENT_ROUTE_2_PAST_HIDDEN_MYSTERYBERRY

PastRoute2HiddenRevivalHerb:
	hiddenitem REVIVAL_HERB, EVENT_ROUTE_2_PAST_HIDDEN_REVIVAL_HERB

PastRoute2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 39, 30, PAST_PECTINIA_CITY, 2 ; Pectinia Gate
	warp_event 39, 31, PAST_PECTINIA_CITY, 3 ; Pectinia Gate

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event 30, 27, SPRITE_OFFICER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerOfficerTommy, -1
	object_event 34, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSuperNerdConnor, -1
	object_event 25,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyJasper, -1
	object_event  9, 20, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerJennie, -1
	object_event 13,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerPokefanMBradley, -1
	object_event 11,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerPokefanFPatricia, -1
	object_event 21, 29, SPRITE_CELEBI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CelebiBoss2, EVENT_HIDE_AND_SEEK_CELEBI_3
