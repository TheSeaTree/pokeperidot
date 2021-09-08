	const_def 2 ; object constants

VitaminShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
VitaminShopClerkScript:
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .Postgame
	pokemart MARTTYPE_STANDARD, MART_POKEMON_LEAGUE_VITAMINS
	closetext
	end
	
.Postgame
	pokemart MARTTYPE_BARGAIN, 0
	closetext
	end

VitaminShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, POKEMON_LEAGUE, 4
	warp_event  3,  7, POKEMON_LEAGUE, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event -4, -3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VitaminShopClerkScript, -1
