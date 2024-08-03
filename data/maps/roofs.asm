; MapGroupRoofs values; Roofs indexes
	const_def
	const ROOF_NEW_BARK  ; 0
	const ROOF_VIOLET    ; 1
	const ROOF_AZALEA    ; 2
	const ROOF_OLIVINE   ; 3
	const ROOF_GOLDENROD ; 4
	const ROOF_SNOWY     ; 5

MapGroupRoofs:
; entries correspond to map groups
; values are indexes for Roofs (see below)
	db -1             ;  0
	db ROOF_OLIVINE   ;  1 (Ocean)
	db ROOF_AZALEA    ;  2 (Rugosa)
	db -1             ;  3 (Dungeons)
	db ROOF_VIOLET    ;  4 (Staghorn)
	db ROOF_AZALEA    ;  5 (Acropora)
	db ROOF_AZALEA    ;  6 (Safari)
	db -1             ;  7 (Carnation)
	db ROOF_GOLDENROD ;  8 (Pectinia)
	db ROOF_AZALEA    ;  9 (Orientem)
	db ROOF_OLIVINE   ; 10 (Ridge)
	db ROOF_NEW_BARK  ; 11 (Favia)
	db -1             ; 12 (Dept Store)
	db ROOF_AZALEA    ; 13 (Route 10)
	db -1             ; 14 (Roofs)
	db -1             ; 15 (SS Mako)
	db ROOF_OLIVINE   ; 16 (Pokemon League)
	db -1             ; 17 (Occident)
	db -1             ; 18 (Route 11)
	db ROOF_NEW_BARK  ; 19 (Lost Land)
	db -1             ; 20 (Cable Club)
	db -1             ; 21 (Castle)
	db ROOF_SNOWY     ; 22 (Hepatica)
	db ROOF_NEW_BARK  ; 23 (Orchid)
	db ROOF_AZALEA    ; 24 (Elkhorn)
	db -1             ; 25 (Postgame)
	db ROOF_AZALEA    ; 26 (Pavona)
	db ROOF_SNOWY	  ; 26 (Palerock)
	db -1			  ; 27 (Boreas Forest)
	db ROOF_OLIVINE   ; 28 (Sea Route 7)
	db -1			  ; 29 (Battle Sim)
	db ROOF_NEW_BARK  ; 30 (Past Favia)
	db ROOF_GOLDENROD ; 31 (Past Pectinia)
	db ROOF_AZALEA	  ; 32 (Past Route 10)
	db ROOF_AZALEA	  ; 33 (Past Elkhorn)
	db ROOF_AZALEA    ; 34 (Past Pavona)

Roofs:
; entries correspond to ROOF_* constants
INCBIN "gfx/tilesets/roofs/new_bark.2bpp"
INCBIN "gfx/tilesets/roofs/violet.2bpp"
INCBIN "gfx/tilesets/roofs/azalea.2bpp"
INCBIN "gfx/tilesets/roofs/olivine.2bpp"
INCBIN "gfx/tilesets/roofs/goldenrod.2bpp"
INCBIN "gfx/tilesets/roofs/snowy.2bpp"
