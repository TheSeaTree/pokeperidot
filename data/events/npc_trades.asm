npctrade: MACRO
; dialog set, requested mon, offered mon, nickname, dvs, item, OT ID, OT name, gender requested
	db \1, \2, \3, \4, \5, \6, \7
	shift
	dw \7
	db \8, \9, 0
ENDM

NPCTrades:
; entries correspond to NPCTRADE_* constants
	npctrade TRADE_DIALOGSET_COLLECTOR, VENUSAUR,   SQUIRTLE,   "LEONARDO@@@", $79, $99, GOLD_LEAF,    37460, "MIKEY@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, CHARIZARD,  BULBASAUR,  "CABBAGE@@@@", $79, $99, GOLD_LEAF,    48926, "DONNIE@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, BLASTOISE,  CHARMANDER, "MATCHES@@@@", $79, $99, GOLD_LEAF,    51984, "RAPHAEL@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      ELEKID,     MAGBY,      "BAGMOY@@@@@", $77, $77, GOLD_LEAF,    00283, "EMY@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NEWBIE,    EEVEE,      SEARION,    "WOLFGANG@@@", $78, $58, SMOKE_BALL,   23129, "RICHARD@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      CHANSEY,    AERODACTYL, "AEROY@@@@@@", $96, $66, GOLD_BERRY,   26491, "KIM@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, DITTO,      DITTO,      "DIVI@@@@@@@", $FF, $FF, METAL_POWDER, 50082, "IVY@@@@@@@@", TRADE_GENDER_EITHER
