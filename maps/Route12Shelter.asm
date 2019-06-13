	const_def 2 ; object constants
	const ROUTE12SHELTER_HELPER
	const ROUTE12SHELTER_LEADER
	const ROUTE12SHELTER_KANGASKHAN
	const ROUTE12SHELTER_MAROWAK

Route12Shelter_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
.MarowakScene:
	turnobject ROUTE12SHELTER_LEADER, DOWN
	opentext
	writetext Route12LeaderMarowakText
	waitbutton
	closetext
	turnobject ROUTE12SHELTER_KANGASKHAN, LEFT
	turnobject PLAYER, RIGHT
	turnobject ROUTE12SHELTER_MAROWAK, LEFT
	turnobject ROUTE12SHELTER_KANGASKHAN, RIGHT
	opentext
	writetext KangaskhanText
	waitbutton
	closetext
	applymovement ROUTE12SHELTER_MAROWAK, MarowakWalksToDoor
	opentext
	writetext MarowakWavesGoodbye
	waitbutton
	closetext
	applymovement ROUTE12SHELTER_MAROWAK, MarowakWalksOut
	disappear ROUTE12SHELTER_MAROWAK
	end
	
Route12ShelterAssistant:
	faceplayer
	opentext
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
	
Route12LeaderMarowakText:
	text "I didn't get a"
	line "chance to thank"
	cont "you back there!"
	
	para "KANGASKHAN thanks"
	line "you too!"
	done
	
KangaskhanText:
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
	cont "first."
	
	para "Now that this"
	line "problem was taken"
	cont "care of, I must"
	cont "get back to my"
	cont "duties as a GYM"
	cont "leader."
	
	para "I await your"
	line "challenge in the"
	cont "future, trainer."
	done
	
Route12KangaskhanText:
	text "KANGASKHAN:"
	line "Baru-ba!"
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
	object_event  2,  4, SPRITE_POSEY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDE_SHELTER_MAROWAK
	object_event  3,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route12ShelterKangaskhan, -1
	object_event  4,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDE_SHELTER_MAROWAK
