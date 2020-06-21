CutTreeBlockPointers:
; tileset, block list pointer
	dbw TILESET_JOHTO,        .johto
	dbw TILESET_MOUNTAIN,     .mountain
	dbw TILESET_VOLCANO,      .volcano
	dbw TILESET_JOHTO_CITY,   .johto_city
	dbw TILESET_FACILITY,	  .facility
	dbw TILESET_CAVE,		  .cave
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
	db $b0, $73, 0 ; smash wall
	db -1 ; end

.mountain:
; facing block, replacement block, animation
	db $03, $02, 1 ; grass
	db $06, $4d, 0 ; smash wall
	db $8c, $7c, 0 ; tree
	db $90, $7c, 0 ; tree
	db $91, $7f, 0 ; tree
	db $8d, $7e, 0 ; tree
	db $83, $87, 1 ; grass
	db $9e, $9f, 1 ; grass
	db -1 ; end
	
.volcano
	db $03, $02, 1 ; grass
	db $06, $3d, 0 ; smash wall
	db -1 ; end
	
.johto_city
	db $03, $02, 1 ; grass
	db $67, $3b, 0 ; tree
	db -1

.facility
	db $30, $62, 0 ; smash wall
	db -1

.cave
	db $88, $13, 0 ; smash wall
	db -1

WhirlpoolBlockPointers:
	dbw TILESET_JOHTO, .johto
	db -1 ; end

.johto:
; facing block, replacement block, animation
	db $07, $36, 0
	db -1 ; end
