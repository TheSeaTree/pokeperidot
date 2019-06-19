	const_def 2 ; object constants
	const ROUTE12SHELTER_HELPER
	const ROUTE12SHELTER_LEADER
	const ROUTE12SHELTER_KANGASKHAN
	const ROUTE12SHELTER_MAROWAK

Route12Shelter_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
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
	cry KANGASKHAN
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
	cry MAROWAK
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
	
Route12ShelterKangaskhan:
	faceplayer
	opentext
	writetext Route12KangaskhanText
	cry KANGASKHAN
	waitbutton
	checkevent EVENT_ROUTE_14_CAVE_MAROWAK
	iftrue .end
	writetext Route12KangaskhanUpset
	waitbutton
.end
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

; Leader is already out looking, the assistant tells you about it. After defeating Marowak, the leader finds you in the cave and invites you back with her & Marowak(don't teleport back?). At the shelter, Marowak tells Kangaskhan it needs to go out on its own and leaves. Leader explains that it can't be easy for a parent to let go of its child, but needs to return to the gym. After getting her badge, Kangaskhan will see you as worthy and ask to go with you, as she no longer has a child to care for. Kangaskhan will have a special moveset.

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
	cont "young. You could"
	cont "start by looking"
	cont "there."
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
	object_event  3,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route12ShelterKangaskhan, -1
	object_event  4,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route12ShelterMarowak, EVENT_HIDE_SHELTER_MAROWAK
