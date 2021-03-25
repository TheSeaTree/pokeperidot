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
	dba BugContestResultsWarpScript
	dba InitializeEventsScript
	dba GymStatue1Script
	dba GymStatue2Script
	dba ReceiveItemScript
	dba ReceiveTogepiEggScript
	dba PCScript
	dba GameCornerCoinVendorScript
	dba HappinessCheckScript
	dba MysteryGiftGirl
	dba LightUpRoomScript
	dba TeleportGuyScript
	dba StolenItemsBoxScript

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

	checkphonecall ; elm already called about pokerus
	iftrue .no
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
	applymovement PLAYER, CenterTurnDown
	end

.pokerus
	; already cleared earlier in the script
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .pokerus_comcenter
	farwritetext NursePokerusText
	waitbutton
	closetext
	jump .pokerus_done

.pokerus_comcenter
	farwritetext PokeComNursePokerusText
	waitbutton
	closetext

.pokerus_done
	setflag ENGINE_CAUGHT_POKERUS
	specialphonecall SPECIALCALL_POKERUS
	end

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
	opentext
	special PokemonCenterPC
	closetext
	end

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
	opentext
	farwritetext FireGymPassOutText
	waitbutton
	closetext
	special FadeBlackQuickly
	playsound SFX_EXIT_BUILDING
	waitsfx
	warpfacing RIGHT, ORCHID_GYM_1F, 7, 5
	setmapscene ORCHID_GYM_1F, SCENE_FINISHED
	end

BugContestResultsWarpScript:
	special FadeOutPalettes
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	playsound SFX_EXIT_BUILDING
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
	setevent EVENT_PLAYERS_HOUSE_MOM_2
	setevent EVENT_PALEROCK_MOUNTAIN_B1F_FIRE_STONE
	setevent EVENT_PALEROCK_MOUNTAIN_B1F_STARDUST
	setevent EVENT_PALEROCK_MOUNTAIN_B1F_REVIVE
	setevent EVENT_BOULDER_IN_PALEROCK_2A
	setevent EVENT_BOULDER_IN_PALEROCK_2B
	setevent EVENT_BOULDER_IN_PALEROCK_B
	setevent EVENT_ROUTE_14_CAVE_1F_BOULDER_1 ; Top Right
	setevent EVENT_ROUTE_14_CAVE_1F_BOULDER_2 ; Top Left
	setevent EVENT_ROUTE_14_CAVE_1F_BOULDER_3 ; Bottom Right
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
	waitbutton
	closetext
	end

GymStatue2Script:
	mapnametotext MEM_BUFFER_0
	opentext
	farwritetext GymStatue_CityGymText
	buttonsound
	farwritetext GymStatue_WinningTrainersText
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

Movement_ContestResults_WalkAfterWarp:
	step DOWN
	step DOWN
	turn_head RIGHT
	step_resume

Movement_SafariZone_Leave:
	step DOWN
	step_resume
