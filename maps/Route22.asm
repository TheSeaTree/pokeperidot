	const_def 2 ; object constants
	const ROUTE22_SUPERNERD1
	const ROUTE22_TRAINER1
	const ROUTE22_TRAINER2
	const ROUTE22_TRAINER3
	const ROUTE22_TRAINER4
	const ROUTE22_COOLTRAINERF1
	const ROUTE22_OFFICER
	const ROUTE22_COOLTRAINERF2
	const ROUTE22_COOLTRAINERM1
	const ROUTE22_MONSTER1
	const ROUTE22_BIRD1
	const ROUTE22_COOLTRAINERF3
	const ROUTE22_COOLTRAINERM2
	const ROUTE22_DRAGON
	const ROUTE22_SLOWPOKE

Route22_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route22OfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_BATTLED_OFFICER_DANIEL
	iftrue .FightDone
	checkevent EVENT_OFFICER_DANIEL_READY
	iftrue .Rematch
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .Waiting
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .Waiting
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iffalse .Waiting
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iffalse .Waiting
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iffalse .Waiting
	writetext Route22OfficerGoodJobText
	waitbutton
	setevent EVENT_OFFICER_DANIEL_READY
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext Route22OfficerChallengeText
.DoBattle
	waitbutton
	closetext
	winlosstext Route22OffficerWinText, 0
	checkevent EVENT_STOLE_TRICK_MIRROR
	iftrue .StoleMirror
	; Make a note of how many Trick Mirrors the player has prior to the battle.
	special CheckStolenTrickMirror
	checkcode VAR_MIRRORS_HELD
	writevarcode VAR_MIRRORS_COMPARE
	loadtrainer OFFICER, DANIEL1
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	ifnotequal $0, .Lost
	jump .AfterBattle
.StoleMirror
	loadtrainer OFFICER, DANIEL2
	startbattle
	reloadmapafterbattle
.AfterBattle
	opentext
	writetext Route22OfficerAfterBattleText
	waitbutton
	closetext
	setflag ENGINE_BATTLED_OFFICER_DANIEL

.CheckStolenMirror
	; Compare the current amount of Trick Mirrors with how many the player had before the battle.
	special CheckStolenTrickMirror
	special CompareTrickMirrors
	iffalse .Nope
 	setevent EVENT_STOLE_TRICK_MIRROR
.Nope
	end

.Rematch
	writetext Route22OfficerAskRematchText
	yesorno
	iffalse .Decline
	playmusic MUSIC_OFFICER_ENCOUNTER
	checkevent EVENT_STOLE_TRICK_MIRROR
	iftrue .Rematch_StolenMirror
	writetext Route22OfficerRematchText
	jump .DoBattle

.Rematch_StolenMirror
	writetext Route22OfficerRematchStolenMirrorText
	jump .DoBattle

.Decline
	writetext Route22OfficerDeclineRematchText
	waitbutton
	closetext
	end

.FightDone:
	writetext Route22OfficerPokemonRestingText
	waitbutton
	closetext
	end

.Waiting:
	writetext Route22OfficerWaitingText
	waitbutton
	closetext
	end

.Lost
	opentext
	writetext Route22OfficerHealPartyText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	jump .CheckStolenMirror

TrainerLassJodie:
	trainer LASS, JODIE, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1, LassJodieText, LassJodieWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext LassJodieAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerMAlbert:
	trainer COOLTRAINERM, ALBERT, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2, CooltrainerMAlbertText, CooltrainerMAlbertWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext CooltrainerMAlbertAfterText
	waitbutton
	closetext
	end

TrainerPokefanFZoey:
	trainer POKEFANF, ZOEY, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3, PokefanFZoeyText, PokefanFZoeyWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PokefanFZoeyAfterText
	waitbutton
	closetext
	end

TrainerPsychicChaz:
	trainer PSYCHIC_T, CHAZ, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4, PsychicChazText, PsychicChazWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PsychiChazAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerFAlice:
	trainer COOLTRAINERF, ALICE, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5, CooltrainerFAliceText, CooltrainerFAliceWinText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext CooltrainerFAliceAfterText
	waitbutton
	closetext
	end

Route22CooltrainerFScript:
	opentext
	writetext Route22CooltrainerFText
	waitbutton
	closetext
	applymovement ROUTE22_MONSTER1, Route22NidoqueenStomping
	cry NIDOQUEEN
	applymovement ROUTE22_MONSTER1, Route22NidoqueenAttack
	playsound SFX_TACKLE
	applymovement ROUTE22_MONSTER1, Route22NidoqueenRecoil
	end

Route22CooltrainerMScript:
	opentext
	writetext Route22CooltrainerMText
	waitbutton
	closetext
	cry FEAROW
	applymovement ROUTE22_BIRD1, Route22FearowAttack
	playsound SFX_TACKLE
	applymovement ROUTE22_BIRD1, Route22FearowRecoil
	end

Route22BeautyScript:
	cry DRAGONITE
	wait 4
	playsound SFX_OUTRAGE
	waitsfx
	applymovement ROUTE22_DRAGON, Route22DragoniteAttack
	playsound SFX_MEGA_PUNCH
	earthquake 4
	applymovement ROUTE22_DRAGON, Route22DragoniteRecoil
	opentext
	writetext Route22BeautyText
	waitbutton
	closetext
	playsound SFX_LICK
	showemote EMOTE_QUESTION, ROUTE22_SLOWPOKE, 15
	wait 6
	cry SLOWKING
	end

Route22FocusedPokemon:
	jumptext Route22FocusedPokemonText

Route22SuperNerd:
	jumptextfaceplayer Route22SuperNerdText

Route22HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_22_HIDDEN_REVIVE

Route22HiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_ROUTE_22_HIDDEN_FULL_RESTORE

Route22HiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_ROUTE_22_HIDDEN_MAX_REVIVE

Route22HiddenPPUp:
	hiddenitem PP_UP, EVENT_ROUTE_22_HIDDEN_PP_UP

Route22HiddenRareCandy1:
	hiddenitem RARE_CANDY, EVENT_ROUTE_22_HIDDEN_RARE_CANDY_1

Route22HiddenRareCandy2:
	hiddenitem RARE_CANDY, EVENT_ROUTE_22_HIDDEN_RARE_CANDY_2

Route22HiddenRareCandy3:
	hiddenitem RARE_CANDY, EVENT_ROUTE_22_HIDDEN_RARE_CANDY_3

Route22NidoqueenStomping:
	turn_step LEFT
	turn_step LEFT
	step_sleep 24
	turn_step LEFT
	turn_step LEFT
	turn_step LEFT
	step_resume

Route22NidoqueenAttack:
	run_step LEFT
	step_resume

Route22NidoqueenRecoil:
	fix_facing
	slow_step RIGHT
	step_resume

Route22FearowAttack:
	fix_facing
	slow_step LEFT
	run_step RIGHT
	run_step RIGHT
	step_resume

Route22FearowRecoil:
	slow_step LEFT
	step_resume

Route22DragoniteAttack:
	run_step UP
	step_resume

Route22DragoniteRecoil:
	fix_facing
	slow_step DOWN
	step_resume

Route22OfficerGoodJobText:
	text "You beat every"
	line "trainer here with-"
	cont "out visiting the"
	cont "nurse?"

	para "That's admirable."
	done

Route22OfficerChallengeText:
	text "I want to see your"
	line "skills in person."
	
	para "Let's battle!"
	done

Route22OffficerWinText:
	text "Where have you"
	line "been training?"

	para "I need to go check"
	line "that place out!"
	done

Route22OfficerAfterBattleText:
	text "You really wiped"
	line "the floor with me."

	para "I don't think I"
	line "can battle any"
	cont "more tonight."
	done

Route22OfficerPokemonRestingText:
	text "It's best I give my"
	line "#MON a break"
	cont "for the rest of"
	cont "the night."

	para "But I'll be here"
	line "tomorrow if you"
	cont "want to do this"
	cont "again."
	done

Route22OfficerWaitingText:
	text "Are you looking"
	line "for a battle?"

	para "I'm sorry, but I"
	line "want to only have"
	cont "battles with the"
	cont "best trainers, so"
	cont "I can improve."

	para "If you can beat"
	line "everyone on this"
	cont "route without"
	cont "leaving to heal,"
	cont "I'll battle you."
	done

Route22OfficerAskRematchText:
	text "Hello again."

	para "It's <PLAYER>,"
	line "right?"

	para "Do you want to"
	line "have another"
	cont "battle with me?"
	done

Route22OfficerRematchText:
	text "It's always a"
	line "pleasure to fight"
	cont "someone strong!"
	done

Route22OfficerRematchStolenMirrorText:
	text "My team has gotten"
	line "a lot better since"
	cont "you stole my TRICK"
	cont "MIRROR!"
	done

Route22OfficerDeclineRematchText:
	text "Alright, but you"
	line "don't have much"
	cont "time if you change"
	cont "your mind."

	para "I have to return"
	line "to my post in the"
	cont "morning."
	done

LassJodieText:
	text "My big sister is"
	line "a COOLTRAINER."

	para "She taught me how"
	line "to make my #MON"
	cont "grow up strong!"
	done

LassJodieWinText:
	text "I'm sorry, big sis."

	para "I'm just not as"
	line "good as you."
	done

LassJodieAfterText:
	text "My #MON are too"
	line "tired for more"
	cont "battles. Maybe we"
	cont "can battle later?"
	done

CooltrainerMAlbertText:
	text "No way you can"
	line "beat my team of"
	cont "rare #MON!"
	done

CooltrainerMAlbertWinText:
	text "No way!"

	para "You beat my team"
	line "of rare #MON…"
	done

CooltrainerMAlbertAfterText:
	text "Just wait until I"
	line "get my #MON"
	cont "healed up."

	para "Oh, you're gonna"
	line "get it bad!"
	done

PokefanFZoeyText:
	text "My #MON have"
	line "won lots of beauty"
	cont "pageants."

	para "Now it's time for"
	line "them to start win-"
	cont "ning battles too!"
	done

PokefanFZoeyWinText:
	text "How dare you!"

	para "I just got done"
	line "brushing RAIGER's"
	cont "fur, and you mess-"
	cont "ed it up!"
	done

PokefanFZoeyAfterText:
	text "Hmph!"

	para "Now I need to go"
	line "to the NURSE."

	para "I will be very"
	line "upset if you made"
	cont "me late to my"
	cont "babies' manicure"
	cont "appointments!"
	done

PsychicChazText:
	text "Hm…"

	para "I'm having trouble"
	line "reading you…"

	para "No matter. My"
	line "#MON will see"
	cont "what I cannot."
	done

PsychicChazWinText:
	text "I will need more"
	line "time to understand"
	cont "how you battle."
	done

PsychiChazAfterText:
	text "I predict that we"
	line "will battle again"
	cont "in the future."

	para "Don't make me a"
	line "liar. I am looking"
	cont "forward to it."
	done

CooltrainerFAliceText:
	text "So many different"
	line "people to battle,"
	cont "and a NURSE nearby"
	cont "to heal afterward."

	para "Isn't this place"
	line "paradise?"
	done

CooltrainerFAliceWinText:
	text "It's no longer"
	line "paradise when I"
	cont "lose!"
	done

CooltrainerFAliceAfterText:
	text "Have you tried out"
	line "the TRAINER HOUSE?"

	para "It's expensive, but"
	line "you meet a lot of"
	cont "strong trainers"
	cont "there too."

	para "…Plus, it would"
	line "let me build up"
	cont "my win streak once"
	cont "again."
	done

Route22OfficerHealPartyText:
	text "Hey, your #MON"
	line "don't look so good."

	para "Here, let me help"
	line "you out."
	done

Route22OfficerAfterHealPartyText:
	text "You put up a good"
	line "fight. Let's try"
	cont "that again some-"
	cont "time."
	done

Route22CooltrainerFText:
	text "C'mon NIDOQUEEN!"
	
	para "Let's show this"
	line "guy that we're not"
	cont "scared of his"
	cont "FLYING-types!"
	done

Route22CooltrainerMText:
	text "Ha! I have the"
	line "type advantage in"
	cont "this fight!"

	para "FEAROW! Let's"
	line "finish this!"
	done

Route22BeautyText:
	text "Your OUTRAGE won't"
	line "hurt my SLOWKING!"

	para "SLOWKING! Use"
	line "AMNESIA again!"
	done

Route22FocusedPokemonText:
	text "The #MON are"
	line "too focused on the"
	cont "battle to notice"
	cont "anyone else."
	done

Route22SuperNerdText:
	text "Don't you think the"
	line "nurse in the gate"
	cont "is kinda cute?"

	para "Something about"
	line "her is… different."

	para "I want to talk to"
	line "her, but she is"
	cont "always so busy"
	cont "healing everyone's"
	cont "#MON."
	done

Route22_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  4, 34, ROUTE_22_GATE, 3
	warp_event  4, 35, ROUTE_22_GATE, 4
	warp_event 31, 43, ROUTE_21_GATE, 1
	warp_event 32, 43, ROUTE_21_GATE, 2
	warp_event 33, 30, ROUTE_23_GATE, 1
	warp_event 33, 31, ROUTE_23_GATE, 2
	warp_event  5,  1, DEVELOPERS_HOUSE, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event  3, 28, BGEVENT_ITEM, Route22HiddenRevive
	bg_event  5, 39, BGEVENT_ITEM, Route22HiddenFullRestore
	bg_event 20, 37, BGEVENT_ITEM, Route22HiddenMaxRevive
	bg_event 36, 40, BGEVENT_ITEM, Route22HiddenPPUp
	bg_event 18,  1, BGEVENT_ITEM, Route22HiddenRareCandy1
	bg_event 17,  3, BGEVENT_ITEM, Route22HiddenRareCandy2
	bg_event 19,  2, BGEVENT_ITEM, Route22HiddenRareCandy3

	db 15 ; object events
	object_event  7, 33, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route22SuperNerd, -1
	object_event  6, 29, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerLassJodie, -1
	object_event 17, 39, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerCooltrainerMAlbert, -1
	object_event  7, 39, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 0, TrainerPokefanFZoey, -1
	object_event 24, 39, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 0, TrainerPsychicChaz, -1
	object_event 26, 35, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerCooltrainerFAlice, -1
	object_event 20, 41, SPRITE_OFFICER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, Route22OfficerScript, -1
	object_event 32, 37, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route22CooltrainerFScript, EVENT_BEAT_ELITE_FOUR
	object_event 29, 37, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route22CooltrainerMScript, EVENT_BEAT_ELITE_FOUR
	object_event 31, 37, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route22FocusedPokemon, EVENT_BEAT_ELITE_FOUR
	object_event 30, 37, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route22FocusedPokemon, EVENT_BEAT_ELITE_FOUR
	object_event 15, 28, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route22BeautyScript, EVENT_BEAT_ELITE_FOUR
	object_event 15, 31, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_ELITE_FOUR
	object_event 15, 30, SPRITE_DRAGON, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route22FocusedPokemon, EVENT_BEAT_ELITE_FOUR
	object_event 15, 29, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route22FocusedPokemon, EVENT_BEAT_ELITE_FOUR
