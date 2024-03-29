emote: MACRO
; graphics pointer, length, starting tile
	dw \1
	db \2 tiles, BANK(\1)
	dw vTiles0 tile \3
ENDM

Emotes:
; entries correspond to EMOTE_* constants
	emote ShockEmote,     4, $f8
	emote QuestionEmote,  4, $f8
	emote HappyEmote,     4, $f8
	emote SadEmote,       4, $f8
	emote HeartEmote,     4, $f8
	emote BoltEmote,      4, $f8
	emote SleepEmote,     4, $f8
	emote FishEmote,      4, $f8
	emote OverworldGFX,   5, $fb
	emote FishingRodGFX,  2, $fc
