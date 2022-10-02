	const_def 2 ; object constants

SeaRoute6_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .SmashWall

.SmashWall:
	checkevent EVENT_UNOWN_CHAMBER_VZ_OPEN
	iffalse .skip
	changeblock  4, 12, $73
.skip
	return
	
TrainerBeautyChelle:
	trainer BEAUTY, CHELLE, EVENT_BEAT_BEAUTY_CHELLE, BeautyChelleText, BeautyChelleWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyChelleAfterText
	waitbutton
	closetext
	end
	
TrainerSwimmerLauren:
	trainer SWIMMERF, LAUREN, EVENT_BEAT_SWIMMERF_LAUREN, SwimmerLaurenText, SwimmerLaurenWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerLaurenAfterText
	waitbutton
	closetext
	end
	
TrainerSwimmerWalker:
	trainer SWIMMERM, WALKER, EVENT_BEAT_SWIMMERM_WALKER, SwimmerWalkerText, SwimmerWalkerWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerWalkerAfterText
	waitbutton
	closetext
	end
	
TrainerSwimmerKarla:
	trainer SWIMMERF, KARLA, EVENT_BEAT_SWIMMERF_KARLA, SwimmerKarlaText, SwimmerKarlaWinText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerKarlaAfterText
	waitbutton
	closetext
	end

SeaRoute6TeleportGuy:
	faceplayer
	opentext
	writetext SeaRoute6TeleportGuyText
	yesorno
	iffalse .Decline
	writetext SeaRoute6TeleportGuyAcceptText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp RUGOSA_CITY, 31, 30
	end

.Decline
	writetext SeaRoute6TeleportGuyDeclineText
	waitbutton
	closetext
	end

.TeleportOut:
	teleport_from
	step_resume
	
.TeleportIn:
	show_object
	teleport_to
	step_resume

SeaRoute6Xatu:
	opentext
	writetext SeaRoute6XatuText
	cry XATU
	waitbutton
	closetext
	end

SeaRoute6Sign:
	jumptext SeaRoute6SignText

BeautyChelleText:
	text "My hero! You've"
	line "come to rescue m-"
	
	para "…A battle?"
	
	para "…Okay."
	line "If you wanna lose."
	done 

BeautyChelleWinText:
	text "Okay, you had your"
	line "battle."
	
	para "Now will you help"
	line "me?"
	done

BeautyChelleAfterText:
	text "I was on a boat"
	line "with some friends,"
	cont "but I fell over-"
	cont "board."
	
	para "The current swept"
	line "me up before I"
	cont "knew it."
	
	para "I've been on this"
	line "island for so"
	cont "long that I lost"
	cont "track of time."
	done

SwimmerLaurenText:
	text "I catch my #MON"
	line "on land, and train"
	cont "them here at sea."
	done
	
SwimmerLaurenWinText:
	text "The tides were too"
	line "rough today."
	done
	
SwimmerLaurenAfterText:
	text "Most #MON like"
	line "to train near"
	cont "their old home,"
	cont "but not mine."
	
	para "They love to get"
	line "out and see the"
	cont "world!"
	done

SwimmerWalkerText:
	text "LEADER CECIL is my"
	line "idol. I hope to be"
	cont "a diver like him"
	cont "some day."
	done
	
SwimmerWalkerWinText:
	text "You can't keep me"
	line "down."

	para "I'm too buoyant!"
	done

SwimmerWalkerAfterText:
	text "Maybe some day our"
	line "#MON will allow"
	cont "us to explore the"
	cont "ocean floor."
	done
	
SwimmerKarlaText:
	text "I love the sea."
	line "It's so relaxing."
	done
	
SwimmerKarlaWinText:
	text "Now that our"
	line "battle is over, I"
	cont "can go back to my"
	cont "relaxation."
	done
	
SwimmerKarlaAfterText:
	text "Get off your"
	line "#MON and lay"
	cont "here in the water"
	cont "with me."
	
	para "It's like the whole"
	line "ocean is holding"
	cont "me afloat!"
	done

SeaRoute6TeleportGuyText:
	text "Hey, you look like"
	line "you're pretty far"
	cont "from home."

	para "My XATU's TELEPORT"
	line "power isn't very"
	cont "strong, but he"
	cont "could send you to"
	cont "RUGOSA CITY."
	done

SeaRoute6TeleportGuyAcceptText:
	text "Okay, perfect!"

	para "Just give him a"
	line "second and…"
	done

SeaRoute6TeleportGuyDeclineText:
	text "Okay, cool."

	para "But if you ever"
	line "need a way back to"
	cont "land, we can lend"
	cont "a hand."
	done

SeaRoute6XatuText:
	text "XATU: Dootdoot!"
	done

SeaRoute6SignText:
	text "TRAINER TIPS"

	para "It is recommended"
	line "that trainers who"
	cont "travel across the"
	cont "ocean are accomp-"
	cont "anied by a WATER-"
	cont "type #MON at"
	cont "all times."
	done

SeaRoute6_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4, 13, UNOWN_CHAMBER_VZ, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 33,  8, BGEVENT_READ, SeaRoute6Sign

	db 6 ; object events
	object_event 31,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, SeaRoute6TeleportGuy, -1
	object_event 30,  6, SPRITE_BIRD, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SeaRoute6Xatu, -1
	object_event 21, 22, SPRITE_BUENA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBeautyChelle, -1
	object_event 20, 15, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerSwimmerLauren, -1
	object_event 16, 28, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerSwimmerWalker, -1
	object_event  8, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSwimmerKarla, -1
