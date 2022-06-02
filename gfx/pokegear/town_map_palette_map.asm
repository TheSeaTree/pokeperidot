	const_def
	const PAL_TOWNMAP_BORDER   ; 0
	const PAL_TOWNMAP_EARTH    ; 1
	const PAL_TOWNMAP_MOUNTAIN ; 2
	const PAL_TOWNMAP_CITY     ; 3
	const PAL_TOWNMAP_POI      ; 4
	const PAL_TOWNMAP_POI_MTN  ; 5
	const PAL_TOWNMAP_OCEAN    ; 6
	const PAL_TOWNMAP_8		   ; 7

townmappals: MACRO
rept _NARG / 2
	dn PAL_TOWNMAP_\2, PAL_TOWNMAP_\1
	shift
	shift
endr
ENDM

; gfx/pokegear/town_map.png
	townmappals EARTH,    EARTH,    EARTH,    MOUNTAIN, MOUNTAIN, MOUNTAIN, BORDER,   BORDER
	townmappals EARTH,    EARTH,    CITY,     8,    POI,      POI_MTN,  POI,      POI_MTN
	townmappals EARTH,    EARTH,    EARTH,    MOUNTAIN, MOUNTAIN, MOUNTAIN, BORDER,   BORDER
	townmappals EARTH,    EARTH,    BORDER,   EARTH,    EARTH,    BORDER,   BORDER,   POI
	townmappals EARTH,    EARTH,    EARTH,    MOUNTAIN, MOUNTAIN, MOUNTAIN, BORDER,   BORDER
	townmappals 8,  EARTH,    8,  EARTH,        BORDER,   BORDER,   BORDER,   BORDER
; gfx/pokegear/pokegear.png
	townmappals OCEAN,    OCEAN,    OCEAN,    MOUNTAIN, MOUNTAIN, MOUNTAIN, POI,   8
	townmappals OCEAN,   OCEAN,   OCEAN,   BORDER,   BORDER,   BORDER, 	BORDER,   BORDER
	townmappals OCEAN,    OCEAN,    OCEAN,    EARTH,    EARTH,    MOUNTAIN, BORDER,   BORDER
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER
	townmappals OCEAN,    OCEAN,    OCEAN,    EARTH,    MOUNTAIN, BORDER,   BORDER,   BORDER
	townmappals BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER,   BORDER
