StdScripts::
; entries correspond to constants/std_constants.asm
	dba PokecenterNurseScript
	dba GymDoorScript
	dba CantLeaveGymScript
	dba StrangersMailbox
	dba DifficultBookshelfScript
	dba PictureBookshelfScript
	dba MagazineBookshelfScript
	dba TeamRocketOathScript
	dba IncenseBurnerScript
	dba MerchandiseShelfScript
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
	dba BugContestResultsWarpScript
	dba BugContestResultsScript
	dba InitializeEventsScript
	dba AskNumber1MScript
	dba AskNumber2MScript
	dba RegisteredNumberMScript
	dba NumberAcceptedMScript
	dba NumberDeclinedMScript
	dba PhoneFullMScript
	dba RematchMScript
	dba GiftMScript
	dba PackFullMScript
	dba RematchGiftMScript
	dba AskNumber1FScript
	dba AskNumber2FScript
	dba RegisteredNumberFScript
	dba NumberAcceptedFScript
	dba NumberDeclinedFScript
	dba PhoneFullFScript
	dba RematchFScript
	dba GiftFScript
	dba PackFullFScript
	dba RematchGiftFScript
	dba GymStatue1Script
	dba GymStatue2Script
	dba ReceiveItemScript
	dba ReceiveTogepiEggScript
	dba PCScript
	dba GameCornerCoinVendorScript
	dba HappinessCheckScript

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
	applymovement PLAYER, GymTurnBackMovement
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	special FadeOutMusic
	waitsfx
	end

.no
	closetext
	end
	
CantLeaveGymScript:
	opentext
	farwritetext CantLeaveGymText
	waitbutton
	closetext
	applymovement PLAYER, GymTurnBackMovement
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

BugContestResultsWarpScript:
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	waitsfx
	warp SAFARI_ZONE_GATE_1F, 8, 0
;	applymovement PLAYER, Movement_ContestResults_WalkAfterWarp

BugContestResultsScript:
;	clearflag ENGINE_BUG_CONTEST_TIMER
;	opentext
;	farwritetext SafariZone_LeavingText
;	waitbutton
;	closetext
;	applymovement PLAYER, Movement_SafariZone_Leave
	end

InitializeEventsScript:
	setevent EVENT_PLAYERS_HOUSE_2F_CONSOLE
	setevent EVENT_PLAYERS_HOUSE_2F_DOLL_1
	setevent EVENT_PLAYERS_HOUSE_2F_DOLL_2
	setevent EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
	setevent EVENT_DECO_BED_1
	setevent EVENT_DECO_PLANT_4
	setevent EVENT_PLAYERS_HOUSE_MOM_2
	setevent EVENT_INITIALIZED_EVENTS
	clearevent EVENT_BOULDER_IN_PALEROCK_3A
	clearevent EVENT_BOULDER_IN_PALEROCK_3B
	setevent EVENT_BOULDER_IN_PALEROCK_2A
	setevent EVENT_BOULDER_IN_PALEROCK_2B
	setevent EVENT_BOULDER_IN_PALEROCK_B
	setevent EVENT_ROUTE_14_CAVE_1F_BOULDER_1 ; Top Right
	setevent EVENT_ROUTE_14_CAVE_1F_BOULDER_2 ; Top Left
	setevent EVENT_ROUTE_14_CAVE_1F_BOULDER_3 ; Bottom Right
	setevent EVENT_HIDE_SHELTER_MAROWAK
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_SILVER
	variablesprite SPRITE_SUBSTITUTE_GUY, SPRITE_MONSTER
	return

AskNumber1MScript:
	special RandomPhoneMon
	checkcode VAR_CALLERID

.Jack:
	farwritetext JackAskNumber1Text
	end
.Huey:
	farwritetext HueyAskNumber1Text
	end
.Gaven:
	farwritetext GavenAskNumber1Text
	end
.Jose:
	farwritetext JoseAskNumber1Text
	end
.Joey:
	farwritetext JoeyAskNumber1Text
	end
.Wade:
	farwritetext WadeAskNumber1Text
	end
.Ralph:
	farwritetext RalphAskNumber1Text
	end
.Anthony:
	farwritetext AnthonyAskNumber1Text
	end
.Todd:
	farwritetext ToddAskNumber1Text
	end
.Irwin:
	farwritetext IrwinAskNumber1Text
	end
.Arnie:
	farwritetext ArnieAskNumber1Text
	end
.Alan:
	farwritetext AlanAskNumber1Text
	end
.Chad:
	farwritetext ChadAskNumber1Text
	end
.Derek:
	farwritetext DerekAskNumber1Text
	end
.Tully:
	farwritetext TullyAskNumber1Text
	end
.Brent:
	farwritetext BrentAskNumber1Text
	end
.Vance:
	farwritetext VanceAskNumber1Text
	end
.Wilton:
	farwritetext WiltonAskNumber1Text
	end
.Kenji:
	farwritetext KenjiAskNumber1Text
	end
.Parry:
	farwritetext ParryAskNumber1Text
	end

AskNumber2MScript:
	special RandomPhoneMon
	checkcode VAR_CALLERID

.Jack:
	farwritetext JackAskNumber2Text
	end
.Huey:
	farwritetext HueyAskNumber2Text
	end
.Gaven:
	farwritetext GavenAskNumber2Text
	end
.Jose:
	farwritetext JoseAskNumber2Text
	end
.Joey:
	farwritetext JoeyAskNumber2Text
	end
.Wade:
	farwritetext WadeAskNumber2Text
	end
.Ralph:
	farwritetext RalphAskNumber2Text
	end
.Anthony:
	farwritetext AnthonyAskNumber2Text
	end
.Todd:
	farwritetext ToddAskNumber2Text
	end
.Irwin:
	farwritetext IrwinAskNumber2Text
	end
.Arnie:
	farwritetext ArnieAskNumber2Text
	end
.Alan:
	farwritetext AlanAskNumber2Text
	end
.Chad:
	farwritetext ChadAskNumber2Text
	end
.Derek:
	farwritetext DerekAskNumber2Text
	end
.Tully:
	farwritetext TullyAskNumber2Text
	end
.Brent:
	farwritetext BrentAskNumber2Text
	end
.Vance:
	farwritetext VanceAskNumber2Text
	end
.Wilton:
	farwritetext WiltonAskNumber2Text
	end
.Kenji:
	farwritetext KenjiAskNumber2Text
	end
.Parry:
	farwritetext ParryAskNumber2Text
	end

RegisteredNumberMScript:
	farwritetext RegisteredNumber1Text
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
	end

NumberAcceptedMScript:
	checkcode VAR_CALLERID

.Jack:
	farwritetext JackNumberAcceptedText
	waitbutton
	closetext
	end
.Huey:
	farwritetext HueyNumberAcceptedText
	waitbutton
	closetext
	end
.Gaven:
	farwritetext GavenNumberAcceptedText
	waitbutton
	closetext
	end
.Jose:
	farwritetext JoseNumberAcceptedText
	waitbutton
	closetext
	end
.Joey:
	farwritetext JoeyNumberAcceptedText
	waitbutton
	closetext
	end
.Wade:
	farwritetext WadeNumberAcceptedText
	waitbutton
	closetext
	end
.Ralph:
	farwritetext RalphNumberAcceptedText
	waitbutton
	closetext
	end
.Anthony:
	farwritetext AnthonyNumberAcceptedText
	waitbutton
	closetext
	end
.Todd:
	farwritetext ToddNumberAcceptedText
	waitbutton
	closetext
	end
.Irwin:
	farwritetext IrwinNumberAcceptedText
	waitbutton
	closetext
	end
.Arnie:
	farwritetext ArnieNumberAcceptedText
	waitbutton
	closetext
	end
.Alan:
	farwritetext AlanNumberAcceptedText
	waitbutton
	closetext
	end
.Chad:
	farwritetext ChadNumberAcceptedText
	waitbutton
	closetext
	end
.Derek:
	farwritetext DerekNumberAcceptedText
	waitbutton
	closetext
	end
.Tully:
	farwritetext TullyNumberAcceptedText
	waitbutton
	closetext
	end
.Brent:
	farwritetext BrentNumberAcceptedText
	waitbutton
	closetext
	end
.Vance:
	farwritetext VanceNumberAcceptedText
	waitbutton
	closetext
	end
.Wilton:
	farwritetext WiltonNumberAcceptedText
	waitbutton
	closetext
	end
.Kenji:
	farwritetext KenjiNumberAcceptedText
	waitbutton
	closetext
	end
.Parry:
	farwritetext ParryNumberAcceptedText
	waitbutton
	closetext
	end

NumberDeclinedMScript:
	checkcode VAR_CALLERID

.Jack:
	farwritetext JackNumberDeclinedText
	waitbutton
	closetext
	end
.Huey:
	farwritetext HueyNumberDeclinedText
	waitbutton
	closetext
	end
.Gaven:
	farwritetext GavenNumberDeclinedText
	waitbutton
	closetext
	end
.Jose:
	farwritetext JoseNumberDeclinedText
	waitbutton
	closetext
	end
.Joey:
	farwritetext JoeyNumberDeclinedText
	waitbutton
	closetext
	end
.Wade:
	farwritetext WadeNumberDeclinedText
	waitbutton
	closetext
	end
.Ralph:
	farwritetext RalphNumberDeclinedText
	waitbutton
	closetext
	end
.Anthony:
	farwritetext AnthonyNumberDeclinedText
	waitbutton
	closetext
	end
.Todd:
	farwritetext ToddNumberDeclinedText
	waitbutton
	closetext
	end
.Irwin:
	farwritetext IrwinNumberDeclinedText
	waitbutton
	closetext
	end
.Arnie:
	farwritetext ArnieNumberDeclinedText
	waitbutton
	closetext
	end
.Alan:
	farwritetext AlanNumberDeclinedText
	waitbutton
	closetext
	end
.Chad:
	farwritetext ChadNumberDeclinedText
	waitbutton
	closetext
	end
.Derek:
	farwritetext DerekNumberDeclinedText
	waitbutton
	closetext
	end
.Tully:
	farwritetext TullyNumberDeclinedText
	waitbutton
	closetext
	end
.Brent:
	farwritetext BrentNumberDeclinedText
	waitbutton
	closetext
	end
.Vance:
	farwritetext VanceNumberDeclinedText
	waitbutton
	closetext
	end
.Wilton:
	farwritetext WiltonNumberDeclinedText
	waitbutton
	closetext
	end
.Kenji:
	farwritetext KenjiNumberDeclinedText
	waitbutton
	closetext
	end
.Parry:
	farwritetext ParryNumberDeclinedText
	waitbutton
	closetext
	end

PhoneFullMScript:
	checkcode VAR_CALLERID

.Jack:
	farwritetext JackPhoneFullText
	waitbutton
	closetext
	end
.Huey:
	farwritetext HueyPhoneFullText
	waitbutton
	closetext
	end
.Gaven:
	farwritetext GavenPhoneFullText
	waitbutton
	closetext
	end
.Jose:
	farwritetext JosePhoneFullText
	waitbutton
	closetext
	end
.Joey:
	farwritetext JoeyPhoneFullText
	waitbutton
	closetext
	end
.Wade:
	farwritetext WadePhoneFullText
	waitbutton
	closetext
	end
.Ralph:
	farwritetext RalphPhoneFullText
	waitbutton
	closetext
	end
.Anthony:
	farwritetext AnthonyPhoneFullText
	waitbutton
	closetext
	end
.Todd:
	farwritetext ToddPhoneFullText
	waitbutton
	closetext
	end
.Irwin:
	farwritetext IrwinPhoneFullText
	waitbutton
	closetext
	end
.Arnie:
	farwritetext ArniePhoneFullText
	waitbutton
	closetext
	end
.Alan:
	farwritetext AlanPhoneFullText
	waitbutton
	closetext
	end
.Chad:
	farwritetext ChadPhoneFullText
	waitbutton
	closetext
	end
.Derek:
	farwritetext DerekPhoneFullText
	waitbutton
	closetext
	end
.Tully:
	farwritetext TullyPhoneFullText
	waitbutton
	closetext
	end
.Brent:
	farwritetext BrentPhoneFullText
	waitbutton
	closetext
	end
.Vance:
	farwritetext VancePhoneFullText
	waitbutton
	closetext
	end
.Wilton:
	farwritetext WiltonPhoneFullText
	waitbutton
	closetext
	end
.Kenji:
	farwritetext KenjiPhoneFullText
	waitbutton
	closetext
	end
.Parry:
	farwritetext ParryPhoneFullText
	waitbutton
	closetext
	end

RematchMScript:
	checkcode VAR_CALLERID

.Jack:
	farwritetext JackRematchText
	waitbutton
	closetext
	end
.Huey:
	farwritetext HueyRematchText
	waitbutton
	closetext
	end
.Gaven:
	farwritetext GavenRematchText
	waitbutton
	closetext
	end
.Jose:
	farwritetext JoseRematchText
	waitbutton
	closetext
	end
.Joey:
	farwritetext JoeyRematchText
	waitbutton
	closetext
	end
.Wade:
	farwritetext WadeRematchText
	waitbutton
	closetext
	end
.Ralph:
	farwritetext RalphRematchText
	waitbutton
	closetext
	end
.Anthony:
	farwritetext AnthonyRematchText
	waitbutton
	closetext
	end
.Todd:
	farwritetext ToddRematchText
	waitbutton
	closetext
	end
.Arnie:
	farwritetext ArnieRematchText
	waitbutton
	closetext
	end
.Alan:
	farwritetext AlanRematchText
	waitbutton
	closetext
	end
.Chad:
	farwritetext ChadRematchText
	waitbutton
	closetext
	end
.Tully:
	farwritetext TullyRematchText
	waitbutton
	closetext
	end
.Brent:
	farwritetext BrentRematchText
	waitbutton
	closetext
	end
.Vance:
	farwritetext VanceRematchText
	waitbutton
	closetext
	end
.Wilton:
	farwritetext WiltonRematchText
	waitbutton
	closetext
	end
.Parry:
	farwritetext ParryRematchText
	waitbutton
	closetext
	end

GiftMScript:
	checkcode VAR_CALLERID

.Jose:
	farwritetext JoseGiftText
	buttonsound
	end
.Wade:
	farwritetext WadeGiftText
	buttonsound
	end
.Alan:
	farwritetext AlanGiftText
	buttonsound
	end
.Derek:
	farwritetext DerekGiftText
	buttonsound
	end
.Tully:
	farwritetext TullyGiftText
	buttonsound
	end
.Wilton:
	farwritetext WiltonGiftText
	buttonsound
	end
.Kenji:
	farwritetext KenjiGiftText
	buttonsound
	end

PackFullMScript:
	checkcode VAR_CALLERID

.Huey:
	farwritetext HueyPackFullText
	waitbutton
	closetext
	end
.Jose:
	farwritetext JosePackFullText
	waitbutton
	closetext
	end
.Joey:
	farwritetext JoeyPackFullText
	waitbutton
	closetext
	end
.Wade:
	farwritetext WadePackFullText
	waitbutton
	closetext
	end
.Alan:
	farwritetext AlanPackFullText
	waitbutton
	closetext
	end
.Derek:
	farwritetext DerekPackFullText
	waitbutton
	closetext
	end
.Tully:
	farwritetext TullyPackFullText
	waitbutton
	closetext
	end
.Vance:
	farwritetext VancePackFullText
	waitbutton
	closetext
	end
.Wilton:
	farwritetext WiltonPackFullText
	waitbutton
	closetext
	end
.Kenji:
	farwritetext KenjiPackFullText
	waitbutton
	closetext
	end
.Parry:
	farwritetext ParryPackFullText
	waitbutton
	closetext
	end

RematchGiftMScript:
	opentext
	checkcode VAR_CALLERID

.Huey:
	farwritetext HueyRematchGiftText
	buttonsound
	end
.Joey:
	farwritetext JoeyRematchGiftText
	buttonsound
	end
.Vance:
	farwritetext VanceRematchGiftText
	buttonsound
	end
.Parry:
	farwritetext ParryRematchGiftText
	buttonsound
	end

AskNumber1FScript:
	checkcode VAR_CALLERID

.Beverly:
	farwritetext BeverlyAskNumber1Text
	end
.Beth:
	farwritetext BethAskNumber1Text
	end
.Reena:
	farwritetext ReenaAskNumber1Text
	end
.Liz:
	farwritetext LizAskNumber1Text
	end
.Gina:
	farwritetext GinaAskNumber1Text
	end
.Dana:
	farwritetext DanaAskNumber1Text
	end
.Tiffany:
	farwritetext TiffanyAskNumber1Text
	end
.Erin:
	farwritetext ErinAskNumber1Text
	end

AskNumber2FScript:
	checkcode VAR_CALLERID

.Beverly:
	farwritetext BeverlyAskNumber2Text
	end
.Beth:
	farwritetext BethAskNumber2Text
	end
.Reena:
	farwritetext ReenaAskNumber2Text
	end
.Liz:
	farwritetext LizAskNumber2Text
	end
.Gina:
	farwritetext GinaAskNumber2Text
	end
.Dana:
	farwritetext DanaAskNumber2Text
	end
.Tiffany:
	farwritetext TiffanyAskNumber2Text
	end
.Erin:
	farwritetext ErinAskNumber2Text
	end

RegisteredNumberFScript:
	farwritetext RegisteredNumber2Text
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
	end

NumberAcceptedFScript:
	checkcode VAR_CALLERID

.Beverly:
	farwritetext BeverlyNumberAcceptedText
	waitbutton
	closetext
	end
.Beth:
	farwritetext BethNumberAcceptedText
	waitbutton
	closetext
	end
.Reena:
	farwritetext ReenaNumberAcceptedText
	waitbutton
	closetext
	end
.Liz:
	farwritetext LizNumberAcceptedText
	waitbutton
	closetext
	end
.Gina:
	farwritetext GinaNumberAcceptedText
	waitbutton
	closetext
	end
.Dana:
	farwritetext DanaNumberAcceptedText
	waitbutton
	closetext
	end
.Tiffany:
	farwritetext TiffanyNumberAcceptedText
	waitbutton
	closetext
	end
.Erin:
	farwritetext ErinNumberAcceptedText
	waitbutton
	closetext
	end

NumberDeclinedFScript:
	checkcode VAR_CALLERID

.Beverly:
	farwritetext BeverlyNumberDeclinedText
	waitbutton
	closetext
	end
.Beth:
	farwritetext BethNumberDeclinedText
	waitbutton
	closetext
	end
.Reena:
	farwritetext ReenaNumberDeclinedText
	waitbutton
	closetext
	end
.Liz:
	farwritetext LizNumberDeclinedText
	waitbutton
	closetext
	end
.Gina:
	farwritetext GinaNumberDeclinedText
	waitbutton
	closetext
	end
.Dana:
	farwritetext DanaNumberDeclinedText
	waitbutton
	closetext
	end
.Tiffany:
	farwritetext TiffanyNumberDeclinedText
	waitbutton
	closetext
	end
.Erin:
	farwritetext ErinNumberDeclinedText
	waitbutton
	closetext
	end

PhoneFullFScript:
	checkcode VAR_CALLERID

.Beverly:
	farwritetext BeverlyPhoneFullText
	waitbutton
	closetext
	end
.Beth:
	farwritetext BethPhoneFullText
	waitbutton
	closetext
	end
.Reena:
	farwritetext ReenaPhoneFullText
	waitbutton
	closetext
	end
.Liz:
	farwritetext LizPhoneFullText
	waitbutton
	closetext
	end
.Gina:
	farwritetext GinaPhoneFullText
	waitbutton
	closetext
	end
.Dana:
	farwritetext DanaPhoneFullText
	waitbutton
	closetext
	end
.Tiffany:
	farwritetext TiffanyPhoneFullText
	waitbutton
	closetext
	end
.Erin:
	farwritetext ErinPhoneFullText
	waitbutton
	closetext
	end

RematchFScript:
	checkcode VAR_CALLERID

.Beth:
	farwritetext BethRematchText
	waitbutton
	closetext
	end
.Reena:
	farwritetext ReenaRematchText
	waitbutton
	closetext
	end
.Liz:
	farwritetext LizRematchText
	waitbutton
	closetext
	end
.Gina:
	farwritetext GinaRematchText
	waitbutton
	closetext
	end
.Dana:
	farwritetext DanaRematchText
	waitbutton
	closetext
	end
.Tiffany:
	farwritetext TiffanyRematchText
	waitbutton
	closetext
	end
.Erin:
	farwritetext ErinRematchText
	waitbutton
	closetext
	end

GiftFScript:
	checkcode VAR_CALLERID

.Beverly:
	farwritetext BeverlyGiftText
	buttonsound
	end
.Gina:
	farwritetext GinaGiftText
	buttonsound
	end
.Dana:
	farwritetext DanaGiftText
	buttonsound
	end
.Tiffany:
	farwritetext TiffanyGiftText
	buttonsound
	end

PackFullFScript:
	checkcode VAR_CALLERID

.Beverly:
	farwritetext BeverlyPackFullText
	waitbutton
	closetext
	end
.Gina:
	farwritetext GinaPackFullText
	waitbutton
	closetext
	end
.Dana:
	farwritetext DanaPackFullText
	waitbutton
	closetext
	end
.Tiffany:
	farwritetext TiffanyPackFullText
	waitbutton
	closetext
	end
.Erin:
	farwritetext ErinPackFullText
	waitbutton
	closetext
	end

RematchGiftFScript:
	checkcode VAR_CALLERID

.Erin:
	opentext
	farwritetext ErinRematchGiftText
	buttonsound
	end

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

Movement_ContestResults_WalkAfterWarp:
	step DOWN
	step DOWN
	turn_head RIGHT
	step_resume

Movement_SafariZone_Leave:
	step DOWN
	step_resume
