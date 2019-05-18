CutTreeBlockPointers:
; tileset, block list pointer
	dbw TILESET_JOHTO,        .johto
	dbw TILESET_KANTO,        .kanto
	dbw TILESET_PARK,         .park
	dbw TILESET_MOUNTAIN,     .mountain
	dbw TILESET_JOHTO_CITY,   .johto_city
	db -1 ; end

.johto:
; facing block, replacement block, animation
	db $03, $02, 1 ; grass
	db $81, $5d, 1 ; grass
	db $82, $60, 1 ; grass
	db $83, $64, 1 ; grass
	db $84, $66, 1 ; grass
	db $85, $5c, 1 ; grass
	db $86, $3f, 1 ; grass
	db $87, $5e, 1 ; grass
	db $88, $3d, 1 ; grass
	db $89, $3e, 1 ; grass
	db $8a, $62, 1 ; grass
	db $8b, $3c, 1 ; grass
	db $5b, $3c, 0 ; tree
	db $5f, $3d, 0 ; tree
	db $63, $3f, 0 ; tree
	db $67, $3e, 0 ; tree
	db -1 ; end

.kanto:
; facing block, replacement block, animation
	db $0b, $0a, 1 ; grass
	db $32, $6d, 0 ; tree
	db $33, $6c, 0 ; tree
	db $34, $6f, 0 ; tree
	db $35, $4c, 0 ; tree
	db $60, $6e, 0 ; tree
	db -1 ; end

.park:
; facing block, replacement block, animation
	db $13, $03, 1 ; grass
	db $03, $04, 1 ; grass
	db -1 ; end
	
.mountain:
; facing block, replacement block, animation
	db $03, $02, 1 ; grass
	db $5b, $3c, 0 ; tree
	db $5f, $3d, 0 ; tree
	db $63, $3f, 0 ; tree
	db $67, $3e, 0 ; tree
	db -1 ; end
	
.johto_city
	db $03, $02, 1 ; grass
	db $67, $3b, 0 ; tree
	db -1

WhirlpoolBlockPointers:
	dbw TILESET_JOHTO, .johto
	db -1 ; end

.johto:
; facing block, replacement block, animation
	db $07, $36, 0
	db -1 ; end
