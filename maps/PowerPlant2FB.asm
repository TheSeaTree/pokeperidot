	const_def 2 ; object constants

PowerPlant2FB_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .CardKeyShutterCallback

.CardKeyShutterCallback:
	checkevent EVENT_USED_OFFICE_KEY
	iftrue .Office
	checkevent EVENT_USED_ADMIN_KEY
	iftrue .Admin
	return

.Office:
	changeblock  22, 10, $07 ; open shutter
	checkevent EVENT_USED_ADMIN_KEY
	iftrue .Admin
	return

.Admin:
	changeblock   6, 10, $07 ; open shutter
	return

XItemMan:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .WaitForApricorns
	checkevent EVENT_GAVE_KURT_PROTEIN
	iftrue .GiveXAttack
	checkevent EVENT_GAVE_KURT_IRON
	iftrue .GiveXDefend
	checkevent EVENT_GAVE_KURT_CALCIUM
	iftrue .GiveXSpAtk
	checkevent EVENT_GAVE_KURT_HP_UP
	iftrue .GiveXSpDef
	checkevent EVENT_GAVE_KURT_CARBOS
	iftrue .GiveXSpeed

.Introduction:
	opentext
	writetext StudyingVitaminsText
	waitbutton
;	closetext
	giveitem PROTEIN, 5

.CheckVitamins:
	checkitem PROTEIN
	iftrue .AskVitamin
	checkitem IRON
	iftrue .AskVitamin
	checkitem CALCIUM
	iftrue .AskVitamin
	checkitem HP_UP
	iftrue .AskVitamin
	checkitem CARBOS
	iftrue .AskVitamin
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .ThatTurnedOutGreat
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .IMakeBallsFromApricorns
	closetext
	end

.IMakeBallsFromApricorns:
	writetext MakeItemsFromVitaminsText
	waitbutton
	closetext
	end

.AskVitamin:
	writetext HaveVitaminsText
	buttonsound
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	special SelectApricornForKurt
	ifequal FALSE, .Cancel
	ifequal IRON, .XDefend
	ifequal CALCIUM, .XSpAtk
	ifequal HP_UP, .XSpDef
	ifequal CARBOS, .XSpeed
;XAttack:
	setevent EVENT_GAVE_KURT_PROTEIN
	jump .GaveKurtApricorns

.XDefend:
	setevent EVENT_GAVE_KURT_IRON
	jump .GaveKurtApricorns

.XSpAtk:
	setevent EVENT_GAVE_KURT_CALCIUM
	jump .GaveKurtApricorns

.XSpDef:
	setevent EVENT_GAVE_KURT_HP_UP
	jump .GaveKurtApricorns

.XSpeed:
	setevent EVENT_GAVE_KURT_CARBOS
	jump .GaveKurtApricorns

.GaveKurtApricorns:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setflag ENGINE_VITAMIN_TIMER
.WaitForApricorns:
	writetext PowerPlantComeBackTomorrow
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

.Cancel:
	writetext VitaminCancelText
	waitbutton
	closetext
	end

._ThatTurnedOutGreat:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
.ThatTurnedOutGreat:
	writetext TurnedOutGreatText
	waitbutton
.NoRoomForBall:
	closetext
	end

.GiveXAttack:
	checkflag ENGINE_VITAMIN_TIMER
	iftrue PowerPlantWorkingOnItScript
	writetext XItemGiftText
	buttonsound
	verbosegiveitem2 X_ATTACK, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_PROTEIN
	jump ._ThatTurnedOutGreat

.GiveXDefend:
	checkflag ENGINE_VITAMIN_TIMER
	iftrue PowerPlantWorkingOnItScript
	writetext XItemGiftText
	buttonsound
	verbosegiveitem2 X_DEFEND, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_IRON
	jump ._ThatTurnedOutGreat

.GiveXSpAtk:
	checkflag ENGINE_VITAMIN_TIMER
	iftrue PowerPlantWorkingOnItScript
	writetext XItemGiftText
	buttonsound
	verbosegiveitem2 X_SP_ATK, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_CALCIUM
	jump ._ThatTurnedOutGreat

.GiveXSpDef:
	checkflag ENGINE_VITAMIN_TIMER
	iftrue PowerPlantWorkingOnItScript
	writetext XItemGiftText
	buttonsound
	verbosegiveitem2 X_SP_DEF, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_HP_UP
	jump ._ThatTurnedOutGreat

.GiveXSpeed:
	checkflag ENGINE_VITAMIN_TIMER
	iftrue PowerPlantWorkingOnItScript
	writetext XItemGiftText
	buttonsound
	verbosegiveitem2 X_SPEED, VAR_KURT_APRICORNS
	iffalse .NoRoomForBall
	clearevent EVENT_GAVE_KURT_CARBOS
	jump ._ThatTurnedOutGreat
	
PowerPlantWorkingOnItScript:
	opentext
	writetext PowerPlantComeBackTomorrow
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

StudyingVitaminsText:
	text "Before this plant"
	line "was repurposed for"
	cont "the SUBWAY, I was"
	cont "researching the"
	cont "effects of"
	cont "VITAMINs on"
	cont "#MON."
	
	para "If my hypothesis"
	line "is correct, I"
	cont "should be able to"
	cont "break them down"
	cont "into an item"
	cont "#MON could use"
	cont "in battle."
	done
	
MakeItemsFromVitaminsText:
	text "I believe I can"
	line "turn them into"
	cont "items which will"
	cont "boost a #MON's"
	cont "stats in battle!"

	para "Bring me any"
	line "VITAMINs and I'll"
	cont "see what I can do"
	cont "with them."
	done

HaveVitaminsText:
	text "Do you have any"
	line "VITAMINs?"

	para "I can turn them"
	line "into a new item!"
	done
	
PowerPlantComeBackTomorrow:
	text "My experiment is"
	line "going to take a"
	cont "while to complete."

	para "Come back tomorrow"
	line "and I'll have your"
	cont "item."
	done
	
VitaminCancelText:
	text "You don't want to"
	line "help me further"
	cont "our research…?"
	done
	
XItemGiftText:
	text "Ah, there you are!"
	line "I was looking for"
	cont "you."
	
	para "Here is the item I"
	line "made!"
	done	

TurnedOutGreatText:
	text "Bring me more"
	line "VITAMINs and I'll"
	cont "make you more of"
	cont "those items."
	done

PowerPlant2FB_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 25, 14, POWER_PLANT_1F_B, 3
	warp_event  3,  4, POWER_PLANT_1F_B, 4

	db 0 ; coord events

	db 0 ; bg events

	db 13 ; object events
	object_event 15, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1 ; Some Item
	object_event 15, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1 ; Some Item
	object_event  9,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1 ; Some Item
	object_event  1, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1 ; Some Item
	object_event 30, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1 ; Some Item
	object_event 18,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1 ; Some Item
	object_event 26,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, ObjectEvent, -1 ; Some Item
	object_event 24,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 28,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 20, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, XItemMan, -1
	object_event 16, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 14,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6, 15, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
