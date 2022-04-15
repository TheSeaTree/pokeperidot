overworld_sprite: MACRO
; pointer, length, type, palette
	dw \1
	db \2 tiles, BANK(\1), \3, \4
ENDM

OverworldSprites:
; entries correspond to SPRITE_* constants
	overworld_sprite PerrySpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite PerryBikeSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite GameboyKidSpriteGFX, 12, STANDING_SPRITE, PAL_OW_GREEN
	overworld_sprite GameboyGirlSpriteGFX, 12, STANDING_SPRITE, PAL_OW_GREEN
	overworld_sprite SilverSpriteGFX, 12, WALKING_SPRITE, PAL_OW_PURPLE
	overworld_sprite OakSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite RedSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BlueSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BillSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite ElderSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite JanineSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite PerryHeadsetSpriteGFX, 12, STANDING_SPRITE, PAL_OW_RED
	overworld_sprite RedsMomSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite JadeHeadsetSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite RedsMomSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite DaisySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite UnusedGuySpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN ; Unused
	overworld_sprite UnusedGuySpriteGFX, 4, STILL_SPRITE, PAL_OW_RED ; Unused
	overworld_sprite CecilSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite PeridotTrophySpriteGFX, 4, STILL_SPRITE, PAL_OW_GREEN
	overworld_sprite MurphySpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite DuaneSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite UnusedGuySpriteGFX, 4, STILL_SPRITE, PAL_OW_RED ; Unused
	overworld_sprite JasmineSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite UnusedGuySpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN ; Unused
	overworld_sprite ClairSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite UnusedGuySpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN ; Unused
	overworld_sprite UnusedGuySpriteGFX, 4, STILL_SPRITE, PAL_OW_BLUE ; Unused
	overworld_sprite UnusedGuySpriteGFX, 4, STILL_SPRITE, PAL_OW_RED ; Unused
	overworld_sprite UnusedGuySpriteGFX, 4, STILL_SPRITE, PAL_OW_BLUE ; Unused
	overworld_sprite LanceSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite UnusedGuySpriteGFX, 4, STILL_SPRITE, PAL_OW_GREEN ; Unused
	overworld_sprite UnusedGuySpriteGFX, 4, STILL_SPRITE, PAL_OW_GREEN ; Unused
	overworld_sprite UnusedGuySpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN ; Unused
	overworld_sprite UnusedGuySpriteGFX, 4, STILL_SPRITE, PAL_OW_RED ; Unused
	overworld_sprite CooltrainerMSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite CooltrainerFSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BugCatcherSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite TwinSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite YoungsterSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite LassSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite TeacherSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite BuenaSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite SuperNerdSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite RockerSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite PokefanMSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite PokefanFSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite GrampsSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite GrannySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite SwimmerGuySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite SwimmerGirlSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite BigSnorlaxSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite SurfingPikachuSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite RocketSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite RocketGirlSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite NurseSpriteGFX, 12, STANDING_SPRITE, PAL_OW_RED
	overworld_sprite LinkReceptionistSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite ClerkSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite FisherSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite FishingGuruSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite ScientistSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite KimonoGirlSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite SageSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite UnusedGuySpriteGFX, 12, STANDING_SPRITE, PAL_OW_RED
	overworld_sprite GentlemanSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BlackBeltSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite ReceptionistSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite OfficerMSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite CalSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite SlowpokeSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite CaptainSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite BigLaprasSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite GymGuySpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite SailorSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BikerSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite PharmacistSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite MonsterSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite FairySpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BirdSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite DragonSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite BigOnixSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BROWN
	overworld_sprite N64SpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite SudowoodoSpriteGFX, 12, STANDING_SPRITE, PAL_OW_GREEN
	overworld_sprite SurfSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite PokeBallSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite PokedexSpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite PaperSpriteGFX, 4, STILL_SPRITE, PAL_OW_BLUE
	overworld_sprite VirtualBoySpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite OldLinkReceptionistSpriteGFX, 12, STANDING_SPRITE, PAL_OW_RED
	overworld_sprite RockSpriteGFX, 4, STILL_SPRITE, PAL_OW_ROCK
	overworld_sprite BoulderSpriteGFX, 4, STILL_SPRITE, PAL_OW_ROCK
	overworld_sprite SnesSpriteGFX, 4, STILL_SPRITE, PAL_OW_BLUE
	overworld_sprite FamicomSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite FruitTreeSpriteGFX, 4, STILL_SPRITE, PAL_OW_TREE
	overworld_sprite GoldTrophySpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite SilverTrophySpriteGFX, 4, STILL_SPRITE, PAL_OW_SILVER
	overworld_sprite JadeSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite JadeBikeSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite UnusedGuySpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN ; Unused
	overworld_sprite StandingYoungsterSpriteGFX, 12, STANDING_SPRITE, PAL_OW_BLUE
	overworld_sprite ConeSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite ProfSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite OldAmberSpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite BookSpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite BushSpriteGFX, 4, STILL_SPRITE, PAL_OW_TREE
	overworld_sprite SwimmerGuyLandSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite SwimmerGirlLandSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite PerryRunSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite JadeRunSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite PoseySpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite CelesteSpriteGFX, 12, WALKING_SPRITE, PAL_OW_PURPLE
	overworld_sprite AbbotSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite FangirlSpriteGFX, 12, WALKING_SPRITE, PAL_OW_GREEN
	overworld_sprite FoodSpriteGFX, 4, STILL_SPRITE, PAL_OW_BROWN
	overworld_sprite ChefSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite JoelSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite ReganSpriteGFX, 12, WALKING_SPRITE, PAL_OW_PURPLE
	overworld_sprite BredeSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite AmberSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite WilburSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BROWN
	overworld_sprite BombSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite TeacherSleepingSpriteGFX, 4, STILL_SPRITE, PAL_OW_RED
	overworld_sprite BuenaSleepingSpriteGFX, 4, STILL_SPRITE, PAL_OW_BLUE
	overworld_sprite PerrySurfSpriteGFX, 12, WALKING_SPRITE, PAL_OW_RED
	overworld_sprite JadeSurfSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite ShadowSpriteGFX, 12, STANDING_SPRITE, PAL_OW_ROCK
	overworld_sprite OfficerFSpriteGFX, 12, WALKING_SPRITE, PAL_OW_BLUE
	overworld_sprite BigAerodactylSpriteGFX, 12, STANDING_SPRITE, PAL_OW_SILVER
