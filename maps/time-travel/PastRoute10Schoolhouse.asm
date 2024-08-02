	const_def 2 ; object constants

PastRoute10Schoolhouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PastRoute10SchoolhouseTeacher:
	faceplayer
	opentext
	checkevent EVENT_DEFEATED_SCHOOLHOUSE_TEACHER
	iftrue .After
	checkevent EVENT_INTRODUCED_SCHOOLHOUSE_TEACHER
	iftrue .Battle
	writetext PastRoute10SchoolhouseTeacherIntroText
	setevent EVENT_INTRODUCED_SCHOOLHOUSE_TEACHER
	waitbutton
.Battle
	checkevent EVENT_BEAT_SCHOOLBOY_PATRICK
	iffalse .Introduced
	checkevent EVENT_BEAT_LASS_JEAN
	iffalse .Introduced
	checkevent EVENT_BEAT_BUG_CATCHER_TONY
	iffalse .Introduced
	checkevent EVENT_BEAT_COOLTRAINERM_MITCH
	iffalse .Introduced
	checkevent EVENT_BEAT_PICNICKER_GIA
	iffalse .Introduced
	checkevent EVENT_BEAT_COOLTRAINERF_HANNAH
	iffalse .Introduced
	writetext PastRoute10SchoolhouseTeacherChallengeText
	waitbutton
	winlosstext PastRoute10SchoolhouseTeacherWinText, 0
	loadtrainer TEACHERM, MASON
	startbattle
	reloadmapafterbattle
	opentext
	writetext PastRoute10SchoolhouseTeacherGiveHomeworkText
	yesorno
	iffalse .Decline
.Accept
	writetext PastRoute10SchoolhouseTeacherAcceptText
	waitbutton
	setevent EVENT_DEFEATED_SCHOOLHOUSE_TEACHER
	verbosegiveitem SCHOOLWORK
	closetext
	end

.Decline
	writetext PastRoute10SchoolhouseTeacherDeclineText
	yesorno
	iftrue .Accept
	jump .Decline

.After
	checkevent EVENT_HIDE_MAPLES_MOTHER
	iftrue .Delivered
	writetext PastRoute10SchoolhouseTeacherAwaitingDeliveryText
	waitbutton
	closetext
	end

.Delivered
	writetext PastRoute10SchoolhouseTeacherAfterText
	waitbutton
	closetext
	end

.Introduced
	writetext PastRoute10SchoolhouseTeacherWaitingText
	waitbutton
	closetext
	end

PastRoute10SchoolhouseTeacherAfterHours:
	jumptextfaceplayer PastRoute10SchoolhouseTeacherAfterHoursText

TrainerSchoolboyPatrick:
	checkevent EVENT_BEAT_SCHOOLBOY_PATRICK
	iftrue .AfterBattle
	checkevent EVENT_INTRODUCED_SCHOOLHOUSE_TEACHER
	iftrue .DoBattle
	jumptextfaceplayer TrainerSchoolboyPatrickText
.DoBattle
	faceplayer
	opentext
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	writetext TrainerSchoolboyPatrickBattleText
	waitbutton
	closetext
	winlosstext TrainerSchoolboyPatrickWinText, 0
	loadtrainer SCHOOLBOY, PATRICK
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SCHOOLBOY_PATRICK
	end

.AfterBattle
	jumptextfaceplayer TrainerSchoolboyPatrickAfterText

TrainerLassJean:
	checkevent EVENT_BEAT_LASS_JEAN
	iftrue .AfterBattle
	checkevent EVENT_INTRODUCED_SCHOOLHOUSE_TEACHER
	iftrue .DoBattle
	jumptextfaceplayer TrainerLassJeanText
.DoBattle
	faceplayer
	opentext
	playmusic MUSIC_LASS_ENCOUNTER
	writetext TrainerLassJeanBattleText
	waitbutton
	closetext
	winlosstext TrainerLassJeanWinText, 0
	loadtrainer LASS, JEAN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LASS_JEAN
	end

.AfterBattle
	jumptextfaceplayer TrainerLassJeanAfterText

TrainerBugCatcherTony:
	checkevent EVENT_BEAT_BUG_CATCHER_TONY
	iftrue .AfterBattle
	checkevent EVENT_INTRODUCED_SCHOOLHOUSE_TEACHER
	iftrue .DoBattle
	jumptextfaceplayer TrainerBugCatcherTonyText
.DoBattle
	faceplayer
	opentext
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	writetext TrainerBugCatcherTonyBattleText
	waitbutton
	closetext
	winlosstext TrainerBugCatcherTonyWinText, 0
	loadtrainer BUG_CATCHER, TONY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BUG_CATCHER_TONY
	end

.AfterBattle
	jumptextfaceplayer TrainerBugCatcherTonyAfterText

TrainerCooltrainerMMitch:
	checkevent EVENT_BEAT_COOLTRAINERM_MITCH
	iftrue .AfterBattle
	checkevent EVENT_INTRODUCED_SCHOOLHOUSE_TEACHER
	iftrue .DoBattle
	jumptextfaceplayer TrainerCooltrainerMMitchText
.DoBattle
	faceplayer
	opentext
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext TrainerCooltrainenrMMitchBattleText
	waitbutton
	closetext
	winlosstext TrainerCooltrainerMMitchWinText, 0
	loadtrainer COOLTRAINERM, MITCH
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_MITCH
	end

.AfterBattle
	jumptextfaceplayer TrainerCooltrainenrMMitchAfterText

TrainerPicnickerGia:
	checkevent EVENT_BEAT_PICNICKER_GIA
	iftrue .AfterBattle
	checkevent EVENT_INTRODUCED_SCHOOLHOUSE_TEACHER
	iftrue .DoBattle
	jumptextfaceplayer TrainerPicnickerGiaText
.DoBattle
	faceplayer
	opentext
	playmusic MUSIC_LASS_ENCOUNTER
	writetext TrainerPicnickerGiaBattleText
	waitbutton
	closetext
	winlosstext TrainerPicnickerGiaWinText, 0
	loadtrainer PICNICKER, GIA
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PICNICKER_GIA
	end

.AfterBattle
	jumptextfaceplayer TrainerPicnickerGiaAfterText

TrainerCooltrainerFHannah:
	checkevent EVENT_BEAT_COOLTRAINERF_HANNAH
	iftrue .AfterBattle
	checkevent EVENT_INTRODUCED_SCHOOLHOUSE_TEACHER
	iftrue .DoBattle
	jumptextfaceplayer TrainerCooltrainerFHannaText
.DoBattle
	faceplayer
	opentext
	playmusic MUSIC_BEAUTY_ENCOUNTER
	writetext TrainerCooltrainerFHannaText
	waitbutton
	closetext
	winlosstext TrainerCooltrainerFHannaWinText, 0
	loadtrainer COOLTRAINERF, HANNAH
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERF_HANNAH
	end

.AfterBattle
	jumptextfaceplayer TrainerCooltrainenrFHannaAfterText

PastRoute10SchoolhouseTwin:
	jumptextfaceplayer PastRoute10SchoolhouseTwinText

PastRoute10SchoolhouseEmptyDesk:
	jumptext PastRoute10SchoolhouseEmptyDeskText

PastRoute10SchoolhouseTidyDesk:
	jumptext PastRoute10SchoolhouseTidyDeskText

PastRoute10SchoolhouseChalkboard:
	jumptext PastRoute10SchoolhouseChalkboardText

PastRoute10SchoolhouseTeacherIntroText:
	text "Welcome to my"
	line "classroom."

	para "I teach #MON"
	line "battle theory."

	para "There is an empty"
	line "desk if you would"
	cont "like to sit in on"
	cont "my lecture."
	done

PastRoute10SchoolhouseTeacherWaitingText:
	text "You look like you"
	line "train #MON."

	para "You're perfect to"
	line "test how much my"
	cont "students have"
	cont "learned from me!"
	done

PastRoute10SchoolhouseTeacherChallengeText:
	text "Oh my! You've won"
	line "against all of my"
	cont "students!"
	done

PastRoute10SchoolhouseTeacherWinText:
	text "Is every trainer"
	line "from your hometown"
	cont "as strong as you?"

	para "We have so much to"
	line "learn, class!"
	done

PastRoute10SchoolhouseTeacherGiveHomeworkText:
	text "Could I ask a"
	line "a favor of you?"

	para "I have a student"
	line "who hasn't been in"
	cont "class for quite"
	cont "some time now."

	para "Could you deliver"
	line "some of her missed"
	cont "SCHOOLWORK to her"
	cont "for me?"

	para "I'd do it myself,"
	line "but I am too busy"
	cont "after class to"
	cont "travel all the way"
	cont "to PAVONA VILLAGE."
	done

PastRoute10SchoolhouseTeacherAcceptText:
	text "Great! Thank you!"

	para "I have her missed"
	line "assignments set"
	cont "aside right here."
	done

PastRoute10SchoolhouseTeacherDeclineText:
	text "…You won't?"

	para "I have much to do"
	line "after class, I"
	cont "can't possibly make"
	cont "it to PAVONA"
	cont "VILLAGE before it"
	cont "gets dark."

	para "Please reconsider?"
	done

PastRoute10SchoolhouseTeacherAwaitingDeliveryText:
	text "That SCHOOLWORK is"
	line "for a student of"
	cont "mine living in"
	cont "PAVONA VILLAGE."

	para "Please deliver it"
	line "to her on my be-"
	cont "half."
	done

PastRoute10SchoolhouseTeacherAfterText:
	text "If you wanted to"
	line "stop by more often"
	cont "and give lessons"
	cont "on battling, you're"
	cont "more than welcome!"
	done

PastRoute10SchoolhouseTeacherAfterHoursText:
	text "I'm sorry, but"
	line "class is not in"
	cont "session right now."

	para "Please come back"
	line "in the morning."
	done

TrainerSchoolboyPatrickText:
	text "Some day I'll beat"
	line "the TEACHER in a"
	cont "#MON battle!"
	done

TrainerSchoolboyPatrickBattleText:
	text "My big brother"
	line "traded me some"
	cont "rare #MON from"
	cont "far away!"
	done

TrainerSchoolboyPatrickWinText:
	text "Mr. MASON!"
	line "Don't look!"
	done

TrainerSchoolboyPatrickAfterText:
	text "My brother told me"
	line "these #MON were"
	cont "really strong."

	para "I must need to"
	line "train them more!"
	done

TrainerLassJeanText:
	text "Battle ability is"
	line "not the only thing"
	cont "that matters."

	para "I want my #MON"
	line "to look as good"
	cont "as they battle."
	done

TrainerLassJeanBattleText:
	text "I will have the"
	line "strongest and"
	cont "most beautiful"
	cont "#MON around!"
	done

TrainerLassJeanWinText:
	text "Well my #MON"
	line "still look way"
	cont "better than yours."
	done

TrainerLassJeanAfterText:
	text "I haven't put in"
	line "enough effort to"
	cont "make my star"
	cont "#MON shine."
	done

TrainerBugCatcherTonyText:
	text "Unlike the rest of"
	line "the kids here, I"
	cont "want to specialize"
	cont "in one type."
	done

TrainerBugCatcherTonyBattleText:
	text "Come on, team!"

	para "Let's show the new"
	line "kid what a good"
	cont "BUG-type can do!"
	done

TrainerBugCatcherTonyWinText:
	text "I couldn't get by" 
	line "with one type!"
	done

TrainerBugCatcherTonyAfterText:
	text "TEACHER was right."

	para "I need many kinds"
	line "of #MON to"
	cont "handle whatever we"
	cont "are faced against."
	done

TrainerCooltrainerMMitchText:
	text "I find it very"
	line "interesting to"
	cont "learn how each"
	cont "#MON evolves."
	done

TrainerCooltrainenrMMitchBattleText:
	text "I've searched for"
	line "STONEs to make my"
	cont "#MON as strong"
	cont "as they can be!"
	done

TrainerCooltrainerMMitchWinText:
	text "I was too hasty…"
	done

TrainerCooltrainenrMMitchAfterText:
	text "My #MON must"
	line "learn how to use"
	cont "better moves to"
	cont "make use of their"
	cont "inherent strength."
	done

TrainerPicnickerGiaText:
	text "I wish we could"
	line "outdoor classes."

	para "It would feel so"
	line "much nicer to"
	cont "learn while out in"
	cont "the sun."
	done

TrainerPicnickerGiaBattleText:
	text "I love to spend"
	line "time outside, but"
	cont "it's important to"
	cont "study in class as"
	cont "much as I do out"
	cont "in the field."
	done

TrainerPicnickerGiaWinText:
	text "I was out of my"
	line "element!"
	done

TrainerPicnickerGiaAfterText:
	text "I'll need to spend"
	line "even more time"
	cont "studying if I want"
	cont "to improve!"
	done

TrainerCooltrainerFHannaText:
	text "In my free time,"
	line "I look for #MON"
	cont "anywhere I can"
	cont "find them."

	para "I even use special"
	line "moves to discover"
	cont "where they might"
	cont "be hiding!"
	done

TrainerCooltrainenrFHannaBattleText:
	text "Can you even match"
	line "the variety of"
	cont "#MON I have?"
	done

TrainerCooltrainerFHannaWinText:
	text "Wow! You came"
	line "prepared!"
	done

TrainerCooltrainenrFHannaAfterText:
	text "I'll need to look"
	line "harder to find"
	cont "the most rare and"
	cont "powerful #MON."
	done

PastRoute10SchoolhouseTwinText:
	text "I don't have any"
	line "#MON, but I"
	cont "want to be ready"
	cont "to battle when I'm"
	cont "old enough!"
	done

PastRoute10SchoolhouseEmptyDeskText:
	text "There are lots of"
	line "papers left inside"
	cont "this desk."
	done

PastRoute10SchoolhouseTidyDeskText:
	text "The inside of this"
	line "desk is very neat"
	cont "and tidy."
	done

PastRoute10SchoolhouseChalkboardText:
	text "The board is full"
	line "of battle theory"
	cont "and charts."
	done

PastRoute10Schoolhouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  9, PAST_ROUTE_10, 1
	warp_event  6,  9, PAST_ROUTE_10, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6,  6, BGEVENT_UP, PastRoute10SchoolhouseEmptyDesk
	bg_event  6,  0, BGEVENT_UP, PastRoute10SchoolhouseChalkboard
	bg_event  5,  0, BGEVENT_UP, PastRoute10SchoolhouseChalkboard

	db 8 ; object events
	object_event  5,  3, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, 0, 0, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PastRoute10SchoolhouseTeacher, -1
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, 0, 0, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerSchoolboyPatrick, -1
	object_event  2,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, 0, 0, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerLassJean, -1
	object_event  8,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, 0, 0, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TrainerBugCatcherTony, -1
	object_event  4,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, 0, 0, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PastRoute10SchoolhouseTwin, -1
	object_event  2,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, 0, 0, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerCooltrainerMMitch, -1
	object_event  8,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, 0, 0, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerPicnickerGia, -1
	object_event  6,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, 0, 0, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerCooltrainerFHannah, -1
