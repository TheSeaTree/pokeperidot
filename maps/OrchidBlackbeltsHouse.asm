	const_def 2 ; object constants
	const ORCHIDBLACKBELTHOUSE_ELDER
	const ORCHIDBLACKBELTHOUSE_BLACKBELT1
	const ORCHIDBLACKBELTHOUSE_BLACKBELT2
	const ORCHIDBLACKBELTHOUSE_BLACKBELT3
	const ORCHIDBLACKBELTHOUSE_MACHOP

OrchidBlackbeltsHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .OpenCave

.OpenCave
	setevent EVENT_ORCHID_CITY_HIDDEN_CAVE_OPEN
	return

OrchidBlackbeltsHouseEnteiGuy:
	faceplayer
	opentext
	checkevent EVENT_SHOWED_ORCHID_BLACKBELT_ENTEI
	iftrue .AfterShowedEntei
	writebyte ENTEI
	special FindPartyMonThatSpecies
	iftrue .HaveEntei
	writetext OrchidBlackbelt1Text
	waitbutton
	closetext
	end

.HaveEntei
	writetext OrchidBlackbelt1ShowEnteiText
	waitbutton
	closetext
	setevent EVENT_SHOWED_ORCHID_BLACKBELT_ENTEI
	end

.AfterShowedEntei
	writetext OrchidBlackbelt1AfterEnteiText
	waitbutton
	closetext
	end

CrashHelmetGuy:
	faceplayer
	opentext
	checkcode VAR_FACING
	ifequal RIGHT, .FacingRight
	checkevent EVENT_GOT_CRASH_HELMET
	iftrue .GotHelmet
	writetext CrashHelmetGuyAskText
	yesorno
	iffalse .Decline
	writetext CrashHelmetGuyDemonstratesTrainingText
	waitbutton
	closetext
	wait 2
	applymovement ORCHIDBLACKBELTHOUSE_BLACKBELT3, CrashHelmetGuyPrepareRun
	opentext
	writetext CrashHelmetGuyYellingText
	waitbutton
	closetext
	
	applymovement ORCHIDBLACKBELTHOUSE_BLACKBELT3, CrashHelmetGuyRunIntoWall
	playsound SFX_TACKLE
	earthquake 20
	waitsfx
	applymovement ORCHIDBLACKBELTHOUSE_BLACKBELT3, CrashHelmetGuyRecoil

	faceplayer
	opentext
	writetext CrashHelmetGuyGiftCrashHelmetText
	waitbutton
	verbosegiveitem CRASH_HELMET
	iffalse .NoRoom
	setevent EVENT_GOT_CRASH_HELMET
	
.GotHelmet
	writetext CrashHelmetGuyAfterText
	waitbutton
	closetext
	end
	
.Decline
	writetext CrashHelmetGuyDeclineText
	waitbutton
	closetext
	end
	
.NoRoom
	writetext CrashHelmetGuyNoRoomText
	waitbutton
	closetext
	end
	
.FacingRight
	writetext CrashHelmetMoveText
	waitbutton
	closetext
	end

OrchidBlackbeltLavaGuy:
	jumptextfaceplayer OrchidBlackbeltLavaGuyText

OrchidBackbeltsHouseElder:
	jumptextfaceplayer OrchidBackbeltsHouseElderText

OrchidBlackbeltsHouseMachoke:
	opentext
	writetext OrchidBlackbeltsHouseMachokeText
	cry MACHOKE
	waitbutton
	closetext
	end

CrashHelmetGuyPrepareRun:
	turn_step LEFT
	turn_step LEFT
	turn_step LEFT
	step_end

CrashHelmetGuyRunIntoWall:
	turn_step LEFT
	turn_step LEFT
	turn_step LEFT
	turn_step LEFT
	step_sleep 8
	run_step LEFT
	run_step LEFT
	step_end

CrashHelmetGuyRecoil:
	fix_facing
	jump_step RIGHT
	step_sleep 8
	step_sleep 8
	remove_fixed_facing
	step_end

OrchidBlackbelt1Text:
	text "Have you heard the"
	line "legends of the"
	cont "powerful #MON"
	cont "that used to live"
	cont "here?"

	para "I bet it was a"
	line "FIGHTING-type!"
	done

OrchidBlackbelt1ShowEnteiText:
	text "No way? You caught"
	line "the GUARDIAN?"

	para "…And it's FIRE,"
	line "not FIGHTING-type?"

	para "My life has been a"
	line "lie! FIGHTING-"
	cont "types should be"
	cont "the strongest!"
	done

OrchidBlackbelt1AfterEnteiText:
	text "From this day"
	line "forward, I will"
	cont "exclusively train"
	cont "FIRE-type #MON!"

	para "I will be the"
	line "strongest!"

	para "Just like our"
	line "GUARDIAN, ENTEI!"
	done

OrchidBackbeltsHouseElderText:
	text "Ehehehe!"

	para "I may not look"
	line "like much now, but"
	cont "I used to be quite"
	cont "the bodybuilder in"
	cont "my day."

	para "I still have some"
	line "fight left in me!"

	para "Someone has to"
	line "keep these boys in"
	cont "line!"
	done

CrashHelmetGuyAskText:
	text "Hey kid, want to"
	line "see my training?"
	done

CrashHelmetGuyDemonstratesTrainingText:
	text "Alright, watch and"
	line "learn…"
	done

CrashHelmetGuyYellingText:
	text "HIIIII-YA!"
	done

CrashHelmetGuyGiftCrashHelmetText:
	text "Impressive, right?"
	
	para "Here, you can try"
	line "out my style of"
	cont "training as well!"
	done

CrashHelmetGuyDeclineText:
	text "You sure? You"
	line "could learn a lot."
	done

CrashHelmetGuyNoRoomText:
	text "I can't give you"
	line "this item. Your"
	cont "PACK is too full."
	done

CrashHelmetGuyAfterText:
	text "The CRASH HELMET"
	line "will reduce recoil"
	cont "damage for what-"
	cont "ever holds it."

	para "I use one myself,"
	line "and it hardly even"
	cont "hurts when I smash"
	cont "my head against"
	cont "the wall!"
	done

CrashHelmetMoveText:
	text "Hey kid, get out"
	line "of the way."
	
	para "I'm trying to train"
	line "here!"
	done

OrchidBlackbeltLavaGuyText:
	text "Every day I train"
	line "my body and my"
	cont "#MON in this"
	cont "intense heat!"

	para "Weakness leaves"
	line "our bodies in the"
	cont "form of sweat!"
	done

OrchidBlackbeltsHouseMachokeText:
	text "MACHOKE: Guooh"
	line "gogogoh!"
	done

OrchidBlackbeltsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  9, ORCHID_CITY, 6
	warp_event 13,  7, ORCHID_ENTEI_SHRINE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 12,  5, SPRITE_ELDER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OrchidBackbeltsHouseElder, -1
	object_event  2,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OrchidBlackbeltsHouseEnteiGuy, -1
	object_event  6,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OrchidBlackbeltLavaGuy, -1
	object_event  8,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CrashHelmetGuy, -1
	object_event 10,  4, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 1, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OrchidBlackbeltsHouseMachoke, -1
