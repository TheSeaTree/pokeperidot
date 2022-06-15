; Maps that roaming monsters can be on, and possible maps they can jump to.
; Notably missing are Route 40 and Route 41, which are water routes.

roam_map: MACRO
	map_id \1
	db _NARG - 1
rept _NARG + -1
	map_id \2
	shift
endr
	db 0
ENDM

RoamMaps:
; there are NUM_ROAMMON_MAPS entries
	; start map, ...other maps
	; Articuno
	roam_map PALEROCK_MOUNTAIN_OUTSIDE, ROUTE_3
	roam_map ROUTE_3, ROUTE_4
	roam_map ROUTE_4, ROUTE_5
	roam_map ROUTE_5, ROUTE_6
	roam_map ROUTE_6, ROUTE_3
	
	; Zapdos
	roam_map RUGOSA_CITY, ROUTE_14
	roam_map ROUTE_14, ROUTE_12
	roam_map ROUTE_12, ILEX_FOREST
	roam_map ILEX_FOREST, ROUTE_9
	roam_map ROUTE_9, ROUTE_14
	
	; Moltres
	roam_map ROUTE_22, MOLTEN_PEAK_OUTSIDE
	roam_map MOLTEN_PEAK_OUTSIDE, ROUTE_21
	roam_map ROUTE_21, ROUTE_20
	roam_map ROUTE_20, ROUTE_13
	roam_map ROUTE_13, ACROPORA_CITY
	roam_map ACROPORA_CITY, ROUTE_21
	db -1 ; end
