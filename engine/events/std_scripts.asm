StdScripts::
; entries correspond to constants/std_constants.asm
	dba PokecenterNurseScript
	dba GymDoorScript
	dba EnterGymDoorScript
	dba CantLeaveGymScript
	dba StrangersMailbox
	dba DifficultBookshelfScript
	dba PictureBookshelfScript
	dba MagazineBookshelfScript
	dba TeamRocketOathScript
	dba IncenseBurnerScript
	dba MerchandiseShelfScript
	dba CapsuleMachineScript
	dba GymGeyserScript
	dba UnownWallScript
	dba OldStatueScript
	dba TownMapScript
	dba WindowScript
	dba TVScript
	dba HomepageScript
	dba Radio1Script
	dba Radio2Script
	dba TrashCanScript
	dba StrengthBoulderScript
	dba SmashRockScript
	dba PokecenterSignScript
	dba MartSignScript
	dba ElevatorButtonScript
	dba DayToTextScript
	dba FireGymWarpScript
	dba SafariZoneWarpScript
	dba InitializeEventsScript
	dba GymStatue1Script
	dba GymStatue2Script
	dba GymStatue3Script
	dba GymStatue4Script
	dba ReceiveItemScript
	dba ReceiveTogepiEggScript
	dba PCScript
	dba GameCornerCoinVendorScript
	dba HappinessCheckScript
	dba MysteryGiftGirl
	dba LightUpRoomScript
	dba DarkenRoomScript
	dba DarkenRoomNoFlashScript
	dba TeleportGuyScript
	dba StolenItemsBoxScript
	dba WishingFountainScript
	dba EmilyCompanionScript
	dba BattleSimExitWarpScript
	dba TimeTravelWarpScript
	dba SelectSimulationItemballEncounter
	dba BossCelebiIntroScript
	dba BossCelebiDisappearedScript
	dba CelebiEncounterNoBattleScript
	dba TurntableScript
	dba IncubatorScript
	dba EmptyIncubatorScript

PokecenterNurseScript:
; EVENT_WELCOMED_TO_POKECOM_CENTER is never set

	opentext
	checktime MORN
	iftrue .morn
	checktime DAY
	iftrue .day
	checktime NITE
	iftrue .nite
	jump .ok

.morn
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .morn_comcenter
	farwritetext NurseMornText
	buttonsound
	jump .ok
.morn_comcenter
	farwritetext PokeComNurseMornText
	buttonsound
	jump .ok

.day
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .day_comcenter
	farwritetext NurseDayText
	buttonsound
	jump .ok
.day_comcenter
	farwritetext PokeComNurseDayText
	buttonsound
	jump .ok

.nite
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .nite_comcenter
	farwritetext NurseNiteText
	buttonsound
	jump .ok
.nite_comcenter
	farwritetext PokeComNurseNiteText
	buttonsound
	jump .ok

.ok
	; only do this once
	clearevent EVENT_WELCOMED_TO_POKECOM_CENTER

	farwritetext NurseAskHealText
	yesorno
	iffalse .done

	farwritetext NurseTakePokemonText
	pause 20
	special StubbedTrainerRankings_Healings
	turnobject LAST_TALKED, LEFT
	pause 10
	special HealParty
	playmusic MUSIC_NONE
	writebyte HEALMACHINE_POKECENTER
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	turnobject LAST_TALKED, DOWN
	pause 10

	checkflag ENGINE_CAUGHT_POKERUS
	iftrue .no
	special CheckPokerus
	iftrue .pokerus
.no

	farwritetext NurseReturnPokemonText
	pause 20

.done
	farwritetext NurseGoodbyeText

	turnobject LAST_TALKED, UP
	pause 10
	turnobject LAST_TALKED, DOWN
	pause 10
	closetext

	callasm PokeCenterCheckHoldingDirection
	iftrue .end_script
	applymovement PLAYER, CenterTurnDown
.end_script
	end

.pokerus
	farwritetext NursePokerusText
	waitbutton
	closetext
	setflag ENGINE_CAUGHT_POKERUS
	end

PokeCenterCheckHoldingDirection:
	; If the player is holding Up, Right, or Left when the Center script ends, do not turn the player away.
	call GetJoypad
	ldh a, [hJoyDown]
	and D_RIGHT | D_UP | D_LEFT
	ret z
	ld [wScriptVar], a
	ret

CenterTurnDown:
	turn_step DOWN
	step_end
	
GymDoorScript:
	opentext
	farwritetext AskEnterGymText
	yesorno
	iffalse .no
	closetext
	jump EnterGymDoorScript

.no
	closetext
	end
	
EnterGymDoorScript:
	applymovement PLAYER, GymTurnBackMovement
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	special FadeOutMusic
	waitsfx
	end
	
CantLeaveGymScript:
	opentext
	farwritetext CantLeaveGymText
	waitbutton
	closetext
;	applymovement PLAYER, GymTurnBackMovement
	end
	
GymTurnBackMovement:
	step UP
	step_end
	
StrangersMailbox:
	farjumptext MailboxText
	
DifficultBookshelfScript:
	farjumptext DifficultBookshelfText

PictureBookshelfScript:
	farjumptext PictureBookshelfText

MagazineBookshelfScript:
	farjumptext MagazineBookshelfText

TeamRocketOathScript:
	farjumptext TeamRocketOathText

IncenseBurnerScript:
	farjumptext IncenseBurnerText

MerchandiseShelfScript:
	farjumptext MerchandiseShelfText
	
GymGeyserScript:
	farjumptext GymGeyserText
	
UnownWallScript:
	farjumptext UnownWallText

OldStatueScript:
	farjumptext OldStatueText

TownMapScript:
	opentext
	farwritetext TownMapText
	waitbutton
	special OverworldTownMap
	closetext
	end

WindowScript:
	farjumptext WindowText

TVScript:
	opentext
	farwritetext TVText
	waitbutton
	closetext
	end

TurntableScript:
	opentext
	farwritetext TurntableText
	waitbutton
	closetext
	end

IncubatorScript:
	farjumptext IncubatorText

EmptyIncubatorScript:
	opentext
	farwritetext IncubatorText
	waitbutton
	farwritetext EmptyIncubatorText
	waitbutton
	closetext
	end

HomepageScript:
	farjumptext HomepageText

Radio1Script:
	opentext
	writebyte MAPRADIO_POKEMON_CHANNEL
	special MapRadio
	closetext
	end

Radio2Script:
; Lucky Channel
	opentext
	writebyte MAPRADIO_LUCKY_CHANNEL
	special MapRadio
	closetext
	end

TrashCanScript:
	farjumptext TrashCanText

PCScript:
	checkcode VAR_FACING
	ifnotequal UP, .CantAccessPC
	opentext
	special PokemonCenterPC
	closetext
	end

.CantAccessPC
	farjumptext CantAccessPCText

ElevatorButtonScript:
	playsound SFX_READ_TEXT_2
	pause 15
	playsound SFX_ELEVATOR_END
	end

StrengthBoulderScript:
	farjump AskStrengthScript

SmashRockScript:
	farjump AskRockSmashScript

PokecenterSignScript:
	farjumptext PokecenterSignText

MartSignScript:
	farjumptext MartSignText

DayToTextScript:
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .Monday
	ifequal TUESDAY, .Tuesday
	ifequal WEDNESDAY, .Wednesday
	ifequal THURSDAY, .Thursday
	ifequal FRIDAY, .Friday
	ifequal SATURDAY, .Saturday
	stringtotext .SundayText, MEM_BUFFER_0
	end
.Monday:
	stringtotext .MondayText, MEM_BUFFER_0
	end
.Tuesday:
	stringtotext .TuesdayText, MEM_BUFFER_0
	end
.Wednesday:
	stringtotext .WednesdayText, MEM_BUFFER_0
	end
.Thursday:
	stringtotext .ThursdayText, MEM_BUFFER_0
	end
.Friday:
	stringtotext .FridayText, MEM_BUFFER_0
	end
.Saturday:
	stringtotext .SaturdayText, MEM_BUFFER_0
	end
.SundayText:
	db "SUNDAY@"
.MondayText:
	db "MONDAY@"
.TuesdayText:
	db "TUESDAY@"
.WednesdayText:
	db "WEDNESDAY@"
.ThursdayText:
	db "THURSDAY@"
.FridayText:
	db "FRIDAY@"
.SaturdayText:
	db "SATURDAY@"

FireGymWarpScript::
	special FadeOutMusic
	showemote EMOTE_SAD, PLAYER, 15
	opentext
	farwritetext FireGymUnbearableHeatText
	waitbutton
	playsound SFX_KINESIS
	waitsfx
	playsound SFX_FAINT
	scall DarkenRoomScript
	waitsfx
	farwritetext FireGymPassOutText
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	wait 8
	playsound SFX_FULL_HEAL
	wait 8
	warpfacing RIGHT, ORCHID_GYM_1F, 9, 7
	setmapscene ORCHID_GYM_1F, SCENE_ORCHIDGYM1F_FAINTED
	end

SafariZoneWarpScript:
	special FadeOutPalettes
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	playsound SFX_EXIT_BUILDING
	setmapscene SAFARI_ZONE_GATE_1F, SCENE_DEFAULT
	waitsfx
	warp SAFARI_ZONE_GATE_1F, 8, 0
	end

InitializeEventsScript:
	setevent EVENT_PLAYERS_HOUSE_2F_CONSOLE
	setevent EVENT_PLAYERS_HOUSE_2F_DOLL_1
	setevent EVENT_PLAYERS_HOUSE_2F_DOLL_2
	setevent EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
	setevent EVENT_DECO_BED_1
	setevent EVENT_DECO_PLANT_4
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	setevent EVENT_PLAYERS_HOUSE_MOM_2
	setevent EVENT_PALEROCK_MOUNTAIN_B1F_FIRE_STONE
	setevent EVENT_PALEROCK_MOUNTAIN_B1F_STARDUST
	setevent EVENT_PALEROCK_MOUNTAIN_B1F_REVIVE
	setevent EVENT_BOULDER_IN_PALEROCK_2A
	setevent EVENT_BOULDER_IN_PALEROCK_2B
	setevent EVENT_BOULDER_IN_PALEROCK_B
	setevent EVENT_THE_BONEYARD_1F_BOULDER_1 ; Top Right
	setevent EVENT_THE_BONEYARD_1F_BOULDER_2 ; Top Left
	setevent EVENT_THE_BONEYARD_1F_BOULDER_3 ; Bottom Right
	setevent EVENT_HIDE_SHELTER_MAROWAK
	setevent EVENT_HIDE_TELEPORT_GUY
	setevent EVENT_GOT_TM_CURSE
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_SILVER
	variablesprite SPRITE_SUBSTITUTE_GUY, SPRITE_MONSTER
	setevent EVENT_INITIALIZED_EVENTS
	return

GymStatue1Script:
	mapnametotext MEM_BUFFER_0
	opentext
	farwritetext GymStatue_CityGymText
	buttonsound
	farwritetext GymStatue_WinningTrainers1Text
	waitbutton
	closetext
	end

GymStatue2Script:
	mapnametotext MEM_BUFFER_0
	opentext
	farwritetext GymStatue_CityGymText
	buttonsound
	farwritetext GymStatue_WinningTrainers2Text
	waitbutton
	closetext
	end

GymStatue3Script:
	mapnametotext MEM_BUFFER_0
	opentext
	farwritetext GymStatue_CityGymText
	buttonsound
	farwritetext GymStatue_WinningTrainers3Text
	waitbutton
	closetext
	end

GymStatue4Script:
	mapnametotext MEM_BUFFER_0
	opentext
	farwritetext GymStatue_CityGymText
	buttonsound
	farwritetext GymStatue_WinningTrainers4Text
	waitbutton
	closetext
	end	

ReceiveItemScript:
	waitsfx
	farwritetext ReceivedItemText
	playsound SFX_ITEM
	waitsfx
	end

ReceiveTogepiEggScript:
	waitsfx
	farwritetext ReceivedItemText
	playsound SFX_GET_EGG_FROM_DAY_CARE_LADY
	waitsfx
	end

GameCornerCoinVendorScript:
	faceplayer
	opentext
	farwritetext CoinVendor_WelcomeText
	buttonsound
	checkitem COIN_CASE
	iftrue CoinVendor_IntroScript
	farwritetext CoinVendor_NoCoinCaseText
	waitbutton
	closetext
	end

CoinVendor_IntroScript:
	farwritetext CoinVendor_IntroText

.loop
	special DisplayMoneyAndCoinBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Buy50
	ifequal 2, .Buy500
	jump .Cancel

.Buy50:
	checkcoins MAX_COINS - 50
	ifequal HAVE_MORE, .CoinCaseFull
	checkmoney YOUR_MONEY, 1000
	ifequal HAVE_LESS, .NotEnoughMoney
	givecoins 50
	takemoney YOUR_MONEY, 1000
	waitsfx
	playsound SFX_TRANSACTION
	farwritetext CoinVendor_Buy50CoinsText
	waitbutton
	jump .loop

.Buy500:
	checkcoins MAX_COINS - 500
	ifequal HAVE_MORE, .CoinCaseFull
	checkmoney YOUR_MONEY, 10000
	ifequal HAVE_LESS, .NotEnoughMoney
	givecoins 500
	takemoney YOUR_MONEY, 10000
	waitsfx
	playsound SFX_TRANSACTION
	farwritetext CoinVendor_Buy500CoinsText
	waitbutton
	jump .loop

.NotEnoughMoney:
	farwritetext CoinVendor_NotEnoughMoneyText
	waitbutton
	closetext
	end

.CoinCaseFull:
	farwritetext CoinVendor_CoinCaseFullText
	waitbutton
	closetext
	end

.Cancel:
	farwritetext CoinVendor_CancelText
	waitbutton
	closetext
	end

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db " 50 :  ¥1000@"
	db "500 : ¥10000@"
	db "CANCEL@"

HappinessCheckScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	ifless 50, .Unhappy
	ifless 150, .KindaHappy
	farwritetext HappinessText3
	waitbutton
	closetext
	end

.KindaHappy:
	farwritetext HappinessText2
	waitbutton
	closetext
	end

.Unhappy:
	farwritetext HappinessText1
	waitbutton
	closetext
	end
	
MysteryGiftGirl:
	callasm MysteryGiftNPC
	verbosegiveitem ITEM_FROM_MEM
	end
	
LightUpRoomScript:
	reloadmappart
	special UpdateTimePals
	callasm BlindingFlash
	end

DarkenRoomScript:
	reloadmappart
	special UpdateTimePals
	callasm TotalDarkness
	end

DarkenRoomNoFlashScript:
	reloadmappart
	special UpdateTimePals
	callasm TotalDarknessNoFlash
	end

TeleportGuyScript:
	opentext
	checkevent EVENT_TELEPORT_GUY_INTRODUCED
	iftrue .alreadymet
	farwritetext TeleportGuyIntroductionText
	setevent EVENT_TELEPORT_GUY_INTRODUCED
.alreadymet
	farwritetext TeleportGuyAskText
	yesorno
	iffalse .decline
	closetext
	special OverworldFlyMap
.decline
	farwritetext TeleportGuyDeclineText
	closetext
	end

DoTeleportScript:
	opentext
	farwritetext TeleportGuyAcceptText
	closetext
	playsound SFX_WARP_TO
	applymovement PLAYER, .TeleportOut
	pause 8
	special WarpToSpawnPoint
	callasm DelayLoadingNewSprites
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_FLY
	playsound SFX_WARP_FROM
	applymovement PLAYER, .TeleportIn
	callasm .ReturnFromFly
	end

.ReturnFromFly:
	farcall LoadOverworldFont
	farcall LoadMapNameSignGFX
	ret
	
.TeleportOut:
	teleport_from
	step_resume
	
.TeleportIn:
	show_object
	teleport_to
	step_resume

CapsuleMachineScript:
	opentext
	farwritetext CapsuleMachineText
	special PlaceMoneyTopRight
	yesorno
	iffalse .End
.Again
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem DOLL_CAPSULE
	iffalse .NotEnoughSpace
	takemoney YOUR_MONEY, 500
	special PlaceMoneyTopRight
	farwritetext CapsuleMachineUsedText1
	playsound SFX_ENTER_DOOR
	waitsfx
	farwritetext CapsuleMachineUsedText1
	playsound SFX_ENTER_DOOR
	waitsfx
	farwritetext CapsuleMachineUsedText2
	playsound SFX_BALL_POOF
	waitbutton

	itemtotext DOLL_CAPSULE, MEM_BUFFER_1
	farwritetext GiveItemText
	playsound SFX_ITEM
	pause 60
	itemnotify
	farwritetext CapsuleMachineAgainText
	yesorno
	iftrue .Again	
.End
	closetext
	end
	
.NotEnoughMoney:
	farwritetext UnknownText_0x1bdebc
	jump .End
	
.NotEnoughSpace:
	farwritetext UnknownText_0x1c4fb7
	waitbutton
	jump .End

StolenItemsBoxScript:
	random 2
	ifequal 1, .box1
	farjumptext StolenGoodsText1
.box1:
	farjumptext StolenGoodsText2
	
WishingFountainScript:
; 1% chance to call StartShinyEncounterTimer, 49% chance to raise happiness by 1, 50% chance to do nothing.
; Change the  random amount depending on how much money is spent(255, 100, 75).
	opentext
	farwritetext FountainIntroText
	special PlaceMoneyTopRight
	checkevent EVENT_GOT_HM_SURF
	iftrue .good_odds
	yesorno
	iftrue .roll_10
	closetext
	end

.good_odds
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .roll_10
	ifequal 2, .roll_100
	ifequal 3, .roll_500
	closetext
	end

.roll_10
	checkmoney YOUR_MONEY, 10
	ifequal HAVE_LESS, .NotEnoughMoney
	farwritetext FountainTossed10Text
	playsound SFX_PAY_DAY
	waitsfx
	takemoney YOUR_MONEY, 10
	special PlaceMoneyTopRight
	random 10
	ifequal 0, .results_10
	closetext
	end

.roll_100
	checkmoney YOUR_MONEY, 100
	ifequal HAVE_LESS, .NotEnoughMoney
	farwritetext FountainTossed100Text
	playsound SFX_PAY_DAY
	waitsfx
	takemoney YOUR_MONEY, 100
	special PlaceMoneyTopRight
.results_10
	random 120
	jump .results

.roll_500
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, .NotEnoughMoney
	farwritetext FountainTossed500Text
	playsound SFX_PAY_DAY
	waitsfx
	takemoney YOUR_MONEY, 500
	special PlaceMoneyTopRight
	random 60
.results
	ifequal 0, .ShinyEncounters
	ifless 25, .IncreaseHappiness
	ifless 40, .GivePokerus
	closetext
	end

.ShinyEncounters:
	farwritetext FountainCoinsSparkleText
	waitbutton
	closetext
	special StartShinyEncounterTimer
	end
.IncreaseHappiness:
	special GetFirstPokemonHappiness
	farwritetext FountainFirstMonHappyText
	waitbutton
	special FountainHappiness ; Make this add happiness instead of maxing it?
	closetext
	end
.GivePokerus
	farwritetext GivePokerusText
	waitbutton
	closetext
	callasm GivePokerusAndConvertBerries
	end

.NotEnoughMoney:
	farwritetext FountainNotEnoughMoneyText
	waitbutton
	closetext
	end

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 13, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "¥10@"
	db "¥100@"
	db "¥500@"
	
EmilyCompanionScript:
	faceplayer
	opentext
; Make checks for certain story events on the ship
	checkevent EVENT_SS_MAKO_DECK_CLEARED
	iftrue .message11
	checkevent EVENT_SS_MAKO_UNLOCK_2F_DOORS
	iftrue .message10
	checkevent EVENT_ACCESS_TO_SS_MAKO_2F
	iftrue .message9
	checkevent EVENT_GOT_VIP_TICKET
	iftrue .message8
	checkevent EVENT_USED_ENGINE_KEY
	iftrue .message7
	checkevent EVENT_GOT_ENGINE_KEY
	iftrue .message6
	checkevent EVENT_SS_MAKO_ENGINE_DOOR_LOCKED
	iftrue .message5
	checkevent EVENT_VIP_TICKET_LOCATION_INFO
	iftrue .message4
	checkevent EVENT_SS_MAKO_TRIED_GOING_UPSTAIRS
	iftrue .message3
	; A couple of random messages for her bag being stolen.
	random 2
	ifequal 1, .message2
	farwritetext EmilyCompanionText1
	jump .waitbuttonclosetext
.message2
	farwritetext EmilyCompanionText2
	jump .waitbuttonclosetext
.message3
	; After the player tries to go upstairs
	farwritetext EmilyCompanionText3
	jump .waitbuttonclosetext
.message4
	; Have a counter for the SS Mako trainers, and make one of them hint at the guy in the basement with a ticket after losing.
	farwritetext EmilyCompanionText4
	jump .waitbuttonclosetext
.message5
	; The door to the engine room is locked.
	farwritetext EmilyCompanionText5
	jump .waitbuttonclosetext
.message6
	; After the player finds the key for the engine room.
	farwritetext EmilyCompanionText6
	jump .waitbuttonclosetext
.message7
	; Engine room door is unlocked.
	farwritetext EmilyCompanionText7
	jump .waitbuttonclosetext
.message8
	; Have the golden ticket.
	farwritetext EmilyCompanionText8
	jump .waitbuttonclosetext
.message9
	; Access to the second floor.
	farwritetext EmilyCompanionText9
	jump .waitbuttonclosetext
.message10
	; After the player has talked to an NPC outside, unlock the doors on the second floor.
	farwritetext EmilyCompanionText10
	jump .waitbuttonclosetext
.message11
	; When the player has defeated enough trainers on the second floor.
	farwritetext EmilyCompanionText11
.waitbuttonclosetext
	waitbutton
	closetext
	end

Movement_ContestResults_WalkAfterWarp:
	step DOWN
	step DOWN
	turn_head RIGHT
	step_resume

Movement_SafariZone_Leave:
	step DOWN
	step_resume

BattleSimExitWarpScript:
	setmapscene BATTLE_SIMULATION, SCENE_BATTLESIMULATION_FINISHED
	special FadeOutPalettes
	writecode VAR_MOVEMENT, PLAYER_HEADSET
	playsound SFX_WARP_FROM
	waitsfx
	warpfacing DOWN, BATTLE_SIMULATION, 8, 6
	end

TimeTravelWarpScript:
	setmapscene BATTLE_SIMULATION, SCENE_BATTLESIMULATION_RETURNED_TO_PRESENT
	playsound SFX_WARP_FROM
	special FadeOutPalettes
	waitsfx
	writecode VAR_MOVEMENT, PLAYER_HEADSET
	warpfacing UP, BATTLE_SIMULATION, 2, 9
	end

SelectSimulationItemballEncounter:
	random 28
	ifequal 0, .Feraligatr
	ifequal 1, .Typhlosion
	ifequal 2, .Meganium
	ifless  5, .Dragonair
	ifless  7, .Kadabra
	ifless 10, .Weezing
	ifless 14, .Yanma
	ifless 17, .Ancor
	ifless 21, .Slowbro
	ifless 25, .Scyther
; Common
.Furret
	loadwildmon FURRET, 50
	jump .DoBattle
.Slowbro
	loadwildmon SLOWBRO, 50
	jump .DoBattle
.Scyther
	loadwildmon SCYTHER, 50
	jump .DoBattle
.Yanma
	loadwildmon YANMA, 50
	jump .DoBattle
; Uncommon
.Ancor
	loadwildmon ANCOR, 50
	jump .DoBattle
.Weezing
	loadwildmon WEEZING, 50
	jump .DoBattle
; Rare
.Dragonair
	loadwildmon DRAGONAIR, 50
	jump .DoBattle
.Kadabra
	loadwildmon KADABRA, 50
	jump .DoBattle
; Ultra Rare
.Typhlosion
	loadwildmon TYPHLOSION, 50
	jump .DoBattle
.Feraligatr
	loadwildmon FERALIGATR, 50
	jump .DoBattle
.Meganium
	loadwildmon MEGANIUM, 50
.DoBattle
	writecode VAR_BATTLETYPE, BATTLETYPE_SIMULATION
	startbattle
	reloadmapafterbattle
	end

BossCelebiIntroScript:
	opentext
	farwritetext CelebiBossIntroText
	cry CELEBI
	waitsfx
	closetext
	end

BossCelebiDisappearedScript:
	opentext
	farwritetext CelebiBossDisappearedText
	waitbutton
	closetext
	end

CelebiEncounterNoBattleScript:
	opentext
	farwritetext CelebiBossIntroText
	cry CELEBI
	waitsfx
	farwritetext CelebiNoBattleText
	waitbutton
	closetext
	end
