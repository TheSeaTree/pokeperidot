	const_def 2 ; object constants

CarnationWobbuffetHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WobbuffetGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_WOBBUFFET
	iftrue .GotWobbuffet
	writetext WobbuffetOfferText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Decline
	checkmoney YOUR_MONEY, 5000
	ifequal HAVE_LESS, .NotEnoughMoney
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	takemoney YOUR_MONEY, 5000
	special PlaceMoneyTopRight
	writetext WobbuffetGuyThanksText
	waitbutton
	writetext PlayerGotWobbuffet
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke WOBBUFFET, 40
	setevent EVENT_GOT_WOBBUFFET
	closetext
	end
	
.Decline
	writetext WobbuffetDeclineText
	jump .End
	
.NotEnoughMoney
	writetext WobbuffetNotEnough
	jump .End
	
.PartyFull
	writetext WobbuffetNoRoomText
	jump .End
	
.GotWobbuffet
	writetext WobbuffetAfterText
.End
	waitbutton
	closetext
	end

WobbuffetOfferText:
	text "How lucky of you"
	line "to find me!"

	para "I'm not a trainer"
	line "myself, but I was"
	cont "given a real"
	cont "special #MON."
	
	para "Let me tell you,"
	line "this #MON is so"
	cont "powerful that it"
	cont "was banned in some"
	cont "competitions!"
	
	para "Can you believe"
	line "such a thing? A"
	cont "#MON so strong"
	cont "that some regions"
	cont "won't allow it in"
	cont "battle!"
	
	para "You seem like the"
	line "kind of trainer"
	cont "who would apprec-"
	cont "iate such a power-"
	cont "house."
	
	para "I'm feeling gener-"
	line "ous today. I can"
	cont "let you take this"
	cont "#MON home."
	
	para "Honestly, I might"
	line "regret this later."
	
	para "How about it? I"
	line "can part ways with"
	cont "this #MON for"
	cont "only ¥5000."
	done
	
WobbuffetDeclineText:
	text "Are you insane? I"
	line "am practically"
	cont "giving this"
	cont "#MON away!"
	done
	
WobbuffetNotEnough:
	text "What are you"
	line "trying to pull"
	cont "here?"
	
	para "I can't just give"
	line "this #MON away!"
	done

WobbuffetNoRoomText:
	text "There appears to"
	line "be a problem. You"
	cont "can't carry any"
	cont "more #MON."
	
	para "Come back later"
	line "with a smaller"
	cont "party."
	done
	
WobbuffetGuyThanksText:
	text "Oh wow!"
	
	para "I didn't think you"
	line "would go for it!"
	done
	
PlayerGotWobbuffet:
	text "<PLAYER>"
	line "bought WOBBUFFET!"
	done
	
WobbuffetAfterText:
	text "What? You're not"
	line "happy with my old"
	cont "WOBBUFFET?"

	para "I don't blame"
	line "you."
	
	para "The region it was"
	line "banned from must"
	cont "have some real"
	cont "stinkers if they"
	cont "couldn't handle"
	cont "that weakling."
	
	para "It doesn't even"
	line "learn any attack-"
	cont "ing moves!"
	
	para "Oh well."
	line "No refunds!"
	done

CarnationWobbuffetHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 7, CARNATION_TOWN, 5
	warp_event  3, 7, CARNATION_TOWN, 5

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 2, 4, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WobbuffetGuy, -1