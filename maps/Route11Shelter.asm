	const_def 2 ; object constants
	const ROUTE11SHELTER_HELPER
	const ROUTE11SHELTER_LEADER
	const ROUTE11SHELTER_KANGASKHAN
	const ROUTE11SHELTER_MAROWAK

Route11Shelter_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .AssistantLocation
	
.AssistantLocation:
	checkevent EVENT_GOT_SPECIAL_KANGASKHAN
	iftrue .end
	checkevent EVENT_KANGASKHAN_EVENT_EXPLAINED
	iffalse .end
	turnobject ROUTE11SHELTER_HELPER, DOWN
	moveobject ROUTE11SHELTER_HELPER, 4, 5
.end
	return
	
LeaderMarowakScene:
	opentext
	writetext Route11LeaderIntroText
	waitbutton
	closetext
	faceplayer
	showemote EMOTE_SHOCK, ROUTE11SHELTER_LEADER, 15
	opentext
	writetext Route11LeaderMarowakText
	waitbutton
	closetext
	turnobject ROUTE11SHELTER_KANGASKHAN, LEFT
	checkcode VAR_FACING
	ifequal DOWN, .FacingDown
	ifequal RIGHT, .FacingRight
.continue
	faceplayer
	applymovement ROUTE11SHELTER_KANGASKHAN, MarowakAttentionMovement
	cry KANGASKHAN
	showemote EMOTE_QUESTION, PLAYER, 15
	opentext
	writetext Route11KangaskhanThanksText
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	showemote EMOTE_HEART, ROUTE11SHELTER_KANGASKHAN, 15
	applymovement ROUTE11SHELTER_KANGASKHAN, MarowakAttentionMovement
	cry KANGASKHAN
	wait 6
	turnobject ROUTE11SHELTER_MAROWAK, LEFT
	showemote EMOTE_SHOCK, ROUTE11SHELTER_MAROWAK, 15
	applymovement ROUTE11SHELTER_MAROWAK, MarowakAttentionMovement
	cry MAROWAK
	turnobject ROUTE11SHELTER_MAROWAK, LEFT
	wait 6
	opentext
	writetext MarowakAttentionText
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	special FadeOutMusic
	turnobject ROUTE11SHELTER_KANGASKHAN, RIGHT
	applymovement ROUTE11SHELTER_MAROWAK, MarowakAttentionMovement
	cry MAROWAK
	wait 6
	showemote EMOTE_SAD, ROUTE11SHELTER_KANGASKHAN, 15	
	cry KANGASKHAN
	waitsfx
	opentext
	writetext Route11KangaskhanDisappointed
	waitbutton
	closetext
	turnobject PLAYER, UP
	opentext
	writetext MarowakExplainsText
	waitbutton
	closetext
	turnobject PLAYER, RIGHT
	showemote EMOTE_SAD, ROUTE11SHELTER_KANGASKHAN, 15
	cry KANGASKHAN
	waitsfx
	opentext
	writetext KangaskhanAgreesText
	waitbutton
	closetext
	playmusic MUSIC_POST_CREDITS
	applymovement ROUTE11SHELTER_MAROWAK, MarowakWalksToDoor
	turnobject ROUTE11SHELTER_KANGASKHAN, DOWN
	turnobject PLAYER, DOWN
	showemote EMOTE_HEART, ROUTE11SHELTER_MAROWAK, 30
	cry MAROWAK
	waitsfx
	opentext
	writetext MarowakWavesGoodbye
	waitbutton
	closetext
	turnobject ROUTE11SHELTER_MAROWAK, DOWN
	showemote EMOTE_SAD, ROUTE11SHELTER_MAROWAK, 15
	applymovement ROUTE11SHELTER_MAROWAK, MarowakWalksOut
	playsound SFX_EXIT_BUILDING
	disappear ROUTE11SHELTER_MAROWAK
	waitsfx
	showemote EMOTE_SAD, ROUTE11SHELTER_KANGASKHAN, 15
	cry KANGASKHAN
	waitsfx
	turnobject PLAYER, UP
	opentext
	writetext Route11LeaderExplaination
	waitbutton
	closetext
	applymovement ROUTE11SHELTER_LEADER, LeaderWalksOut
	special FadeOutMusic
	playsound SFX_EXIT_BUILDING
	disappear ROUTE11SHELTER_LEADER
	waitsfx
	setevent EVENT_HIDE_SHELTER_MAROWAK
	setevent EVENT_ECRUTEAK_GYM_ACCESS
	special RestartMapMusic
	end
	
.FacingDown
	applymovement PLAYER, Route11ShelterPlayerFacingDown
	jump .continue

.FacingRight
	applymovement PLAYER, Route11ShelterPlayerFacingRight
	jump .continue	
	
Route11ShelterAssistant:
	faceplayer
	opentext
	checkevent EVENT_GOT_SPECIAL_KANGASKHAN
	iftrue Route11ShelterKangaskhan.GotKangaskhan
	checkevent EVENT_KANGASKHAN_EVENT_EXPLAINED
	iftrue Route11ShelterKangaskhan.AskTakeKangaskhan
	checkevent EVENT_HIDE_SHELTER_MAROWAK
	iffalse .Rescued
	checkevent EVENT_ECRUTEAK_GYM_ACCESS
	iftrue .MissMarowak
	checkevent EVENT_HEARD_ROUTE_11_LEADER
	iftrue .HeardIntro
	writetext Route11AssistantIntro
	yesorno
	iffalse .No
.Yes
	setevent EVENT_HEARD_ROUTE_11_LEADER
	writetext Route11AssistantYes
	buttonsound
.HeardIntro
	writetext Route11AssistantAfter
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.No
	writetext Route11AssistantNo
	yesorno
	iftrue .Yes
	iffalse .No
	end
	
.Rescued
	writetext Route11AssistantBack
	waitbutton
	closetext
	end
	
.MissMarowak
	writetext Route11AssistantMarowakGone
	waitbutton
	closetext
	end
	
.ThankYou
	writetext Route11TakeGoodCare
	waitbutton
	closetext
	end
	
Route11ShelterKangaskhan:
	faceplayer
	opentext
	writetext Route11KangaskhanText
	cry KANGASKHAN
	waitbutton
	checkevent EVENT_KANGASKHAN_EVENT_EXPLAINED
	iftrue .end
	checkevent EVENT_BEAT_POSEY
	iftrue .KangaskhanGift
	checkevent EVENT_THE_BONEYARD_MAROWAK
	iftrue .end
	writetext Route11KangaskhanUpset
	waitbutton
.end
	closetext
	end

.KangaskhanGift:
	writetext KangaskhanNoticesBadge
	waitbutton
	closetext
	showemote EMOTE_QUESTION, ROUTE11SHELTER_HELPER, 15
	turnobject ROUTE11SHELTER_HELPER, DOWN
	opentext
	writetext Route11ShelterWhatsTheMatter
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .FacingUp
	ifequal RIGHT, .FacingRight
	turnobject PLAYER, RIGHT
	applymovement PLAYER, Route11ShelterPlayerLeft
	jump .ContinueKangaskhanGift
	
.FacingUp
	applymovement PLAYER, Route11ShelterPlayerUp
	jump .ContinueKangaskhanGift
	
.FacingRight
	applymovement PLAYER, Route11ShelterPlayerRight
	
.ContinueKangaskhanGift
	opentext
	writetext Route11AssistantGotRootBadge
	waitbutton
	closetext
	applymovement ROUTE11SHELTER_KANGASKHAN, Route11KangaskhanStomp
	turnobject ROUTE11SHELTER_KANGASKHAN, RIGHT
	cry KANGASKHAN
	opentext
	writetext Route11KangaskhanWantsSomething
	waitbutton
	closetext
	applymovement PLAYER, Route11PlayerOutOfWay
	applymovement ROUTE11SHELTER_HELPER, Route11AssistantWalkToKangaskhan
	turnobject PLAYER, LEFT
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Girl
	writetext Route11AssistantTalkToKangaskhanMale
	jump .continue
.Girl
	writetext Route11AssistantTalkToKangaskhanFemale
.continue
	waitbutton
	closetext
	applymovement PLAYER, Route11PlayerWalkToAssistant
	turnobject ROUTE11SHELTER_HELPER, DOWN
	opentext
	writetext Route11AssistantExplainKangaskhan
	waitbutton
	setevent EVENT_KANGASKHAN_EVENT_EXPLAINED
.AskTakeKangaskhan
	writetext Route11AssistantOfferKangaskhan
	yesorno
	iffalse .Decline
	checkcode VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	closetext
	checkcode VAR_FACING
	ifequal LEFT, .GiftFacingLeft
	applymovement PLAYER, Route11PlayerWalkToAssistant
	jump .GiveKangaskhan
.GiftFacingLeft
	applymovement PLAYER, Route11PlayerWalkToKangaskhanLeft
	
.GiveKangaskhan
	turnobject ROUTE11SHELTER_KANGASKHAN, DOWN
	opentext
	writetext PlayerReceivedKangaskhan
	playsound SFX_CAUGHT_MON
	disappear ROUTE11SHELTER_KANGASKHAN
	waitsfx
	givepoke KANGASKHAN, 32
	special KangaskhanGiftMon
	setevent EVENT_GOT_SPECIAL_KANGASKHAN
	closetext
	applymovement PLAYER, Route11PlayerAfterKangaskhan
	turnobject ROUTE11SHELTER_HELPER, LEFT
	opentext
.GotKangaskhan
	writetext Route11TakeGoodCare
	waitbutton
	closetext
	end
	
.PartyFull
	writetext Route11NotEnoughRoom
	waitbutton
	closetext
	end
	
.Decline
	writetext Route11KangaskhanDecline
	waitbutton
	closetext
	end

Route11ShelterMarowak:
	faceplayer
	opentext
	writetext Route11MarowakText
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

Route11ShelterPlayerFacingDown:
	step LEFT
	step DOWN
	step DOWN
	step RIGHT
	step_end
	
Route11ShelterPlayerFacingRight:
	step DOWN
	step RIGHT
	step_end
	
Route11ShelterPlayerLeft:
	step RIGHT
	turn_head UP
	step_resume
	
Route11ShelterPlayerRight:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step_resume

Route11ShelterPlayerUp:
	step RIGHT
	step RIGHT
	step UP
	step_resume
	
Route11PlayerOutOfWay:
	fix_facing
	step DOWN
	remove_fixed_facing
	step_end
	
Route11AssistantWalkToKangaskhan:
	step DOWN
	step LEFT
	step_resume
	
Route11PlayerWalkToAssistant:
	step LEFT
	turn_head UP
	step_resume
	
Route11PlayerWalkToKangaskhanDown:
	step RIGHT
	step DOWN
	step LEFT
	step LEFT
	step_resume
	
Route11PlayerWalkToKangaskhanLeft:
	step DOWN
	step LEFT
	step LEFT
	turn_head UP
	step_resume
	
Route11PlayerAfterKangaskhan:
	step UP
	turn_head RIGHT
	step_resume
	
Route11KangaskhanStomp:
	turn_step RIGHT
	step_sleep 8
	turn_step RIGHT
	step_sleep 8
	step_resume

MarowakAttentionMovement:
	turn_step LEFT
	step_sleep 8
	turn_step LEFT
	step_sleep 8
	step_end

Route11AssistantIntro:
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
	
Route11AssistantYes:
	text "Oh, thank you so"
	line "very much!"
	
	para "MAROWAK would love"
	line "to play in THE"
	cont "BONEYARD when it"
	cont "was young."
	
	para "You could start by"
	line "looking there, it's"
	cont "on ROUTE 13."
	done
	
Route11AssistantAfter:
	text "MAROWAK are timid"
	line "creatures. They"
	cont "will not attack"
	cont "unless they are"
	cont "given no other"
	cont "choice."
	
	para "Please be"
	line "careful!"
	done
	
Route11AssistantNo:
	text "…What? You won't"
	line "help?"
	
	para "Please reconsider."
	line "…For me?"
	done
	
Route11AssistantBack:
	text "Thank you so much"
	line "for finding"
	cont "MAROWAK for us!"
	done

Route11AssistantMarowakGone:
	text "I'm going to miss"
	line "that #MON, but"
	cont "it was time for"
	cont "MAROWAK to go live"
	cont "out in the wild."
	done	

Route11LeaderIntroText:
	text "Hello and welcome"
	line "to the #MON"
	cont "SHEL-"
	done

Route11LeaderMarowakText:
	text "Oh!"
	
	para "You're the trainer"
	line "I met earlier when"
	cont "we found MAROWAK!"
	
	para "I didn't get a"
	line "chance to thank"
	cont "you then!"
	
	para "It was so selfless"
	line "of you to help out"
	cont "MAROWAK like that."
	done
	
Route11KangaskhanThanksText:
	text "KANGASKHAN would"
	line "like to thank you"
	cont "too, it seems!"
	done
	
MarowakAttentionText:
	text "MAROWAK is trying"
	line "to get KANGASKHAN's"
	cont "attention."
	done
	
MarowakExplainsText:
	text "………"
	
	para "It seems like"
	line "MAROWAK is trying"
	cont "to tell KANGASKHAN"
	cont "that he wants to"
	cont "live on his own,"
	cont "in the wild."
	done
	
KangaskhanAgreesText:
	text "KANGASKHAN nods"
	line "her head slowly."
	done

MarowakWavesGoodbye:
	text "MAROWAK waves"
	line "goodbye to"
	cont "KANGASKHAN."
	
	para "He looks to be ho-"
	line "lding back tears…"
	done
	
Route11LeaderExplaination:
	text "It can't be easy"
	line "for KANGASKHAN to"
	cont "say goodbye like"
	cont "that."
	
	para "But that is part"
	line "of being a parent."
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
	cont "us to console her."
	
	para "Now then."
	
	para "I must return to"
	line "my duties as a GYM"
	cont "LEADER."
	
	para "I don't want to"
	line "think about how"
	cont "many trainers were"
	cont "turned away in my"
	cont "absence."
	
	para "Take care! I await"
	line "your challenge in"
	cont "the future."
	done
	
Route11KangaskhanText:
	text "KANGASKHAN:"
	line "Baru-ba!"
	done
	
Route11MarowakText:
	text "MAROWAK: Kyarugoo!"
	done

Route11KangaskhanDisappointed:
	text "KANGASKHAN has"
	line "a disappointed"
	cont "tone in her voice."
	done
	
Route11KangaskhanUpset:
	text "KANGASKHAN seems"
	line "to be upset over"
	cont "something."
	done
	
KangaskhanNoticesBadge:
	text "…KANGASKHAN"
	line "is investigating"
	cont "your jacket."
	done
	
Route11ShelterWhatsTheMatter:
	text "Huh? Is someone"
	line "there?"
	done
	
Route11AssistantGotRootBadge:
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
	
Route11KangaskhanWantsSomething:
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
	
Route11AssistantTalkToKangaskhanMale:
	text "Hm…"
	
	para "I see…"
	
	para "I'll let him know"
	line "for you!"
	done
	
Route11AssistantTalkToKangaskhanFemale:
	text "Hm…"
	
	para "I see…"
	
	para "I'll let her know"
	line "for you!"
	done
	
Route11AssistantExplainKangaskhan:
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
	
Route11AssistantOfferKangaskhan:
	text "What do you say?"
	
	para "Will you add"
	line "KANGASKHAN to your"
	cont "party?"
	done
	
PlayerReceivedKangaskhan:
	text "<PLAYER> received"
	line "KANGASKHAN!"
	done
	
Route11TakeGoodCare:
	text "You had better"
	line "take good care of"
	cont "her!"
	
	para "I am trusting you!"
	done
	
Route11NotEnoughRoom:
	text "You will need to"
	line "deposit something"
	cont "into the PC before"
	cont "KANGASKHAN can go"
	cont "along with you."
	done
	
Route11KangaskhanDecline:
	text "…What?"
	
	para "After all you have"
	line "done for her, this"
	cont "is where you draw"
	cont "the line?"
	
	para "KANGASKHAN and I"
	line "must have mis-"
	cont "judged you."
	done

Route11Shelter_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_11, 3
	warp_event  3,  7, ROUTE_11, 3

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route11ShelterAssistant, -1
	object_event  2,  4, SPRITE_POSEY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LeaderMarowakScene, EVENT_HIDE_SHELTER_MAROWAK
	object_event  3,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route11ShelterKangaskhan, EVENT_GOT_SPECIAL_KANGASKHAN
	object_event  4,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route11ShelterMarowak, EVENT_HIDE_SHELTER_MAROWAK
