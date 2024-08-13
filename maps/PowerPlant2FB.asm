	const_def 2 ; object constants

PowerPlant2FB_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .CardKeyShutterCallback

.CardKeyShutterCallback:
	changeblock  22, 10, $07 ; open shutter
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
	writetext StudyingVitaminsText
	waitbutton

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
	writetext PowerPlantComeBackTomorrow
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end
	
IronHeadTMSalesman:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_IRON_HEAD
	iftrue .GotIronHead
	checkevent EVENT_POWER_PLANT_BOUGHT_IRON_HEAD
	iftrue .GotIronHead
	writetext IronHeadTMSalesmanText
	special PlaceMoneyTopRight
	yesorno
	iffalse .End
	checkmoney YOUR_MONEY, 4800
	ifequal HAVE_LESS, .NotEnoughMoney
	verbosegiveitem TM_IRON_HEAD
	takemoney YOUR_MONEY, 4800
.GotIronHead
	writetext ExplainIronHeadText
	waitbutton
	jump .End
.NotEnoughMoney
	writetext IronHeadTMNotEnoughMoney
	waitbutton
.End
	turnobject LAST_TALKED, RIGHT
	closetext
	end
	
PowerPlant2FSparklingResidueScript:
	jumptextfaceplayer PowerPlant2FSparklingResidueText

PowerPlant2FCornerOfficeScript:
	jumptextfaceplayer PowerPlant2FCornerOfficeText
	
PowerPlant2FNoTimeScript:
	jumptextfaceplayer PowerPlant2FNoTimeText
	
PowerPlant2FGoofOffScript:
	jumptextfaceplayer PowerPlant2FGoofOffText
	
PowerPlant2FAdminScript:
	jumptextfaceplayer PowerPlant2FAdminText
	
PowerPlantBThunderstone:
	itemball THUNDERSTONE
	
PowerPlantBUltraBall:
	itemball ULTRA_BALL
	
PowerPlantBMagnet:
	itemball MAGNET
	
PowerPlantBElixer:
	itemball ELIXER
	
PowerPlantBFullHeal:
	itemball FULL_HEAL

StudyingVitaminsText:
	text "I am researching"
	line "the effects of"
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
	text "Bring me any"
	line "VITAMIN and I'll"
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
	
IronHeadTMSalesmanText:
	text "I have been"
	line "researching how to"
	cont "make a new TM."
	
	para "I have been able"
	line "to successfully"
	cont "create one copy,"
	cont "but I am not a"
	cont "trainer myself to"
	cont "use it."
	
	para "Would you like to"
	line "test it? You must"
	cont "understand I can't"
	cont "give you this TM"
	cont "for free."
	
	para "Would you like to"
	line "buy this TM for"
	cont "¥4800?"
	done
	
IronHeadTMNotEnoughMoney:
	text "Sorry, I really"
	line "can't do this for"
	cont "free. The R&D was"
	cont "too expensive."
	done
	
GotIronHeadTMText:
	text "Hey kid, did you"
	line "see what happened"
	cont "to my TM?"
	
	para "I left it right on"
	line "my desk, but now"
	cont "it's gone."
	
ExplainIronHeadText:
	text "Thank you for"
	line "helping test my"
	cont "TM."

	para "IRON HEAD is a"
	line "powerful STEEL-"
	cont "type move."
	
	para "It may cause the"
	line "target to flinch."
	done
	
PowerPlant2FSparklingResidueText:
	text "I noticed a green"
	line "residue all over"
	cont "my work space."
	
	para "It seems to spark-"
	line "le in the light."
	
	para "But it also has a"
	line "terrible stench…"
	done
	
PowerPlant2FCornerOfficeText:
	text "Hehe! I love my"
	line "corner office!"
	
	para "I can play all"
	line "sorts of PC games"
	cont "and nobody will"
	cont "ever bother me!"
	done
	
PowerPlant2FNoTimeText:
	text "I have no time to"
	line "work on a pet pro-"
	cont "ject like the guy"
	cont "behind me."
	
	para "It's a real shame,"
	line "too. I need to"
	cont "flex my creative"
	cont "muscles!"
	done
	
PowerPlant2FGoofOffText:
	text "The worst part"
	line "about having my"
	cont "desk too close to"
	cont "the ADMIN's office"
	cont "is that I can"
	cont "never get away"
	cont "with goofing off!"
	done

PowerPlant2FAdminText:
	text "Ah!"
	line "Hello <PLAYER>!"

	para "Operations have"
	line "been quite smooth"
	cont "ever since we re-"
	cont "opened!"
	
	para "How is the ITEM-"
	line "FINDER treating"
	cont "you?"
	
	para "It is just one of"
	line "our many side"
	cont "projects."
	
	para "We hope to produce"
	line "even more products"
	cont "in the future."
	done

PowerPlant2FB_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 25, 14, POWER_PLANT_1F_B, 3
	warp_event  3,  4, POWER_PLANT_1F_B, 4

	db 0 ; coord events

	db 0 ; bg events

	db 13 ; object events
	object_event 15, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantBUltraBall, EVENT_POWER_PLANT_ULTRA_BALL
	object_event 15, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantBThunderstone, EVENT_POWER_PLANT_THUNDERSTONE
	object_event  9,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, IronHeadTMSalesman, -1
	object_event  1, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantBFullHeal, EVENT_POWER_PLANT_FULL_HEAL
	object_event 30, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantBMagnet, EVENT_POWER_PLANT_MAGNET
	object_event 26,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, PowerPlantBElixer, EVENT_POWER_PLANT_ELIXER
	object_event 24,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PowerPlant2FSparklingResidueScript, -1
	object_event 28,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PowerPlant2FCornerOfficeScript, -1
	object_event 20, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, XItemMan, -1
	object_event 16, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PowerPlant2FNoTimeScript, -1
	object_event 14,  7, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PowerPlant2FGoofOffScript, -1
	object_event  6, 15, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PowerPlant2FAdminScript, -1
