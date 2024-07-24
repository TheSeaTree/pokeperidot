	const_def 2 ; object constants
	const PASTROUTE2_OFFICER
	const PASTROUTE2_SUPER_NERD
	const PASTROUTE2_YOUNGSTER
	const PASTROUTE2_LASS1
	const PASTROUTE2_POKEFANM
	const PASTROUTE2_POKEFANF
	const PASTROUTE2_LASS2
	const PASTROUTE2_POKE_BALL1
	const PASTROUTE2_POKE_BALL2
	const PASTROUTE2_POKE_BALL3
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

TrainerLassPaige:
	trainer LASS, PAIGE, EVENT_BEAT_LASS_PAIGE, LassPaigeText, LassPaigeWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassPaigeAfterText
	waitbutton
	closetext
	end

CelebiBoss3:
	scall CelebiBoss3Intro
	loadwildmon CELEBI, 21
	writecode VAR_BATTLETYPE, BATTLETYPE_BOSS
	startbattle
	reloadmapafterbattle
	playsound SFX_WARP_TO
	applymovement PASTROUTE2_CELEBI, PastRoute2CelebiTeleportMovement
	setevent EVENT_HIDE_AND_SEEK_CELEBI_3
	clearevent EVENT_HIDE_AND_SEEK_CELEBI_4
	disappear PASTROUTE2_CELEBI
	waitsfx
	jumpstd bosscelebidisappear

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

PastRoute2SkillBelt:
	itemball SKILL_BELT

PastRoute2Thunderstone:
	itemball THUNDERSTONE

PastRoute2MaxRepel:
	itemball MAX_REPEL

PastRoute2Sign:
	jumptext PastRoute2SignText

PastRoute2HiddenMiracleBerry:
	hiddenitem MIRACLEBERRY, EVENT_ROUTE_2_PAST_HIDDEN_MIRACLEBERRY

PastRoute2HiddenEnergyRoot:
	hiddenitem ENERGY_ROOT, EVENT_ROUTE_2_PAST_HIDDEN_ENERGY_ROOT

PastRoute2HiddenMysteryBerry:
	hiddenitem MYSTERYBERRY, EVENT_ROUTE_2_PAST_HIDDEN_MYSTERYBERRY

PastRoute2HiddenRevivalHerb:
	hiddenitem REVIVAL_HERB, EVENT_ROUTE_2_PAST_HIDDEN_REVIVAL_HERB

OfficerTommyText:
	text "Hey, kid. Do you"
	line "want to give me"
	cont "something to pass"
	cont "the time?"
	done

OfficerTommyWinText:
	text "That was too"
	line "quick!"

	para "Now I have nothing"
	line "to do again…"
	done

OfficerTommyAfterText:
	text "They have me pat-"
	line "rol this part of"
	cont "the route that"
	cont "nobody visits."
	done

SuperNerdConnorText:
	text "I use the rarest"
	line "most rare #MON!"
	done

SuperNerdConnorWinText:
	text "…A loss?"

	para "That is more rare"
	line "than my team!"
	done

SuperNerdConnorAfterText:
	text "It's so time-"
	line "consuming to find"
	cont "#MON like mine."

	para "I never have time"
	line "to properly train…"
	done

SchoolboyJasperText:
	text "Don't tell my big"
	line "bro about this"
	cont "#MON I found!"
	done

SchoolboyJasperWinText:
	text "Wow! It wasn't"
	line "even a good one!"
	done

SchoolboyJasperAfterText:
	text "My brother CONNOR"
	line "has been looking"
	cont "for a GLIGAR!"

	para "He's going to be"
	line "mad when he sees"
	cont "I found one first!"
	done

PicnickerJennieText:
	text "I like to catch"
	line "cool #MON!"
	done

PicnickerJennieWinText:
	text "Waaaah! My #MON"
	line "weren't cool"
	cont "enough to win!"
	done

PicnickerJennieAfterText:
	text "My friends say my"
	line "#MON are for"
	cont "boys, but I still"
	cont "like them!"
	done

PokefanMBradleyText:
	text "I took my wife"
	line "along to find my"
	cont "favorite #MON!"
	done

PokefanMBradleyWinText:
	text "My wife's not going"
	line "to like this!"
	done

PokefanMBradleyAfterText:
	text "I had to travel to"
	line "a far away ROUTE"
	cont "for my PIKACHU."
	done

PokefanFPatriciaText:
	text "When my husband"
	line "was looking for"
	cont "his PIKACHU, I"
	cont "found my favorite"
	cont "#MON too!"
	done

PokefanFPatriciaWinText:
	text "How could you do"
	line "that to my baby!?"
	done

PokefanFPatriciaAfterText:
	text "I love to spend"
	line "time with my"
	cont "husband, even if"
	cont "he makes me walk"
	cont "so far to find new"
	cont "#MON to catch."
	done

LassPaigeText:
	text "My #MON know"
	line "how to use"
	line "lots of moves!"
	done

LassPaigeWinText:
	text "…How were you"
	line "prepared for that?"
	done

LassPaigeAfterText:
	text "The lady in FAVIA"
	line "TOWN taught my"
	cont "#MON lots of"
	cont "special moves."

	para "I need to give her"
	line "another visit be-"
	cont "fore our rematch!"
	done

PastRoute2SignText:
	text "ROUTE 2"

	para "PAVONA VILLAGE -"
	line "PECTINIA CITY"
	done

PastRoute2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 39, 30, PAST_ROUTE_2_GATE, 1
	warp_event 39, 31, PAST_ROUTE_2_GATE, 2

	db 0 ; coord events

	db 5 ; bg events
	bg_event  4,  3, BGEVENT_READ, PastRoute2Sign
	bg_event 12, 13, BGEVENT_ITEM, PastRoute2HiddenMiracleBerry
	bg_event 27, 10, BGEVENT_ITEM, PastRoute2HiddenEnergyRoot
	bg_event 30, 30, BGEVENT_ITEM, PastRoute2HiddenMysteryBerry
	bg_event  7, 26, BGEVENT_ITEM, PastRoute2HiddenRevivalHerb

	db 11 ; object events
	object_event 30, 27, SPRITE_OFFICER_M, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerOfficerTommy, -1
	object_event 34, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSuperNerdConnor, -1
	object_event 25,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyJasper, -1
	object_event  9, 20, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerJennie, -1
	object_event 13,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPokefanMBradley, -1
	object_event 11,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPokefanFPatricia, -1
	object_event 18, 29, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassPaige, -1
	object_event 10,  0, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute2SkillBelt, EVENT_ROUTE_2_PAST_SKILL_BELT
	object_event 20, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute2Thunderstone, EVENT_ROUTE_2_PAST_THUNDERSTONE
	object_event 22, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PastRoute2MaxRepel, EVENT_ROUTE_2_PAST_MAX_REPEL
	object_event 17, 38, SPRITE_CELEBI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CelebiBoss3, EVENT_HIDE_AND_SEEK_CELEBI_3
