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
	roam_map RUGOSA_CITY, ROUTE_13
	roam_map ROUTE_13, ROUTE_11
	roam_map ROUTE_11, OCCIDENT_FOREST
	roam_map OCCIDENT_FOREST, ROUTE_9
	roam_map ROUTE_9, ROUTE_13
	
	; Moltres
	roam_map ROUTE_20, MOLTEN_PEAK_OUTSIDE
	roam_map MOLTEN_PEAK_OUTSIDE, ROUTE_17
	roam_map ROUTE_17, ROUTE_16
	roam_map ROUTE_16, ROUTE_12
	roam_map ROUTE_12, ROUTE_15
	roam_map ROUTE_15, ROUTE_17
	db -1 ; end
