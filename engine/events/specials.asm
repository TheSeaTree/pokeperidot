Special::
; Run script special de.
	ld hl, SpecialsPointers
	add hl, de
	add hl, de
	add hl, de
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	rst FarCall
	ret

INCLUDE "data/special_pointers.asm"

SetPlayerPalette:
	ld a, [wScriptVar]
	ld d, a
	farcall _SetPlayerPalette
	ret

GameCornerPrizeMonCheckDex:
	ld a, [wScriptVar]
	dec a
	call CheckCaughtMon
	ret nz
	ld a, [wScriptVar]
	dec a
	call SetSeenAndCaughtMon
	call FadeToMenu
	ld a, [wScriptVar]
	ld [wNamedObjectIndexBuffer], a
	farcall NewPokedexEntry
	call ExitAllMenus
	ret

SetSeenMon:
	ld a, [wScriptVar]
	dec a
	call _SetSeenMon
	ret

CheckOwnedMon:
	ld a, [wScriptVar]
	dec a
	call CheckCaughtMon
	jr z, FoundNone
	jr FoundOne

FindPartyMonAboveLevel:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonAboveLevel
	jr z, FoundNone
	jr FoundOne

FindPartyMonAtLeastThatHappy:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonAtLeastThatHappy
	jr z, FoundNone
	jr FoundOne

FindPartyMonThatSpecies:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonThatSpecies
	jr z, FoundNone
	jr FoundOne

FindPartyMonThatSpeciesYourTrainerID:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonThatSpeciesYourTrainerID
	jr z, FoundNone
	jr FoundOne

FoundOne:
	ld a, TRUE
	ld [wScriptVar], a
	ret

FoundNone:
	xor a
	ld [wScriptVar], a
	ret

NameRival:
	ld b, NAME_RIVAL
	ld de, wRivalName
	farcall _NamingScreen
	; default to "MIKE"
	ld hl, wRivalName
	ld de, .default
	call InitName
	ret

.default
	db "MIKE@"

NameRater:
	farcall _NameRater
	ret

OverworldTownMap:
	call FadeToMenu
	farcall _TownMap
	call ExitAllMenus
	ret

OverworldFlyMap:
	call FadeToMenu
	farcall TeleportGuyFunction
	call ExitAllMenus
	ret

UnownPrinter:
	call FadeToMenu
	farcall _UnownPrinter
	call ExitAllMenus
	ret

DisplayLinkRecord:
	call FadeToMenu
	farcall _DisplayLinkRecord
	call ExitAllMenus
	ret

PlayersHousePC:
	xor a
	ld [wScriptVar], a
	farcall _PlayersHousePC
	ld a, c
	ld [wScriptVar], a
	ret

BugContestJudging:
	farcall _BugContestJudging
	ld a, b
	ld [wScriptVar], a
	ret

MapRadio:
	ld a, [wScriptVar]
	ld e, a
	farcall PlayRadio
	ret

UnownPuzzle:
	call FadeToMenu
	farcall _UnownPuzzle
	ld a, [wSolvedUnownPuzzle]
	ld [wScriptVar], a
	call ExitAllMenus
	ret

SlotMachine:
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_SlotMachine)
	ld hl, _SlotMachine
	call StartGameCornerGame
	ret

CardFlip:
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_CardFlip)
	ld hl, _CardFlip
	call StartGameCornerGame
	ret

DummyNonfunctionalGameCornerGame:
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_DummyGame)
	ld hl, _DummyGame
	call StartGameCornerGame
	ret

StartGameCornerGame:
	call FarQueueScript
	call FadeToMenu
	ld hl, wQueuedScriptBank
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	rst FarCall
	call ExitAllMenus
	ret

CheckCoinsAndCoinCase:
	ld hl, wCoins
	ld a, [hli]
	or [hl]
	jr z, .no_coins
	ld a, COIN_CASE
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	jr nc, .no_coin_case
	and a
	ret

.no_coins
	ld hl, .NoCoinsText
	jr .print

.no_coin_case
	ld hl, .NoCoinCaseText

.print
	call PrintText
	scf
	ret

.NoCoinsText:
	; You have no coins.
	text_far UnknownText_0x1bd3d7
	text_end

.NoCoinCaseText:
	; You don't have a COIN CASE.
	text_far UnknownText_0x1bd3eb
	text_end

ClearBGPalettesBufferScreen:
	call ClearBGPalettes
	call BufferScreen
	ret

ScriptReturnCarry:
	jr c, .carry
	xor a
	ld [wScriptVar], a
	ret
.carry
	ld a, 1
	ld [wScriptVar], a
	ret

UnusedCheckUnusedTwoDayTimer:
	farcall CheckUnusedTwoDayTimer
	ld a, [wUnusedTwoDayTimer]
	ld [wScriptVar], a
	ret

ActivateFishingSwarm:
	ld a, [wScriptVar]
	ld [wFishingSwarmFlag], a
	ret

StoreSwarmMapIndices::
	ld a, c
	and a
	jr nz, .yanma
; swarm dark cave violet entrance
	ld a, d
	ld [wDunsparceMapGroup], a
	ld a, e
	ld [wDunsparceMapNumber], a
	ret

.yanma
	ld a, d
	ld [wYanmaMapGroup], a
	ld a, e
	ld [wYanmaMapNumber], a
	ret

CheckPokerus:
; Check if a monster in your party has Pokerus
	farcall _CheckPokerus
	jp ScriptReturnCarry

ResetLuckyNumberShowFlag:
	farcall RestartLuckyNumberCountdown
	ld hl, wLuckyNumberShowFlag
	res LUCKYNUMBERSHOW_GAME_OVER_F, [hl]
	farcall LoadOrRegenerateLuckyIDNumber
	ret

CheckLuckyNumberShowFlag:
	farcall _CheckLuckyNumberShowFlag
	jp ScriptReturnCarry

SnorlaxAwake:
; Check if the Poké Flute channel is playing, and if the player is standing
; next to Snorlax.

; outputs:
; wScriptVar is 1 if the conditions are met, otherwise 0.

; check background music
	ld a, [wMapMusic]
	cp MUSIC_POKE_FLUTE_CHANNEL
	jr nz, .nope

	ld a, [wXCoord]
	ld b, a
	ld a, [wYCoord]
	ld c, a

	ld hl, .ProximityCoords
.loop
	ld a, [hli]
	cp -1
	jr z, .nope
	cp b
	jr nz, .nextcoord
	ld a, [hli]
	cp c
	jr nz, .loop

	ld a, TRUE
	jr .done

.nextcoord
	inc hl
	jr .loop

.nope
	xor a
.done
	ld [wScriptVar], a
	ret

.ProximityCoords:
	;   x,  y
	db 33,  8 ; left
	db 34, 10 ; below
	db 35, 10 ; below
	db 36,  8 ; right
	db 36,  9 ; right
	db -1

PlayCurMonCry:
	ld a, [wCurPartySpecies]
	jp PlayMonCry

GameboyCheck:
	ldh a, [hCGB]
	and a
	jr nz, .cgb

	ldh a, [hSGB]
	and a
	jr nz, .sgb

.gb
	xor a ; GBCHECK_GB
	jr .done
.sgb
	ld a, GBCHECK_SGB
	jr .done
.cgb
	ld a, GBCHECK_CGB
.done
	ld [wScriptVar], a
	ret

FadeOutMusic:
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a
	ld a, $2
	ld [wMusicFade], a
	ret

Diploma:
	call FadeToMenu
	farcall _Diploma
	call ExitAllMenus
	ret

PrintDiploma:
	call FadeToMenu
	farcall _PrintDiploma
	call ExitAllMenus
	ret

TrainerHouse:
	ld a, BANK(sMysteryGiftTrainerHouseFlag)
	call GetSRAMBank
	ld a, [sMysteryGiftTrainerHouseFlag]
	ld [wScriptVar], a
	jp CloseSRAM
	
SpecialMoveRelearner:
	farcall MoveRelearner
	ret

SimulationMoveRelearner:
	farcall MoveReminder_Simulation
	ret

SpecialEggTutor:
	farcall EggMoveTutor
	ret

SetFireGymSteps:
	xor a
	ld a, 50
	ld [wFireGymStepsRemaining], a
	ret

RestorePlayerSprite:
; Sometimes the player's sprite will become corrupted on the SS Mako.
; I have never been able to reproduce it and don't know the cause.
; This will fix the player's sprite for each warp.
	ld a, [wPlayerDirection]
	ld [wPrevFacingDirection], a
	farcall SpawnPlayer
	ld a, [wPrevFacingDirection]
	ld [wPlayerDirection], a
	ret

CompareTrickMirrors:
	ld a, [wTrickMirrorCount]
	ld b, a
	ld a, [wTrickMirrorCompare]
	sbc b

	jr nc, .False
	jr z, .False
	ld a, TRUE
	ld [wScriptVar], a
	ret

.False
	ld a, FALSE
	ld [wScriptVar], a
	ret

CheckStolenTrickMirror:
	xor a
	ld a, 1
	ld [wTrickMirrorCount], a

	ld hl, wPartyMon1Item
	ld de, PARTYMON_STRUCT_LENGTH
	ld a, [wPartyCount]
	ld c, a
.loop
	ld a, [hl]
	cp TRICK_MIRROR
	call z, .stolen
	add hl, de
	dec c
	jr nz, .loop
	ld a, FALSE
	ld [wScriptVar], a
	ret

.stolen
	ld a, [wTrickMirrorCount]
	and a
	ret z
	inc a
	ld [wTrickMirrorCount], a
	ret

DropOffParty:
; Mask the whole party by setting the count to 0...
	ld hl, wPartyCount
	ld a, 0
	ld [hli], a
	inc hl
; ... and replacing it with the terminator byte
	ld [hl], -1
	ret

ReloadEmotes:
	farcall RefreshSprites
	ret

StopPlayerRunning:
	ld a, [wPlayerState]
	cp PLAYER_RUN
	ret nz
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
