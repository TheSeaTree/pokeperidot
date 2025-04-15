	const_def 2 ; object constants

Route9_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route9Sign:
	jumptext Route9SignText
	
RainDanceLady:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_RAIN_DANCE
	iftrue .RainDance
	writetext RainDanceLadyText
	yesorno
	iffalse .No
	writetext TMRainDanceGift
	buttonsound
	verbosegiveitem TM_RAIN_DANCE
	setevent EVENT_GOT_TM_RAIN_DANCE
	
.RainDance:
	writetext TMRainDanceExplaination
	buttonsound
	closetext
	end
	
.No:
	writetext RainDanceLadyDecline
	buttonsound
	closetext
	end
	
Route9LegendaryGuy:
	jumptextfaceplayer Route9LegendaryGuyText

Route9HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_9_HIDDEN_ETHER

Route9SignText:
	text "OCCIDENT FOREST"
	line "REST HOUSE"
	done
	
RainDanceLadyText:
	text "I love a nice"
	line "rainy day, they"
	cont "are so relaxing!"
	
	para "Don't you love"
	line "them too?"
	done
	
TMRainDanceGift:
	text "I'm so glad to"
	line "have someone agree"
	cont "with me!"
	
	para "Here, I have some-"
	line "thing you'd like"
	cont "to have!"
	done
	
RainDanceLadyDecline:
	text "Oh, you don't?"
	
	para "You looked like"
	line "someone who would…"
	done
	
TMRainDanceExplaination:
	text "That TM will let"
	line "your #MON use"
	cont "the move RAIN"
	cont "DANCE!"
	
	para "I don't have any"
	line "#MON of my own,"
	cont "so you can make"
	cont "better use of it"
	cont "than I could."

	para "Now you can make a"
	line "rainy day any time"
	cont "you want!"
	done
	
Route9LegendaryGuyText:
	text "There's a lot of"
	line "rumors about a"
	cont "group of super"
	cont "rare #MON."
	
	para "I believe in them,"
	line "but most people"
	cont "find it difficult."
	
	para "It's said they"
	line "used to roam far-"
	cont "away lands. With a"
	cont "kind of swiftness"
	cont "that leaves them a"
	cont "blur to the naked"
	cont "eye."
	done

Route9_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 30, 17, PAVONA_PASS_1F, 4
	warp_event 26,  5, ROUTE_9_FOREST_GATE, 1
	warp_event  6,  9, ROUTE_9_CAVE_1F, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 28,  6, BGEVENT_READ, Route9Sign
	bg_event 21,  5, BGEVENT_ITEM, Route9HiddenEther

	db 2 ; object events
	object_event 18,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RainDanceLady, -1
	object_event 18, 17, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route9LegendaryGuy, -1
	