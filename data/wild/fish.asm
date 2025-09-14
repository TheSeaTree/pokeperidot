time_group EQUS "0," ; use the nth TimeFishGroups entry

fishgroup: MACRO
; chance, old rod, good rod, super rod
	dbwww \1, \2, \3, \4
ENDM

FishGroups:
; entries correspond to FISHGROUP_* constants
	fishgroup 50 percent + 1, .Shore_Old,            .Shore_Good,            .Shore_Super
	fishgroup 50 percent + 1, .Ocean_Old,            .Ocean_Good,            .Ocean_Super
	fishgroup 50 percent + 1, .Lake_Old,             .Lake_Good,             .Lake_Super
	fishgroup 50 percent + 1, .Pond_Old,             .Pond_Good,             .Pond_Super
	fishgroup 50 percent + 1, .Dratini_Old,          .Dratini_Good,          .Dratini_Super
	fishgroup 50 percent + 1, .Qwilfish_Swarm_Old,   .Qwilfish_Swarm_Good,   .Qwilfish_Swarm_Super
	fishgroup 50 percent + 1, .Past_Old,   			 .Past_Good,   			 .Past_Super
	fishgroup 50 percent + 1, .Past_2_Old,         	 .Past_2_Good,         	 .Past_2_Super
	fishgroup 50 percent + 1, .Past_3_Old,           .Past_3_Good,        	 .Past_3_Super
	fishgroup 50 percent + 1, .Grimer_Old,     		 .Grimer_Good,     		 .Grimer_Super
	fishgroup 50 percent + 1, .Qwilfish_Old,         .Qwilfish_Good,         .Qwilfish_Super
	fishgroup 50 percent + 1, .Fossil_Old,           .Fossil_Good,           .Fossil_Super
	fishgroup  5 percent + 1, .Qwilfish_NoSwarm_Old, .Qwilfish_NoSwarm_Good, .Qwilfish_NoSwarm_Super

.Shore_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     KRABBY,     10
.Shore_Good:
	db  35 percent,     MAGIKARP,   10
	db  70 percent,     KRABBY,     15
	db  90 percent + 1, HORSEA,     15
	db 100 percent,     time_group 0
.Shore_Super:
	db  40 percent,     KRABBY,     44
	db  70 percent,     time_group 1
	db  90 percent + 1, SEADRA,     46
	db 100 percent,     KINGLER,    50

.Ocean_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     SMOLA,      10
.Ocean_Good:
	db  35 percent,     SHELLDER,   12
	db  70 percent,     SMOLA,	    13
	db  90 percent + 1, SHELLDER,   13
	db 100 percent,     time_group 12
.Ocean_Super:
	db  40 percent,     SHELLDER,   44
	db  80 percent + 1, ANCOR,   	44
	db 100 percent,     SHELLDER, 	45

.Lake_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     GOLDEEN,    10
.Lake_Good:
	db  35 percent,     MAGIKARP,   10
	db  70 percent,     GOLDEEN,    10
	db  90 percent + 1, GOLDEEN,    13
	db 100 percent,     time_group 4
.Lake_Super:
	db  40 percent,     GOLDEEN,     46
	db  70 percent,     time_group 5
	db  95 percent + 1, MAGIKARP,    45
	db 100 percent,     GYARADOS,    47

.Pond_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     POLIWAG,    10
.Pond_Good:
	db  35 percent,     MAGIKARP,   10
	db  70 percent,     POLIWAG,    11
	db  90 percent + 1, POLIWAG,    13
	db 100 percent,     time_group 6
.Pond_Super:
	db  40 percent,     POLIWHIRL,  45
	db  70 percent,     time_group 7
	db  90 percent + 1, MAGIKARP,   45
	db 100 percent,     POLIWHIRL,  47

.Dratini_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Dratini_Good:
	db  35 percent,     MAGIKARP,   32
	db  70 percent,     GYARADOS,   30
	db  90 percent + 1, DRATINI,    28
	db 100 percent,     time_group 8
.Dratini_Super:
	db  40 percent,     MAGIKARP,   45
	db  70 percent,     time_group 9
	db  90 percent + 1, GYARADOS,   43
	db 100 percent,     DRAGONAIR,  45

.Qwilfish_Swarm_Old:
	db  70 percent + 1, MAGIKARP,   5
	db  85 percent + 1, MAGIKARP,   5
	db 100 percent,     QWILFISH,   5
.Qwilfish_Swarm_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     QWILFISH,   20
	db  90 percent + 1, QWILFISH,   20
	db 100 percent,     time_group 10
.Qwilfish_Swarm_Super:
	db  40 percent,     QWILFISH,   40
	db  70 percent,     time_group 11
	db  90 percent + 1, QWILFISH,   40
	db 100 percent,     QWILFISH,   40

.Past_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     GOLDEEN,    10
.Past_Good:
	db  35 percent,     MAGIKARP,   15
	db  70 percent+ 1,  GOLDEEN,    16
	db 100 percent,     POLIWAG,	18
.Past_Super:
	db  40 percent,     GOLDEEN,    18
	db  90 percent + 1, GOLDEEN,    20
	db 100 percent,     SEAKING,    19

.Past_2_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Past_2_Good:
	db  35 percent,     MAGIKARP,   12
	db  70 percent,     POLIWAG,    14
	db  95 percent + 1, POLIWAG,    15
	db 100 percent,     time_group 14
.Past_2_Super:
	db  40 percent,     POLIWAG,    16
	db  70 percent + 1, MAGIKARP,   16
	db  90 percent,     time_group 14
	db 100 percent,     POLIWHIRL,  18

.Past_3_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     GOLDEEN,    10
.Past_3_Good:
	db  35 percent,     MAGIKARP,   15
	db  70 percent,     GOLDEEN,    16
	db  90 percent + 1, GOLDEEN,    15
	db 100 percent,     time_group 16
.Past_3_Super:
	db  40 percent,     GOLDEEN,    18
	db  70 percent,     time_group 8
	db  90 percent + 1, GOLDEEN,    20
	db 100 percent,     SEAKING,    19

.Grimer_Old:
	db  70 percent + 1, GRIMER,   10
	db  85 percent + 1, GRIMER,   10
	db 100 percent,     GRIMER,   10
.Grimer_Good:
	db  70 percent + 1, GRIMER,     20
	db 100 percent, GRIMER,		    20
.Grimer_Super:
	db  90 percent + 1, GRIMER,     45
	db 100 percent,     MUK,        48

.Qwilfish_NoSwarm_Old:
.Qwilfish_Old:
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     TENTACOOL,  10
.Qwilfish_NoSwarm_Good:
	db  50 percent + 1, CLOYSTER,  40
	db 100 percent,     CONCHER,   40
.Qwilfish_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     TENTACOOL,  20
	db  90 percent + 1, TENTACOOL,  20
	db 100 percent,     time_group  20
.Qwilfish_NoSwarm_Super:
.Qwilfish_Super:
	db  50 percent + 1, CLOYSTER,  45
	db 100 percent,     CONCHER,   45

.Fossil_Old:
	db  50 percent + 1, KABUTO,   35
	db 100 percent,     OMANYTE,  35
.Fossil_Good:
	db  50 percent + 1, KABUTO,   35
	db 100 percent,     OMANYTE,  35
.Fossil_Super:
	db  50 percent + 1, KABUTOPS, 45
	db 100 percent,     OMASTAR,  45

TimeFishGroups:
	;  day              nite
	db CORSOLA,    20,  STARYU,     20 ; 0
	db CORSOLA,    46,  STARYU,     44 ; 1
	db SHELLDER,   20,  SHELLDER,   20 ; 2
	db SHELLDER,   40,  SHELLDER,   40 ; 3
	db GOLDEEN,    20,  GOLDEEN,    20 ; 4
	db SEAKING,    45,  SEAKING,    45 ; 5
	db POLIWAG,    20,  POLIWAG,    20 ; 6
	db POLIWAG,    49,  POLIWAG,    49 ; 7
	db DRATINI,    20,  DRATINI,    20 ; 8
	db DRATINI,    46,  DRATINI,    46 ; 9
	db QWILFISH,   20,  QWILFISH,   20 ; 10
	db QWILFISH,   40,  QWILFISH,   40 ; 11
	db REMORAID,   15,  REMORAID,   15 ; 12
	db REMORAID,   40,  REMORAID,   40 ; 13
	db GYARADOS,   20,  GYARADOS,   20 ; 14
	db GYARADOS,   40,  GYARADOS,   40 ; 15
	db DRATINI,    10,  DRATINI,    10 ; 16
	db DRATINI,    10,  DRATINI,    10 ; 17
	db HORSEA,     20,  HORSEA,     20 ; 18
	db HORSEA,     40,  HORSEA,     40 ; 19
	db TENTACOOL,  20,  TENTACOOL,  20 ; 20
	db TENTACOOL,  40,  TENTACOOL,  40 ; 21
