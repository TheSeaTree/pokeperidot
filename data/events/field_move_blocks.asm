CutTreeBlockPointers:
; tileset, block list pointer
	dbw TILESET_JOHTO,        .johto
	dbw TILESET_MOUNTAIN,     .mountain
	dbw TILESET_VOLCANO,      .volcano
	dbw TILESET_JOHTO_CITY,   .johto_city
	dbw TILESET_FACILITY,	  .facility
	dbw TILESET_CAVE,		  .cave
	dbw TILESET_FOREST,		  .forest
	dbw TILESET_PARK,		  .park
	dbw TILESET_LOST_LAND,	  .lost_land
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
	db $64, $35, 0 ; tree
	db -1

.facility
	db $30, $62, 0 ; smash wall
	db -1

.cave
	db $88, $13, 0 ; smash wall
	db $e2, $76, 0 ; smash wall
	db $ed, $37, 0 ; smash wall
	db -1

.forest
	db $03, $02, 1 ; grass
	db $34, $24, 1 ; grass
	db $35, $25, 1 ; grass
	db $36, $26, 1 ; grass
	db $38, $28, 1 ; grass
	db $3a, $2a, 1 ; grass
	db $3c, $2c, 1 ; grass
	db $2d, $2d, 1 ; grass
	db $2e, $2e, 1 ; grass
	db $3f, $30, 1 ; grass
	db $39, $31, 1 ; grass
	db $3b, $32, 1 ; grass
	db $37, $33, 1 ; grass
	db $20, $33, 0 ; tree
	db $21, $32, 0 ; tree
	db $22, $31, 0 ; tree
	db $23, $30, 0 ; tree
	db $5f, $66, 0 ; smash wall
	db -1

.park
	db $03, $04, 1 ; grass
	db $1f, $04, 1 ; grass
	db $23, $04, 1 ; grass
	db $27, $04, 1 ; grass
	db $2b, $04, 1 ; grass
	db $13, $03, 1 ; long grass
	db $84, $2b, 1 ; long grass
	db $85, $27, 1 ; long grass
	db $86, $1f, 1 ; long grass
	db $87, $23, 1 ; long grass
	db -1

.lost_land
	db $55, $54, 1 ; smash wall
	db -1

WhirlpoolBlockPointers:
	dbw TILESET_JOHTO, .johto
	db -1 ; end

.johto:
; facing block, replacement block, animation
	db $07, $36, 0
	db -1 ; end
