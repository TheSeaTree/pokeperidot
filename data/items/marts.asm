Marts:
; entries correspond to MART_* constants
	dw MartOrchid
	dw MartViolet
	dw MartPectinia
	dw MartCianwood
	dw MartCianwoodRobbed
	dw MartDeptStore2F1
	dw MartDeptStore2F2
	dw MartDeptStore3F1
	dw MartDeptStore3F2
	dw MartDeptStore4F
	dw MartOlivine
	dw MartEcruteak
	dw MartEcruteakTM
	dw MartMahogany
	dw MartBlackthorn
	dw MartBlackthornTM
	dw MartFavia
	dw MartFaviaTM
	dw MartPewter
	dw MartCerulean
	dw MartLavender
	dw MartVermilion
	dw MartCeladon2F1
	dw MartCeladon2F2
	dw MartCeladon3F
	dw MartCeladon4F
	dw MartCeladon5F1
	dw MartCeladon5F2
	dw MartFuchsia
	dw MartSaffron
	dw MartMtMoon
	dw MartPokemonLeague
	dw MartPokemonLeagueTM
	dw MartPokemonLeagueVitamins
	dw MartPokemonLeagueCafe
	dw MartUnderground
	dw MartPectiniaBattleItems1
	dw MartPectiniaBattleItems2
	dw MartPectiniaBattleItems3
.End

MartOrchid:
	db 9 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db HYPER_POTION
	db MAX_POTION
	db FULL_HEAL
	db ETHER
	db MAX_ETHER
	db REVIVE
	db MAX_REPEL
	db -1 ; end

MartViolet:
	db 3 ; # items
	db FRESH_WATER
	db LEMONADE
	db SWEET_TEA
	db -1 ; end

MartPectinia:
	db 6 ; # items
	db POKE_BALL
	db POTION
	db ESCAPE_ROPE
	db REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db -1 ; end

MartCianwood:
	db 7 ; # items
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db FULL_HEAL
	db ETHER
	db REVIVE
	db -1 ; end
	
MartCianwoodRobbed:
	db 2
	db POTION
	db ANTIDOTE
	db -1

MartDeptStore2F1:
	db 7 ; # items
	db POTION
	db SUPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db -1 ; end

MartDeptStore2F2:
	db 7 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db ESCAPE_ROPE
	db SUPER_REPEL
	db REVIVE
	db FULL_HEAL
	db POKE_DOLL
	db -1 ; end

MartDeptStore3F1:
	db 3 ; # items
	db TM_FIRE_PUNCH
	db TM_ICE_PUNCH
	db TM_THUNDERPUNCH
	db -1 ; end

MartDeptStore3F2:
	db 3 ; # items
	db CHARCOAL
	db MYSTIC_WATER
	db MIRACLE_SEED
	db -1 ; end

MartDeptStore4F:
	db 5 ; # items
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db HP_UP
	db -1 ; end

MartDeptStore5F:
	db 3 ; # items
	db KINGS_ROCK
	db DRAGON_SCALE
	db SLOWPOKETAIL
	db -1 ; end

MartDeptStore5F2:
	db 8 ; # items
	db SILVERPOWDER
	db MAGNET
	db SHARP_BEAK
	db NEVERMELTICE
	db POISON_BARB
	db TWISTEDSPOON
	db HARD_STONE
	db METAL_COAT
	db -1

MartOlivine:
	db 8 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db HYPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db ICE_HEAL
	db SUPER_REPEL
	db -1 ; end

MartEcruteak:
	db 6 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db FULL_HEAL
	db REVIVE
	db -1 ; end
	
MartEcruteakTM:
	db 3
	db TM_REFLECT
	db TM_LIGHT_SCREEN
	db TM_SAFEGUARD
	db -1

MartMahogany:
	db 4 ; # items
	db FRESH_WATER
	db BERRY_JUICE
	db SODA_POP
	db SWEET_TEA
	db -1 ; end

MartBlackthorn:
	db 9 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db HYPER_POTION
	db MAX_POTION
	db FULL_HEAL
	db ETHER
	db MAX_ETHER
	db REVIVE
	db MAX_REPEL
	db -1 ; end
	
MartBlackthornTM:
	db 3
	db TM_PSYCHIC_M
	db TM_CRUNCH
	db TM_SHADOW_BALL
	db -1

MartFavia:
	db 8 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db REPEL
	db AWAKENING
	db PARLYZ_HEAL
	db ETHER
	db -1 ; end
	
MartFaviaTM:
	db 3
	db TM_PROTECT
	db TM_ENDURE
	db TM_PSYCH_UP
	db -1

MartPewter:
	db 7 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db SUPER_REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db -1 ; end

MartCerulean:
	db 8 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db SUPER_REPEL
	db FULL_HEAL
	db X_DEFEND
	db X_ATTACK
	db DIRE_HIT
	db -1 ; end

MartLavender:
	db 8 ; # items
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db MAX_REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db -1 ; end

MartVermilion:
	db 7 ; # items
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db REVIVE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db -1 ; end

MartCeladon2F1:
	db 7 ; # items
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db REVIVE
	db SUPER_REPEL
	db MAX_REPEL
	db -1 ; end

MartCeladon2F2:
	db 10 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db ESCAPE_ROPE
	db FULL_HEAL
	db ANTIDOTE
	db BURN_HEAL
	db ICE_HEAL
	db AWAKENING
	db PARLYZ_HEAL
	db -1 ; end

MartCeladon3F:
	db 5 ; # items
	db TM_PSYCH_UP
	db TM_PROTECT
	db TM_THUNDERPUNCH
	db TM_FIRE_PUNCH
	db TM_ICE_PUNCH
	db -1 ; end

MartCeladon4F:
	db 1 ; # items
	db POKE_DOLL
	db -1 ; end

MartCeladon5F1:
	db 5 ; # items
	db HP_UP
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db -1 ; end

MartCeladon5F2:
	db 7 ; # items
	db X_ACCURACY
	db GUARD_SPEC
	db DIRE_HIT
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db X_SP_ATK
	db -1 ; end

MartFuchsia:
	db 6 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db FULL_HEAL
	db MAX_REPEL
	db -1 ; end

MartSaffron:
	db 7 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db HYPER_POTION
	db MAX_POTION
	db FULL_HEAL
	db X_ATTACK
	db X_DEFEND
	db -1 ; end

MartMtMoon:
	db 5 ; # items
	db POKE_DOLL
	db FRESH_WATER
	db SODA_POP
	db LEMONADE
	db REPEL
	db -1 ; end

MartPokemonLeague:
	db 7 ; # items
	db ULTRA_BALL
	db MAX_REPEL
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db REVIVE
	db FULL_HEAL
	db -1 ; end
	
MartPokemonLeagueTM:
	db 4
	db TM_FIRE_BLAST
	db TM_BLIZZARD
	db TM_THUNDER
	db TM_HURRICANE
	db -1
	
MartPokemonLeagueVitamins:
	db 6
	db HP_UP
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db PP_UP
	db -1

MartPokemonLeagueCafe:
	db 4 ; # items
	db BERRY_JUICE
	db FRESH_WATER
	db LEMONADE
	db SWEET_TEA
	db -1 ; end

MartUnderground:
	db 4 ; # items
	db ENERGYPOWDER
	db ENERGY_ROOT
	db HEAL_POWDER
	db REVIVAL_HERB
	db -1 ; end

MartPectiniaBattleItems1:
	db 6
	db SUN_STONE
	db FIRE_STONE
	db SILVERPOWDER
	db PINK_BOW
	db SHARP_BEAK
	db SILK_SCARF
	db -1

MartPectiniaBattleItems2:
	db 6
	db LEAF_STONE
	db THUNDERSTONE
	db MAGNET
	db TWISTEDSPOON
	db POISON_BARB
	db DRAGON_FANG
	db -1

MartPectiniaBattleItems3:
	db 6
	db MOON_STONE
	db WATER_STONE
	db HARD_STONE
	db NEVERMELTICE
	db SPELL_TAG
	db METAL_COAT
	db -1

DefaultMart:
	db 2 ; # items
	db POKE_BALL
	db POTION
	db -1 ; end
