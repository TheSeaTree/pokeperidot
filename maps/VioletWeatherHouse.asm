	const_def 2 ; object constants
	const VIOLET_WEATHER_HOUSE_POKEFAN_M
	const VIOLET_WEATHER_HOUSE_POKEFAN_F

VioletWeatherHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletWeatherHousePokefanM:
	opentext
	writetext VioletWeatherHousePokefanMIntroText
	buttonsound
	closetext
	showemote EMOTE_SHOCK, LAST_TALKED, 15
	faceplayer
	opentext
	writetext VioletWeatherHousePokefanMSorryText
	buttonsound
	closetext
	turnobject LAST_TALKED, UP
	opentext
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime NITE
	iftrue .NiteScript

.MornScript:
	writetext VioletWeatherHousePokefanMMorningText
	buttonsound
	jump .Main

.DayScript:
	checkevent EVENT_GOT_TM_SUNNY_DAY
	iftrue .SunnyDay
	writetext VioletWeatherHousePokefanMDayText
	buttonsound
	faceplayer
	writetext TMSunnyDayGift
	buttonsound
	verbosegiveitem TM_SUNNY_DAY
	setevent EVENT_GOT_TM_SUNNY_DAY
	writetext TMSunnyDayExplaination
	buttonsound
	turnobject LAST_TALKED, UP
	jump .Main

.SunnyDay:
	writetext VioletWeatherHousePokefanMSunnyDayText
	buttonsound
	turnobject LAST_TALKED, UP
	jump .Main
	
.NiteScript:
	writetext VioletWeatherHousePokefanMNiteText
	buttonsound
	jump .Main

.Main:
	closetext
	end
	
VioletWeatherHousePokefanF:
	jumptextfaceplayer VioletWeatherHousePokefanFText

VioletWeatherHousePokefanMIntroText:
	text "Ah, yes…"
	
	para "I see…"
	done

VioletWeatherHousePokefanMSorryText:
	text "Oh, I'm so sorry!"
	
	para "I'm checking the"
	line "weather right now."
	done
	
VioletWeatherHousePokefanMMorningText:
	text "Hmm… I see the sun"
	line "rising once again."
	
	para "I thought that it"
	line "was gone for good"
	cont "last night!"
	done

VioletWeatherHousePokefanMDayText:
	text "Let's see…"

	para "The sky's blue…"
	
	para "There's no clouds…"
	
	para "No chance of rain"
	line "at all, so it's a"
	cont "good day for"
	cont "barbecuing."
	done
	
TMSunnyDayGift:
	text "Just in case I'm"
	line "wrong, you should"
	cont "take this."
	done
	
TMSunnyDayExplaination:
	text "That TM is for"
	line "SUNNY DAY."
	
	para "It will let your"
	line "#MON make even"
	cont "the gloomiest day"
	cont "perfect for a"
	cont "barbecue!"
	done
	
VioletWeatherHousePokefanMSunnyDayText:
	text "You might want to"
	line "use SUNNY DAY"
	cont "before trying to"
	cont "have a barbecue"
	cont "today."
	done

VioletWeatherHousePokefanMNiteText:
	text "The sun seemed to"
	line "have completely"
	cont "disappeared!"
	
	para "If only there was"
	line "a way to bring it"
	cont "back."
	done
	
VioletWeatherHousePokefanFText:
	text "My husband is a"
	line "loon, please don't"
	cont "mind him."
	
	para "Sigh…"
	
	para "I really shouldn't"
	line "encourage this"
	cont "behavior."

	para "I don't think"
	line "anyone finds it"
	cont "funny."
	done

VioletWeatherHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VIOLET_CITY, 6
	warp_event  3,  7, VIOLET_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletWeatherHousePokefanM, -1
	object_event  2,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletWeatherHousePokefanF, -1
