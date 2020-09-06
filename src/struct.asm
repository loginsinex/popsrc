MACRO SLOT_ENEMY	nEnemyID, XPos, YPos, ptrAction, nDirection, nAction, nPose, nUnknown1, nUnknown2, nUnknown3, nUnknown4
	.BYTE nEnemyID
	.WORD XPos
	.WORD YPos
	.WORD ptrAction
	.BYTE nDirection
	.BYTE nAction
	.BYTE nPose
	.BYTE nUnknown1
	.BYTE nUnknown2
	.BYTE nUnknown3
	.BYTE nUnknown4
ENDM

; ---------------------------------------------------------------------------

MACRO DOOR_TIMER	nRoom, nPlace, nTimer
		.BYTE nRoom
		.BYTE nPlace
		.BYTE nTimer
ENDM

; ---------------------------------------------------------------------------

MACRO ENEMY_PLACE XPos, YPos
	.WORD XPos
	.BYTE YPos
ENDM

; ---------------------------------------------------------------------------

MACRO GUARD_ROOM_PLACE nRoomId, nRoomPlace
	.BYTE nRoomId
	.BYTE nRoomPlace
ENDM

; ---------------------------------------------------------------------------

MACRO SPRITE sprY, sprTile, sprAttr, sprX
	.BYTE sprY
	.BYTE sprTile
	.BYTE sprAttr
	.BYTE sprX
ENDM

; ---------------------------------------------------------------------------

MACRO DEMO_PLAY_DATA	nTimer, nJoyControl
	.BYTE nTimer
	.BYTE nJoyControl
ENDM

; ---------------------------------------------------------------------------

MACRO MIRROR_IMAGE_PLAY_DATA nTimer, nAction
	.BYTE nTimer
	.BYTE nAction
ENDM

; ---------------------------------------------------------------------------

MACRO SPRITE_CONFIG	scCharsListId, scOffsetX, scOffsetY, scObjectWidth, scObjectHeight, scAttribute, scSpriteListPtr
	.BYTE scCharsListId
	.BYTE scOffsetX
	.BYTE scOffsetY
	.BYTE scObjectWidth
	.BYTE scObjectHeight
	.BYTE scAttribute
	.WORD scSpriteListPtr
ENDM

; ---------------------------------------------------------------------------

MACRO ANIM_BLOCK	abWidth, abHeight, abPPUPtrHi, abPPUPtrLo, abFrameId, abUnused, abOffsetFlags, abDataPtr, abPlace
	.BYTE abWidth
	.BYTE abHeight
	.BYTE abPPUPtrHi
	.BYTE abPPUPtrLo
	.BYTE abFrameId
	.BYTE abUnused
	.BYTE abOffsetFlags
	.WORD abDataPtr
	.BYTE abPlace
ENDM

; ---------------------------------------------------------------------------

MACRO BLOCK_CHARS_PTR	blockDataPtr, blockDataBeginTileId
	.WORD blockDataPtr
	.BYTE blockDataBeginTileId
ENDM

; ---------------------------------------------------------------------------

MACRO ANIM_BLOCK_DESCRIPTOR abdWidth, abdHeight, abdOffset, abdAttribute, field_4, field_5, field_6, abdFramesPtr
	.BYTE abdWidth
	.BYTE abdHeight
	.BYTE abdOffset
	.BYTE abdAttribute
	.BYTE field_4
	.BYTE field_5
	.BYTE field_6
	.WORD abdFramesPtr
ENDM

; ---------------------------------------------------------------------------

MACRO LEVEL_HEADER	nPlayerRoomId, nPlayerPlace, nPlayerDirection
	.BYTE nPlayerRoomId
	.BYTE nPlayerPlace
	.BYTE nPlayerDirection
ENDM

; ---------------------------------------------------------------------------

MACRO	ROOM_NEIGHBORS	nLeftRoom, nRightRoom, nTopRoom, nBottomRoom
	.BYTE nLeftRoom
	.BYTE nRightRoom
	.BYTE nTopRoom
	.BYTE nBottomRoom
ENDM

; ---------------------------------------------------------------------------

MACRO DOOR_LINK	nButtonRoomId, nButtonPlace, fOpenDoor, nDoorRoomId, nDoorPlace
					; BANK06:82F9r	...
	.BYTE nButtonRoomId
	.BYTE nButtonPlace
	.BYTE fOpenDoor
	.BYTE nDoorRoomId
	.BYTE nDoorPlace
ENDM

; ---------------------------------------------------------------------------

MACRO FALLING_PLATE_DATA 	fplPlace, fplFloorTimer, fplRoom, field_3
	.BYTE fplPlace
	.BYTE fplFloorTimer
	.BYTE fplRoom
	.BYTE field_3
FALLING_PLATE_DATA ends

; ---------------------------------------------------------------------------

MACRO ROOM_BLOCKS
	.BYTE 30 dup(?)
ROOM_BLOCKS	ends

; ---------------------------------------------------------------------------

MACRO ROOM_GUARDS	
	.BYTE 0,0,0,0,0,0,0,0
	.BYTE 0,0,0,0,0,0,0,0
	.BYTE 0,0,0,0,0,0,0,0
ENDM

; ---------------------------------------------------------------------------


MACRO BLOCK_JOINT	nNeighorBlock, nCharsId, ptrJoinTiles
	.BYTE nNeighorBlock
	.BYTE nCharsId
	.WORD ptrJoinTiles
ENDM

; ---------------------------------------------------------------------------

MACRO JOINT_BLOCK	nTopLeft, nTopMdl, nTopRight, nBtmLeft, nBtmMdl, nBtmRight
	.BYTE nTopLeft
	.BYTE nTopMdl
	.BYTE nTopRight
	.BYTE nBtmLeft
	.BYTE nBtmMdl
	.BYTE nBtmRight
ENDM

; ---------------------------------------------------------------------------

MACRO BLOCK_LINE	tile1, tile2, tile3, tile4, tile5, tile6, tile7
	.BYTE	tile1
	.BYTE	tile2
	.BYTE	tile3
	.BYTE	tile4
	.BYTE	tile5
	.BYTE	tile6
	.BYTE	tile7
ENDM

pDemoPlayData.nTimer		equ	pDemoPlayData
pDemoPlayData.nJoyControl	equ	pDemoPlayData+1

pObjectPlaceValues.XPos		equ	pObjectPlaceValues
pObjectPlaceValues.YPos		equ	pObjectPlaceValues+2