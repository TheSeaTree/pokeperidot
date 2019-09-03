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
	roam_map ROUTE_1, ROUTE_6, ROUTE_8
	roam_map ROUTE_11, ROUTE_6, ROUTE_8
	roam_map ROUTE_12, ROUTE_6, ROUTE_8
	roam_map ROUTE_13, ROUTE_6, ROUTE_8
	roam_map ROUTE_14, ROUTE_6, ROUTE_8
	roam_map ROUTE_15, ROUTE_6, ROUTE_8
	roam_map ROUTE_16, ROUTE_6, ROUTE_8
	roam_map ROUTE_17, ROUTE_6, ROUTE_8
	roam_map ROUTE_18, ROUTE_6, ROUTE_8
	roam_map ROUTE_2, ROUTE_6, ROUTE_8
	roam_map ROUTE_3, ROUTE_6, ROUTE_8
	roam_map ROUTE_4, ROUTE_6, ROUTE_8
	roam_map ROUTE_5, ROUTE_6, ROUTE_8
	roam_map ROUTE_6, ROUTE_8
	roam_map ROUTE_7, ROUTE_6, ROUTE_8
	roam_map ROUTE_8, ROUTE_6
	db -1 ; end
