	const_def 2 ; object constants
	const ROUTE12SHELTER_HELPER
	const ROUTE12SHELTER_LEADER
	const ROUTE12SHELTER_KANGASKHAN
	const ROUTE12SHELTER_MAROWAK

Route12Shelter_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .AssistantLocation
	
.AssistantLocation:
	checkevent EVENT_GOT_SPECIAL_KANGASKHAN
	iftrue .end
	checkevent EVENT_KANGASKHAN_EVENT_EXPLAINED
	iffalse .end
	turnobject ROUTE12SHELTER_HELPER, DOWN
	moveobject ROUTE12SHELTER_HELPER, 4, 5
.end
	return
	
LeaderMarowakScene:
	faceplayer
	opentext
	writetext Route12LeaderMarowakText
	waitbutton
	closetext
	turnobject ROUTE12SHELTER_KANGASKHAN, LEFT
	checkcode VAR_FACING
	ifequal DOWN, .FacingDown
	ifequal RIGHT, .FacingRight
.continue
	faceplayer
	turnobject PLAYER, RIGHT
	opentext
	writetext Route12KangaskhanText
	cry KANGASKHAN
	waitbutton
	closetext
	turnobject ROUTE12SHELTER_MAROWAK, LEFT
	opentext
	writetext Route12MarowakText
	cry MAROWAK
	waitbutton
	closetext
	turnobject ROUTE12SHELTER_KANGASKHAN, RIGHT
	opentext
	writetext MarowakSomethingToSay
	waitbutton
	closetext
	opentext
	writetext Route12KangaskhanText
	writebyte KANGASKHAN
	special PlaySlowCry
	waitbutton
	writetext Route12KangaskhanDisappointed
	waitbutton
	closetext
	turnobject PLAYER, UP
	opentext
	writetext MarowakExplainsText
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	opentext
	writetext KangaskhanAgreesText
	waitbutton
	closetext
	applymovement ROUTE12SHELTER_MAROWAK, MarowakWalksToDoor
	turnobject ROUTE12SHELTER_KANGASKHAN, DOWN
	turnobject PLAYER, DOWN
	writebyte MAROWAK
	special PlaySlowCry
	opentext
	writetext MarowakWavesGoodbye
	waitbutton
	closetext
	applymovement ROUTE12SHELTER_MAROWAK, MarowakWalksOut
	playsound SFX_EXIT_BUILDING
	disappear ROUTE12SHELTER_MAROWAK
	waitsfx
	turnobject PLAYER, UP
	opentext
	writetext Route12LeaderExplaination
	waitbutton
	closetext
	applymovement ROUTE12SHELTER_LEADER, LeaderWalksOut
	playsound SFX_EXIT_BUILDING
	disappear ROUTE12SHELTER_LEADER
	waitsfx
	setevent EVENT_HIDE_SHELTER_MAROWAK
	setevent EVENT_ECRUTEAK_GYM_ACCESS
	end
	
.FacingDown
	applymovement PLAYER, Route12ShelterPlayerFacingDown
	jump .continue

.FacingRight
	applymovement PLAYER, Route12ShelterPlayerFacingRight
	jump .continue	
	
Route12ShelterAssistant:
	faceplayer
	opentext
	checkevent EVENT_GOT_SPECIAL_KANGASKHAN
	iftrue Route12ShelterKangaskhan.GotKangaskhan
	checkevent EVENT_KANGASKHAN_EVENT_EXPLAINED
	iftrue Route12ShelterKangaskhan.AskTakeKangaskhan
	checkevent EVENT_HIDE_SHELTER_MAROWAK
	iffalse .Rescued
	checkevent EVENT_ECRUTEAK_GYM_ACCESS
	iftrue .MissMarowak
	checkevent EVENT_HEARD_ROUTE_12_LEADER
	iftrue .HeardIntro
	writetext Route12AssistantIntro
	yesorno
	iffalse .No
.Yes
	setevent EVENT_HEARD_ROUTE_12_LEADER
	writetext Route12AssistantYes
	buttonsound
.HeardIntro
	writetext Route12AssistantAfter
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.No
	writetext Route12AssistantNo
	yesorno
	iftrue .Yes
	iffalse .No
	end
	
.Rescued
	writetext Route12AssistantBack
	waitbutton
	closetext
	end
	
.MissMarowak
	writetext Route12AssistantMarowakGone
	waitbutton
	closetext
	end
	
.ThankYou
	writetext Route12TakeGoodCare
	waitbutton
	closetext
	end
	
Route12ShelterKangaskhan:
	faceplayer
	opentext
	writetext Route12KangaskhanText
	cry KANGASKHAN
	waitbutton
	checkevent EVENT_KANGASKHAN_EVENT_EXPLAINED
	iftrue .end
	checkevent EVENT_BEAT_POSEY
	iftrue .KangaskhanGift
	checkevent EVENT_ROUTE_14_CAVE_MAROWAK
	iftrue .end
	writetext Route12KangaskhanUpset
	waitbutton
.end
	closetext
	end
	
.KangaskhanGift:
	writetext KangaskhanNoticesBadge
	waitbutton
	closetext
	showemote EMOTE_QUESTION, ROUTE12SHELTER_HELPER, 15
	turnobject ROUTE12SHELTER_HELPER, DOWN
	opentext
	writetext Route12ShelterWhatsTheMatter
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .FacingUp
	ifequal RIGHT, .FacingRight
	turnobject PLAYER, RIGHT
	applymovement PLAYER, Route12ShelterPlayerLeft
	jump .ContinueKangaskhanGift
	
.FacingUp
	applymovement PLAYER, Route12ShelterPlayerUp
	jump .ContinueKangaskhanGift
	
.FacingRight
	applymovement PLAYER, Route12ShelterPlayerRight
	
.ContinueKangaskhanGift
	opentext
	writetext Route12AssistantGotRootBadge
	waitbutton
	closetext
	applymovement ROUTE12SHELTER_KANGASKHAN, Route12KangaskhanStomp
	turnobject ROUTE12SHELTER_KANGASKHAN, RIGHT
	cry KANGASKHAN
	opentext
	writetext Route12KangaskhanWantsSomething
	waitbutton
	closetext
	applymovement PLAYER, Route12PlayerOutOfWay
	applymovement ROUTE12SHELTER_HELPER, Route12AssistantWalkToKangaskhan
	turnobject PLAYER, LEFT
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Girl
	writetext Route12AssistantTalkToKangaskhanMale
	jump .continue
.Girl
	writetext Route12AssistantTalkToKangaskhanFemale
.continue
	waitbutton
	closetext
	applymovement PLAYER, Route12PlayerWalkToAssistant
	turnobject ROUTE12SHELTER_HELPER, DOWN
	opentext
	writetext Route12AssistantExplainKangaskhan
	waitbutton
	setevent EVENT_KANGASKHAN_EVENT_EXPLAINED
.AskTakeKangaskhan
	writetext Route12AssistantOfferKangaskhan
	yesorno
	iffalse .Decline
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	closetext
	checkcode VAR_FACING
	ifequal LEFT, .GiftFacingLeft
	applymovement PLAYER, Route12PlayerWalkToAssistant
	jump .GiveKangaskhan
.GiftFacingLeft
	applymovement PLAYER, Route12PlayerWalkToKangaskhanLeft
	
.GiveKangaskhan
	turnobject ROUTE12SHELTER_KANGASKHAN, DOWN
	opentext
	writetext PlayerReceivedKangaskhan
	playsound SFX_CAUGHT_MON
	disappear ROUTE12SHELTER_KANGASKHAN
	waitsfx
	givepoke KANGASKHAN, 32
	special KangaskhanGiftMon
	setevent EVENT_GOT_SPECIAL_KANGASKHAN
	closetext
	applymovement PLAYER, Route12PlayerAfterKangaskhan
	turnobject ROUTE12SHELTER_HELPER, LEFT
	opentext
.GotKangaskhan
	writetext Route12TakeGoodCare
	waitbutton
	closetext
	end
	
.PartyFull
	writetext Route12NotEnoughRoom
	waitbutton
	closetext
	end
	
.Decline
	writetext Route12KangaskhanDecline
	waitbutton
	closetext
	end

Route12ShelterMarowak:
	faceplayer
	opentext
	writetext Route12MarowakText
	cry MAROWAK
	waitbutton
	closetext
	end

MarowakWalksToDoor:
	step DOWN
	step LEFT
	step DOWN
	turn_step UP
	step_resume

MarowakWalksOut:
	turn_step DOWN
	step_resume
	
LeaderWalksOut:
	step LEFT
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	turn_step DOWN
	step_resume

Route12ShelterPlayerFacingDown:
	step LEFT
	step DOWN
	step DOWN
	step RIGHT
	step_end
	
Route12ShelterPlayerFacingRight:
	step DOWN
	step RIGHT
	step_end
	
Route12ShelterPlayerLeft:
	step RIGHT
	turn_head UP
	step_resume
	
Route12ShelterPlayerRight:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_resume

Route12ShelterPlayerUp:
	step RIGHT
	step RIGHT
	step UP
	step_resume
	
Route12PlayerOutOfWay:
	fix_facing
	step DOWN
	remove_fixed_facing
	step_end
	
Route12AssistantWalkToKangaskhan:
	step DOWN
	step LEFT
	step_resume
	
Route12PlayerWalkToAssistant:
	step LEFT
	turn_head UP
	step_resume
	
Route12PlayerWalkToKangaskhanDown:
	step RIGHT
	step DOWN
	step LEFT
	step LEFT
	step_resume
	
Route12PlayerWalkToKangaskhanLeft:
	step DOWN
	step LEFT
	step LEFT
	turn_head UP
	step_resume
	
Route12PlayerAfterKangaskhan:
	step UP
	turn_head RIGHT
	step_resume
	
Route12KangaskhanStomp:
	turn_step RIGHT
	step_sleep 8
	turn_step RIGHT
	step_sleep 8
	step_resume

Route12AssistantIntro:
	text "Oh, this is"
	line "terrible!"
	
	para "The MAROWAK we"
	line "were taking care"
	cont "of here has gone"
	cont "missing!"
	
	para "It evolved from a"
	line "CUBONE recently,"
	cont "and KANGASKHAN has"
	cont "been in shambles."
	
	para "She has taken care"
	line "of CUBONE ever"
	cont "since it came out"
	cont "of an egg."
	
	para "If I were a"
	line "trainer, I would"
	cont "help POSEY look,"
	cont "but I need to stay"
	cont "here and comfort"
	cont "KANGASKHAN."
	
	para "…You look like a"
	line "trainer."

	para "Please, could you"
	line "help us and go"
	cont "find MAROWAK?"
	done
	
Route12AssistantYes:
	text "Oh, thank you so"
	line "very much!"
	
	para "There is a cave on"
	line "ROUTE 14 where"
	cont "MAROWAK would love"
	cont "to play when it"
	cont "was young."
	
	para "You could start by"
	line "looking there."
	done
	
Route12AssistantAfter:
	text "MAROWAK are timid"
	line "creatures. They"
	cont "will not attack"
	cont "unless they are"
	cont "given no other"
	cont "choice."
	
	para "Please be"
	line "careful!"
	done
	
Route12AssistantNo:
	text "…What? You won't"
	line "help?"
	
	para "Please reconsider."
	line "…For me?"
	done
	
Route12AssistantBack:
	text "Thank you so much"
	line "for finding"
	cont "MAROWAK for us!"
	done
	
Route12AssistantMarowakGone:
	text "I'm going to miss"
	line "that #MON, but"
	cont "it was time for"
	cont "MAROWAK to go live"
	cont "out in the wild."
	done
	
Route12LeaderMarowakText:
	text "I didn't get a"
	line "chance to thank"
	cont "you back there!"
	
	para "It was so selfless"
	line "of you to help out"
	cont "MAROWAK like that."
	
	para "KANGASKHAN would"
	line "like to thank you"
	cont "too!"
	done
	
MarowakExplainsText:
	text "MAROWAK says he"
	line "wants to go out on"
	cont "his own now"
	
	para "He thinks he no"
	line "longer needs a"
	cont "guardian, and is"
	cont "mature enough to"
	cont "handle himself in"
	cont "the wild."
	done
	
KangaskhanAgreesText:
	text "KANGASKHAN nods in"
	line "agreement to"
	cont "MAROWAK's request."
	done
	
MarowakWavesGoodbye:
	text "MAROWAK waves "
	line "goodbye to"
	cont "KANGASKHAN."
	done
	
Route12LeaderExplaination:
	text "It can't be easy"
	line "for KANGASKHAN to"
	cont "say goodbye like"
	cont "that."
	
	para "But that is part"
	line "of being a parent,"
	cont "MAROWAK needed to"
	cont "go out on its own."
	
	para "I just wish he"
	line "would have let us"
	cont "know about it"
	cont "first to save us"
	cont "the worry."
	
	para "I trust MAROWAK"
	line "will be okay out"
	cont "in the wild."
	
	para "KANGASKHAN must be"
	line "hurting, but at"
	cont "at least she has"
	cont "my assistant to"
	cont "keep her company."
	
	para "I must get back to"
	line "my duties as a GYM"
	cont "leader."
	
	para "I don't want to"
	line "think about how"
	cont "many trainers were"
	cont "turned away in my"
	cont "absence."
	
	para "Until your"
	line "challenge,"
	cont "take care."
	done
	
Route12KangaskhanText:
	text "KANGASKHAN:"
	line "Baru-ba!"
	done
	
Route12MarowakText:
	text "MAROWAK: Kyarugoo!"
	done
	
Route12KangaskhanDisappointed:
	text "KANGASKHAN has"
	line "a disappointed"
	cont "tone in its voice."
	done
	
MarowakSomethingToSay:
	text "It looks like"
	line "MAROWAK has"
	cont "something to tell"
	cont "KANGASKHAN."
	done
	
Route12KangaskhanUpset:
	text "KANGASKHAN seems"
	line "to be upset over"
	cont "something."
	done
	
KangaskhanNoticesBadge:
	text "…KANGASKHAN"
	line "is investigating"
	cont "your jacket."
	done
	
Route12ShelterWhatsTheMatter:
	text "Huh? Is someone"
	line "there?"
	done
	
Route12AssistantGotRootBadge:
	text "Oh, <PLAYER>!"
	line "How nice to see"
	cont "you again!"
	
	para "I see you got the"
	line "ROOTBADGE from"
	cont "POSEY."
	
	para "I think KANGASKHAN"
	line "could smell"
	cont "POSEY's scent on"
	cont "your badge-"
	done
	
Route12KangaskhanWantsSomething:
	text "Excuse me for a"
	line "moment, I think"
	cont "KANGASKHAN would"
	cont "like to tell me"
	cont "something."
	
	para "POSEY has been"
	line "teaching me how to"
	cont "understand what a"
	cont "#MON is saying."
	done
	
Route12AssistantTalkToKangaskhanMale:
	text "Hm…"
	
	para "I see…"
	
	para "I'll let him know"
	line "for you!"
	done
	
Route12AssistantTalkToKangaskhanFemale:
	text "Hm…"
	
	para "I see…"
	
	para "I'll let her know"
	line "for you!"
	done
	
Route12AssistantExplainKangaskhan:
	text "KANGASKHAN would"
	line "like to come along"
	cont "with you on your"
	cont "journey."
	
	para "There must be too"
	line "many memories of"
	cont "MAROWAK here."
	
	para "Going along on"
	line "your adventure"
	cont "would allow her to"
	cont "take her mind off"
	cont "of that situation."
	
	para "You have already"
	line "shown to her that"
	cont "you are a kind"
	cont "and compassionate"
	cont "person."
	
	para "Your ROOTBADGE"
	line "shows that you are"
	cont "also a strong"
	cont "trainer."
	done
	
Route12AssistantOfferKangaskhan:
	text "What do you say?"
	
	para "Will you add"
	line "KANGASKHAN to your"
	cont "party?"
	done
	
PlayerReceivedKangaskhan:
	text "<PLAYER> received"
	line "KANGASKHAN!"
	done
	
Route12TakeGoodCare:
	text "You had better"
	line "take good care of"
	cont "her!"
	
	para "I am trusting you!"
	done
	
Route12NotEnoughRoom:
	text "You will need to"
	line "deposit something"
	cont "into the PC before"
	cont "KANGASKHAN can go"
	cont "along with you."
	done
	
Route12KangaskhanDecline:
	text "…What?"
	
	para "After all you have"
	line "done for her, this"
	cont "is where you draw"
	cont "the line?"
	
	para "KANGASKHAN and I"
	line "must have mis-"
	cont "judged you."
	done

Route12Shelter_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_12, 3
	warp_event  3,  7, ROUTE_12, 3

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route12ShelterAssistant, -1
	object_event  2,  4, SPRITE_POSEY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LeaderMarowakScene, EVENT_HIDE_SHELTER_MAROWAK
	object_event  3,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route12ShelterKangaskhan, EVENT_GOT_SPECIAL_KANGASKHAN
	object_event  4,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route12ShelterMarowak, EVENT_HIDE_SHELTER_MAROWAK
