	const_def 2 ; object constants
	const COASTAL_LAB_MAPLE
	const COASTAL_LAB_AIDE
	const COASTAL_LAB_UNOWN
	const COASTAL_LAB_BALL1
	const COASTAL_LAB_BALL2
	const COASTAL_LAB_BALL3
	const COASTAL_LAB_BOOK

CoastalLab_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ProfessorMapleSrScript:
	faceplayer
	opentext
	checkevent EVENT_MET_PROF_MAPLE_SR
	iftrue .AlreadyIntroduced
	writetext ProfessorMapleSrIntroductionText
	waitbutton
	setevent EVENT_MET_PROF_MAPLE_SR
.AlreadyIntroduced
	writetext ProfessorMapleSrAfterText
	waitbutton
	closetext
	turnobject LAST_TALKED, UP
	end

ProfessorMapleSrAideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_ANCIENT_TOME
	iftrue .GotAncientTome
	checkevent EVENT_MET_UNOWN_MANIAC
	iffalse .NotMet
	checkflag ENGINE_UNOWN_DEX
	iftrue .AlreadyShown
	writebyte UNOWN
	special FindPartyMonThatSpecies
	iftrue .ShowUnown
.NotMet
	writetext ProfessorMapleSrAdieText
	waitbutton
	closetext
	setevent EVENT_MET_UNOWN_MANIAC
	turnobject LAST_TALKED, DOWN
	end

.ShowUnown:
	writetext ProfessorMapleSrAdieShowUnown
	waitbutton
	closetext
	applymovement PLAYER, CoastalLabPlayerStepBack
	playsound SFX_BALL_POOF
	pause 2
	moveobject COASTAL_LAB_UNOWN, 6, 2
	appear COASTAL_LAB_UNOWN
	showemote EMOTE_SHOCK, COASTAL_LAB_AIDE, 15
	applymovement COASTAL_LAB_AIDE, CoastalLabAideBlownBack
	opentext
	writetext ProfessorMapleSrAideSurprisedText
	waitbutton
	closetext
	applymovement COASTAL_LAB_AIDE, CoastalLabAideStepForward
	opentext
	writetext ProfessorMapleSrAideUpgradePokedexText
	waitbutton
	closetext
	playsound SFX_BALL_POOF
	disappear COASTAL_LAB_UNOWN
	waitsfx
	applymovement PLAYER, CoastalLabPlayerStepForward
	opentext
	writetext ProfessorMapleSrAideHandOverPokedex
	waitbutton
	closetext
	turnobject COASTAL_LAB_AIDE, DOWN
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject COASTAL_LAB_AIDE, LEFT
	opentext
	writetext ProfessorMapleSrAdieAfterUpgradeText
	waitbutton
	setflag ENGINE_UNOWN_DEX
	setevent EVENT_SHOWED_UNOWN_MANIAC_UNOWN
.AlreadyShown
	checkevent EVENT_DECO_UNOWN_DOLL
	iftrue .CheckAllUnown
	checkcode VAR_UNOWNCOUNT
	ifgreater 12, .GiveUnownDoll
.CheckAllUnown
	checkcode VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .AllUnown
	writetext ProfessorMapleSrAdieAfterUpgradeText2
	waitbutton
	closetext
	applymovement COASTAL_LAB_AIDE, CoastalLabAideStepResume
	end

.GiveUnownDoll
	writetext ProfessorMapleSrAideHalfUnownText
	waitbutton
	setevent EVENT_DECO_UNOWN_DOLL
	writetext ProfessorMapleSrAideGiveUnownDollText
	playsound SFX_LEVEL_UP
	waitsfx
	writetext ProfessorMapleSrAideSentUnownDollHomeText
	waitbutton
	checkcode VAR_UNOWNCOUNT
	ifless NUM_UNOWN, .CheckAllUnown
	writetext ProfessorMapleSrAideCheckAllUnown
	waitbutton

.AllUnown
	writetext ProfessorMapleSrAideAllUnownText
	waitbutton
	verbosegiveitem ANCIENT_TOME
	setevent EVENT_GOT_ANCIENT_TOME
.GotAncientTome
	writetext ProfessorMapleSrAideAfterAncientTomeText
	waitbutton
	closetext
	applymovement COASTAL_LAB_AIDE, CoastalLabAideStepResume
	end

CoastalLabBirdsBook:
	checkevent EVENT_MET_PROF_MAPLE_SR
	iffalse CoastalLabDifficultBook
	opentext
	writetext CoastalLabBirdsBookText
	yesorno
	iffalse .No
	writetext CoastalLabArticunoBookText
	yesorno
	iffalse .No
	writetext CoastalLabZapdosBookText
	yesorno
	iffalse .No
	writetext CoastalLabMoltresBookText
	waitbutton
.No
	closetext
	end

CoastalLabBeastsBook:
	checkevent EVENT_MET_PROF_MAPLE_SR
	iffalse CoastalLabDifficultBook
	opentext
	writetext CoastalLabBeastsBookText
	yesorno
	iffalse .No
	writetext CoastalLabRaikouBookText
	yesorno
	iffalse .No
	writetext CoastalLabEnteiBookText
	yesorno
	iffalse .No
	writetext CoastalLabSuicuneBookText
	waitbutton
.No
	closetext
	end

CoastalLabLugiaHoOhBook:
	checkevent EVENT_MET_PROF_MAPLE_SR
	iffalse CoastalLabDifficultBook
	opentext
	writetext CoastalLabLugiaHoOhBookText
	yesorno
	iffalse .No
	writetext CoastalLabLugiaBookText
	yesorno
	iffalse .No
	writetext CoastalLabHoOhBookText
	waitbutton
.No
	closetext
	end

CoastalLabSketchbook:
	opentext
	writetext CoastalLabBirdSketchbookText
.Loop:
	loadmenu .SketchbookMenuHeader
	sketchbookmenu
	closewindow
	ifequal 1, .Articuno
	ifequal 2, .Zapdos
	ifequal 3, .Moltres
	ifequal 4, .Raikou
	ifequal 5, .Entei
	ifequal 6, .Suicune
	writetext CoastalLabSketchbookCloseText
	waitbutton
	closetext
	end

.Articuno
	refreshscreen
	trainerpic GEN_1_ARTICUNO
	waitbutton
	closetext
	writebyte ARTICUNO
	special SetSeenMon
	opentext
	writetext CoastalLabSketchbookLabeledText
	jump .Loop

.Zapdos
	refreshscreen
	trainerpic GEN_1_ZAPDOS
	waitbutton
	closetext
	writebyte ZAPDOS
	special SetSeenMon
	opentext
	writetext CoastalLabSketchbookLabeledText
	jump .Loop

.Moltres
	refreshscreen
	trainerpic GEN_1_MOLTRES
	waitbutton
	closetext
	writebyte MOLTRES
	special SetSeenMon
	opentext
	writetext CoastalLabSketchbookLabeledText
	jump .Loop

.Raikou
	refreshscreen
	trainerpic SW97_RAIKOU
	waitbutton
	closetext
	opentext
	writetext CoastalLabSketchbookLabeledText
	jump .Loop

.Entei
	refreshscreen
	trainerpic SW97_ENTEI
	waitbutton
	closetext
	opentext
	writetext CoastalLabSketchbookLabeledText
	jump .Loop

.Suicune
	refreshscreen
	trainerpic SW97_SUICUNE
	waitbutton
	closetext
	opentext
	writetext CoastalLabSketchbookLabeledText
	jump .Loop

.SketchbookMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 17, 12
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING | STATICMENU_WRAP ; flags
	db 6 ; items
	db "FROZEN WING@"
	db "THUNDER BEAK@"
	db "BURNING FEATHER@"
	db "LIGHTNING QUILL@"
	db "MAGMA STEP@"
	db "LIQUID MANE@"

CoastalLabUnownBook:
	checkevent EVENT_MET_UNOWN_MANIAC
	iffalse IllegibleUnownBook
	jumptext CoastalLabUnownBookText

CoastalLabDifficultBook:
	jumptext CoastalLabDifficultBooksText
	
IllegibleUnownBook:
	jumptext IllegibleUnownBookText

CoastalLabTapeReels:
	jumptext CoastalLabTapeReelsText

CoastalLabOpenWindow:
	jumptext CoastalLabOpenWindowText

CoastalLabPokeBall:
	jumptext CoastalLabPokeBallText
	
CoastalLabPlayerStepBack:
	fix_facing
	step LEFT
	remove_fixed_facing
	step_resume
	
CoastalLabPlayerStepForward:
	step RIGHT
	step_resume
	
CoastalLabAideBlownBack:
	fix_facing
	run_step RIGHT
	remove_fixed_facing
	step_end

CoastalLabAideStepForward:
	step LEFT
	step_end

CoastalLabAideStepResume:
	step_resume

ProfessorMapleSrIntroductionText:
	text "Hello! I am PROF."
	line "MAPLE."

	para "…"

	para "Oh, I get why you"
	line "are giving me that"
	cont "look!"
	
	para "JULIA MAPLE of"
	line "PAVONA VILLAGE is"
	cont "my daughter!"

	para "Ever since she was"
	line "a child, JULIA has"
	cont "dreamed of becom-"
	cont "ing a PROFESSOR"
	cont "just like her old"
	cont "man."
	
	para "Our goals differ"
	line "quite a bit beyond"
	cont "that, mind you."
	
	para "As you may have"
	line "been able to tell,"
	cont "my JULIA wants to"
	cont "introduce young"
	cont "minds to the world"
	cont "of #MON. You"
	cont "must have gotten"
	cont "your first #MON"
	cont "from her!"

	para "Now, I prefer to"
	line "dedicate my stud-"
	cont "ies to LEGENDARY"
	cont "#MON. Creatures"
	cont "some regard as"
	cont "pure myth."

	para "If you would like,"
	line "I would be happy"
	cont "to share my notes"
	cont "with any friend of"
	cont "my daughter!"
	done

ProfessorMapleSrAfterText:
	text "Help yourself to"
	line "any book I own."

	para "I'm sure a trainer"
	line "such as yourself"
	cont "would love to find"
	cont "these extraordin-"
	cont "ary #MON for"
	cont "yourself."
	done

ProfessorMapleSrAdieText:
	text "Have you ever"
	line "heard of UNOWN?"

	para "It's an ancient"
	line "language created"
	cont "long before any"
	cont "of us were born."

	para "I work with PROF."
	line "MAPLE to translate"
	cont "and learn more"
	cont "about it."

	para "The glyphs UNOWN"
	line "uses bear an unca-"
	cont "nny resemblance to"
	cont "the characters we"
	cont "use to write with"
	cont "every day."

	para "Isn't that so int-"
	line "eresting to you?"
	done
	
ProfessorMapleSrAdieShowUnown:
	text "Hello again. Did"
	line "you come to learn"
	cont "more about the"
	cont "UNOWN language?"

	para "Hm? You have some-"
	line "thing for me to"
	cont "see? What is it?"
	done

ProfessorMapleSrAideHandOverPokedex:
	text "<PLAYER> handed"
	line "over the #DEX."
	done

ProfessorMapleSrAideSurprisedText:
	text "WOAH!"
	done

ProfessorMapleSrAideUpgradePokedexText:
	text "No way! UNOWN are"
	line "#MON? I thought"
	cont "they were just an"
	cont "ancient form of"
	cont "writing!"
	
	para "This is amazing!"
	
	para "That gives me an"
	line "idea!"

	para "May I have your"
	line "#DEX for one"
	cont "moment, please?"
	done
	
ProfessorMapleSrAdieAfterUpgradeText:
	text "There. Thank you!"

	para "I have added a new"
	line "program to track"
	cont "the UNOWN you enc-"
	cont "ounter."

	para "I used a program I"
	line "wrote to translate"
	cont "ancient UNOWN"
	cont "writing in order"
	cont "to make this new"
	cont "#DEX mode."
	done

ProfessorMapleSrAdieAfterUpgradeText2:
	text "Please do let me"
	line "know if you manage"
	cont "to find every kind"
	cont "of UNOWN!"

	para "I want to learn"
	line "all I can about"
	cont "those mysterious"
	cont "#MON!"
	done

ProfessorMapleSrAideHalfUnownText:
	text "Wow! You've already"
	line "captured half of"
	cont "the UNOWN forms?"

	para "That's fantastic!"

	para "Oh! By the way."

	para "I've taken up"
	line "sewing in my spare"
	cont "time, and managed"
	cont "to make a DOLL"
	cont "that looks like"
	cont "the UNOWN."

	para "Take a look, I"
	line "think it turned"
	cont "out decently."
	done

ProfessorMapleSrAideGiveUnownDollText:
	text "<PLAYER> received"
	line "the UNOWN DOLL."
	done

ProfessorMapleSrAideSentUnownDollHomeText:
	text "<PLAYER> sent the"
	line "UNOWN DOLL home."
	done

ProfessorMapleSrAideCheckAllUnown:
	text "Huh? You've seen"
	line "even more than"
	cont "half of the UNOWN?"
	done

ProfessorMapleSrAideAllUnownText:
	text "Oh my! Have you"
	line "done it? You have!"

	para "You have cataloged"
	line "every UNOWN form!"

	para "I know I can trust"
	line "you with this now-"

	para "It's an ancient"
	line "book written in"
	cont "UNOWN characters."

	para "I have recently"
	line "finished translat-"
	cont "ing it."

	para "You seem to have"
	line "more experience"
	cont "with UNOWN than I,"
	cont "so please take it."
	done

ProfessorMapleSrAideAfterAncientTomeText:
	text "You have been a"
	line "considerable help"
	cont "to my research."

	para "I am ever-grateful"
	line "to you."
	done

CoastalLabDifficultBooksText:
	text "There are so many"
	line "difficult books"
	cont "about #MON."
	done
	
CoastalLabUnownBookText:
	text "This book is full"
	line "of UNOWN writing."
	
	para "Possibly all done"
	line "by hand."
	done
	
IllegibleUnownBookText:
	text "These pages are"
	line "covered in strange"
	cont "symbols."

	para "Its impossible to"
	line "read any of it!"
	done

CoastalLabTapeReelsText:
	text "The PC is connect-"
	line "ed to the machine."

	para "The reels spin"
	line "every once in a"
	cont "while."
	done

CoastalLabOpenWindowText:
	text "The window is"
	line "open."

	para "It's letting in a"
	line "salty sea breeze."
	done

CoastalLabBirdsBookText:
	text "This notebook is"
	line "titled “LEGENDARY"
	cont "BIRDS”…"
	
	para "Open it?"
	done
	
CoastalLabArticunoBookText
	text "ARTICUNO is the"
	line "first of these"
	cont "LEGENDARY BIRD"
	cont "#MON."
	
	para "ARTICUNO sightings"
	line "have historically"
	cont "been associated"
	cont "with a terrible"
	cont "winter."
	
	para "Just the act of"
	line "flapping its wings"
	cont "can cause the moi-"
	cont "sture in the air"
	cont "to freeze and"
	cont "become snow."
	
	para "Continue reading?"
	done
	
CoastalLabZapdosBookText:
	text "Our next subject"
	line "is ZAPDOS."

	para "All reports of"
	line "ZAPDOS sightings"
	cont "have described a"
	cont "sudden and violent"
	cont "thunderstorm out"
	cont "of nowhere moments"
	cont "before its appear-"
	cont "ance."

	para "Could ZAPDOS be"
	line "capable of summon-"
	cont "ing such storms on"
	cont "its own? Or does"
	cont "it simply thrive"
	cont "in such chaos?"

	para "Continue reading?"
	done
	
CoastalLabMoltresBookText:
	text "Rounding out this"
	line "trio of birds, we"
	cont "are left with"
	cont "MOLTRES."

	para "Contrary to the"
	line "myths surrounding"
	cont "ARTICUNO, MOLTRES"
	cont "signifies an early"
	cont "spring."

	para "Its burning wings"
	line "shine with such"
	cont "brilliance that it"
	cont "can turn night"
	cont "into day."

	para "The rest of the"
	line "pages are blank…"
	done

CoastalLabBeastsBookText:
	text "This notebook is"
	line "titled “LEGENDARY"
	cont "BEASTS”…"

	para "Open it?"
	done

CoastalLabRaikouBookText:
	text "RAIKOU is as fast"
	line "as the lightning"
	cont "which trails it."

	para "There are no repo-"
	line "rts of any person"
	cont "capturing RAIKOU"
	cont "on film."
	
	para "Continue reading?"
	done

CoastalLabEnteiBookText:
	text "Born of a volcano,"
	line "ENTEI seems to"
	cont "prefer hotter cli-"
	cont "mates."

	para "Rumors suggest"
	line "ENTEI has a conne-"
	cont "ction with UNOWN,"
	cont "but this cannot be"
	cont "substantiated."

	para "Continue reading?"
	done

CoastalLabSuicuneBookText:
	text "The water in which"
	line "SUICUNE treads is"
	cont "said to become in-"
	cont "stantly purified."

	para "Many people descr-"
	line "ibe close encount-"
	cont "ers with this"
	cont "#MON. Although"
	cont "these are always"
	cont "brief."

	para "The rest of the"
	line "pages are blank…"
	done

CoastalLabLugiaHoOhBookText:
	text "This notebook is"
	line "titled “MASTERS OF"
	cont "THE TRIOS”…"

	para "Open it?"
	done

CoastalLabLugiaBookText:
	text "LUGIA is the guar-"
	line "dian of the sea."

	para "It spends its time"
	line "deep in the ocean,"
	cont "away from people."

	para "It is said that if"
	line "ARTICUNO, ZAPDOS,"
	cont "and MOLTRES are in"
	cont "distress, LUGIA"
	cont "will emerge from"
	cont "the sea and come"
	cont "their aide."

	para "Continue reading?"
	done

CoastalLabHoOhBookText:
	text "HO-OH, the BIRD OF"
	line "CREATION, is known"
	cont "through legend to"
	cont "have resurrected"
	cont "the souls of the"
	cont "LEGENDARY BEAST"
	cont "#MON."

	para "HO-OH must have"
	line "some kind of conn-"
	cont "ection with ENTEI,"
	cont "SUICUNE, and"
	cont "RAIKOU."

	para "The rest of the"
	line "pages are blank…"
	done

CoastalLabBirdSketchbookText:
	text "It's a sketchbook"
	line "titled “WHAT MAY"
	cont "BE - A GUIDE TO"
	cont "#MON MYTHS.”"

	para "There's a table of"
	line "contents."
	done

CoastalLabSketchbookLabeledText:
	text "Continue looking?"
	done

CoastalLabSketchbookCloseText:
	text "There are no words"
	line "written in this"
	cont "book, only"
	cont "sketches that vary"
	cont "in quality."

	para "…Are these even"
	line "real #MON?"
	done

CoastalLabPokeBallText:
	text "Better not touch"
	line "these #BALLs."
	done

CoastalLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, RUGOSA_COAST, 5
	warp_event  5,  7, RUGOSA_COAST, 5

	db 0 ; coord events

	db 6 ; bg events
	bg_event  6,  5, BGEVENT_UP, CoastalLabBirdsBook
	bg_event  7,  5, BGEVENT_UP, CoastalLabBeastsBook
	bg_event  8,  5, BGEVENT_UP, CoastalLabLugiaHoOhBook
	bg_event  6,  1, BGEVENT_UP, CoastalLabUnownBook
	bg_event  2,  1, BGEVENT_UP, CoastalLabTapeReels
	bg_event  5,  0, BGEVENT_UP, CoastalLabOpenWindow

	db 7 ; object events
	object_event  0,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ProfessorMapleSrScript, -1
	object_event  7,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ProfessorMapleSrAideScript, -1
	object_event  -3, -3, SPRITE_UNOWN, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  0,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CoastalLabPokeBall, EVENT_BULBASAUR_POKEBALL_IN_MAPLES_LAB
	object_event  1,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CoastalLabPokeBall, EVENT_CHARMANDER_POKEBALL_IN_MAPLES_LAB
	object_event  2,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CoastalLabPokeBall, EVENT_SQUIRTLE_POKEBALL_IN_MAPLES_LAB
	object_event  4,  1, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CoastalLabSketchbook, -1
