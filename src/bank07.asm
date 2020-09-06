
.base $C000

		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
; ---------------------------------------------------------------------------

RESET:					; ...
		SEI
		LDX	#0
		STX	vfEnableMusic
		STX	PPU_CR_1	; PPU Control Register #1 (W)
					;
					;    D7: Execute NMI on	VBlank
					;    D6: PPU Master/Slave Selection
					;    D5: Sprite	Size
					;    D4: Background Pattern Table Address
					;    D3: Sprite	Pattern	Table Address
					;    D2: PPU Address Increment
					; D1-D0: Name Table Address
		STX	PPU_CR_2	; PPU Control Register #2 (W)
					;
					; D7-D5: Full Background Colour	(when D0 == 1)
					; D7-D5: Colour	Intensity (when	D0 == 0)
					;    D4: Sprite	Visibility
					;    D3: Background Visibility
					;    D2: Sprite	Clipping
					;    D1: Background Clipping
					;    D0: Display Type
		DEX
		TXS
		LDX	#2

_wait_blank:				; ...
		BIT	PPU_SR		; PPU Status Register (R)
					;
					;    D7: VBlank	Occurance
					;    D6: Sprite	#0 Occurance
					;    D5: Scanline Sprite Count
					;    D4: VRAM Write Flag
					;
					; NOTE:	D7 is set to 0 after read occurs.
					; NOTE:	After a	read occurs, $2005 is reset, hence the
					;	next write to $2005 will be Horizontal.
					; NOTE:	After a	read occurs, $2006 is reset, hence the
					;	next write to $2006 will be the	high byte portion.
		BPL	_wait_blank

_wait_sub_blank:			; ...
		BIT	PPU_SR		; PPU Status Register (R)
					;
					;    D7: VBlank	Occurance
					;    D6: Sprite	#0 Occurance
					;    D5: Scanline Sprite Count
					;    D4: VRAM Write Flag
					;
					; NOTE:	D7 is set to 0 after read occurs.
					; NOTE:	After a	read occurs, $2005 is reset, hence the
					;	next write to $2005 will be Horizontal.
					; NOTE:	After a	read occurs, $2006 is reset, hence the
					;	next write to $2006 will be the	high byte portion.
		BMI	_wait_sub_blank
		DEX
		BNE	_wait_blank
		LDA	#1000000b
		STA	Joypad_2	; Joypad #2/SOFTCLK (RW)
					;
					; READING:
					;    D7: Vertical Clock	Signal (External)
					;    D6: Vertical Clock	Signal (Internal)
					;    D4: Zapper	Trigger
					;    D3: Zapper	Sprite Detection
					;    D0: Joypad	Data
					; ----------------------------------------------
					; WRITING:
					; Expansion Port Latch (W)
					;
					;    D0: Expansion Port	Method
					;
		LDA	#0
		STA	pAPU_DM_CR	; pAPU Delta Modulation	Control	Register (W)
		STA	pAPU_SV_CSR	; pAPU Sound/Vertical Clock Signal Register (R)
					;
					;    D6: Vertical Clock	Signal IRQ Availability
					;    D4: Delta Modulation
					;    D3: Noise
					;    D2: Triangle
					;    D1: Pulse #2
					;    D0: Pulse #1
					; ---------------------------------------------
					; pAPU Channel Control (W)
					;
					;    D4: Delta Modulation
					;    D3: Noise
					;    D2: Triangle
					;    D1: Pulse #2
					;    D0: Pulse #1
		LDX	#0

lbClearMemoryLoop:			; ...
		STA	vptrLeftBorderBlocksPtr,X
		STA	v0,X
		DEX
		BNE	lbClearMemoryLoop
		LDX	#0
		STX	vfEnableInput	; Used when game starts
		JSR	GetSavedRoomDataPtr
		JSR	j_ClearSoundEngineVars
; START	OF FUNCTION CHUNK FOR CheckDemoPlayControl

lbBeginGame:				; ...
		LDX	#$FF
		TXS
		LDA	vfEnableInput	; Used when game starts
		PHA
		JSR	SwitchPRGBank_5
		JSR	ZeroMemoryAndSetupPPUPatternTable
		PLA
		STA	vfEnableInput	; Used when game starts
		BEQ	lbSkipBeginMusicPlay
		JSR	PlayGameBeginMusic

lbSkipBeginMusicPlay:			; ...
		JSR	SwitchPRGBank_2
		JSR	PlayGameTitles
; END OF FUNCTION CHUNK	FOR CheckDemoPlayControl
; START	OF FUNCTION CHUNK FOR WaitTitleScreen

SetupLevelLoop:				; ...
		JSR	WaitNMI_PRG6
		LDX	#$FF
		TXS
		LDA	#$64 ; 'd'
		STA	vDeathSceneTimer

SetupGameChoice:			; ...
		JSR	GetSavedRoomDataPtr
		LDA	vfDemoPlay
		BNE	_lbStartLevel
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BEQ	lbStartCurrentLevel
		JSR	SwitchPRGBank_4
		JSR	SetupPasswordRoom
		JMP	_lbStartLevel
; ---------------------------------------------------------------------------

lbStartCurrentLevel:			; ...
		STA	vfFreezePrince
		JSR	PlayMusic
		LDA	#0
		STA	vfWaitRestartLevel

_lbStartLevel:				; ...
		JMP	lbStartLevel
; END OF FUNCTION CHUNK	FOR WaitTitleScreen

; =============== S U B	R O U T	I N E =======================================


ResetRoomOffsetPtr:			; ...
		LDA	#0
		STA	v52
		STA	v53
		RTS
; End of function ResetRoomOffsetPtr


; =============== S U B	R O U T	I N E =======================================

; Input: A - room id
; Return: $52,$53 - offset of room id (from #00	room)

GetRoomPtrById:				; ...
		STA	vtmp_4BD
		JSR	ResetRoomOffsetPtr
		LDA	vtmp_4BD
		BEQ	lbGetRoomPtrByIdExit

lbGetRoomPtrByIdLoop:			; ...
		JSR	GetByteFromRoomData
		CMP	#$FF
		BNE	lbStepNextNonEmptyRoom
		LDA	v52
		CLC
		ADC	#1
		STA	v52
		JMP	lbIncHiRoomOffset
; ---------------------------------------------------------------------------

lbStepNextNonEmptyRoom:			; ...
		LDA	v52
		CLC
		ADC	#30
		STA	v52

lbIncHiRoomOffset:			; ...
		LDA	v53
		ADC	#0
		STA	v53
		DEC	vtmp_4BD
		BNE	lbGetRoomPtrByIdLoop

lbGetRoomPtrByIdExit:			; ...
		RTS
; End of function GetRoomPtrById


; =============== S U B	R O U T	I N E =======================================


GetLevelDataPtr:			; ...
		JSR	GetDoubleLevelId
		LDA	pLevelRoomData,X
		STA	vLevelDataPtr
		LDA	pLevelRoomData+1,X
		STA	vLevelDataPtr+1
		RTS
; End of function GetLevelDataPtr


; =============== S U B	R O U T	I N E =======================================


GetDoubleLevelId:			; ...
		LDA	vLevelNumber
		ASL	A
		TAX
		RTS
; End of function GetDoubleLevelId


; =============== S U B	R O U T	I N E =======================================


GetLevelHeaderDataPtr:			; ...
		JSR	GetDoubleLevelId
		LDA	pLevelHeaderData,X
		STA	vLevelDataPtr
		LDA	pLevelHeaderData+1,X
		STA	vLevelDataPtr+1
		RTS
; End of function GetLevelHeaderDataPtr


; =============== S U B	R O U T	I N E =======================================


GetLevelGeomDataPtr:			; ...
		JSR	GetDoubleLevelId
		LDA	pLevelGeomData,X
		STA	vLevelDataPtr
		LDA	pLevelGeomData+1,X
		STA	vLevelDataPtr+1
		RTS
; End of function GetLevelGeomDataPtr


; =============== S U B	R O U T	I N E =======================================


GetByteFromRoomData:			; ...
		JSR	GetLevelDataPtr
		LDA	v52
		CLC
		ADC	vLevelDataPtr
		STA	word_E
		LDA	v53
		ADC	vLevelDataPtr+1
		STA	word_E+1
		STY	vTmp_40b
		LDY	#0
		LDA	(word_E),Y
		LDY	vTmp_40b
		RTS
; End of function GetByteFromRoomData


; =============== S U B	R O U T	I N E =======================================


sub_7C111:				; ...
		LDA	vFallingHeight
		CMP	#6
		BCS	locret_7C138
		LDA	vPressedButtonAction
		BNE	locret_7C138
		STA	vfLockJoypad
		STA	v54
		STA	vfExternalRoomId
		LDA	vEnemy.nPose
		CMP	#pPrincePose10_offset2 - pPrincePosesLo
		BCC	loc_7C139
		CMP	#pPrincePose2B_offset -	pPrincePosesLo
		BCS	loc_7C139
		CMP	#pPrincePose1A_offset -	pPrincePosesLo
		BCC	locret_7C138
		CMP	#pPrincePose26_offset -	pPrincePosesLo
		BCC	loc_7C139

locret_7C138:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7C139:				; ...
		JSR	GetSavedRoomDataPtr
		LDA	vfSword
		CMP	#2
		BNE	loc_7C158
		LDX	#0
		LDA	vEnemy.nDirection
		BEQ	loc_7C14C
		LDX	#$38 ; '8'

loc_7C14C:				; ...
		JSR	sub_7FA60
		JSR	sub_7D147
		JSR	SwitchPRGBank_6
		JMP	loc_7C19E
; ---------------------------------------------------------------------------

loc_7C158:				; ...
		LDX	#$22 ; '"'
		LDA	vEnemy.nDirection
		BEQ	loc_7C161
		LDX	#$17

loc_7C161:				; ...
		JSR	sub_7FA60
		JSR	sub_7D147
		LDA	vEnemy.nAction
		CMP	#oaJumpUpAndBump
		BNE	loc_7C18A
		LDA	vEnemy.nPose
		CMP	#pPrincePose45_offset -	pPrincePosesLo
		BCC	loc_7C18A
		CMP	#pPrincePose4E_offset -	pPrincePosesLo
		BNE	locret_7C1A5
		JSR	MovePrinceUpFor1Floor
		BCS	loc_7C18A
		ADC	#$1E
		STA	vEnemyPlace
		JSR	GetTopBorderBlocks
		LDA	#1
		STA	v54

loc_7C18A:				; ...
		LDA	vRemoteActionPlace ; do	action at this place while it is not equal to 0xFF
		CMP	#$FF
		BEQ	loc_7C19E
		STA	vEnemyPlace
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBrokenPlate
		BNE	loc_7C19E
		STA	vfLockJoypad

loc_7C19E:				; ...
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBrokenPlate
		BEQ	loc_7C1A6

locret_7C1A5:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7C1A6:				; ...
		JSR	GetBitsForPlace
		BNE	locret_7C1A5
		JSR	GetBitsByRoomId	; input:
					;  $54 or $6f0 True - get by vDoorRoom id
					;  $4b1	- place	in room
					; return:
					;  $6D - array offset
					;  $6E (and A) - bit mask (2 bits)
					;  X - bits pattern id
		LDA	pObjectBitmaskLo,X
		STA	vLevelDataPtr+1
		JSR	SetBitsToObjectsBitsMask
		JSR	SwitchPRGBank_2
		JSR	SetupFallingPlateSlot

loc_7C1BC:				; ...
		JSR	SwitchPRGBank_2
		JSR	FallBrokenPlate
		JSR	SwitchPRGBank_6
		INC	vEnemyPlace
		JSR	GetBlockFromEnemyPlace
		CMP	#lbDoubleColumns
		BNE	loc_7C1DB
		LDX	vwEnemySlotOffset
		LDA	#>(pActionBrokenPlateWithPillar)
		STA	vEnemy.ptrAction+1,X
		LDA	#<(pActionBrokenPlateWithPillar)
		STA	vEnemy.ptrAction,X

loc_7C1DB:				; ...
		DEC	vEnemyPlace
		LDX	vwEnemySlotOffset
		LDY	vEnemyPlace
		LDA	v54
		BEQ	loc_7C1EA
		LDY	vDupEnemyPlace

loc_7C1EA:				; ...
		TYA
		STA	vEnemy.nUnknown4,X
		STY	vEnemyPlace
		JSR	SetupEnemyPlace	; vEnemyPlace -	is a place to be converted
					; vwEnemySlotOffset - offset of	slot to	write converted	point
		JSR	SwitchPRGBank_5
		LDX	vwEnemySlotOffset
		RTS
; End of function sub_7C111


; =============== S U B	R O U T	I N E =======================================


sub_7C1FA:				; ...
		LDA	#0
		LDX	#3

loc_7C1FE:				; ...
		STA	byte_419,Y
		STA	byte_420,Y
		INY
		DEX
		BNE	loc_7C1FE
		RTS
; End of function sub_7C1FA


; =============== S U B	R O U T	I N E =======================================

; renders holes	after fallen broken plates

RenderHoles:				; ...
		JSR	GetSavedRoomDataPtr
		LDA	#4
		STA	vSpriteOffsetX
		LDY	#$14

loc_7C212:				; ...
		STY	v66
		LDX	#$A

loc_7C216:				; ...
		STX	vwTmp_17
		STY	vwTmp_17+1
		STY	vEnemyPlace
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbBrokenPlate
		BNE	loc_7C22C
		JSR	GetBitsForPlace
		BNE	loc_7C22C
		JSR	RenderBlock

loc_7C22C:				; ...
		LDX	vwTmp_17
		LDY	vwTmp_17+1
		INY
		DEX
		BNE	loc_7C216
		LDA	v66
		SEC
		SBC	#$A
		BCS	loc_7C248
		JSR	GetSavedRoomDataPtr
		JSR	GetTopBorderBlocks
		LDA	#$14
		STA	v54
		STA	vfRoomScreenDraw

loc_7C248:				; ...
		TAY
		DEC	vSpriteOffsetX
		BNE	loc_7C212
		JMP	GetSavedRoomDataPtr
; End of function RenderHoles


; =============== S U B	R O U T	I N E =======================================


RenderBlock:				; ...
		LDA	#1
		STA	vfLowButton
		LDY	vwTmp_17+1
		DEY
		CPY	#$FF
		BEQ	loc_7C264
		CPY	#9
		BEQ	loc_7C264
		CPY	#$13
		BNE	loc_7C271

loc_7C264:				; ...
		TYA
		CLC
		ADC	#$A
		TAY
		JSR	GetLeftBorderBlocks ; vLevelDataPtr - pointer to blocks
					; vDoorRoom - left border room id
		LDA	vDoorRoom
		STA	vRoomId

loc_7C271:				; ...
		STY	vEnemyPlace
		STY	vtmpCounter4F
		JSR	GetBlockIdFromPtr ; Y -	place in room
		STA	vPreviousBlockId
		JSR	GetModifiedBlockDataPtr2122
		JSR	RenderBlock1
		JSR	SwitchPRGBank_6
		LDY	vwTmp_17+1
		INY
		STY	vtmpCounter4F
		TYA
		JSR	GetModifiedBlockDataPtr2122
		LDA	v54
		BEQ	loc_7C2A3
		LDX	#1
		LDY	vtmpCounter4F
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbBrickWall
		BNE	loc_7C29F
		LDX	#lbBrickWall

loc_7C29F:				; ...
		TXA
		JSR	GetBlockDataPtr2122 ; A	- block	id
					; return: $21,$22 - data ptr

loc_7C2A3:				; ...
		JSR	RenderBlock2
		LDA	v54
		BEQ	loc_7C2B8
		LDX	byte_499
		LDA	#0
		STA	v41D,X
		STA	v41E,X
		STA	v41F,X

loc_7C2B8:				; ...
		JSR	SwitchPRGBank_6
		JSR	SaveRoomDataPtr
		JSR	RenderBlockJoints
		JSR	RestoreRoomDataPtr
		LDA	byte_499
		CLC
		ADC	#$10
		STA	byte_499
		JSR	GetSavedRoomDataPtr
		LDA	#0
		STA	vfLowButton
		STA	vfVertBlock
		STA	v5F
		RTS
; End of function RenderBlock


; =============== S U B	R O U T	I N E =======================================


GetModifiedBlockDataPtr2122:		; ...
		STY	vSaveY
		TAY
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbBrokenPlate
		BNE	lbIsBrokenPlateOk
		JSR	GetBitsForPlace
		BEQ	lbIsBrokenPlateOk
		LDA	#lbSpace
		JMP	GetBlockDataPtr2122 ; A	- block	id
					; return: $21,$22 - data ptr
; ---------------------------------------------------------------------------

lbIsBrokenPlateOk:			; ...
		LDY	vSaveY
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbLowButton
		BNE	GetBlockDataPtr2122 ; A	- block	id
					; return: $21,$22 - data ptr
		LDA	#lbPlate
; End of function GetModifiedBlockDataPtr2122


; =============== S U B	R O U T	I N E =======================================

; A - block id
; return: $21,$22 - data ptr

GetBlockDataPtr2122:			; ...
		ASL	A
		TAX
		JSR	SwitchPRGBank_4
		LDA	vLevelType
		BNE	lbGetCastleBlockDataPtr2122
		LDA	pDungeonBlocksLibrary,X
		STA	v21
		LDA	pDungeonBlocksLibrary+1,X
		JMP	lbGetBlockDataPtr2122Exit
; ---------------------------------------------------------------------------

lbGetCastleBlockDataPtr2122:		; ...
		LDA	pPalaceBlocksLibrary,X
		STA	v21
		LDA	pPalaceBlocksLibrary+1,X

lbGetBlockDataPtr2122Exit:		; ...
		STA	v22
		JMP	SwitchPRGBank_6
; End of function GetBlockDataPtr2122


; =============== S U B	R O U T	I N E =======================================


GetBlockDataTileId:			; ...
		LDA	(v21),Y
		BEQ	lbGetBlockDataTileIdExit
		CLC
		ADC	vBlockPPUTileId

lbGetBlockDataTileIdExit:		; ...
		RTS
; End of function GetBlockDataTileId


; =============== S U B	R O U T	I N E =======================================


RenderBlock1:				; ...
		LDA	vEnemyPlace
		PHA
		LDY	vtmpCounter4F
		STY	vEnemyPlace
		JSR	FetchLevelCharsDataPtr
		JSR	CheckAndLoadLevelBlockChars ; vLevelBlocksCharsPtr - pointer to	block chars
					; Pointers and begin tile id will be placed at $0300 area
					; $75 -	first tile id at PPU char
		JSR	SwitchPRGBank_5
		PLA
		STA	vEnemyPlace
		JSR	GetBlockDataOffset
		TYA
		CLC
		ADC	#4
		TAY
		LDX	byte_499
		JSR	GetBlockDataTileId
		STA	byte_419,X
		INY
		JSR	GetBlockDataTileId
		STA	byte_419+1,X
		INY
		JSR	GetBlockDataTileId
		STA	byte_419+2,X
		JSR	GetBlockDataOffset
		TYA
		CLC
		ADC	#$B
		TAY
		JSR	GetBlockDataTileId
		STA	byte_420,X
		INY
		JSR	GetBlockDataTileId
		STA	byte_420+1,X
		INY
		LDA	(v21),Y
		BNE	loc_7C392
		LDA	vPreviousBlockId
		CMP	#lbCastleOverDoor
		BNE	loc_7C392
		LDA	#lbCastleOverDoor
		JSR	GetLevelBlockCharsDataPtr ; A -	block id
					; returns: vLevelBlocksCharsPtr	- pointer
		JSR	CheckAndLoadLevelBlockChars ; vLevelBlocksCharsPtr - pointer to	block chars
					; Pointers and begin tile id will be placed at $0300 area
					; $75 -	first tile id at PPU char
		JSR	SwitchPRGBank_5
		LDA	#<(pPalace_OverDoor)
		STA	v21
		LDA	#>(pPalace_OverDoor)
		STA	v22
		LDX	byte_499
		LDY	#7

loc_7C392:				; ...
		JSR	GetBlockDataTileId
		STA	byte_420+2,X
		RTS
; End of function RenderBlock1


; =============== S U B	R O U T	I N E =======================================


RenderBlock2:				; ...
		LDA	vEnemyPlace
		PHA
		LDY	vtmpCounter4F
		STY	vEnemyPlace
		JSR	FetchLevelCharsDataPtr
		JSR	CheckAndLoadLevelBlockChars ; vLevelBlocksCharsPtr - pointer to	block chars
					; Pointers and begin tile id will be placed at $0300 area
					; $75 -	first tile id at PPU char
		JSR	SwitchPRGBank_5
		PLA
		STA	vEnemyPlace
		JSR	GetBlockDataOffset
		LDX	byte_499
		JSR	GetBlockDataTileId
		STA	v41D,X
		INY
		JSR	GetBlockDataTileId
		STA	v41E,X
		INY
		JSR	GetBlockDataTileId
		STA	v41F,X
		JSR	GetBlockDataOffset
		TYA
		CLC
		ADC	#7
		TAY
		JSR	GetBlockDataTileId
		STA	v424,X
		INY
		JSR	GetBlockDataTileId
		STA	v425,X
		INY
		JSR	GetBlockDataTileId
		STA	v426_PADDING,X
		RTS
; End of function RenderBlock2


; =============== S U B	R O U T	I N E =======================================


GetBlockDataOffset:			; ...
		LDY	#0
		LDA	(v21),Y
		CMP	#4
		BNE	lbGetBlockDataOffset_7
		LDY	#$1D
		RTS
; ---------------------------------------------------------------------------

lbGetBlockDataOffset_7:			; ...
		CMP	#7
		BNE	lbGetBlockDataOffset_8
		LDY	#8
		RTS
; ---------------------------------------------------------------------------

lbGetBlockDataOffset_8:			; ...
		CMP	#8
		BNE	lbGetBlockDataOffset_Other
		LDY	#1
		RTS
; ---------------------------------------------------------------------------

lbGetBlockDataOffset_Other:		; ...
		LDY	#$39 ; '9'
		RTS
; End of function GetBlockDataOffset


; =============== S U B	R O U T	I N E =======================================


RenderBlockJoints:			; ...

; FUNCTION CHUNK AT C46C SIZE 0000005C BYTES

		LDA	#1
		STA	vfVertBlock
		LDA	v54
		BNE	loc_7C416
		LDA	vEnemyPlace
		CMP	#$14
		BCC	loc_7C416
		LDA	#1
		STA	v5F

loc_7C416:				; ...
		JSR	GetNextFloorBlockId
		STA	vCornerBlockId
		LDA	#0
		STA	v5E
		LDA	vPreviousBlockId
		ASL	A
		TAX
		JSR	SwitchPRGBank_2
		LDA	vLevelType
		BNE	lbRenderPalaceVertJoints
		LDA	pDungeonBlocksVertJoints,X
		STA	vptrBlockData
		LDA	pDungeonBlocksVertJoints+1,X
		JMP	lbRenderFindJointBlock
; ---------------------------------------------------------------------------

lbRenderPalaceVertJoints:		; ...
		LDA	pPalaceBlocksVertJoints,X
		STA	vptrBlockData
		LDA	pPalaceBlocksVertJoints+1,X

lbRenderFindJointBlock:			; ...
		STA	vptrBlockData+1
		JSR	SwitchPRGBank_6
		LDY	#0

lbRenderFindJointBlockLoop:		; ...
		LDA	(vptrBlockData),Y
		CMP	#$FF
		BEQ	lbRenderBlockJointsExit
		LDA	(vptrBlockData),Y
		CMP	vCornerBlockId
		BEQ	lbDoRenderBlockJoints
		INY
		INY
		INY
		INY
		JMP	lbRenderFindJointBlockLoop
; End of function RenderBlockJoints


; =============== S U B	R O U T	I N E =======================================

; Y - source offset (vptrBlockData)
; X - target offset ($419)

WriteBlockTilesPair:			; ...
		JSR	_SendBlockTileToBuffer
		JSR	_SendBlockTileToBuffer
; End of function WriteBlockTilesPair


; =============== S U B	R O U T	I N E =======================================


_SendBlockTileToBuffer:			; ...
		LDA	(vptrBlockData),Y
		BEQ	lbSendBlockTileToBufferExit
		CLC
		ADC	vBlockPPUTileId
		STA	byte_419,X

lbSendBlockTileToBufferExit:		; ...
		INY
		INX

lbRenderBlockJointsExit:		; ...
		RTS
; End of function _SendBlockTileToBuffer

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR RenderBlockJoints

lbDoRenderBlockJoints:			; ...
		JSR	LoadJointChars
		LDX	byte_499
		LDY	#0
		JSR	WriteBlockTilesPair ; Y	- source offset	(vptrBlockData)
					; X - target offset ($419)
		TXA
		CLC
		ADC	#4
		TAX
		JSR	WriteBlockTilesPair ; Y	- source offset	(vptrBlockData)
					; X - target offset ($419)
		LDA	vptrBlockData
		PHA
		LDA	vptrBlockData+1
		PHA
		LDA	vBlockPPUTileId
		PHA
		LDA	vCornerBlockId
		CMP	#lbCastleOverDoor
		BNE	loc_7C49F
		JSR	GetLevelBlockCharsDataPtr ; A -	block id
					; returns: vLevelBlocksCharsPtr	- pointer
		JSR	CheckAndLoadLevelBlockChars ; vLevelBlocksCharsPtr - pointer to	block chars
					; Pointers and begin tile id will be placed at $0300 area
					; $75 -	first tile id at PPU char
		LDX	byte_499
		LDA	#4
		CLC
		ADC	vBlockPPUTileId
		STA	byte_420+2,X

loc_7C49F:				; ...
		LDA	vCornerBlockId
		CMP	#lbBrickWall
		BNE	loc_7C4BE
		JSR	GetLevelBlockCharsDataPtr ; A -	block id
					; returns: vLevelBlocksCharsPtr	- pointer
		JSR	CheckAndLoadLevelBlockChars ; vLevelBlocksCharsPtr - pointer to	block chars
					; Pointers and begin tile id will be placed at $0300 area
					; $75 -	first tile id at PPU char
		LDX	byte_499
		LDY	#$F
		LDA	vLevelType
		BEQ	loc_7C4B7
		LDY	#1

loc_7C4B7:				; ...
		TYA
		CLC
		ADC	vBlockPPUTileId
		STA	byte_420+2,X

loc_7C4BE:				; ...
		PLA
		STA	vBlockPPUTileId
		PLA
		STA	vptrBlockData+1
		PLA
		STA	vptrBlockData
		RTS
; END OF FUNCTION CHUNK	FOR RenderBlockJoints

; =============== S U B	R O U T	I N E =======================================


sub_7C4C8:				; ...

; FUNCTION CHUNK AT C604 SIZE 00000082 BYTES
; FUNCTION CHUNK AT CB4C SIZE 00000067 BYTES

		LDA	#0
		STA	vCurrentFallingPlateHandlingOffset

loc_7C4CD:				; ...
		LDY	#0

loc_7C4CF:				; ...
		LDA	vCurrentFallingPlateHandlingOffset
		ASL	A
		ASL	A
		TAX
		LDA	#0
		STA	v54
		JSR	GetSavedRoomDataPtr
		LDA	vFallingPlateData.field_3,X
		CMP	#$FF
		BEQ	loc_7C517
		DEC	vFallingPlateData.field_3,X
		BNE	loc_7C514
		LDA	vFallingPlateData.fplPlace,X
		AND	#$7F ; ''
		STA	vEnemyPlace
		LDA	vFallingPlateData.fplRoom,X
		STA	vRoomId
		LDA	vFallingPlateData.fplPlace,X
		AND	#$80 ; 'Ä'
		BEQ	loc_7C509
		JSR	SwitchPRGBank_6
		JSR	GetTopBorderBlocks
		LDA	#1
		STA	v54
		JSR	MoveObjectDownFor2Floors

loc_7C509:				; ...
		JSR	IsObjectHiBitSet
		BNE	loc_7C51E
		JSR	UpdateObjectBits
		JMP	loc_7CB4C
; ---------------------------------------------------------------------------

loc_7C514:				; ...
		JMP	loc_7C51E
; ---------------------------------------------------------------------------

loc_7C517:				; ...
		LDA	vFallingPlateData.fplPlace,X
		CMP	#$FF
		BNE	loc_7C527

loc_7C51E:				; ...
		INC	vCurrentFallingPlateHandlingOffset
		INY
		CPY	#3
		BNE	loc_7C4CF
		RTS
; ---------------------------------------------------------------------------

loc_7C527:				; ...
		AND	#$7F ; ''
		STA	v49
		STA	vEnemyPlace
		STX	byte_4FA
		LDA	vFallingPlateData.fplRoom,X
		JSR	_GetCurrentRoomDataPtr
		JSR	GetBlockFromEnemyPlace
		BEQ	loc_7C564
		CMP	#lbBrokenPlate
		BEQ	loc_7C564
		STA	vtmp_4C0
		JSR	GetCurrentHandlingFallingPlate
		LDA	vFallingPlateData.fplPlace,X
		AND	#$80 ; 'Ä'
		BEQ	lbBrokenPlateBreaks
		JSR	GetCurrentHandlingFallingPlate
		CMP	#2
		BNE	loc_7C564
		LDA	byte_362
		CMP	#2
		BEQ	lbBrokenPlateBreaks
		INC	byte_362
		JMP	HideObject_4
; ---------------------------------------------------------------------------

lbBrokenPlateBreaks:			; ...
		JMP	_lbBrokenPlateBreaks
; ---------------------------------------------------------------------------

loc_7C564:				; ...
		JSR	GetCurrentHandlingFallingPlate
		CLC
		ADC	#1
		CMP	#3
		BCS	lbIncrementFallingPlateFloor
		STA	vFallingPlateData.fplFloorTimer,X
		JMP	loc_7C5AD
; ---------------------------------------------------------------------------

lbIncrementFallingPlateFloor:		; ...
		LDA	#0
		STA	vFallingPlateData.fplFloorTimer,X
		LDA	vFallingPlateData.fplPlace,X
		AND	#$80 ; 'Ä'
		STA	vwTmp_17
		LDA	vFallingPlateData.fplPlace,X
		AND	#$7F ; ''
		CLC
		ADC	#$A
		CMP	#$1D
		BCC	loc_7C5A8
		SBC	#30
		PHA
		LDA	vFallingPlateData.fplRoom,X
		ASL	A
		ASL	A
		TAY
		STX	vSaveY
		JSR	GetLevelGeomDataPtr
		INY
		INY
		INY
		LDA	(vLevelDataPtr),Y
		LDX	vSaveY
		SEC
		SBC	#1
		STA	vFallingPlateData.fplRoom,X
		PLA

loc_7C5A8:				; ...
		ORA	vwTmp_17
		STA	vFallingPlateData.fplPlace,X

loc_7C5AD:				; ...
		LDA	vFallingPlateData.fplFloorTimer,X
		ASL	A
		ASL	A
		ASL	A
		ASL	A
		STA	vCharsListId
		STX	vwEnemySlotOffset+1
		LDA	vFallingPlateData.fplPlace,X
		AND	#$7F ; ''
		PHA
		LDA	#4
		JSR	FindEnemy	; A - enemy ID
					; $49 -	unknown4
					;
					; returns:
					; X - slot offset
		STX	vwEnemySlotOffset
		PLA
		STA	vEnemy.nUnknown4,X
		STA	vEnemyPlace
		JSR	SetupEnemyPlace	; vEnemyPlace -	is a place to be converted
					; vwEnemySlotOffset - offset of	slot to	write converted	point
		LDA	vEnemy.YPos,Y
		CLC
		ADC	vCharsListId
		SEC
		SBC	#4
		STA	vEnemy.YPos,Y
		LDX	vwEnemySlotOffset+1
		LDA	vRoomId
		CMP	vFallingPlateData.fplRoom,X
		BEQ	loc_7C5E9
		LDA	#10
		STA	vEnemy.XPos+1,Y

loc_7C5E9:				; ...
		INC	vCurrentFallingPlateHandlingOffset
		JMP	loc_7C4CD
; End of function sub_7C4C8


; =============== S U B	R O U T	I N E =======================================


HideObject_4:				; ...
		LDA	#4
		JSR	FindEnemy	; A - enemy ID
					; $49 -	unknown4
					;
					; returns:
					; X - slot offset
		LDA	#2
		STA	vEnemy.XPos+1,X
		RTS
; End of function HideObject_4


; =============== S U B	R O U T	I N E =======================================


GetCurrentHandlingFallingPlate:		; ...
		LDA	vCurrentFallingPlateHandlingOffset
		ASL	A
		ASL	A
		TAX
		LDA	vFallingPlateData.fplFloorTimer,X
		RTS
; End of function GetCurrentHandlingFallingPlate

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7C4C8

_lbBrokenPlateBreaks:			; ...
		TYA
		PHA
		LDX	byte_4FA
		LDA	vFallingPlateData.fplRoom,X
		CMP	vRoomId
		BNE	lbSkipPrinceInjure
		LDA	vEnemy.nAction
		CMP	#oaBeginFalling
		BEQ	lbSkipPrinceInjure
		CMP	#oaRunning1
		BEQ	lbSkipPrinceInjure
		CMP	#oaInjureSitDown
		BEQ	lbSkipPrinceInjure
		CMP	#oaSittingDown
		BEQ	lbSkipPrinceInjure
		JSR	sub_7F649
		LDA	v49
		CMP	vEnemyPlace
		BNE	lbSkipPrinceInjure
		JSR	InjurePrinceByOnePoint

lbSkipPrinceInjure:			; ...
		PLA
		TAY
		JSR	SwitchPRGBank_2
		JSR	sub_2A789
		JSR	UpdateObjectBits
		JSR	GetSavedRoomDataPtr
		LDX	#seBreakSound
		JSR	PlaySound_Wrapper ; X -	sound id
		LDA	vRoomId
		CMP	vRoomGuardPlace
		BEQ	loc_7C64B

locret_7C64A:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7C64B:				; ...
		JSR	HideObject_4
		LDA	vtmp_4C0
		CMP	#2
		BEQ	locret_7C64A
		CMP	#$13
		BEQ	locret_7C64A
		CMP	#$F
		BEQ	locret_7C64A
		CMP	#6
		BEQ	locret_7C64A
		JSR	sub_7DD99
		JSR	sub_7C686
		STA	vtmp_4C0
		JSR	SwitchPRGBank_2
		JSR	sub_2ABE7
		JSR	SwitchPRGBank_5
		JSR	GetCurrentHandlingFallingPlate
		LDA	vFallingPlateData.fplRoom,X
		CMP	vRoomId
		BNE	loc_7C680
		INC	vfAllowRenderPushButtonAnim

loc_7C680:				; ...
		LDA	#1
		STA	byte_6D5
		RTS
; END OF FUNCTION CHUNK	FOR sub_7C4C8

; =============== S U B	R O U T	I N E =======================================


sub_7C686:				; ...
		JSR	GetSavedRoomDataPtr
		LDA	#0
		STA	v54
		DEC	vEnemyPlace
		JSR	CheckForBrokenPlate
		PHA
		INC	vEnemyPlace
		INC	vEnemyPlace
		JSR	CheckForBrokenPlate
		DEC	vEnemyPlace
		CMP	#lbPlateWithDebris
		BEQ	loc_7C6B0
		LDY	vEnemyPlace
		INY
		LDA	(vC),Y
		CMP	#lbPlateWithTorch
		BNE	loc_7C6B0
		LDA	#lbPlate

loc_7C6B0:				; ...
		AND	#$1F
		STA	vPreviousBlockId
		PHA
		JSR	GetLevelBlockCharsDataPtr ; A -	block id
					; returns: vLevelBlocksCharsPtr	- pointer
		JSR	CheckAndLoadLevelBlockChars ; vLevelBlocksCharsPtr - pointer to	block chars
					; Pointers and begin tile id will be placed at $0300 area
					; $75 -	first tile id at PPU char
		PLA
		JSR	GetBlockDataPtr2122 ; A	- block	id
					; return: $21,$22 - data ptr
		JSR	SwitchPRGBank_5
		INC	vEnemyPlace
		LDY	#0
		LDA	(v21),Y
		INY
		CMP	#8
		BEQ	loc_7C6E2
		CMP	#7
		BEQ	loc_7C6D8
		TYA
		CLC
		ADC	#$31 ; '1'
		TAY

loc_7C6D8:				; ...
		LDX	#4
		JSR	DumpBlockDataFromPtr
		TYA
		CLC
		ADC	#4
		TAY

loc_7C6E2:				; ...
		LDX	#$B
		JSR	DumpBlockDataFromPtr
		TYA
		CLC
		ADC	#4
		TAY
		LDX	#$12
		JSR	DumpBlockDataFromPtr
		PLA
		RTS
; End of function sub_7C686


; =============== S U B	R O U T	I N E =======================================

; vPrevBlockIdDataOffset - 2x(block id)

_LoadHorzJointForBlock:			; ...
		JSR	SwitchPRGBank_4
		LDX	vPrevBlockIdDataOffset
		LDA	vLevelType
		BNE	lbLoadHorzJointForPalace
		LDA	pDungeonBlocksHorzJoints,X
		STA	vptrBlockData
		LDA	pDungeonBlocksHorzJoints+1,X
		STA	vptrBlockData+1
		JMP	GetJointPtrForBlock ; Input:
					;    vptrBlockData - pointer to	block joints data
					; Output:
					;    $6D9 = 1 -	pattern	for supplied block not found
; ---------------------------------------------------------------------------

lbLoadHorzJointForPalace:		; ...
		LDA	pPalaceBlocksHorzJoints,X
		STA	vptrBlockData
		LDA	pPalaceBlocksHorzJoints+1,X
		STA	vptrBlockData+1
; End of function _LoadHorzJointForBlock


; =============== S U B	R O U T	I N E =======================================

; Input:
;    vptrBlockData - pointer to	block joints data
; Output:
;    $6D9 = 1 -	pattern	for supplied block not found

GetJointPtrForBlock:			; ...
		JSR	SwitchPRGBank_6
		LDY	#0

lbLoopSearchJointBlock:			; ...
		LDA	(vptrBlockData),Y
		CMP	#$FF
		BEQ	lbGetJointPtrForBlockExit
		LDA	(vptrBlockData),Y
		CMP	vPreviousBlockId
		BEQ	lbJointLoadChars
		INY
		INY
		INY
		INY
		JMP	lbLoopSearchJointBlock
; ---------------------------------------------------------------------------

lbGetJointPtrForBlockExit:		; ...
		LDA	#1
		STA	byte_6D9
		RTS
; ---------------------------------------------------------------------------

lbJointLoadChars:			; ...
		JMP	LoadJointChars
; End of function GetJointPtrForBlock


; =============== S U B	R O U T	I N E =======================================

; Y - offset of	block data
; X - offset to	write

DumpBlockDataFromPtr:			; ...
		JSR	DumpBlockDataByte
		JSR	DumpBlockDataByte
		JMP	DumpBlockDataByte
; End of function DumpBlockDataFromPtr


; =============== S U B	R O U T	I N E =======================================


DumpBlockDataByte:			; ...
		LDA	(v21),Y
		BEQ	lbSkipDumpBlockDataByte
		CLC
		ADC	vBlockPPUTileId
		STA	vPasswordChars+5,X

lbSkipDumpBlockDataByte:		; ...
		INY
		INX
		RTS
; End of function DumpBlockDataByte


; =============== S U B	R O U T	I N E =======================================


GetCurrentRoomDataPtr_PRG6:		; ...
		JSR	SwitchPRGBank_6

lbGetCurrentRoomDataPtr:		; ...
		LDA	vRoomId
		JMP	_GetCurrentRoomDataPtr
; End of function GetCurrentRoomDataPtr_PRG6

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7D7EC

loc_7C754:				; ...
		LDA	vfLockJoypad
		BNE	locret_7C760
		LDA	vEnemy.nUnknown1
		CMP	#1
		BNE	loc_7C761

locret_7C760:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7C761:				; ...
		LDX	#$28 ; '('
		LDA	vEnemy.XPos+1
		BNE	loc_7C771
		LDA	vEnemy.XPos
		CMP	#$3C ; ''
		BCS	loc_7C771
		LDX	#$24 ; '$'

loc_7C771:				; ...
		LDA	vEnemy.nDirection
		BEQ	loc_7C778
		LDX	#$C

loc_7C778:				; ...
		JSR	sub_7C790
		LDA	vEnemy.nAction
		CMP	#oaJumpUpAndSwing1
		BEQ	locret_7C786
		CMP	#oaJumpUpAndSwing2
		BNE	loc_7C787

locret_7C786:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7C787:				; ...
		LDX	#$10
		LDA	vEnemy.nDirection
		BEQ	sub_7C790
		LDX	#9
; END OF FUNCTION CHUNK	FOR sub_7D7EC

; =============== S U B	R O U T	I N E =======================================


sub_7C790:				; ...

; FUNCTION CHUNK AT C8FB SIZE 00000011 BYTES

		STX	byte_4EE
		JSR	GetSavedRoomDataPtr
		JSR	sub_7FA60
		JSR	sub_7D147
		LDA	vEnemyPlace
		STA	byte_4B3
		JSR	SaveRoomDataPtr
		LDA	#0
		STA	vSpriteOffsetY
		LDA	vEnemy.YPos
		CMP	#$48 ; 'H'
		BCS	loc_7C7C1
		JSR	GetTopBorderBlocks
		LDA	#1
		STA	v54
		STA	vSpriteOffsetY
		JSR	MoveObjectDownFor2Floors
		JMP	loc_7C7C4
; ---------------------------------------------------------------------------

loc_7C7C1:				; ...
		JSR	MovePrinceUpFor1Floor

loc_7C7C4:				; ...
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBrokenPlate
		BNE	loc_7C7D0
		JSR	GetBitsForPlace
		BNE	locret_7C7EF

loc_7C7D0:				; ...
		JSR	GetBlockFromEnemyPlace
		CMP	#lbCastleArchColumnPart
		BEQ	locret_7C7EF
		CMP	#lbCastleSmallArch
		BEQ	locret_7C7EF
		CMP	#lbCastleLeftPartBigArch
		BEQ	locret_7C7EF
		CMP	#lbCastleRightPartBigArch
		BEQ	locret_7C7EF
		CMP	#lbBigColumnHighPart
		BEQ	locret_7C7EF
		CMP	#lbCastleOverDoor
		BEQ	locret_7C7EF
		CMP	#lbSpace
		BNE	loc_7C7F3

locret_7C7EF:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7C7F0:				; ...
		JMP	loc_7C8FB
; ---------------------------------------------------------------------------

loc_7C7F3:				; ...
		LDA	byte_4EE
		CMP	#$10
		BEQ	loc_7C7F0
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBrickWall
		BEQ	loc_7C7F0
		CMP	#lbBigColumnHighPart
		BEQ	locret_7C7EF
		CMP	#lbCastleOverDoor
		BEQ	locret_7C7EF
		CMP	#lbCastleOverDoorWithPlate
		BEQ	loc_7C7F0
		INC	vEnemyPlace
		LDA	vEnemy.XPos+1
		BNE	loc_7C834
		LDA	vEnemy.XPos
		CMP	#$46 ; 'F'
		BCS	loc_7C834
		LDA	vEnemyPlace
		CMP	#$A
		BEQ	loc_7C82B
		CMP	#$14
		BEQ	loc_7C82B
		CMP	#$1E
		BNE	loc_7C834

loc_7C82B:				; ...
		SEC
		SBC	#$A
		STA	vEnemyPlace
		JSR	GetSavedRoomDataPtr

loc_7C834:				; ...
		LDA	vEnemy.nDirection
		BEQ	loc_7C85B
		LDA	vEnemy.XPos+1
		BNE	loc_7C848
		LDA	vEnemy.XPos
		CMP	#$20 ; ' '
		BCS	loc_7C848
		JMP	loc_7C8FB
; ---------------------------------------------------------------------------

loc_7C848:				; ...
		DEC	vEnemyPlace
		LDA	vEnemyPlace
		BEQ	loc_7C85B
		CMP	#$A
		BEQ	loc_7C85B
		CMP	#$14
		BEQ	loc_7C85B
		DEC	vEnemyPlace

loc_7C85B:				; ...
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBrokenPlate
		BNE	loc_7C867
		JSR	GetBitsForPlace
		BNE	loc_7C86F

loc_7C867:				; ...
		JSR	GetBlockIdFromPtr ; Y -	place in room
		BEQ	loc_7C86F
		JMP	loc_7C8FB
; ---------------------------------------------------------------------------

loc_7C86F:				; ...
		LDA	vSpriteOffsetY
		BEQ	loc_7C887
		JSR	GetSavedRoomDataPtr
		LDA	vEnemyPlace
		SEC
		SBC	#$14
		TAY
		LDA	vDupEnemyPlace
		STA	vEnemyPlace
		JMP	loc_7C893
; ---------------------------------------------------------------------------

loc_7C887:				; ...
		LDA	vDupEnemyPlace
		STA	vEnemyPlace
		JSR	RestoreRoomDataPtr
		LDY	byte_4B3

loc_7C893:				; ...
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbBrickWall
		BEQ	loc_7C8AB
		LDY	#$20 ; ' '
		LDA	vEnemy.nDirection
		BNE	loc_7C8A3
		LDY	#$3A ; ':'

loc_7C8A3:				; ...
		JSR	MovePrinceHorz	; Y - offset to	move
		LDA	#oaJumpUpAndSwing1
		JMP	loc_7C8C7
; ---------------------------------------------------------------------------

loc_7C8AB:				; ...
		LDY	#$E
		LDA	vEnemy.nDirection
		BNE	loc_7C8C2
		LDY	#$40 ; '@'
		LDA	vEnemy.XPos+1
		BNE	loc_7C8C2
		LDA	vEnemy.XPos
		CMP	#$32 ; '2'
		BCS	loc_7C8C2
		LDY	#$20 ; ' '

loc_7C8C2:				; ...
		JSR	MovePrinceHorz	; Y - offset to	move
		LDA	#oaJumpUpAndSwing2

loc_7C8C7:				; ...
		JMP	SetupPrinceAction
; End of function sub_7C790


; =============== S U B	R O U T	I N E =======================================


MoveObjectDownFor2Floors:		; ...
		LDA	vEnemyPlace
		CLC
		ADC	#$14
		STA	vEnemyPlace

locret_7C8D3:				; ...
		RTS
; End of function MoveObjectDownFor2Floors


; =============== S U B	R O U T	I N E =======================================

; Y - offset to	move

MovePrinceHorz:				; ...
		TYA
		LDX	#$40 ; '@'
		JMP	SetupPrincePosition ; A	- additional for X
; End of function MovePrinceHorz	; X - additional for Y
					; vEnemyPlace -	position in room

; =============== S U B	R O U T	I N E =======================================


sub_7C8DA:				; ...
		JSR	sub_7D499
		JSR	MovePrinceUpFor1Floor
		BCS	loc_7C8EE
		ADC	#$1E
		STA	vEnemyPlace
		JSR	GetTopBorderBlocks
		LDA	#1
		STA	v54

loc_7C8EE:				; ...
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBrokenPlate
		BNE	loc_7C8F8
		JMP	GetBitsForPlace
; ---------------------------------------------------------------------------

loc_7C8F8:				; ...
		LDA	#0
		RTS
; End of function sub_7C8DA

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7C790

loc_7C8FB:				; ...
		JSR	sub_7C8DA
		BNE	locret_7C8D3
		LDA	byte_4EE
		CMP	#$20 ; ' '
		BCS	locret_7C915
		LDA	#oaJumpUpAndBump
		JMP	SetupPrinceAction
; END OF FUNCTION CHUNK	FOR sub_7C790

; =============== S U B	R O U T	I N E =======================================


MovePrinceUpFor1Floor:			; ...
		LDA	vEnemyPlace
		SEC
		SBC	#$A
		STA	vEnemyPlace

locret_7C915:				; ...
		RTS
; End of function MovePrinceUpFor1Floor


; =============== S U B	R O U T	I N E =======================================


IncrementCharsLoopOffset:		; ...
;		LDA	vtmpCounter4F
		.BYTE	$AD, $4F, $00
		CLC
		ADC	#2
		BCC	lbSkipIncHiPtr
		INC	vEncodedPointerDataPtr+1

lbSkipIncHiPtr:				; ...
;		STA	vtmpCounter4F
		.BYTE	$8D, $4F, $00

lbExitProc:				; ...
		RTS
; End of function IncrementCharsLoopOffset


; =============== S U B	R O U T	I N E =======================================


PlayDoorAnim:				; ...
		LDA	#<(vAnimBlock)
		STA	v21
		LDA	#>(vAnimBlock)
		STA	v22
		LDA	vfDisabledBlockAction
		BNE	lbExitProc
		LDA	#0
		STA	vDoorPlacedCounter
		STA	word_47

lbPlayDoorAnimLoop:			; ...
		LDA	#0
		STA	v54
		LDY	word_47
		LDA	(v21),Y
		CMP	#$FF
		BEQ	lbExitProc
		LDA	(v21),Y
		CMP	#2
		BNE	lbAnimDoorContinue
		LDA	word_47
		CLC
		ADC	#9
		TAY
		LDA	(v21),Y
		STA	vEnemyPlace
		TAY
		JSR	GetSavedRoomDataPtr
		LDA	vLevelType
		BNE	lbCheckForLeftBorder
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbDoubleColumns ; here	we check for right neighbor of door
					; but... really	if door	in our room, we	found door itself!
					; How can we check that	neighbor is pillar?
		BEQ	lbCheckForLeftBorder
		CMP	#lbPlateWithTorch
		BEQ	loc_7C96F
		INY
		JSR	GetBlockIdFromPtr ; Y -	place in room
		BEQ	lbCheckForLeftBorder

loc_7C96F:				; ...
		INC	vDoorPlacedCounter
		LDX	vDoorPlacedCounter
		LDA	vEnemyPlace
		STA	vDoorPlacedPlaces,X

lbCheckForLeftBorder:			; ...
		LDA	vEnemyPlace
		BEQ	lbLeftBorderRender
		CMP	#10
		BEQ	lbLeftBorderRender
		CMP	#20
		BNE	lbMiddleRoomRender

lbLeftBorderRender:			; ...
		LDA	#1
		STA	v54
		JSR	GetRightSideOfLeftRoom

lbMiddleRoomRender:			; ...
		LDA	word_47
		CLC
		ADC	#4
		TAY
		STA	vCharsListId
		JSR	IsObjectHiBitSet
		BEQ	lbAnimClosingDoor
		JSR	IncDoorOpeningAnimCounter
		JMP	lbAnimDoorContinue
; ---------------------------------------------------------------------------

lbAnimClosingDoor:			; ...
		JSR	IsObjectLoBitSet
		BEQ	lbAnimDoorContinue
		JSR	sub_7C9CB

lbAnimDoorContinue:			; ...
		JSR	IncrementAnimBlockOffset
		JMP	lbPlayDoorAnimLoop
; End of function PlayDoorAnim


; =============== S U B	R O U T	I N E =======================================


IncrementAnimBlockOffset:		; ...
		LDA	word_47
		CLC
		ADC	#$A
		STA	word_47

lbIncDoorOpeningAnimCounterExit:	; ...
		RTS
; End of function IncrementAnimBlockOffset


; =============== S U B	R O U T	I N E =======================================


IncDoorOpeningAnimCounter:		; ...
		LDY	vCharsListId
		LDA	(v21),Y
		CMP	#$2E ; '.'
		BCS	lbIncDoorOpeningAnimCounterExit
		STA	byte_4F3
		CLC
		ADC	#2
		STA	(v21),Y
		JMP	lbIncOpeningDoorSoundCounter
; End of function IncDoorOpeningAnimCounter


; =============== S U B	R O U T	I N E =======================================


sub_7C9CB:				; ...
		LDY	vCharsListId
		LDA	(v21),Y
		CMP	#$2F ; '/'
		BCC	loc_7C9D8
		LDA	#0
		STA	(v21),Y

locret_7C9D7:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7C9D8:				; ...
		CMP	#$18
		BCS	locret_7C9D7

lbIncOpeningDoorSoundCounter:		; ...
		INC	vOpeningDoorSoundCounter
		LDA	vOpeningDoorSoundCounter
		AND	#1
		BEQ	lbPlayOpeningDoorSoundNote

locret_7C9E6:				; ...
		RTS
; ---------------------------------------------------------------------------

lbPlayOpeningDoorSoundNote:		; ...
		LDA	vLevelStatusText
		CMP	#$20 ; ' '
		BCS	locret_7C9E6
		LDX	#seOpeningDoor
		JSR	PlaySound_Wrapper ; X -	sound id
		LDX	#seDoorMechanism
		JMP	PlaySound_Wrapper ; X -	sound id
; End of function sub_7C9CB


; =============== S U B	R O U T	I N E =======================================


GetRightSideOfLeftRoom:			; ...
		JSR	GetLeftBorderBlocksPtr
; End of function GetRightSideOfLeftRoom


; =============== S U B	R O U T	I N E =======================================


IncrementPlaceFloor:			; ...
		LDA	vEnemyPlace
		CLC
		ADC	#9
		STA	vEnemyPlace
		RTS
; End of function IncrementPlaceFloor


; =============== S U B	R O U T	I N E =======================================


FindDoorLink:				; ...
		LDY	#$1B		; skip main level header
		STY	v54
		JSR	GetLevelHeaderDataPtr

lbNextDoorLink:				; ...
		STY	vSpriteOffsetX
		LDA	(vLevelDataPtr),Y
		CMP	#$FF
		BNE	lbCheckRoomDoorLink
		JMP	lbFindDoorLinkExit
; ---------------------------------------------------------------------------

lbCheckRoomDoorLink:			; ...
		SEC
		SBC	#1
		CMP	vRoomId
		BEQ	lbCheckButtonPlace
		JMP	lbFindDoorLinkIncOffset
; ---------------------------------------------------------------------------

lbCheckButtonPlace:			; ...
		INY
		LDA	(vLevelDataPtr),Y
		CMP	vEnemyPlace
		BNE	lbFindDoorLinkIncOffset
		INY
		LDA	(vLevelDataPtr),Y
		BNE	lbIsLinkOpensDoor
		STA	vRoomGuardPlace
		JMP	lbFindLinkTarget
; ---------------------------------------------------------------------------

lbIsLinkOpensDoor:			; ...
		STA	vRoomGuardPlace

lbFindLinkTarget:			; ...
		INY
		LDA	(vLevelDataPtr),Y
		SEC
		SBC	#1
		STA	vDoorRoom
		INY
		LDA	vEnemyPlace
		PHA
		LDA	(vLevelDataPtr),Y
		STA	vEnemyPlace
		LDA	vLevelDataPtr
		PHA
		LDA	vLevelDataPtr+1
		PHA
		LDA	vPressedButtonBlockId
		CMP	#lbHighButton|Modifier_04 ; Is the button for infinite opened door?
		BEQ	lbSkipSetupDoorTimer
		LDA	vFallingPlateCheckPlace
		CMP	#$FF		; Is the button	pushed by fallen plate?	So door	will be	opened for infinite
		BNE	lbSkipSetupDoorTimer
		JSR	SwitchPRGBank_2
		JSR	SetupOpenedDoorTimer

lbSkipSetupDoorTimer:			; ...
		JSR	SwitchPRGBank_6
		JSR	GetBitsByRoomId	; input:
					;  $54 or $6f0 True - get by vDoorRoom id
					;  $4b1	- place	in room
					; return:
					;  $6D - array offset
					;  $6E (and A) - bit mask (2 bits)
					;  X - bits pattern id
		STX	vwTmp_17
		LDA	pObjectBitmask,X
		EOR	#$FF
		STA	vtmp_4C0
		LDX	vLevelDataPtr
		LDA	vObjectsMasks,X
		AND	vtmp_4C0
		STA	vObjectsMasks,X
		LDX	vwTmp_17
		LDA	pObjectBitmaskHi,X
		STA	vLevelDataPtr+1
		LDA	vRoomGuardPlace
		BNE	loc_7CA90
		LDA	pObjectBitmaskLo,X
		STA	vLevelDataPtr+1

loc_7CA90:				; ...
		JSR	SetBitsToObjectsBitsMask
		PLA
		STA	vLevelDataPtr+1
		PLA
		STA	vLevelDataPtr
		PLA
		STA	vEnemyPlace

lbFindDoorLinkIncOffset:		; ...
		LDA	vSpriteOffsetX
		CLC
		ADC	#5
		TAY
		JMP	lbNextDoorLink
; End of function FindDoorLink


; =============== S U B	R O U T	I N E =======================================


CheckAnimObjState_Cutters:		; ...
		LDA	#3		; 3 - width of cutters block
		JMP	lbDoCheckAnimObjState
; End of function CheckAnimObjState_Cutters


; =============== S U B	R O U T	I N E =======================================


CheckAnimObjState_Door:			; ...
		LDA	#2		; this is a width of door animation object

lbDoCheckAnimObjState:			; ...
		STA	vRoomGuardPlace
		JSR	SwitchPRGBank_4
		JSR	_CheckAnimObjectState ;	vRoomGuardPlace	- object width (identifying object) to check
					; vDupEnemyPlace - place to check
					;
					; return: A - state found (frame_id), X=1 if found
		PHA
		LDA	#6
		STA	vSelectedPRGBank
		STA	pBankList+6
		PLA

lbFindDoorLinkExit:			; ...
		RTS
; End of function CheckAnimObjState_Door


; =============== S U B	R O U T	I N E =======================================


PseudoRandomGen:			; ...
		STY	vSaveY
		JSR	UnsafeSwitchPRGBank_2
		JSR	_PseudoRandomGen
		JSR	_RevertPRGBank
		LDA	vPseudoRandomGenResult
		LDY	vSaveY
; End of function PseudoRandomGen

; START	OF FUNCTION CHUNK FOR CloseEnterDoorSound2

lbPseudoRandomGenExit:			; ...
		RTS
; END OF FUNCTION CHUNK	FOR CloseEnterDoorSound2

; =============== S U B	R O U T	I N E =======================================


CloseEnterDoorSound2:			; ...

; FUNCTION CHUNK AT CAD1 SIZE 00000001 BYTES

		LDA	vfExitDoorAnimation
		CMP	#2
		BNE	lbPseudoRandomGenExit
		JMP	lbCheckIsNotChoiceLevel
; End of function CloseEnterDoorSound2


; =============== S U B	R O U T	I N E =======================================


CloseEnterDoorSound1:			; ...
		LDA	vfExitDoorAnimation
		CMP	#1
		BNE	lbEnterDoorExit

lbCheckIsNotChoiceLevel:		; ...
		LDA	vRoomId
		CMP	#2
		BNE	lbPlayCloseEnterDoorSound
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BNE	lbEnterDoorExit

lbPlayCloseEnterDoorSound:		; ...
		LDA	vLevelStatusText
		CMP	#$20 ; ' '
		BEQ	lbEnterDoorExit
		LDX	#seBrokenPlateWave
		JSR	PlaySound_Wrapper ; X -	sound id

lbEnterDoorExit:			; ...
		JMP	SwitchPRGBank_2
; End of function CloseEnterDoorSound1


; =============== S U B	R O U T	I N E =======================================

; A - action id
; Y - slot offset

SetupEnemyAction_Wrapper:		; ...
		JSR	SetupEnemyAction ; A - action id
; End of function SetupEnemyAction_Wrapper ; Y - slot offset


; =============== S U B	R O U T	I N E =======================================


SwitchPRGBank_2:			; ...
		LDA	#2
		JMP	SwitchPRGBank
; End of function SwitchPRGBank_2


; =============== S U B	R O U T	I N E =======================================

; A - action id
; Y - slot offset

SetupEnemyAction:			; ...
		PHA
		JSR	SwitchPRGBank_5
		PLA
		JMP	_SetupEnemyAction ; A -	action id
; End of function SetupEnemyAction	; Y - slot offset


; =============== S U B	R O U T	I N E =======================================


PlayGameBeginMusic:			; ...
		JSR	GetSavedRoomDataPtr
		LDA	vfEnableMusic
		BNE	loc_7CB1A
		LDA	#mGameBegin
		JSR	PlayMusic

loc_7CB1A:				; ...
		JMP	SwitchPRGBank_2
; End of function PlayGameBeginMusic

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR CheckRoomGoingOut

lbInitAndStartLevel:			; ...
		JSR	SwitchPRGBank_2
		JSR	ShowNewLevelPassword
		JSR	GetSavedRoomDataPtr
		LDA	#mLevel
		JSR	PlayMusic

lbStartLevel:				; ...
		JSR	GetSavedRoomDataPtr
		LDX	vLevelNumber
		LDA	pLevelType,X
		STA	vLevelType
		JSR	SetupPrinceFromHeader
		JSR	SetupLevelGuardsArrayFromHeader
		JSR	SetupVariousLevelStuff
		JMP	LevelLoop
; END OF FUNCTION CHUNK	FOR CheckRoomGoingOut
; ---------------------------------------------------------------------------
pLevelCoreRoutines:.WORD sbrCoreRoutine_00 ; ...
		.WORD sbrCoreRoutine_01
		.WORD sbrCoreRoutine_02
		.WORD sbrCoreRoutine_03
		.WORD sbrCoreRoutine_04
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7C4C8

loc_7CB4C:				; ...
		JSR	SwitchPRGBank_2
		JSR	loc_2AD61
		JSR	SwitchPRGBank_6
		INC	vEnemyPlace
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBrokenPlate
		BNE	loc_7CB75
		JSR	GetBitsForPlace
		BEQ	loc_7CB75
		JSR	SwitchPRGBank_4
		JSR	sub_4B9DA
		TYA
		CLC
		ADC	#4
		TAY
		JSR	sub_7C1FA
		JSR	SwitchPRGBank_6

loc_7CB75:				; ...
		DEC	vEnemyPlace
		DEC	vEnemyPlace
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBrokenPlate
		BNE	loc_7CB90
		JSR	GetBitsForPlace
		BEQ	loc_7CB90
		JSR	SwitchPRGBank_4
		JSR	sub_4B9DA
		JSR	sub_7C1FA

loc_7CB90:				; ...
		INC	vEnemyPlace
		INC	v12
		LDA	vEnemyPlace
		AND	#$7F ; ''
		STA	vEnemyPlace
		LDA	v54
		BEQ	locret_7CBB2
		JSR	SwitchPRGBank_4
		JSR	sub_4B9DA
		LDA	#0
		LDX	#3

loc_7CBAB:				; ...
		STA	byte_419,Y
		INY
		DEX
		BNE	loc_7CBAB

locret_7CBB2:				; ...
		RTS
; END OF FUNCTION CHUNK	FOR sub_7C4C8
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR CheckRoomGoingOut

LevelLoop:				; ...
		LDX	#0
		STX	vPPU_CR_2
		STX	PPU_CR_2	; PPU Control Register #2 (W)
					;
					; D7-D5: Full Background Colour	(when D0 == 1)
					; D7-D5: Colour	Intensity (when	D0 == 0)
					;    D4: Sprite	Visibility
					;    D3: Background Visibility
					;    D2: Sprite	Clipping
					;    D1: Background Clipping
					;    D0: Display Type
		DEX
		TXS
		STX	vfSkipNMI
		JSR	WaitNMI_PRG6
		JSR	SwitchPRGBank_5
		JSR	InitLevelVars
		JSR	LoadBgSpriteTiles ; writes tiles that will hides prince. Like columns, bricks, etc...
		JSR	SwitchPRGBank_4
		JSR	CheckAndSetupRoomGuard
		JSR	HideSprites
		LDA	#1
		STA	vfSpriteAnimation
		JSR	SwitchPRGBank_2
		JSR	CheckAndSetupLevelsScripts
		JSR	SwitchPRGBank_5
		JSR	SetupWavingPlateObject
		JSR	InitAndPreloadJoints
		JSR	SwitchPRGBank_2
		JSR	nullsub_1
		JSR	RenderExitDoor
		JSR	ResetupLevel1GuardPalette
		JSR	LoadExitDoorTiles
		JSR	LoadPasswordRoomSpecialChars
		JSR	InitGuardsDefaults
		JSR	SwitchPRGBank_4
		JSR	SetupAnimatedBlocksAttributes
		JSR	InitDoorsRoomBits
		JSR	SwitchPRGBank_4
		JSR	CheckStatusOrShowTimer
		JSR	ParseAnimationBlocks
		JSR	StartExitDoorAnimation
		JSR	ShowTextLegend
		JSR	SwitchPRGBank_5
		JSR	InitHealthBar

lbLevelLoop:				; ...
		JSR	WaitNMI_PRG6
		JSR	SwitchPRGBank_5
		JSR	CheckRoomGoingOut
		JSR	SwitchPRGBank_2
		JSR	CheckDemoPlayControl
		JSR	SwitchPRGBank_5
		JSR	LevelCoreRoutines
		JSR	SwitchPRGBank_5
		JSR	WaitHealthBarScanline
		JSR	SwitchPRGBank_4
		JSR	CheckForPause
		JSR	SwitchPRGBank_2
		JSR	CheckForLevelRestart
		JSR	CheckAndWalkPrinceAtLevel14
		JMP	lbLevelLoop
; END OF FUNCTION CHUNK	FOR CheckRoomGoingOut
; ---------------------------------------------------------------------------

sbrCoreRoutine_00:			; ...
		LDA	#1
		STA	vfAllowRenderAnimBg
		JSR	sub_7CD1F
		JSR	DoObjectAction

loc_7CC51:				; ...
		INC	vLevelCoreRoutineId
		RTS
; ---------------------------------------------------------------------------

sbrCoreRoutine_01:			; ...
		JSR	sub_7C111
		JSR	sub_7C4C8
		JSR	sub_7D867
		JSR	SwitchPRGBank_5
		JSR	SwitchPrincePPUPtr
		JMP	loc_7CCC0
; ---------------------------------------------------------------------------

sbrCoreRoutine_02:			; ...
		LDA	vfGuardPresent
		BEQ	loc_7CCD4
		STA	vfAllowRenderAnimBg
		JSR	SwitchPRGBank_2
		JSR	sub_2A962
		JSR	SwitchPRGBank_5
		LDA	byte_4F9
		CMP	#2
		BCC	loc_7CC84
		LDA	vEnemy.nPose+$E
		CMP	#$B9 ; 'π'
		BEQ	loc_7CCD4

loc_7CC84:				; ...
		LDA	vfMirrorPresent
		BNE	loc_7CCAB
		JSR	sub_58038
		LDA	vfSword
		CMP	#2
		BEQ	loc_7CC98
		JSR	CheckObjectsDistance
		BCS	loc_7CCAB

loc_7CC98:				; ...
		JSR	SwitchPRGBank_4
		JSR	sub_4ABC9
		LDA	vfSword
		CMP	#2
		BNE	loc_7CCAB
		JSR	SwitchPRGBank_2
		JSR	DoSpritesShuffle

loc_7CCAB:				; ...
		INC	vPrincePPUHi
		LDA	#$10
		STA	vPrincePPULo
		LDX	#1
		LDY	#0
		STY	v52
		LDY	#1
		LDA	vfMirrorPresent
		BEQ	loc_7CCC0
		LDY	#0

loc_7CCC0:				; ...
		STY	vSpriteOffsetX
		LDA	#<(vPrinceChars)
		STA	vPrinceCharsPPUPtr ; RAM/PPU ptr to buffer to write
		LDA	#>(vPrinceChars)
		STA	vPrinceCharsPPUPtr+1 ; RAM/PPU ptr to buffer to	write
		JSR	DecodeTilesToRAM
		LDA	#1
		STA	vfRenderPrinceTiles
		JMP	loc_7CC51
; ---------------------------------------------------------------------------

loc_7CCD4:				; ...
		INC	vLevelCoreRoutineId

sbrCoreRoutine_03:			; ...
		JSR	CheckForPlayerDeath
		JSR	sub_7EFF2
		LDA	#1
		STA	vfAllowRenderAnimBg
		JSR	SwitchPRGBank_2
		JSR	sub_2AF7F
		JSR	SwitchPRGBank_4
		JSR	TimerCoreRoutines
		JMP	loc_7CC51
; ---------------------------------------------------------------------------

sbrCoreRoutine_04:			; ...
		JSR	HandleFalling
		JSR	sub_7D17A
		JSR	sub_7D9E0
		JSR	sub_7FA91
		JSR	CloseEnterDoorSound1
		JSR	CloseEnterDoorSound2
		JSR	PlayDoorAnim
		JSR	SwitchPRGBank_2
		JSR	CheckDoorsTimeouts
		JSR	loc_2AB89
		JSR	CheckForMirrorImage
		JSR	SwitchPRGBank_2
		JSR	loc_2B86A
		JSR	SwitchPRGBank_4
		JSR	ParseAnimationBlocks
		JMP	loc_4BB37

; =============== S U B	R O U T	I N E =======================================


sub_7CD1F:				; ...
		JSR	SwitchPRGBank_2
		JSR	loc_2AE2E
		JSR	loc_7D164
		JSR	HideObjects_xE
		JSR	GetSavedRoomDataPtr
		LDA	vEnemy.nDirection
		BEQ	loc_7CD5E
		LDA	vEnemy.YPos
		CMP	#$41 ; 'A'
		BCS	loc_7CD5E
		LDA	byte_4CB
		BNE	loc_7CD44
		LDA	v405
		BEQ	loc_7CD5E

loc_7CD44:				; ...
		LDA	vEnemyPlace
		PHA
		LDA	vDupEnemyPlace
		STA	vEnemyPlace
		INC	vEnemyPlace
		JSR	sub_7CF1A
		JSR	IncrementObjectSlotOffsetIfLess2
		PLA
		STA	vEnemyPlace
		JMP	loc_7CD87
; ---------------------------------------------------------------------------

loc_7CD5E:				; ...
		LDA	vEnemy.nAction
		CMP	#oaJumpUpAndBump
		BNE	loc_7CD87
		LDA	vEnemy.nPose
		CMP	#pPrincePose48_offset -	pPrincePosesLo
		BCC	loc_7CD87
		CMP	#pPrincePose4F_offset -	pPrincePosesLo
		BCS	loc_7CD87
		JSR	sub_7CF1A
		LDA	vEnemy.XPos
		SEC
		SBC	#$20 ; ' '
		STA	vEnemy.XPos,X
		LDA	vEnemy.XPos+1
		SBC	#0
		STA	vEnemy.XPos+1,X
		JSR	IncrementObjectSlotOffsetIfLess2

loc_7CD87:				; ...
		LDA	vfPrinceWithinRoomHeight
		BEQ	loc_7CDA0
		LDY	#4
		LDA	vwEnemySlotOffset
		PHA
		JSR	lbSetupObjectForBigColumnHiPart
		PLA
		TAX
		LDA	vEnemy.XPos,X
		SEC
		SBC	#$13
		STA	vEnemy.XPos,X

locret_7CD9F:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7CDA0:				; ...
		LDA	vCurrentObjectSlot
		PHA
		LDY	vDupEnemyPlace
		JSR	sub_7CDCC
		PLA
		CMP	vCurrentObjectSlot
		BNE	locret_7CD9F
		LDY	vDupEnemyPlace
		INY
		LDA	vEnemy.nDirection
		BEQ	loc_7CDBA
		JMP	sub_7CDCC
; ---------------------------------------------------------------------------

loc_7CDBA:				; ...
		DEY
		CPY	#0
		BEQ	loc_7CDCB
		CPY	#$A
		BEQ	loc_7CDCB
		CPY	#$14
		BEQ	loc_7CDCB
		DEY
		JMP	sub_7CDCC
; ---------------------------------------------------------------------------

loc_7CDCB:				; ...
		INY
; End of function sub_7CD1F


; =============== S U B	R O U T	I N E =======================================


sub_7CDCC:				; ...

; FUNCTION CHUNK AT CF47 SIZE 0000007C BYTES

		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbCastleOverDoor
		BNE	loc_7CDDD
		LDA	vEnemy.nAction
		CMP	#oaStartFallingAndInjure
		BNE	loc_7CDDD
		JMP	lbSetupShadowObject
; ---------------------------------------------------------------------------

loc_7CDDD:				; ...
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbDoor		; Door
		BEQ	lbSetupShadowObject
		CMP	#lbCastleOverDoorWithPlate ; Over door (in castle)
		BEQ	lbSetupShadowObject
		CMP	#lbBigColumnLowPart ; Low part of big columns
		BEQ	lbSetupObjectForBigColumnLoPart
		CMP	#lbBigColumnHighPart ; High part of big	columns
		BEQ	lbSetupObjectForBigColumnHiPart
		CMP	#lbCastleOneColumn ; Single column in castle
		BEQ	lbSetupObjectForBigColumnHiPart
		CMP	#lbDoubleColumns ; Double columns
		BEQ	lbSetupObjectForBigColumnHiPart
		CMP	#lbBrickWall	; Brick	wall
		BNE	lbSetupBrickWall
		JMP	loc_7CF47
; ---------------------------------------------------------------------------

lbSetupBrickWall:			; ...
		LDA	vEnemy.nUnknown1
		BEQ	locret_7CE38
		CMP	#3
		BEQ	locret_7CE38
		LDA	vEnemy.nDirection
		BEQ	locret_7CE38
		STY	vSaveY
		TYA
		SEC
		SBC	#$A
		BCC	locret_7CE38
		TAY
		STA	vEnemyPlace
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbPlateWithTorch
		BEQ	loc_7CE30
		CMP	#lbBrokenPlate
		BNE	loc_7CE29
		JSR	GetBitsForPlace
		BEQ	loc_7CE30

loc_7CE29:				; ...
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbPlate
		BNE	locret_7CE38

loc_7CE30:				; ...
		LDY	vSaveY
		STY	vEnemyPlace
		JMP	sub_7CF1A
; ---------------------------------------------------------------------------

locret_7CE38:				; ...
		RTS
; ---------------------------------------------------------------------------

lbSetupObjectForBigColumnLoPart:	; ...
		STY	vEnemyPlace
		JSR	IncrementObjectSlotOffsetIfLess2
		LDX	#$16
		LDY	#$48 ; 'H'
		JSR	SetBlockObjectPlace ; X	- additional for posX
					; Y - additional for posY
		LDA	#>(pShadowColumn3)
		STA	vEnemy.ptrAction+1,X
		LDA	#<(pShadowColumn3)
		STA	vEnemy.ptrAction,X
		JMP	locret_7CFC2
; ---------------------------------------------------------------------------

lbSetupShadowObject:			; ...
		STY	vEnemyPlace
		LDX	#$26 ; '&'
		LDY	#$48 ; 'H'
		JSR	SetBlockObjectPlace ; X	- additional for posX
					; Y - additional for posY
		JSR	SetObjectAction
		JMP	IncrementObjectSlotOffsetIfLess2
; End of function sub_7CDCC


; =============== S U B	R O U T	I N E =======================================


GetBlockFromEnemyPlace:			; ...
		LDY	vEnemyPlace
; End of function GetBlockFromEnemyPlace


; =============== S U B	R O U T	I N E =======================================

; Y - place in room

GetBlockIdFromPtr:			; ...
		LDA	(vC),Y
		AND	#$1F
		RTS
; End of function GetBlockIdFromPtr


; =============== S U B	R O U T	I N E =======================================


lbSetupObjectForBigColumnHiPart:	; ...
		STY	vEnemyPlace
		LDX	vwEnemySlotOffset
		LDA	#$16
		STA	vwTmp_17
		LDA	#>(pAnimationBrokenPlateWave_02)
		STA	vEnemy.ptrAction+1,X
		LDA	#<(pAnimationBrokenPlateWave_02)
		STA	vEnemy.ptrAction,X
		LDA	vLevelType
		BEQ	loc_7CE8F
		LDA	vfPrinceWithinRoomHeight
		BNE	loc_7CE8F
		JSR	SetObjectAction
		LDA	#$1E
		STA	vwTmp_17

loc_7CE8F:				; ...
		LDA	vEnemyPlace
		SEC
		SBC	#$A
		BCC	loc_7CEF6
		TAY
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbBigColumnLowPart
		BEQ	loc_7CEAC
		CMP	#lbCastleOneColumn
		BEQ	loc_7CEA7
		CMP	#3
		BNE	loc_7CEF6

loc_7CEA7:				; ...
		LDA	vLevelType
		BNE	loc_7CEB6

loc_7CEAC:				; ...
		LDA	#>(pShadowColumn1)
		STA	vEnemy.ptrAction+1,X
		LDA	#<(pShadowColumn1)
		STA	vEnemy.ptrAction,X

loc_7CEB6:				; ...
		LDX	vwTmp_17
		LDY	#$46 ; 'F'
		JSR	SetBlockObjectPlace ; X	- additional for posX
					; Y - additional for posY
		LDY	#$10
		LDA	vEnemy.nAction
		CMP	#oaSwinging
		BEQ	loc_7CECE
		LDY	#2
		CMP	#oaSlipDown
		BNE	loc_7CECE
		LDY	#$B

loc_7CECE:				; ...
		STY	vwTmp_17
		LDA	byte_6C5
		BEQ	loc_7CEDA
		LDA	v405
		BNE	loc_7CEE3

loc_7CEDA:				; ...
		LDA	byte_6F1
		CLC
		ADC	vwTmp_17
		STA	vEnemy.YPos,X

loc_7CEE3:				; ...
		LDA	vEnemy.nAction
		CMP	#oaBeginFalling
		BNE	loc_7CEFD
		LDA	byte_6F1
		CLC
		ADC	#6
		STA	vEnemy.YPos,X
		JMP	loc_7CEFD
; ---------------------------------------------------------------------------

loc_7CEF6:				; ...
		LDX	vwTmp_17
		LDY	#$46 ; 'F'
		JSR	SetBlockObjectPlace ; X	- additional for posX
					; Y - additional for posY

loc_7CEFD:				; ...
		JSR	sub_7CF08
		CPX	#1
		BEQ	locret_7CF07
		JMP	IncrementObjectSlotOffsetIfLess2
; ---------------------------------------------------------------------------

locret_7CF07:				; ...
		RTS
; End of function lbSetupObjectForBigColumnHiPart


; =============== S U B	R O U T	I N E =======================================


sub_7CF08:				; ...
		JSR	SwitchPRGBank_2
		JSR	sub_2A903
		JSR	GetSavedRoomDataPtr
		CPX	#1
		BNE	locret_7CF2B
		JSR	IncrementObjectSlotOffset
		BEQ	locret_7CF2B
; End of function sub_7CF08


; =============== S U B	R O U T	I N E =======================================


sub_7CF1A:				; ...
		LDY	#$C0 ; '¿'
		LDX	#0
		JSR	SetBlockObjectPlace ; X	- additional for posX
					; Y - additional for posY
		LDA	#>(pAnimationBrokenPlateWave_03)
		STA	vEnemy.ptrAction+1,X
		LDA	#<(pAnimationBrokenPlateWave_03)
		STA	vEnemy.ptrAction,X

locret_7CF2B:				; ...
		RTS
; End of function sub_7CF1A


; =============== S U B	R O U T	I N E =======================================


SetObjectAction:			; ...
		LDA	#>(pShadowColumn4)
		STA	vEnemy.ptrAction+1,X
		LDA	#<(pShadowColumn4)
		STA	vEnemy.ptrAction,X
		RTS
; End of function SetObjectAction


; =============== S U B	R O U T	I N E =======================================


IncrementObjectSlotOffsetIfLess2:	; ...
		LDA	vCurrentObjectSlot
		CMP	#2
		BEQ	lbIncrementObjectSlotOffsetExit
; End of function IncrementObjectSlotOffsetIfLess2


; =============== S U B	R O U T	I N E =======================================


IncrementObjectSlotOffset:		; ...
		INC	vCurrentObjectSlot
		LDA	vwEnemySlotOffset
		CLC
		ADC	#$E
		STA	vwEnemySlotOffset

lbIncrementObjectSlotOffsetExit:	; ...
		RTS
; End of function IncrementObjectSlotOffset

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7CDCC

loc_7CF47:				; ...
		STY	vEnemyPlace
		JSR	SwitchPRGBank_2
		JSR	loc_2B24C
		LDA	#6
		JSR	SwitchPRGBank
		LDA	vEnemyPlace
		STA	byte_4B3
		SEC
		SBC	#10
		TAY
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbDoor
		BEQ	loc_7CF72
		CMP	#lbBigColumnLowPart
		BEQ	loc_7CF72
		CMP	#lbCastleOneColumn
		BEQ	loc_7CF72
		CMP	#lbDoubleColumns
		BNE	loc_7CFBF

loc_7CF72:				; ...
		LDA	vEnemy.nAction
		CMP	#oaStartFalling3
		BEQ	loc_7CF8D
		CMP	#oaStartFalling1
		BEQ	loc_7CF8D
		CMP	#oaBeginFalling
		BEQ	loc_7CF8D
		CMP	#oaGrabLedge
		BEQ	loc_7CF8D
		CMP	#oaMoveUp
		BEQ	loc_7CF8D
		CMP	#oaSlipDown
		BNE	loc_7CFBF

loc_7CF8D:				; ...
		STY	byte_4B3
		JSR	IncrementObjectSlotOffsetIfLess2
		JSR	sub_7CF1A
		JSR	IncrementObjectSlotOffsetIfLess2
		LDA	byte_4B3
		STA	vEnemyPlace
		LDX	#$16
		LDY	#$2E ; '.'
		JSR	SetBlockObjectPlace ; X	- additional for posX
					; Y - additional for posY
		LDA	#>(pShadowColumn2)
		STA	vEnemy.ptrAction+1,X
		LDA	#<(pShadowColumn2)
		STA	vEnemy.ptrAction,X
		LDA	vLevelType
		BEQ	locret_7CFC2
		JSR	SetObjectAction
		LDX	#$1E
		LDY	#$3E ; ''
		JMP	SetBlockObjectPlace ; X	- additional for posX
					; Y - additional for posY
; ---------------------------------------------------------------------------

loc_7CFBF:				; ...
		JMP	sub_7CF08
; ---------------------------------------------------------------------------

locret_7CFC2:				; ...
		RTS
; END OF FUNCTION CHUNK	FOR sub_7CDCC

; =============== S U B	R O U T	I N E =======================================

; X - additional for posX
; Y - additional for posY

SetBlockObjectPlace:			; ...
		STY	vwTmp_17
		STX	vwTmp_17+1
		JSR	SetupEnemyPlace	; vEnemyPlace -	is a place to be converted
					; vwEnemySlotOffset - offset of	slot to	write converted	point
		LDX	vwEnemySlotOffset
		LDA	vEnemy.XPos,X
		CLC
		ADC	vwTmp_17+1
		STA	vEnemy.XPos,X
		LDA	vEnemy.XPos+1,X
		ADC	#0
		STA	vEnemy.XPos+1,X
		LDA	vEnemy.nEnemyID,X
		ORA	#$80 ; 'Ä'
		STA	vEnemy.nEnemyID,X
		LDA	vEnemy.YPos,X
		CLC
		ADC	vwTmp_17
		STA	vEnemy.YPos,X
		RTS
; End of function SetBlockObjectPlace


; =============== S U B	R O U T	I N E =======================================


GetQuarterRoomId:			; ...
		LDA	vRoomId
		ASL	A
		ASL	A
		RTS
; End of function GetQuarterRoomId


; =============== S U B	R O U T	I N E =======================================

; Input	X:
;      * 0 - Left room
;      * 1 - Right room
;      * 2 - Top room
;      * 3 - Bottom room

SetupNeighborRoomId:			; ...

; FUNCTION CHUNK AT D112 SIZE 0000000E BYTES

		STX	vwTmp_17
		STY	vSpriteOffsetX
		JSR	SwitchPRGBank_6
		STY	vSaveY
		JSR	GetQuarterRoomId
		CLC
		ADC	vwTmp_17
		TAY
		JSR	GetLevelGeomDataPtr
		LDA	(vLevelDataPtr),Y
		BEQ	lbNoNeighborRoom
		JMP	SetupNewRoomId
; ---------------------------------------------------------------------------

lbNoNeighborRoom:			; ...
		LDX	#0
; End of function SetupNeighborRoomId


; =============== S U B	R O U T	I N E =======================================


SwitchPRGBank_5:			; ...
		LDA	#5
		JMP	SwitchPRGBank
; End of function SwitchPRGBank_5

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR CheckRoomGoingOut

lbSetupNeighborRoomAndSwitch:		; ...
		JSR	SetupNeighborRoomId ; Input X:
					;      * 0 - Left room
					;      * 1 - Right room
					;      * 2 - Top room
					;      * 3 - Bottom room
		CPX	#0
		BEQ	lbNoNeighborRoomExit
		LDA	#$C2 ; '¬'
		STA	byte_6C5
		STA	vEnemy.YPos
		JMP	LevelLoop
; ---------------------------------------------------------------------------

lbNoNeighborRoomExit:			; ...
		RTS
; ---------------------------------------------------------------------------

lbCheckForLevel6BottomExit:		; ...
		JSR	SetupNeighborRoomId ; Input X:
					;      * 0 - Left room
					;      * 1 - Right room
					;      * 2 - Top room
					;      * 3 - Bottom room
		CPX	#0
		BEQ	lbNoBottomRoom
		LDA	vLevelNumber
		CMP	#Level_6
		BNE	lbNoLevel6BottomExit
		LDA	vRoomId
		CMP	#2
		BNE	lbNoLevel6BottomExit
		JSR	SwitchPRGBank_5
		JMP	lbIncrementAndStartLevel
; ---------------------------------------------------------------------------

lbNoLevel6BottomExit:			; ...
		LDX	#$20 ; ' '
		LDA	vEnemy.nAction
		CMP	#oaSlipDown
		BNE	loc_7D04C
		LDX	#$40 ; '@'

loc_7D04C:				; ...
		STX	vEnemy.YPos
		LDA	vEnemy.nAction
		CMP	#oaJumping1
		BEQ	loc_7D05A
		CMP	#oaRunningJump
		BNE	lbBottomRoomSwitch

loc_7D05A:				; ...
		DEC	vFallingHeight

lbBottomRoomSwitch:			; ...
		JMP	LevelLoop
; ---------------------------------------------------------------------------

lbNoBottomRoom:				; ...
		RTS
; END OF FUNCTION CHUNK	FOR CheckRoomGoingOut

; =============== S U B	R O U T	I N E =======================================


sub_7D061:				; ...
		STX	vtmp_4C0
		JSR	SwitchPRGBank_6
		JSR	lbGetCurrentRoomDataPtr
		LDA	#0
		STA	vEnemyPlace
		JSR	sub_7D147
		LDA	vEnemy.nDirection
		BNE	loc_7D08C
		LDA	vEnemyPlace
		CLC
		ADC	#8
		STA	vEnemyPlace
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBrokenPlate
		BNE	loc_7D08C
		JSR	GetBitsForPlace
		BNE	loc_7D09C

loc_7D08C:				; ...
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBrokenPlate
		BNE	loc_7D098
		JSR	GetBitsForPlace
		BNE	loc_7D09C

loc_7D098:				; ...
		CMP	#0
		BNE	loc_7D0B0

loc_7D09C:				; ...
		LDX	vtmp_4C0
		LDA	vEnemy.nAction
		CMP	#oaStartSteal1
		BCC	loc_7D0B0
		CMP	#oaRunning2
		BCS	loc_7D0B0
		LDY	#0
		TXA
		JSR	SetupEnemyAction ; A - action id
					; Y - slot offset

loc_7D0B0:				; ...
		LDA	#1
		JMP	SwitchPRGBank
; End of function sub_7D061

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR CheckRoomGoingOut

lbCheckForLevel12LeftExit:		; ...
		JSR	SetupNeighborRoomId ; Input X:
					;      * 0 - Left room
					;      * 1 - Right room
					;      * 2 - Top room
					;      * 3 - Bottom room
		LDA	vLevelNumber
		CMP	#Level_12
		BNE	lbNoLevel12RightExit
		LDA	vRoomId
		CMP	#$16
		BNE	lbNoLevel12RightExit
		JSR	SwitchPRGBank_5
		JMP	lbIncrementAndStartLevel
; ---------------------------------------------------------------------------

lbNoLevel12RightExit:			; ...
		CPX	#0
		BEQ	locret_7D0E0
		LDX	#oaStartSteal4
		JSR	sub_7D061
		LDA	#$42 ; 'B'
		STA	vEnemy.XPos
		LDA	#1
		STA	vEnemy.XPos+1
		JMP	LevelLoop
; ---------------------------------------------------------------------------

locret_7D0E0:				; ...
		RTS
; ---------------------------------------------------------------------------

lbGoingRight:				; ...
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BEQ	lbCheckForRightRoom
		LDX	#0
		STX	vPPU_CR_2
		STX	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		STX	vLevelNumber
		STX	PPU_CR_2	; PPU Control Register #2 (W)
					;
					; D7-D5: Full Background Colour	(when D0 == 1)
					; D7-D5: Colour	Intensity (when	D0 == 0)
					;    D4: Sprite	Visibility
					;    D3: Background Visibility
					;    D2: Sprite	Clipping
					;    D1: Background Clipping
					;    D0: Display Type
		DEX
		TXS
		STX	vfSkipNMI
		JSR	WaitNMI_PRG6
		JMP	SetupGameChoice
; ---------------------------------------------------------------------------

lbCheckForRightRoom:			; ...
		JSR	SetupNeighborRoomId ; Input X:
					;      * 0 - Left room
					;      * 1 - Right room
					;      * 2 - Top room
					;      * 3 - Bottom room
		CPX	#0
		BEQ	locret_7D0E0
		LDX	#oaStartSteal5
		JSR	sub_7D061
		JSR	SwitchPRGBank_4
		JSR	CheckLevel8MouseRoom
		JMP	LevelLoop
; END OF FUNCTION CHUNK	FOR CheckRoomGoingOut
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR SetupNeighborRoomId

SetupNewRoomId:				; ...
		LDY	vSpriteOffsetX
		STY	vRoomHorzScroll
		LDY	vSaveY
		SEC
		SBC	#1
		STA	vRoomId
		LDX	#1
		RTS
; END OF FUNCTION CHUNK	FOR SetupNeighborRoomId

; =============== S U B	R O U T	I N E =======================================


sub_7D120:				; ...
		LDX	#$1F
		LDA	vEnemy.nDirection
		BEQ	loc_7D129
		LDX	#$14

loc_7D129:				; ...
		JSR	MovePrinceLeft	; X - offset to	move
; End of function sub_7D120


; =============== S U B	R O U T	I N E =======================================


sub_7D12C:				; ...
		JSR	UnsafeSwitchPRGBank_2
		JSR	loc_2A89A
		JMP	RevertPRGBank
; End of function sub_7D12C


; =============== S U B	R O U T	I N E =======================================


sub_7D135:				; ...
		JSR	UnsafeSwitchPRGBank_2
		JSR	sub_2A8D6
; End of function sub_7D135

; START	OF FUNCTION CHUNK FOR sub_7D147

RevertPRGBank:				; ...
		LDA	vSelectedPRGBank
		JMP	SwitchPRGBank
; END OF FUNCTION CHUNK	FOR sub_7D147

; =============== S U B	R O U T	I N E =======================================


UnsafeSwitchPRGBank_2:			; ...
		LDA	#2
		STA	pBankList+2
		RTS
; End of function UnsafeSwitchPRGBank_2


; =============== S U B	R O U T	I N E =======================================


sub_7D147:				; ...

; FUNCTION CHUNK AT D13B SIZE 00000006 BYTES

		LDA	#$1D
		STA	vwTmp_17
		LDA	vEnemy.nAction
		CMP	#oaJumpUpAndBump
		BEQ	loc_7D15A
		CMP	#oaJumping1
		BEQ	loc_7D15A
		CMP	#oaRunningJump
		BNE	loc_7D15E

loc_7D15A:				; ...
		LDA	#$24 ; '$'
		STA	vwTmp_17

loc_7D15E:				; ...
		LDA	vEnemy.YPos
		SEC
		SBC	vwTmp_17

loc_7D164:				; ...
		STA	vwTmp_17
		BCS	loc_7D169
		RTS
; ---------------------------------------------------------------------------

loc_7D169:				; ...
		JSR	UnsafeSwitchPRGBank_2
		JSR	loc_2A86A
		JMP	RevertPRGBank
; End of function sub_7D147


; =============== S U B	R O U T	I N E =======================================


sub_7D172:				; ...
		CMP	#$1E
		BCC	locret_7D179
		SEC
		SBC	#$A

locret_7D179:				; ...
		RTS
; End of function sub_7D172


; =============== S U B	R O U T	I N E =======================================


sub_7D17A:				; ...

; FUNCTION CHUNK AT 8A26 SIZE 00000091 BYTES
; FUNCTION CHUNK AT D427 SIZE 00000060 BYTES
; FUNCTION CHUNK AT D6E3 SIZE 00000003 BYTES
; FUNCTION CHUNK AT D6FB SIZE 0000009D BYTES
; FUNCTION CHUNK AT D79B SIZE 00000044 BYTES
; FUNCTION CHUNK AT F111 SIZE 0000002D BYTES

		LDA	vEnemy.nPose
		CMP	#pPrincePose01_offset -	pPrincePosesLo
		BNE	loc_7D18C
		LDA	#0
		STA	byte_4CB
		STA	v405
		STA	byte_6C5

loc_7D18C:				; ...
		LDA	vfWaitRestartLevel
		BNE	locret_7D1E1
		LDA	vEnemy.nAction
		CMP	#oaDrinkPotion
		BEQ	locret_7D1E1
		CMP	#oaClimbUpFailed
		BEQ	locret_7D1E1
		CMP	#oaJumpUpAndSwing1
		BEQ	locret_7D1E1
		CMP	#oaJumpUpAndSwing2
		BEQ	locret_7D1E1
		CMP	#oaDeathFromSpike
		BEQ	loc_7D1DE
		CMP	#oaBreakWall
		BEQ	loc_7D1DE
		CMP	#oaStartFalling4
		BEQ	loc_7D1DE
		CMP	#oaStartFallingAndInjure
		BEQ	loc_7D1DE
		CMP	#oaGrabLedge
		BEQ	loc_7D1DE
		CMP	#oaTurnBack1
		BEQ	loc_7D1DE
		CMP	#oaSlipDown
		BEQ	loc_7D1DE
		LDX	vfLockJoypad
		BNE	loc_7D1CD
		CMP	#oaMoveUp
		BEQ	locret_7D1E1
		CMP	#oaSwinging
		BEQ	loc_7D1DE

loc_7D1CD:				; ...
		LDA	vEnemy.YPos
		CMP	#$C4 ; 'ƒ'
		BCS	locret_7D1E1
		LDA	vEnemy.nUnknown1
		CMP	#$F
		BEQ	locret_7D1E1
		JSR	StartLevel4MirrorImageAction

loc_7D1DE:				; ...
		JMP	loc_7D1E2
; ---------------------------------------------------------------------------

locret_7D1E1:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7D1E2:				; ...
		LDA	vEnemy.nUnknown1
		CMP	#6
		BEQ	locret_7D1F4
		CMP	#2
		BEQ	locret_7D1F4
		LDA	vEnemy.nAction
		CMP	#oaShortJumpUp1
		BNE	loc_7D1F5

locret_7D1F4:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7D1F5:				; ...
		JSR	GetSavedRoomDataPtr
		LDA	vEnemy.nDirection
		BNE	loc_7D20E
		TAX
		JSR	MovePrinceLeft	; X - offset to	move
		JSR	sub_7D12C
		JSR	sub_7D147
		JSR	GetBlockFromEnemyPlace
		CMP	#lbCutters
		BEQ	loc_7D225

loc_7D20E:				; ...
		LDA	vEnemy.nDirection
		BEQ	loc_7D228
		LDX	#$C
		JSR	MovePrinceLeft	; X - offset to	move
		JSR	sub_7D12C
		JSR	sub_7D147
		JSR	GetBlockFromEnemyPlace
		CMP	#lbCutters
		BNE	loc_7D228

loc_7D225:				; ...
		JMP	lbCheckAndKillByCutters
; ---------------------------------------------------------------------------

loc_7D228:				; ...
		JSR	GetSavedRoomDataPtr
		LDX	#$14
		JSR	MovePrinceLeft	; X - offset to	move
		JSR	sub_7D12C
		JSR	sub_7D147
		JSR	GetBlockFromEnemyPlace
		CMP	#lbHealthPotion
		BNE	lbCheckForSword
		JMP	lbDrinkPotion
; ---------------------------------------------------------------------------

lbCheckForSword:			; ...
		CMP	#lbPlateWithSword
		BNE	loc_7D247
		JMP	lbGrabTheSword
; ---------------------------------------------------------------------------

loc_7D247:				; ...
		JSR	GetSavedRoomDataPtr
		LDX	#$16
		LDA	vEnemy.nAction
		CMP	#oaStartFallingAndInjure
		BEQ	loc_7D257
		CMP	#oaBreakWall
		BNE	loc_7D259

loc_7D257:				; ...
		LDX	#$A

loc_7D259:				; ...
		LDA	vEnemy.nDirection
		BEQ	loc_7D269
		LDX	#$20 ; ' '
		LDA	vEnemy.nAction
		CMP	#oaRunning1
		BEQ	loc_7D269
		LDX	#$1C

loc_7D269:				; ...
		LDA	vfSword
		CMP	#2
		BNE	loc_7D279
		LDX	#$28 ; '('
		LDA	vEnemy.nDirection
		BNE	loc_7D279
		LDX	#$A

loc_7D279:				; ...
		JSR	sub_7FA60
		LDA	vEnemy.nAction
		CMP	#oaShortJumpUp2
		BNE	loc_7D294
		LDA	vEnemy.YPos
		SEC
		SBC	#$3D ; '='
		BCS	loc_7D28E
		SEC
		LDA	#$14

loc_7D28E:				; ...
		JSR	loc_7D164
		JMP	loc_7D297
; ---------------------------------------------------------------------------

loc_7D294:				; ...
		JSR	sub_7D147

loc_7D297:				; ...
		JSR	GetBlockFromEnemyPlace
		CMP	#lbExitDoorRightPart
		BEQ	loc_7D2A5
		CMP	#lbExitDoorLeftPart
		BNE	loc_7D2AB
		JMP	lbCheckAndExitLevel
; ---------------------------------------------------------------------------

loc_7D2A5:				; ...
		DEC	vEnemyPlace
		JMP	lbCheckAndExitLevel
; ---------------------------------------------------------------------------

loc_7D2AB:				; ...
		CMP	#lbSpikesPlate
		BNE	loc_7D2B5
		JSR	SwitchPRGBank_5
		JMP	loc_58A26
; ---------------------------------------------------------------------------

loc_7D2B5:				; ...
		CMP	#lbBrokenPlate
		BNE	loc_7D2BC
		JMP	loc_7D388
; ---------------------------------------------------------------------------

loc_7D2BC:				; ...
		CMP	#lbBrickWall
		BEQ	loc_7D2CC
		CMP	#lbCastleOverDoor
		BEQ	loc_7D2CF
		CMP	#lbBigColumnHighPart
		BEQ	loc_7D2CF
		CMP	#lbSpace
		BEQ	loc_7D2CF

loc_7D2CC:				; ...
		JMP	CheckFallingInjure
; ---------------------------------------------------------------------------

loc_7D2CF:				; ...
		LDA	vEnemy.nUnknown1
		CMP	#5
		BNE	loc_7D2D9
		JMP	loc_7D370
; ---------------------------------------------------------------------------

loc_7D2D9:				; ...
		LDA	vEnemy.nAction
		CMP	#oaFalling
		BEQ	loc_7D31D
		CMP	#oaGrabLedge
		BNE	loc_7D2E7
		JMP	loc_7D390
; ---------------------------------------------------------------------------

loc_7D2E7:				; ...
		CMP	#oaSlipDown
		BEQ	loc_7D31D
		CMP	#oaStartFallingAndInjure
		BEQ	loc_7D31D
		CMP	#oaStartFalling1
		BEQ	loc_7D31D
		CMP	#oaStartFalling3
		BEQ	loc_7D31D
		CMP	#oaStartFalling4
		BEQ	loc_7D31D
		CMP	#oaShortJumpUp1
		BEQ	loc_7D31D
		LDA	vEnemy.nPose
		CMP	#pPrincePose4F_offset -	pPrincePosesLo
		BEQ	loc_7D31D
		CMP	#pPrincePose0E_offset -	pPrincePosesLo
		BCC	loc_7D320
		CMP	#pPrincePose1E_offset -	pPrincePosesLo
		BCC	loc_7D312
		CMP	#pPrincePose26_offset -	pPrincePosesLo
		BCC	loc_7D320

loc_7D312:				; ...
		LDA	vEnemy.nAction
		CMP	#oaRunningJump
		BEQ	loc_7D31D
		CMP	#oaJumping1
		BNE	loc_7D320

loc_7D31D:				; ...
		JMP	locret_7D498
; ---------------------------------------------------------------------------

loc_7D320:				; ...
		LDA	vfSword
		CMP	#2
		BNE	loc_7D339
		JSR	SetupPrinceX
		JSR	sub_7D499
		LDY	#$32 ; '2'
		LDA	vEnemy.nDirection
		BNE	loc_7D336
		LDY	#$2A ; '*'

loc_7D336:				; ...
		JMP	MovePrinceHorz	; Y - offset to	move
; ---------------------------------------------------------------------------

loc_7D339:				; ...
		LDA	vEnemy.nAction
		CMP	#oaBeginFalling
		BEQ	loc_7D363
		LDA	vEnemy.XPos+1
		BNE	loc_7D34C
		LDA	vEnemy.XPos
		CMP	#$28 ; '('
		BCC	loc_7D363

loc_7D34C:				; ...
		LDA	vEnemy.YPos
		PHA
		LDY	#$2A ; '*'
		LDA	vEnemy.nDirection
		BEQ	loc_7D359
		LDY	#$24 ; '$'

loc_7D359:				; ...
		TYA
		LDX	#$3E ; ''
		JSR	SetupPrincePosition ; A	- additional for X
					; X - additional for Y
					; vEnemyPlace -	position in room
		PLA
		STA	vEnemy.YPos

loc_7D363:				; ...
		LDA	#0
		STA	byte_4ED
		STA	byte_361
		LDA	#oaBeginFalling
		JMP	SetupPrinceAction
; ---------------------------------------------------------------------------

loc_7D370:				; ...
		LDA	vEnemy.nAction
		CMP	#oaInjureSitDown
		BEQ	loc_7D363
		CMP	#oaSittingDown
		BEQ	loc_7D363
		LDA	vfSword
		CMP	#2
		BEQ	locret_7D387
		LDA	#oaStartFalling4
		JMP	SetupPrinceAction
; ---------------------------------------------------------------------------

locret_7D387:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7D388:				; ...
		JSR	IsObjectCurrentRoomHiBitSet
		BEQ	loc_7D390
		JMP	loc_7D2CF
; ---------------------------------------------------------------------------

loc_7D390:				; ...
		JMP	CheckFallingInjure
; ---------------------------------------------------------------------------

lbCheckAndKillByCutters:		; ...
		LDA	vEnemy.nAction
		CMP	#oaTurnBack1
		BEQ	lbCheckAndKillByCuttersExit
		JSR	CheckAnimObjState_Cutters
		BEQ	lbCheckAndKillByCuttersExit
		CMP	#4
		BCC	lbCheckAndKillByCuttersExit
		CMP	#8
		BCS	lbCheckAndKillByCuttersExit
		LDA	#$64 ; 'd'
		STA	vFallingHeight
		LDA	#0
		STA	vEnemy.nDirection
		LDX	#$3D ; '='
		JSR	SetupPrincePosition ; A	- additional for X
					; X - additional for Y
					; vEnemyPlace -	position in room
		DEC	vEnemy.XPos
		LDY	#0
		STY	vfTypeOfBgColor
		JSR	KillAndSwitchToPRG5
		LDA	#oaDeathFromCutters
		JMP	_SetupEnemyAction ; A -	action id
; End of function sub_7D17A		; Y - slot offset

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7EAA6

loc_7D3C6:				; ...
		LDA	byte_4F6
		BNE	lbCheckAndKillByCuttersExit
		LDA	vfJoypadRight
		BEQ	lbCheckAndKillByCuttersExit
		LDA	vEnemy.nAction
		CMP	#oaStopping
		BEQ	lbCheckAndKillByCuttersExit
		CMP	#oaRunning1
		BNE	lbCheckAndKillByCuttersExit
		LDA	#oaRunningTurnBack
		JMP	SetupPrinceAction
; END OF FUNCTION CHUNK	FOR sub_7EAA6

; =============== S U B	R O U T	I N E =======================================


CheckForPlayerDeath:			; ...
		LDA	vfPrinceDeath
		BEQ	lbCheckAndKillByCuttersExit
		LDA	vEnemy.nUnknown1
		BNE	lbCheckAndKillByCuttersExit
		LDA	#oaHealthOffDeath1
		STA	vfWaitRestartLevel
		JMP	SetupPrinceAction
; ---------------------------------------------------------------------------

lbCheckAndKillByCuttersExit:		; ...
		RTS
; End of function CheckForPlayerDeath


; =============== S U B	R O U T	I N E =======================================


SetHealthBarAttr:			; ...
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDX	#$20 ; ' '
		LDA	#$FF

loc_7D3F9:				; ...
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		DEX
		BNE	loc_7D3F9
		RTS
; End of function SetHealthBarAttr


; =============== S U B	R O U T	I N E =======================================


LoadHealthBarTile:			; ...
		LDA	pHealthBarTiles,Y
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INY
		DEX
		BNE	LoadHealthBarTile
		RTS
; End of function LoadHealthBarTile


; =============== S U B	R O U T	I N E =======================================


InitializeBgCharsData:			; ...
		LDA	#<(PPU_CG_PAGE_0_TILE_40)
		STA	vPrinceCharsPPUPtr+1 ; RAM/PPU ptr to buffer to	write
		LDA	#>(PPU_CG_PAGE_0_TILE_40)
		STA	vPrinceCharsPPUPtr ; RAM/PPU ptr to buffer to write
		LDX	#0
		STX	vCharsDataId
		LDY	#3		; Chars	data will load from PRG	#03
		STY	v52		; $52 -	begin bank of data = #03
		STY	v53		; $53 != #00 -	write tiles to PPU
		STX	vfAllowUpdateHealthBarTiles
		STY	vSpriteOffsetX
		STY	vfDisallowLoadEmptyTile
		RTS
; End of function InitializeBgCharsData

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7D17A

CheckFallingInjure:			; ...
		LDA	#0
		STA	byte_4ED
		LDA	vEnemy.nAction
		CMP	#oaSlipDown
		BEQ	locret_7D498
		CMP	#oaStartFalling1
		BEQ	loc_7D44B
		CMP	#oaStartFalling3
		BEQ	loc_7D44B
		CMP	#oaShortJumpUp1
		BEQ	locret_7D498
		CMP	#oaStartFalling4
		BEQ	loc_7D44B
		CMP	#oaStartFallingAndInjure
		BEQ	loc_7D44B
		CMP	#oaBeginFalling
		BNE	locret_7D498

loc_7D44B:				; ...
		LDY	#0
		STY	byte_4C9
		JSR	sub_7D487
		LDY	#oaSittingDown
		LDA	vFallingHeight
		CMP	#3
		BCC	loc_7D469
		LDY	#oaInjureSitDown
		CMP	#7
		BCC	loc_7D475
		LDY	#0
		JSR	KillObject	; Y=False - Prince
					; Y=True - Guard
		LDY	#oaDeadMan3

loc_7D469:				; ...
		LDA	#0
		STA	vfGotMagicPotion
		STA	vfTypeOfBgColor
		TYA
		JMP	SetupPrinceAction
; ---------------------------------------------------------------------------

loc_7D475:				; ...
		LDA	vCurrentHealth
		CMP	#1
		BNE	loc_7D484
		JSR	SwitchPRGBank_5
		JSR	InjureBgColSetup
		LDY	#oaHealthOffDeath1

loc_7D484:				; ...
		JMP	loc_7D469
; END OF FUNCTION CHUNK	FOR sub_7D17A

; =============== S U B	R O U T	I N E =======================================


sub_7D487:				; ...
		LDA	vEnemy.YPos,Y
		SEC
		SBC	vFallingVertSpeed
		SBC	#8
		AND	#$C0 ; '¿'
		CLC
		ADC	#$40 ; '@'
		STA	vEnemy.YPos,Y

locret_7D498:				; ...
		RTS
; End of function sub_7D487


; =============== S U B	R O U T	I N E =======================================


sub_7D499:				; ...
		JSR	SwitchPRGBank_6
		JSR	sub_7D120
		JMP	sub_7D147
; End of function sub_7D499


; =============== S U B	R O U T	I N E =======================================


GetSavedRoomDataPtr:			; ...
		JSR	SwitchPRGBank_6
		LDA	vSavedRoomDataPtrLo
		STA	vC
		LDA	vSavedRoomDataPtrHi
		STA	vD
		LDA	vMirrorRoom
		STA	vRoomId
		RTS
; End of function GetSavedRoomDataPtr


; =============== S U B	R O U T	I N E =======================================


sub_7D4B5:				; ...
		LDA	#$14
		STA	vwTmp_17
		JSR	GetSavedRoomDataPtr
		LDA	vEnemy.nAction
		CMP	#oaStartFalling3
		BEQ	loc_7D4CF
		CMP	#oaStartFalling1
		BEQ	loc_7D4CF
		CMP	#oaJumping1
		BEQ	loc_7D4CF
		CMP	#oaRunningJump
		BNE	loc_7D4DB

loc_7D4CF:				; ...
		LDX	#$28 ; '('
		LDA	vEnemy.nDirection
		BEQ	loc_7D4F2
		LDX	#8
		JMP	loc_7D4F2
; ---------------------------------------------------------------------------

loc_7D4DB:				; ...
		LDX	#$18
		LDA	vfPrinceWithinRoomHeight
		BNE	loc_7D4EB
		LDA	vEnemy.nAction
		CMP	#oaStartSteal4
		BEQ	loc_7D4EB
		LDX	#oaStartSteal6

loc_7D4EB:				; ...
		LDA	vEnemy.nDirection
		BEQ	loc_7D4F2
		LDX	vwTmp_17

loc_7D4F2:				; ...
		JMP	loc_7F655
; End of function sub_7D4B5


; =============== S U B	R O U T	I N E =======================================


StartLevel4MirrorImageAction:		; ...
		JSR	sub_7D4B5
		JSR	SavePrinceYAndPlace
		LDA	word_47
		STA	vSpriteOffsetX
		JSR	GetBlockFromEnemyPlace
		STA	vRoomGuardPlace
		CMP	#lbLevel4MirrorPlate
		BNE	loc_7D52F
		LDA	vEnemy.nDirection
		BNE	loc_7D539
		LDA	vfPrinceWithinRoomHeight
		BEQ	loc_7D539
		LDA	vEnemy.nAction
		CMP	#oaRunningJump
		BNE	loc_7D52F
		LDA	vEnemy.nPose
		CMP	#pPrincePose26_offset -	pPrincePosesLo
		BCC	loc_7D52F
		LDA	#pPrincePose94_offset -	pPrincePosesLo
		STA	vEnemy.XPos+$E
		STA	vfMirrorLevel4Done
		LDA	#0
		STA	vEnemy.XPos+$F
		RTS
; ---------------------------------------------------------------------------

loc_7D52F:				; ...
		LDA	vRoomGuardPlace
		CMP	#lbLevel4MirrorPlate
		BNE	loc_7D539
		JMP	loc_7D5FC
; ---------------------------------------------------------------------------

loc_7D539:				; ...
		LDA	vRoomGuardPlace
		CMP	#lbDoor
		BEQ	loc_7D552
		CMP	#lbCastleOverDoorWithPlate
		BEQ	loc_7D55C
		CMP	#lbCastleOverDoor
		BEQ	loc_7D55C
		CMP	#lbBrickWall
		BNE	loc_7D54F
		JMP	loc_7D5FC
; ---------------------------------------------------------------------------

loc_7D54F:				; ...
		JMP	locret_7D680
; ---------------------------------------------------------------------------

loc_7D552:				; ...
		JSR	CheckAnimObjState_Door
		CMP	#$18
		BNE	loc_7D55C
		JMP	locret_7D680
; ---------------------------------------------------------------------------

loc_7D55C:				; ...
		STA	vwTmp_17
		JSR	GetSavedRoomDataPtr
		LDA	vSpriteOffsetX
		STA	word_47
		LDA	vEnemy.nAction
		LDX	#$14
		CMP	#oaShortJumpUp2
		BEQ	loc_7D580
		CMP	#oaJumpUpAndBump
		BEQ	loc_7D580
		LDX	#$16
		CMP	#oaJumping1
		BEQ	loc_7D580
		LDX	#$1E
		CMP	#oaRunningJump
		BNE	loc_7D580
		LDX	#$12

loc_7D580:				; ...
		LDA	vEnemy.nDirection
		BNE	loc_7D587
		LDX	#$24 ; '$'

loc_7D587:				; ...
		JSR	loc_7F655
		JSR	GetBlockFromEnemyPlace
		CMP	#lbCastleOverDoor
		BEQ	loc_7D599
		CMP	#lbCastleOverDoorWithPlate
		BEQ	loc_7D599
		CMP	#lbDoor
		BNE	locret_7D5FB

loc_7D599:				; ...
		LDA	vEnemy.nDirection
		BNE	loc_7D5B1
		LDY	#$38 ; '8'
		LDA	vEnemy.XPos+1
		BNE	loc_7D5B3
		LDA	vEnemy.XPos
		CMP	#$3C ; ''
		BCS	loc_7D5B3
		LDY	#$1C
		JMP	loc_7D5B3
; ---------------------------------------------------------------------------

loc_7D5B1:				; ...
		LDY	#$27 ; '''

loc_7D5B3:				; ...
		LDA	vEnemy.nAction
		CMP	#oaJumpUpAndBump
		BEQ	loc_7D5BE
		CMP	#oaShortJumpUp2
		BNE	loc_7D5C5

loc_7D5BE:				; ...
		LDA	vEnemy.nPose
		CMP	#pPrincePose4F_offset -	pPrincePosesLo
		BCC	locret_7D5E2

loc_7D5C5:				; ...
		LDA	vEnemy.nAction
		CMP	#oaJumping1
		BNE	loc_7D5D3
		LDA	vEnemy.nPose
		CMP	#pPrincePose10_offset -	pPrincePosesLo
		BCC	locret_7D5E2

loc_7D5D3:				; ...
		CMP	#oaStartSteal1
		BCC	loc_7D5E3
		CMP	#oaRunning2
		BCS	loc_7D5E3
		LDA	vEnemy.nPose
		CMP	#pPrincePose7B_offset -	pPrincePosesLo
		BCS	loc_7D5E3

locret_7D5E2:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7D5E3:				; ...
		LDA	vDupEnemyPlace
		STA	vEnemyPlace
		LDA	vFallingHeight
		CMP	#8
		BCS	locret_7D5FB
		JSR	MovePrinceHorz	; Y - offset to	move
		LDA	#oaBreakWall
		JSR	SetupPrinceAction
		JMP	loc_7D64F
; ---------------------------------------------------------------------------

locret_7D5FB:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7D5FC:				; ...
		LDA	vEnemy.nUnknown1
		BEQ	locret_7D5FB
		CMP	#4
		BEQ	loc_7D64F
		JSR	SavePrinceYAndPlace
		LDY	#$14
		LDA	vEnemy.nAction
		CMP	#oaRunningJump
		BNE	loc_7D613
		LDY	#$10

loc_7D613:				; ...
		LDA	vEnemy.nDirection
		BNE	loc_7D62F
		LDA	vEnemyPlace
		LDY	#$3C ; ''
		CMP	#29
		BEQ	loc_7D62D
		CMP	#$FF
		BEQ	loc_7D62D
		CMP	#9
		BEQ	loc_7D62D
		CMP	#19
		BNE	loc_7D62F

loc_7D62D:				; ...
		LDY	#$1C

loc_7D62F:				; ...
		LDA	word_47
		STA	vEnemyPlace
		JSR	MovePrinceHorz	; Y - offset to	move
		LDA	#0
		STA	vFallingHorzSpeed
		LDA	vFallingHeight
		CMP	#4
		BCS	locret_7D680
		LDA	vfSword
		CMP	#2
		BEQ	locret_7D680
		LDA	#oaBreakWall
		JSR	SetupPrinceAction

loc_7D64F:				; ...
		JSR	GetSavedRoomDataPtr
		LDA	vEnemy.nDirection
		BNE	loc_7D65F
		LDX	#0
		JSR	sub_7FA60
		JMP	loc_7D664
; ---------------------------------------------------------------------------

loc_7D65F:				; ...
		LDX	#$20 ; ' '
		JSR	sub_7FA60

loc_7D664:				; ...
		JSR	sub_7D147
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBrokenPlate
		BNE	loc_7D677
		LDA	#0
		STA	v54
		JSR	GetBitsForPlace
		BNE	loc_7D688

loc_7D677:				; ...
		JSR	GetBlockFromEnemyPlace
		BEQ	loc_7D688
		CMP	#lbCastleOverDoor
		BEQ	loc_7D681

locret_7D680:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7D681:				; ...
		INC	word_47
		LDA	#0
		JMP	loc_7D68A
; ---------------------------------------------------------------------------

loc_7D688:				; ...
		LDA	#4

loc_7D68A:				; ...
		STA	vRoomGuardPlace
		LDA	vtmpCounter4F
		STA	vEnemyPlace
		LDA	vFallingHorzSpeed
		BEQ	loc_7D69C
		LDX	#seWallBreak
		JSR	PlaySound_Wrapper ; X -	sound id

loc_7D69C:				; ...
		LDY	vRoomGuardPlace
		LDA	vEnemy.nDirection
		BNE	loc_7D6BB
		LDY	#$40 ; '@'
		LDA	vEnemyPlace
		CMP	#$1D
		BEQ	loc_7D6B9
		CMP	#$FF
		BEQ	loc_7D6B9
		CMP	#9
		BEQ	loc_7D6B9
		CMP	#$13
		BNE	loc_7D6BB

loc_7D6B9:				; ...
		LDY	#$1A

loc_7D6BB:				; ...
		LDA	word_47
		STA	vEnemyPlace
		JSR	MovePrinceHorz	; Y - offset to	move
		LDA	vSavedPlayerY
		STA	vEnemy.YPos
		LDA	#oaStartFallingAndInjure
		JMP	SetupPrinceAction
; End of function StartLevel4MirrorImageAction


; =============== S U B	R O U T	I N E =======================================

; X - sound id

PlaySound_Wrapper:			; ...
		PHA
		LDA	#6
		JSR	SwitchPRGBank
		PLA
		JMP	j__PlaySound
; End of function PlaySound_Wrapper


; =============== S U B	R O U T	I N E =======================================


SetupPrinceAction:			; ...
		LDY	#0
		JMP	SetupEnemyAction ; A - action id
; End of function SetupPrinceAction	; Y - slot offset


; =============== S U B	R O U T	I N E =======================================


SetupEnemyActionAndSwitchToPRG4:	; ...
		JSR	SetupEnemyAction ; A - action id
					; Y - slot offset
		JMP	SwitchPRGBank_4
; End of function SetupEnemyActionAndSwitchToPRG4

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7D17A

loc_7D6E3:				; ...
		JMP	CheckFallingInjure
; END OF FUNCTION CHUNK	FOR sub_7D17A

; =============== S U B	R O U T	I N E =======================================


InjurePrinceByOnePoint:			; ...
		JSR	SwitchPRGBank_5
		LDY	#0
		JSR	InjureObject	; Y=False - Prince
					; Y=True - Guard
		BCS	lbPotionWithPoisonExit
		LDA	vfWaitRestartLevel
		BNE	lbPotionWithPoisonExit
		LDA	#2
		STA	vfPrinceDeath

lbPotionWithPoisonExit:			; ...
		RTS
; End of function InjurePrinceByOnePoint

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7D17A

lbDrinkPotion:				; ...
		LDA	vEnemy.nPose
		CMP	#pPrincePose6C_offset -	pPrincePosesLo
		BNE	loc_7D6E3
		LDA	vEnemy.nUnknown1
		BNE	loc_7D6E3
		JSR	GetBitsForPlace
		BNE	loc_7D6E3
		JSR	UpdateObjectBits
		LDY	vEnemyPlace
		LDA	(vC),Y
		AND	#$E0 ; '‡'
		CMP	#lbSpace|Modifier_01
		BNE	lbCheckForPoisonPotion
		LDA	#$40 ; '@'
		JSR	FindEnemyById_Wrapper ;	$A - enemy id to search
					; return: Y=0 -	not found, Y=1 - found,	X - slot offset
		LDA	vCurrentMaximumHealth
		CMP	vCurrentHealth
		BEQ	loc_7D775
		INC	vCurrentHealth
		JMP	loc_7D775
; ---------------------------------------------------------------------------

lbCheckForPoisonPotion:			; ...
		LDA	(vC),Y
		AND	#$A0 ; '†'
		CMP	#lbSpace|Modifier_05
		BNE	lbCheckForMagicPotion
		LDA	#$40 ; '@'
		JSR	FindEnemyById_Wrapper ;	$A - enemy id to search
					; return: Y=0 -	not found, Y=1 - found,	X - slot offset
		TXA
		PHA
		JSR	InjurePrinceByOnePoint
		PLA
		TAX
		JMP	loc_7D775
; ---------------------------------------------------------------------------

lbCheckForMagicPotion:			; ...
		LDA	(vC),Y
		AND	#$E0 ; '‡'
		CMP	#lbSpace|Modifier_03
		BNE	lbPotionIncrementMaxHealth
		LDA	#$27 ; '''
		JSR	FindEnemyById_Wrapper ;	$A - enemy id to search
					; return: Y=0 -	not found, Y=1 - found,	X - slot offset
		LDA	#1
		STA	vfGotMagicPotion
		STA	vfTypeOfBgColor
		LDA	#$14
		STA	vChangedBgTimer
		STA	vExitOpenedStatusTimer
		JMP	loc_7D775
; ---------------------------------------------------------------------------

lbPotionIncrementMaxHealth:		; ...
		LDA	#$27 ; '''
		JSR	FindEnemyById_Wrapper ;	$A - enemy id to search
					; return: Y=0 -	not found, Y=1 - found,	X - slot offset
		INC	vCurrentMaximumHealth
		LDA	vCurrentMaximumHealth
		STA	vCurrentHealth
		INC	vGotMaximumHealth

loc_7D775:				; ...
		LDA	#3
		STA	vEnemy.XPos+1,X
		LDA	#$20 ; ' '
		JSR	FindEnemyById_Wrapper ;	$A - enemy id to search
					; return: Y=0 -	not found, Y=1 - found,	X - slot offset
		LDA	#3
		STA	vEnemy.XPos+1,X
		STA	vUpdateHealthBar
		LDY	#$28 ; '('
		LDA	vEnemy.nDirection
		BEQ	loc_7D790
		LDY	#$22 ; '"'

loc_7D790:				; ...
		JSR	MovePrinceHorz	; Y - offset to	move
		LDA	#oaDrinkPotion
		JMP	SetupPrinceAction
; END OF FUNCTION CHUNK	FOR sub_7D17A
; ---------------------------------------------------------------------------
		JMP	CheckFallingInjure
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7D17A

lbCheckAndExitLevel:			; ...
		LDA	vfExitOpened
		BEQ	lbCheckAndExitLevelExit
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BNE	lbSetupExitLevelAction
		LDA	vJoypad1
		AND	#Btn_Up
		BEQ	lbCheckAndExitLevelExit
		LDA	vRoomId
		CMP	vEnteredRoomId
		BEQ	lbCheckAndExitLevelExit
		LDA	vfSword
		CMP	#2
		BEQ	lbCheckAndExitLevelExit
		LDA	vEnemy.nAction
		CMP	#oaJumpUpAndBump
		BEQ	lbSetupExitLevelAction
		CMP	#oaShortJumpUp2
		BNE	lbCheckAndExitLevelExit

lbSetupExitLevelAction:			; ...
		LDA	#$2D ; '-'
		LDX	#$3C ; ''
		JSR	SetupPrincePosition ; A	- additional for X
					; X - additional for Y
					; vEnemyPlace -	position in room
		LDA	#$FF
		STA	vEnemy.nDirection
		LDA	#0
		STA	vLevelBlocksCharsPtr
		STA	vLevelBlocksCharsPtr+1
		LDA	#oaRunningOffLevel
		JMP	SetupPrinceAction
; ---------------------------------------------------------------------------

lbCheckAndExitLevelExit:		; ...
		JMP	CheckFallingInjure
; END OF FUNCTION CHUNK	FOR sub_7D17A

; =============== S U B	R O U T	I N E =======================================

; A - additional for X
; X - additional for Y
; vEnemyPlace -	position in room

SetupPrincePosition:			; ...
		STA	vwTmp_17
		STX	vwTmp_17+1
		JSR	UnsafeSwitchPRGBank_2
		JSR	_MovePrince
		JMP	RevertPRGBank
; End of function SetupPrincePosition


; =============== S U B	R O U T	I N E =======================================


sub_7D7EC:				; ...

; FUNCTION CHUNK AT C754 SIZE 0000003C BYTES

		LDA	vEnemy.nPose
		CMP	#pPrincePose01_offset -	pPrincePosesLo
		BNE	locret_7D833
		LDA	vfJoypadLeftRight
		BNE	locret_7D833
		LDA	vfJoypadUp
		BEQ	loc_7D830
		LDA	vfDemoPlay
		BEQ	loc_7D805
		LDA	byte_4F4
		BNE	locret_7D833

loc_7D805:				; ...
		LDA	#oaShortJumpUp2
		STA	byte_4F4
		JSR	SetupPrinceAction
		LDA	vLevelNumber
		CMP	#Level_4
		BNE	loc_7D82D
		LDA	vRoomId
		CMP	#3
		BNE	loc_7D82D
		LDA	vEnemy.XPos+1
		BEQ	loc_7D82D
		LDA	vfPrinceWithinRoomHeight
		BNE	loc_7D828
		LDA	vfMirrorLevel4Done
		BEQ	loc_7D82D

loc_7D828:				; ...
		LDA	#oaJumpUpAndBump
		JMP	SetupPrinceAction
; ---------------------------------------------------------------------------

loc_7D82D:				; ...
		JMP	loc_7C754
; ---------------------------------------------------------------------------

loc_7D830:				; ...
		STA	byte_4F4

locret_7D833:				; ...
		RTS
; End of function sub_7D7EC

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7D838

loc_7D834:				; ...
		STA	vfDemoPlaySitDown
		RTS
; END OF FUNCTION CHUNK	FOR sub_7D838

; =============== S U B	R O U T	I N E =======================================


sub_7D838:				; ...

; FUNCTION CHUNK AT D834 SIZE 00000004 BYTES
; FUNCTION CHUNK AT F65B SIZE 00000088 BYTES

		LDA	vfJoypadDown
		BEQ	loc_7D834

loc_7D83C:				; ...
		LDA	vEnemy.nPose
		CMP	#pPrincePose01_offset -	pPrincePosesLo
		BNE	locret_7D866
		LDA	vfDemoPlay
		BEQ	loc_7D852
		LDA	vfDemoPlaySitDown
		BNE	locret_7D866
		LDA	#1
		STA	vfDemoPlaySitDown

loc_7D852:				; ...
		LDA	vEnemy.nAction
		CMP	#oaSlipDown
		BEQ	locret_7D866
		LDA	#oaSitDown3
		JSR	SetupPrinceAction
		LDA	vfPrinceWithinRoomHeight
		BNE	locret_7D866
		JMP	loc_7F65B
; ---------------------------------------------------------------------------

locret_7D866:				; ...
		RTS
; End of function sub_7D838


; =============== S U B	R O U T	I N E =======================================


sub_7D867:				; ...
		LDA	#0
		STA	vfDisabledBlockAction
		LDA	byte_4F3
		BEQ	loc_7D872
		RTS
; ---------------------------------------------------------------------------

loc_7D872:				; ...
		LDA	#4
		STA	word_47+1
		JSR	GetSavedRoomDataPtr
		LDX	#$A
		LDA	vEnemy.nDirection
		BEQ	loc_7D882
		LDX	#$23 ; '#'

loc_7D882:				; ...
		JSR	loc_7F655
		JSR	sub_7D93A
		LDX	#$F
		LDA	vEnemy.nDirection
		BEQ	loc_7D89E
		LDX	#$16
		LDA	vEnemy.nAction
		CMP	#oaSlipDown
		BEQ	loc_7D89C
		CMP	#oaMoveUp
		BNE	loc_7D89E

loc_7D89C:				; ...
		LDX	#$32 ; '2'

loc_7D89E:				; ...
		JSR	loc_7F655
		JMP	sub_7D93A
; End of function sub_7D867

; ---------------------------------------------------------------------------
		SEC

loc_7D8A5:				; ...
		SBC	#$A
		BCS	loc_7D8A5
		ADC	#$A
		RTS
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7D93A

loc_7D8AC:				; ...
		LDA	word_47
		CLC
		ADC	#4
		TAY
		LDA	(v21),Y
		CMP	#6
		BCC	loc_7D8CF
		CMP	#8
		BCS	loc_7D8CF
		LDA	(v21),Y
		SEC
		SBC	#1
		STA	(v21),Y
		LDA	#1
		JSR	FindEnemy	; A - enemy ID
					; $49 -	unknown4
					;
					; returns:
					; X - slot offset
		LDA	#6
		STA	vtmpCounter19
		JMP	SetupSpikesAction ; $19	- action counter
; ---------------------------------------------------------------------------

loc_7D8CF:				; ...
		CMP	#9
		BCC	locret_7D922
		LDA	#0
		STA	(v21),Y
		STA	vtmpCounter19
		LDA	#1
		JSR	FindEnemy	; A - enemy ID
					; $49 -	unknown4
					;
					; returns:
					; X - slot offset
		JSR	SetupSpikesAction ; $19	- action counter
		LDX	#seSpikesClank
		JSR	PlaySound_Wrapper ; X -	sound id
		LDX	#seSpikes
		JMP	PlaySound_Wrapper ; X -	sound id
; END OF FUNCTION CHUNK	FOR sub_7D93A

; =============== S U B	R O U T	I N E =======================================


PlayMetallSound:			; ...
		LDA	#0
		LDX	#seMetallClank
		JSR	PlaySound_Wrapper ; X -	sound id
		LDX	#seCuttersClap
		LDA	#0
		JSR	PlaySound_Wrapper ; X -	sound id
		JMP	SwitchPRGBank_2
; End of function PlayMetallSound


; =============== S U B	R O U T	I N E =======================================


SwitchPRGBank_4:			; ...
		LDA	#4
		JMP	SwitchPRGBank
; End of function SwitchPRGBank_4


; =============== S U B	R O U T	I N E =======================================

; $19 -	action counter

SetupSpikesAction:			; ...
		LDA	vEnemy.YPos+1,X
		BEQ	loc_7D913
		LDA	#<(pActionSpikesMove2)
		CLC
		ADC	vtmpCounter19
		STA	vEnemy.ptrAction,X
		LDA	#>(pActionSpikesMove2)
		JMP	loc_7D91D
; ---------------------------------------------------------------------------

loc_7D913:				; ...
		LDA	#<(pActionSpikesMove1)
		CLC
		ADC	vtmpCounter19
		STA	vEnemy.ptrAction,X
		LDA	#>(pActionSpikesMove1)

loc_7D91D:				; ...
		ADC	#0
		STA	vEnemy.ptrAction+1,X

locret_7D922:				; ...
		RTS
; End of function SetupSpikesAction


; =============== S U B	R O U T	I N E =======================================


sub_7D923:				; ...
		LDA	word_47
		CLC
		ADC	#6
		TAY
		LDA	(v21),Y
		ORA	#$81 ; 'Å'
		STA	(v21),Y
		LDA	#1
		JSR	FindEnemy	; A - enemy ID
					; $49 -	unknown4
					;
					; returns:
					; X - slot offset
		LDA	#pPrincePosesLo	- pPrincePosesLo
		STA	vEnemy.nPose,X
		RTS
; End of function sub_7D923


; =============== S U B	R O U T	I N E =======================================


sub_7D93A:				; ...

; FUNCTION CHUNK AT D8AC SIZE 0000003F BYTES

		LDA	#<(vAnimBlock)
		STA	v21
		LDA	#>(vAnimBlock)
		STA	v22
		LDA	#0
		STA	word_47

loc_7D946:				; ...
		LDY	word_47
		LDA	(v21),Y
		CMP	#$FF
		BEQ	locret_7D9B4
		INY
		LDA	(v21),Y
		CMP	word_47+1
		BNE	loc_7D9AB
		LDA	word_47
		CLC
		ADC	#9
		TAY
		LDA	(v21),Y
		STA	v49
		CMP	vEnemyPlace
		BNE	loc_7D99C
		LDA	word_47
		STA	vRoomGuardPlace
		LDA	vfWaitRestartLevel
		BNE	loc_7D98F

loc_7D96E:				; ...
		JSR	IncrementAnimBlockOffset
		LDY	word_47
		LDA	(v21),Y
		CMP	#$FF
		BEQ	loc_7D98F
		INY
		LDA	(v21),Y
		CMP	word_47+1
		BNE	loc_7D98C
		LDA	word_47
		CLC
		ADC	#4
		TAY
		LDA	(v21),Y
		CMP	#$B
		BNE	loc_7D99C

loc_7D98C:				; ...
		JMP	loc_7D96E
; ---------------------------------------------------------------------------

loc_7D98F:				; ...
		LDA	#1
		STA	vfDisabledBlockAction
		LDA	vRoomGuardPlace
		STA	word_47
		JMP	loc_7D8AC
; ---------------------------------------------------------------------------

loc_7D99C:				; ...
		JSR	sub_7D923
		LDA	word_47
		CLC
		ADC	#4
		TAY
		LDA	(v21),Y
		CMP	#$B
		BNE	loc_7D9B1

loc_7D9AB:				; ...
		JSR	IncrementAnimBlockOffset
		JMP	loc_7D946
; ---------------------------------------------------------------------------

loc_7D9B1:				; ...
		STA	vfDisabledBlockAction

locret_7D9B4:				; ...
		RTS
; End of function sub_7D93A


; =============== S U B	R O U T	I N E =======================================


IsObjectCurrentRoomHiBitSet:		; ...
		LDA	#0
		STA	v54
; End of function IsObjectCurrentRoomHiBitSet


; =============== S U B	R O U T	I N E =======================================


IsObjectHiBitSet:			; ...
		JSR	GetBitsByRoomId	; input:
					;  $54 or $6f0 True - get by vDoorRoom id
					;  $4b1	- place	in room
					; return:
					;  $6D - array offset
					;  $6E (and A) - bit mask (2 bits)
					;  X - bits pattern id
		LDY	vLevelDataPtr
		LDA	vObjectsMasks,Y
		AND	pObjectBitmaskHi,X
		RTS
; End of function IsObjectHiBitSet

; ---------------------------------------------------------------------------

IsObjectCurrentRoomLoBitSet:		; not used anywhere
		LDA	#0
		STA	v54

; =============== S U B	R O U T	I N E =======================================


IsObjectLoBitSet:			; ...
		JSR	GetBitsByRoomId	; input:
					;  $54 or $6f0 True - get by vDoorRoom id
					;  $4b1	- place	in room
					; return:
					;  $6D - array offset
					;  $6E (and A) - bit mask (2 bits)
					;  X - bits pattern id
		LDY	vLevelDataPtr
		LDA	vObjectsMasks,Y
		AND	pObjectBitmaskLo,X
		RTS
; End of function IsObjectLoBitSet


; =============== S U B	R O U T	I N E =======================================


LookForActionFloor:			; ...
		LDA	#0
		STA	vEnemyPlace
		STA	vDupEnemyPlace
		JMP	sub_7D147
; End of function LookForActionFloor


; =============== S U B	R O U T	I N E =======================================


sub_7D9E0:				; ...
		LDA	v12
		BNE	locret_7D9EB
		LDA	vBrokenPlateWaveTimer
		CMP	#$FF
		BNE	loc_7D9EC

locret_7D9EB:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7D9EC:				; ...
		JSR	GetSavedRoomDataPtr
		LDA	#$18
		JSR	FindEnemyById_Wrapper ;	$A - enemy id to search
					; return: Y=0 -	not found, Y=1 - found,	X - slot offset
		STX	vwEnemySlotOffset
		LDA	vEnemy.nPose,X
		BNE	locret_7D9EB
		LDA	byte_6D9
		CMP	#$FF
		BNE	lbWalkFloorForLookingBrokenPlate
		LDA	#0
		STA	byte_4EC
		LDA	vEnemy.nAction
		CMP	#oaJumpUpAndBump
		BNE	loc_7DA2C
		JSR	LookForActionFloor
		JSR	GetSavedRoomDataPtr
		LDA	vEnemyPlace
		SEC
		SBC	#$A
		BCS	loc_7DA39
		ADC	#$1E
		STA	byte_6D9
		JSR	GetTopBorderBlocks
		LDA	#1
		STA	byte_4EC
		JMP	lbWalkFloorForLookingBrokenPlate
; ---------------------------------------------------------------------------

loc_7DA2C:				; ...
		LDA	byte_6D9
		CMP	#$FF
		BNE	lbWalkFloorForLookingBrokenPlate
		JSR	LookForActionFloor
		LDA	vEnemyPlace

loc_7DA39:				; ...
		STA	byte_6D9
		JSR	GetSavedRoomDataPtr

lbWalkFloorForLookingBrokenPlate:	; ...
		LDA	byte_6D9
		CLC
		ADC	vBrokenPlateWave
		TAY
		INC	vBrokenPlateWave
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbBrokenPlate	; broken plate
		BEQ	lbBrokenPlateWaveAnimation
		LDA	vBrokenPlateWave
		CMP	#$A
		BCC	lbWalkFloorForLookingBrokenPlate
		LDA	#0
		STA	vBrokenPlateWave
		LDA	#$FF
		STA	byte_6D9
		DEC	vBrokenPlateWaveTimer
		RTS
; ---------------------------------------------------------------------------

lbBrokenPlateWaveAnimation:		; ...
		STY	vEnemyPlace
		INY
		LDA	byte_4EC
		STA	v54
		LDA	#0
		STA	vRoomGuardPlace
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbBigColumnLowPart
		BEQ	lbPlateNearColumns
		CMP	#lbDoubleColumns
		BEQ	lbPlateNearColumns
		CMP	#lbBrickWall
		BNE	lbPlateNotHidden
		LDA	#2
		STA	vRoomGuardPlace
		JMP	lbPlateNotHidden
; ---------------------------------------------------------------------------

lbPlateNearColumns:			; ...
		LDA	#1
		STA	vRoomGuardPlace

lbPlateNotHidden:			; ...
		JSR	GetBitsForPlace
		BNE	lbBrokenPlateWaveExit
		LDA	byte_4EC
		BEQ	lbSetupBrokenPlateWave
		LDA	vEnemyPlace
		SEC
		SBC	#20
		STA	vEnemyPlace

lbSetupBrokenPlateWave:			; ...
		LDX	#seBrokenPlateWave
		JSR	PlaySound_Wrapper ; X -	sound id
		JSR	SetupEnemyPlace	; vEnemyPlace -	is a place to be converted
					; vwEnemySlotOffset - offset of	slot to	write converted	point
		LDX	vwEnemySlotOffset
		LDA	vEnemy.nEnemyID,X
		ORA	#$80 ; 'Ä'
		STA	vEnemy.nEnemyID,X
		JSR	SwitchPRGBank_5
		LDA	vRoomGuardPlace
		BEQ	lbSetupBrokenPlate_Full	; shows	full frame of broken plate wave
		CMP	#2
		BNE	lbSetupBrokenPlate_Half	; shows	half of	broken plate wave
		LDA	#>(pAnimationBrokenPlateWave_1_of_4) ; 1/4 of plate	will waving
		STA	vEnemy.ptrAction+1,X
		LDA	#<(pAnimationBrokenPlateWave_1_of_4)
		JMP	lbSetupBrokenPlateObject
; ---------------------------------------------------------------------------

lbSetupBrokenPlate_Half:		; ...
		LDA	#>(pAnimationBrokenPlateWave_Half) ; shows half of broken plate wave
		STA	vEnemy.ptrAction+1,X
		LDA	#<(pAnimationBrokenPlateWave_Half)
		JMP	lbSetupBrokenPlateObject
; ---------------------------------------------------------------------------

lbSetupBrokenPlate_Full:		; ...
		LDA	#>(pAnimationBrokenPlateWave_Full) ; shows full frame of broken plate wave
		STA	vEnemy.ptrAction+1,X
		LDA	#<(pAnimationBrokenPlateWave_Full)

lbSetupBrokenPlateObject:		; ...
		STA	vEnemy.ptrAction,X
		LDA	byte_4EC
		BEQ	lbBrokenPlateWaveExit
		LDA	vEnemy.YPos,X
		SEC
		SBC	#$40 ; '@'
		STA	vEnemy.YPos,X

lbBrokenPlateWaveExit:			; ...
		RTS
; End of function sub_7D9E0


; =============== S U B	R O U T	I N E =======================================


NMIUpdateHealthBarChars:		; ...
		JSR	SwitchPRGBank_5
		JSR	WaitNMI_PRG6
		JSR	WaitHealthBarScanline
		JMP	SwitchPRGBank_4
; End of function NMIUpdateHealthBarChars


; =============== S U B	R O U T	I N E =======================================


SetupPrinceX:				; ...
		LDA	vPrinceXPos
		STA	vEnemy.XPos
		LDA	vPrinceXPos+1
		STA	vEnemy.XPos+1
		RTS
; End of function SetupPrinceX


; =============== S U B	R O U T	I N E =======================================


SavePrinceYAndPlace:			; ...
		LDA	vEnemy.YPos
		STA	vSavedPlayerY
		LDA	vDupEnemyPlace
		STA	word_47
		LDA	vEnemyPlace
		STA	vtmpCounter4F
		RTS
; End of function SavePrinceYAndPlace


; =============== S U B	R O U T	I N E =======================================


GetBitsForPlace:			; ...
		JSR	GetBitsByRoomId	; input:
					;  $54 or $6f0 True - get by vDoorRoom id
					;  $4b1	- place	in room
					; return:
					;  $6D - array offset
					;  $6E (and A) - bit mask (2 bits)
					;  X - bits pattern id
		LDX	vLevelDataPtr
		LDA	vObjectsMasks,X
		AND	vLevelDataPtr+1
		RTS
; End of function GetBitsForPlace


; =============== S U B	R O U T	I N E =======================================


UpdateObjectBits:			; ...
		JSR	GetBitsByRoomId	; input:
; End of function UpdateObjectBits	;  $54 or $6f0 True - get by vDoorRoom id
					;  $4b1	- place	in room
					; return:
					;  $6D - array offset
					;  $6E (and A) - bit mask (2 bits)
					;  X - bits pattern id

; =============== S U B	R O U T	I N E =======================================


SetBitsToObjectsBitsMask:		; ...
		LDX	vLevelDataPtr
		LDA	vObjectsMasks,X
		ORA	vLevelDataPtr+1
		STA	vObjectsMasks,X
		RTS
; End of function SetBitsToObjectsBitsMask


; =============== S U B	R O U T	I N E =======================================

; input:
;  $54 or $6f0 True - get by vDoorRoom id
;  $4b1	- place	in room
; return:
;  $6D - array offset
;  $6E (and A) - bit mask (2 bits)
;  X - bits pattern id

GetBitsByRoomId:			; ...
		LDX	vRoomId
		LDA	vfExternalRoomId
		BNE	lbGetByExternalRoomId
		LDA	v54
		BEQ	lbBeginGetBitsByRoomId

lbGetByExternalRoomId:			; ...
		LDX	vDoorRoom

lbBeginGetBitsByRoomId:			; ...
		STX	vLevelDataPtr
		TXA
		ASL	A
		ASL	A
		ASL	A
		CLC
		ADC	vLevelDataPtr
		STA	vLevelDataPtr
		LDA	vEnemyPlace

lbNextRoomLine:				; ...
		TAX
		SEC
		SBC	#10
		CMP	#100
		BCS	lbCheckColumn
		INC	vLevelDataPtr
		INC	vLevelDataPtr
		INC	vLevelDataPtr
		JMP	lbNextRoomLine
; ---------------------------------------------------------------------------

lbCheckColumn:				; ...
		TXA
		PHA

lbNextRoomColumn:			; ...
		TAX
		SEC
		SBC	#4
		CMP	#100
		BCS	lbGetBits
		INC	vLevelDataPtr
		JMP	lbNextRoomColumn
; ---------------------------------------------------------------------------

lbGetBits:				; ...
		PLA
		TAX
		LDA	pObjectBitmask,X
		STA	vLevelDataPtr+1
		RTS
; End of function GetBitsByRoomId


; =============== S U B	R O U T	I N E =======================================


ResetSoundEffects:			; ...
		JSR	_ResetSoundEffects
		JMP	SwitchPRGBank_4
; End of function ResetSoundEffects


; =============== S U B	R O U T	I N E =======================================


SetupPrinceObjectSlot:			; ...
		LDA	#<(pPrinceObject)
		STA	vSlotDataPtr
		LDA	#>(pPrinceObject)
		STA	vSlotDataPtr+1
		LDY	#0
; End of function SetupPrinceObjectSlot


; =============== S U B	R O U T	I N E =======================================

; Y - slot ptr
; 2F,30	- ptr to data for write

WriteSlotData:				; ...
		STY	vwTmp_17+1
		LDA	#0
		STA	vwTmp_17

lbWriteSlotDataLoop:			; ...
		LDX	#0
		LDY	vwTmp_17
		LDA	(vSlotDataPtr),Y
		CMP	#$FF
		BNE	lbWriteSlotDataPass1
		INX

lbWriteSlotDataPass1:			; ...
		LDY	vwTmp_17+1
		STA	vEnemy.nEnemyID,Y
		INC	vwTmp_17
		INC	vwTmp_17+1
		LDY	vwTmp_17
		LDA	(vSlotDataPtr),Y
		CMP	#$FF
		BNE	lbWriteSlotDataPass2
		INX

lbWriteSlotDataPass2:			; ...
		LDY	vwTmp_17+1
		STA	vEnemy.nEnemyID,Y
		INC	vwTmp_17
		INC	vwTmp_17+1
		CPX	#2
		BEQ	lbWriteSlotDataExit
		JMP	lbWriteSlotDataLoop
; ---------------------------------------------------------------------------

lbWriteSlotDataExit:			; ...
		RTS
; End of function WriteSlotData


; =============== S U B	R O U T	I N E =======================================


CheckObjectFightPose:			; ...
		LDA	vEnemy.nPose,Y
		CPY	#0
		BEQ	loc_7DBC4
		CMP	#pGuardPose9E_offset+$97 - pGuardPosesLo
		BEQ	loc_7DBC8

loc_7DBC4:				; ...
		CMP	#pPrincePose9F_offset -	pPrincePosesLo
		BNE	locret_7DBCD

loc_7DBC8:				; ...
		LDA	#oaNone
		STA	vEnemy.nAction,Y

locret_7DBCD:				; ...
		RTS
; End of function CheckObjectFightPose


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

LoadExitDoorTiles:			; ...

; FUNCTION CHUNK AT BCC3 SIZE 00000025 BYTES

		JMP	_LoadExitDoorTiles
; End of function LoadExitDoorTiles


; =============== S U B	R O U T	I N E =======================================


PlaySound_DoorClosed:			; ...
		LDX	#seBreakSound
		JSR	PlaySound_Wrapper ; X -	sound id
		JMP	_UnsafeSwitchPRGBank_2
; End of function PlaySound_DoorClosed

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR _ResetSoundEffects

_UnsafeSwitchPRGBank_2:			; ...
		LDA	#2
		JMP	SwitchPRGBank
; END OF FUNCTION CHUNK	FOR _ResetSoundEffects

; =============== S U B	R O U T	I N E =======================================


ResetSounds:				; ...
		LDA	vfEnableMusic
		BNE	_ResetSoundEffects
		RTS
; End of function ResetSounds


; =============== S U B	R O U T	I N E =======================================


_ResetSoundEffects:			; ...

; FUNCTION CHUNK AT DBD9 SIZE 00000005 BYTES

		JSR	GetSavedRoomDataPtr
		LDX	#seNone0
		TXA
		JSR	j__PlaySound
		LDX	#1
		TXA
		JSR	j__PlaySound
		LDX	#2
		TXA
		JSR	j__PlaySound
		LDX	#3
		TXA
		JSR	j__PlaySound
		JMP	_UnsafeSwitchPRGBank_2
; End of function _ResetSoundEffects


; =============== S U B	R O U T	I N E =======================================


SaveRoomDataPtr:			; ...
		LDA	vC
		STA	vPPUPtr
		LDA	vD
		STA	vPPUPtr+1
		RTS
; End of function SaveRoomDataPtr


; =============== S U B	R O U T	I N E =======================================


RestoreRoomDataPtr:			; ...
		LDA	vPPUPtr+1
		STA	vD
		LDA	vPPUPtr
		STA	vC
		RTS
; End of function RestoreRoomDataPtr

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR CheckDemoPlayControl

loc_7DC14:				; ...
		JSR	SwitchPRGBank_5
		JSR	WaitHealthBarScanline
		LDA	#0
		STA	vPPU_CR_2
		JSR	WaitNMI_PRG6
		JMP	lbBeginGame
; END OF FUNCTION CHUNK	FOR CheckDemoPlayControl

; =============== S U B	R O U T	I N E =======================================


InitAndPreloadJoints:			; ...
		JSR	SwitchPRGBank_2
		JSR	ClearRenderVars
		JSR	RenderPalaceBackground
		JSR	GetCurrentRoomDataPtr_PRG6
		LDA	vC
		STA	vSavedRoomDataPtrLo
		LDA	vD
		STA	vSavedRoomDataPtrHi
		JSR	GetLeftBorderBlocks ; vLevelDataPtr - pointer to blocks
					; vDoorRoom - left border room id
		LDA	vC
		STA	vptrLeftBorderBlocksPtr
		LDA	vD
		STA	vptrLeftBorderBlocksPtr+1
		LDA	vDoorRoom
		STA	vLeftBorderRoomId
		JSR	DrawCornersBlocks
		LDA	#0
		STA	v54
		STA	vfExternalRoomId
		LDA	#1
		STA	vfJoypadLeft
		JSR	sub_7DDCA
		LDA	#0
		STA	vfJoypadLeft
		JSR	SwitchPRGBank_5
		LDA	#>(PPU_ATTR_PAGE_0_LINES_0_1_2_3)
		STA	vwTmp_17
		JSR	EraseRoomAttr
		LDA	#>(PPU_ATTR_PAGE_1_LINES_0_1_2_3)
		STA	vwTmp_17
		JSR	EraseRoomAttr
		JSR	SwitchPRGBank_6
		STA	v61
		STA	v5F
		JSR	GetLevelDataPtr
		JSR	StoreRoomDataPtr
		LDA	#<(PPU_PAGE_0_LINE_16+2)
		STA	vwTmp_17+1
		LDA	#>(PPU_PAGE_0_LINE_16+2)
		STA	vwTmp_17
		LDA	vSavePreviousBlockId1
		STA	vPreviousBlockId
		LDA	#$14
		STA	vEnemyPlace
		JSR	sub_7E11A
		LDA	#0
		STA	v5F
		JSR	GetLevelDataPtr
		JSR	StoreRoomDataPtr
		LDA	#<(PPU_PAGE_0_LINE_8+2)
		STA	vwTmp_17+1
		LDA	#>(PPU_PAGE_0_LINE_8+2)
		STA	vwTmp_17
		LDA	vSavePreviousBlockId2
		STA	vPreviousBlockId
		LDA	#$A
		STA	vEnemyPlace
		JSR	sub_7E11A
		JSR	GetLevelDataPtr
		JSR	StoreRoomDataPtr
		LDA	#<(PPU_PAGE_0_LINE_0+2)
		STA	vwTmp_17+1
		LDA	#>(PPU_PAGE_0_LINE_0+2)
		STA	vwTmp_17
		LDA	vDupCastleOverDoor
		STA	vPreviousBlockId
		LDA	#0
		STA	vEnemyPlace
		JSR	sub_7E11A
		LDA	#0
		STA	v61
		JSR	sub_7DDE9
		JSR	SwitchPRGBank_2
		JSR	EraseRoomScreen
		JSR	sub_2A7C7
		JSR	RenderHoles	; renders holes	after fallen broken plates
		LDA	#$1C		; doubled id of	'debris plate' = 0x0E
		STA	vPrevBlockIdDataOffset
		LDA	#lbPlate
		STA	vPreviousBlockId
		JSR	LoadHorzJointForBlock ;	Input:
					;     vPrevBlockIdDataOffset - 2x(block	id)
					;
					; Output:
					;     A	- first	tile id	of loaded joint	chars
		STA	byte_40F
		LDA	#lbSpikesPlate
		STA	vPreviousBlockId
		JSR	LoadHorzJointForBlock ;	Input:
					;     vPrevBlockIdDataOffset - 2x(block	id)
					;
					; Output:
					;     A	- first	tile id	of loaded joint	chars
		STA	byte_410
		LDA	#lbPlateWithDebris
		STA	vPreviousBlockId
		JSR	LoadHorzJointForBlock ;	Input:
					;     vPrevBlockIdDataOffset - 2x(block	id)
					;
					; Output:
					;     A	- first	tile id	of loaded joint	chars
		STA	byte_411
		LDA	#lbDoubleColumns
		STA	vPreviousBlockId
		JSR	LoadHorzJointForBlock ;	Input:
					;     vPrevBlockIdDataOffset - 2x(block	id)
					;
					; Output:
					;     A	- first	tile id	of loaded joint	chars
		STA	byte_412
		LDA	#lbPlateWithDebris
		STA	vPreviousBlockId
		LDA	#8
		STA	vPrevBlockIdDataOffset
		JSR	LoadHorzJointForBlock ;	Input:
					;     vPrevBlockIdDataOffset - 2x(block	id)
					;
					; Output:
					;     A	- first	tile id	of loaded joint	chars
		STA	byte_413
		LDA	#2
		STA	vPrevBlockIdDataOffset
		JSR	LoadHorzJointForBlock ;	Input:
					;     vPrevBlockIdDataOffset - 2x(block	id)
					;
					; Output:
					;     A	- first	tile id	of loaded joint	chars
		STA	byte_417
		LDA	#$28 ; '('      ; doubled 'brick wall' id = 0x14
		STA	vPrevBlockIdDataOffset
		JSR	LoadHorzJointForBlock ;	Input:
					;     vPrevBlockIdDataOffset - 2x(block	id)
					;
					; Output:
					;     A	- first	tile id	of loaded joint	chars
		STA	byte_414
		LDA	#$1C
		STA	vPrevBlockIdDataOffset
		JSR	LoadHorzJointForBlock ;	Input:
					;     vPrevBlockIdDataOffset - 2x(block	id)
					;
					; Output:
					;     A	- first	tile id	of loaded joint	chars
		STA	byte_415
		LDA	#6		; doubled 'double columns' block id = 0x03
		STA	vPrevBlockIdDataOffset
		JSR	LoadHorzJointForBlock ;	Input:
					;     vPrevBlockIdDataOffset - 2x(block	id)
					;
					; Output:
					;     A	- first	tile id	of loaded joint	chars
		STA	byte_416
		JSR	sub_7DD99

loc_7DD4F:				; ...
		LDA	#lbDoubleColumns
		STA	vPreviousBlockId
		STA	vfVertBlock
		LDA	#2		; doubled 'plate' block id = 0x01
		STA	vCornerBlockId
		LDX	vCornerBlockId
		JSR	LoadBlockVertJoints ; Input: X - doubled block id
					; Output: vptrBlockData	- pointer to vert joints data for block
		JSR	GetJointPtrForBlock ; Input:
					;    vptrBlockData - pointer to	block joints data
					; Output:
					;    $6D9 = 1 -	pattern	for supplied block not found
		LDA	#lbBrickWall
		STA	vPreviousBlockId
		LDX	vCornerBlockId
		JSR	LoadBlockVertJoints ; Input: X - doubled block id
					; Output: vptrBlockData	- pointer to vert joints data for block
		JMP	GetJointPtrForBlock ; Input:
; End of function InitAndPreloadJoints	;    vptrBlockData - pointer to	block joints data
					; Output:
					;    $6D9 = 1 -	pattern	for supplied block not found

; =============== S U B	R O U T	I N E =======================================

; Input:
;     vPrevBlockIdDataOffset - 2x(block	id)
;
; Output:
;     A	- first	tile id	of loaded joint	chars

LoadHorzJointForBlock:			; ...
		LDA	#0
		STA	v54
		STA	vfRoomScreenDraw
		STA	byte_6D9
		STA	vfVertBlock
		JSR	_LoadHorzJointForBlock ; vPrevBlockIdDataOffset	- 2x(block id)
		LDA	vBlockPPUTileId
		RTS
; End of function LoadHorzJointForBlock


; =============== S U B	R O U T	I N E =======================================

; Output: ($21,	$22) - pointer to debris block description

GetPointerForDebrisPlate:		; ...
		LDA	#<(pDungeon_DebrisPlate)
		STA	v21
		LDA	#>(pDungeon_DebrisPlate)
		STA	v22
		LDA	vLevelType
		BEQ	locret_7DD98
		LDA	#<(pPalace_DebrisPlate)
		STA	v21
		LDA	#>(pPalace_DebrisPlate)
		STA	v22

locret_7DD98:				; ...
		RTS
; End of function GetPointerForDebrisPlate


; =============== S U B	R O U T	I N E =======================================


sub_7DD99:				; ...
		LDA	#lbPlateWithDebris
		JSR	GetLevelBlockCharsDataPtr ; A -	block id
					; returns: vLevelBlocksCharsPtr	- pointer
		JSR	CheckAndLoadLevelBlockChars ; vLevelBlocksCharsPtr - pointer to	block chars
					; Pointers and begin tile id will be placed at $0300 area
					; $75 -	first tile id at PPU char
		JSR	SwitchPRGBank_5
		JSR	GetPointerForDebrisPlate ; Output: ($21, $22) -	pointer	to debris block	description
		LDA	#1
		STA	vwTmp_17
		LDA	#0
		STA	vwTmp_17+1
		LDA	#$15
		STA	vtmpCounter19

loc_7DDB3:				; ...
		LDY	vwTmp_17
		LDA	(v21),Y
		BEQ	loc_7DDBC
		CLC
		ADC	vBlockPPUTileId

loc_7DDBC:				; ...
		LDX	vwTmp_17+1
		STA	vPasswordChars+5,X
		INC	vwTmp_17+1
		INC	vwTmp_17
		DEC	vtmpCounter19
		BNE	loc_7DDB3
		RTS
; End of function sub_7DD99


; =============== S U B	R O U T	I N E =======================================


sub_7DDCA:				; ...
		LDA	#1
		STA	v5E
		LDA	#2
		STA	vwTmp_17+1
		LDA	#$23 ; '#'
		STA	vwTmp_17
		JSR	GetBottomBorderBlocks
		JSR	GetCurrentRoomBlockDataPtr ; Y - block offset
					; Returns: Y - block id, vptrBlockData - pointer to raw	block data (bank switched to #6)
		LDA	#0
		STA	vEnemyPlace
		JSR	sub_7E11D
		LDA	#0
		STA	v5E
		RTS
; End of function sub_7DDCA


; =============== S U B	R O U T	I N E =======================================


sub_7DDE9:				; ...
		LDA	#1
		STA	vfRoomScreenDraw
		STA	v54
		LDA	#2
		STA	vwTmp_17+1
		LDA	#$1F
		STA	vwTmp_17
		JSR	GetTopBorderBlocks
		JSR	GetCurrentRoomBlockDataPtr ; Y - block offset
					; Returns: Y - block id, vptrBlockData - pointer to raw	block data (bank switched to #6)
		LDA	#lbPlate
		STA	vPreviousBlockId
		LDA	#X_0_Y_2
		STA	vEnemyPlace
		JMP	sub_7E11D
; End of function sub_7DDE9


; =============== S U B	R O U T	I N E =======================================


GetTopBorderBlocks:			; ...
		STY	vSaveY
		JSR	GetQuarterRoomId
		TAY
		JSR	GetLevelGeomDataPtr
		INY
		INY
		LDA	(vLevelDataPtr),Y
		BNE	loc_7DE1F
		LDX	vLevelNumber
		LDA	pTopBordersRooms,X

loc_7DE1F:				; ...
		LDY	vSaveY
		JMP	loc_7E09F
; End of function GetTopBorderBlocks


; =============== S U B	R O U T	I N E =======================================


GetBottomBorderBlocks:			; ...
		STY	vSaveY
		JSR	GetQuarterRoomId
		TAY
		JSR	GetLevelGeomDataPtr
		INY
		INY
		INY
		LDA	(vLevelDataPtr),Y
		BNE	loc_7DE39
		LDX	vLevelNumber
		LDA	pBottomBordersRooms,X

loc_7DE39:				; ...
		LDY	vSaveY
		JMP	loc_7E09F
; End of function GetBottomBorderBlocks


; =============== S U B	R O U T	I N E =======================================


GetCurrentRoomDataPtr:			; ...
		LDA	vRoomId
		JSR	GetRoomPtrById	; Input: A - room id
					; Return: $52,$53 - offset of room id (from #00	room)
		JMP	lbGetRoomDataPtr
; End of function GetCurrentRoomDataPtr

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR DoUpdateSideDoorBlocks

lbDoUpdateDoorBlocksExit:		; ...
		RTS
; END OF FUNCTION CHUNK	FOR DoUpdateSideDoorBlocks

; =============== S U B	R O U T	I N E =======================================


UpdateSideDoorBlocks:			; ...
		JSR	DoUpdateSideDoorBlocks
		JMP	GetLeftBorderBlocksPtr
; End of function UpdateSideDoorBlocks


; =============== S U B	R O U T	I N E =======================================


DoUpdateSideDoorBlocks:			; ...

; FUNCTION CHUNK AT DE46 SIZE 00000001 BYTES

		LDA	vfRoomScreenDraw
		BNE	lbDoUpdateDoorBlocksExit
		JSR	GetBlockFromEnemyPlace
		CMP	#lbDoor
		BNE	lbDoUpdateDoorBlocksExit
		LDX	vAnimBlockOffset
		LDA	vEnemyPlace
		SEC
		SBC	#9
		STA	vAnimBlockPlaces,X
		LDY	#ANIM_PALACE_SIDE_DOOR_UP_BLOCK
		LDA	vLevelType
		BNE	loc_7DE6D
		LDY	#ANIM_DUNGEON_SIDE_DOOR_UP_BLOCK

loc_7DE6D:				; ...
		TYA
		STA	vAnimBlockPlaces+1,X
		JSR	GetSavedRoomDataPtr
		LDA	vEnemyPlace
		CMP	#10
		BCC	loc_7DE98
		SEC
		SBC	#19
		TAY
		JSR	GetBlockIdFromPtr ; Y -	place in room
		BEQ	loc_7DEA7
		CMP	#lbCastleOverDoor
		BEQ	loc_7DEA7
		CMP	#lbCastleArchColumnPart
		BEQ	loc_7DEA7
		CMP	#lbCastleSmallArch
		BEQ	loc_7DEA7
		CMP	#lbCastleLeftPartBigArch
		BEQ	loc_7DEA7
		CMP	#lbCastleRightPartBigArch
		BEQ	loc_7DEA7

loc_7DE98:				; ...
		LDY	#ANIM_DUNGEON_SIDE_DOOR_BLOCK
		LDA	vLevelType
		BEQ	loc_7DEA1
		LDY	#ANIM_PALACE_SIDE_DOOR_BLOCK

loc_7DEA1:				; ...
		TYA
		LDX	vAnimBlockOffset
		STA	vAnimBlockPlaces+1,X

loc_7DEA7:				; ...
		LDA	vEnemyPlace
		SEC
		SBC	#9
		TAY
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbBrickWall
		BEQ	lbSetupSpecialOffsetBit
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbDoubleColumns
		BNE	loc_7DEC6

lbSetupSpecialOffsetBit:		; ...
		LDX	vAnimBlockOffset
		LDA	vAnimBlockPlaces+1,X
		ORA	#$40 ; '@'
		STA	vAnimBlockPlaces+1,X

loc_7DEC6:				; ...
		INC	vAnimBlockOffset
		INC	vAnimBlockOffset
		LDA	vBlockPPUTileId
		STA	vDoorBlockPPUStartTile
		RTS
; End of function DoUpdateSideDoorBlocks


; =============== S U B	R O U T	I N E =======================================


DrawCornersBlocks:			; ...

; FUNCTION CHUNK AT E048 SIZE 00000029 BYTES

		JSR	GetQuarterRoomId
		TAY
		JSR	GetLevelGeomDataPtr
		LDA	(vLevelDataPtr),Y ; note that left room	can absent,
					; so GetBottomBorderBlocks and GetCurrentRoomBlockDataPtr
					; will get data	from random area (it depends on	previous data).
					; TODO:	Need to	fix it like this:
					;
					; if ( !leftRoom[ current_room ] ) current_room	= pLeftBorders[	nLevelId ];
					; else current_room = leftRoom[	current_room ];
		SEC
		SBC	#1
		STA	vRoomId
		JSR	GetBottomBorderBlocks
		LDA	#1
		STA	vSpriteOffsetY
		LDA	#<(PPU_PAGE_0_LINE_23+$1E)
		STA	vwTmp_17+1
		LDA	#>(PPU_PAGE_0_LINE_23+$1E)
		STA	vwTmp_17
		LDY	#9
		STY	vEnemyPlace
		JSR	GetCurrentRoomBlockDataPtr ; Y - block offset
					; Returns: Y - block id, vptrBlockData - pointer to raw	block data (bank switched to #6)
		JSR	CopyPtr17To47
		JSR	FetchPtrAndDrawBlock
		JSR	GetBottomBorderBlocks
		JSR	GetCurrentRoomBlockDataPtr ; Y - block offset
					; Returns: Y - block id, vptrBlockData - pointer to raw	block data (bank switched to #6)
		STY	vCornerBlockId
		LDA	#0
		STA	vSpriteOffsetY
		STA	byte_4EE
		JSR	SwitchPRGBank_2
		JSR	loc_2AB0F
		JSR	GetSavedRoomDataPtr
		LDA	#<(PPU_PAGE_1_LINE_16+$1E)
		STA	vwTmp_17+1
		LDA	#>(PPU_PAGE_1_LINE_16+$1E)
		STA	vwTmp_17
		LDY	#X_9_Y_2
		STY	vEnemyPlace
		JSR	GetLeftBorderBlocksPtr
		JSR	GetCurrentRoomBlockDataPtr ; Y - block offset
					; Returns: Y - block id, vptrBlockData - pointer to raw	block data (bank switched to #6)
		STY	vSavePreviousBlockId1
		STY	vPreviousBlockId
		JSR	CopyPtr17To47
		JSR	FetchPtrAndDrawBlock
		JSR	UpdateSideDoorBlocks
		JSR	CheckAndDrawBgWall ; in	dungeon	gfx of wall
		JSR	SwitchPRGBank_6
		JSR	GetQuarterRoomId
		TAY
		JSR	GetLevelGeomDataPtr
		LDA	(vLevelDataPtr),Y
		SEC
		SBC	#1
		STA	vRoomId
		LDY	#X_9_Y_0
		STY	vEnemyPlace
		JSR	GetBottomBorderBlocks
		JSR	GetCurrentRoomBlockDataPtr ; Y - block offset
					; Returns: Y - block id, vptrBlockData - pointer to raw	block data (bank switched to #6)
		STY	vCornerBlockId
		LDA	#1
		STA	vfVertBlock
		JSR	DrawCornerVertJoints
		LDA	#<(PPU_PAGE_1_LINE_8+$1E)
		STA	vwTmp_17+1
		LDA	#>(PPU_PAGE_1_LINE_8+$1E)
		STA	vwTmp_17
		JSR	GetSavedRoomDataPtr
		LDY	#X_9_Y_1
		STY	vEnemyPlace
		JSR	GetLeftBorderBlocksPtr
		JSR	GetCurrentRoomBlockDataPtr ; Y - block offset
					; Returns: Y - block id, vptrBlockData - pointer to raw	block data (bank switched to #6)
		STY	vPreviousBlockId
		STY	vSavePreviousBlockId2
		JSR	GetBlockFromEnemyPlace
		CMP	#lbCastleOverDoorWithPlate
		BEQ	loc_7DF87
		CMP	#lbCastleOverDoor
		BNE	loc_7DFA6

loc_7DF87:				; ...
		JSR	GetSavedRoomDataPtr
		LDY	#X_1_Y_1
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbCastleArchColumnPart
		BNE	loc_7DFA6
		LDA	#<(PPU_PAGE_0_LINE_8+2)
		STA	vwTmp_17+1
		LDA	#>(PPU_PAGE_0_LINE_8+2)
		STA	vwTmp_17
		JSR	CopyPtr17To47
		LDA	#X_9_Y_2
		JSR	DrawLeftArchOverDoorPart
		JMP	loc_7DFC4
; ---------------------------------------------------------------------------

loc_7DFA6:				; ...
		JSR	GetLeftBorderBlocksPtr
		LDY	#X_9_Y_2
		JSR	GetBlockIdFromPtr ; Y -	place in room
		STA	vCornerBlockId
		JSR	CopyPtr17To47
		JSR	FetchPtrAndDrawBlock
		JSR	UpdateSideDoorBlocks
		JSR	CheckAndDrawBgWall ; in	dungeon	gfx of wall
		LDA	#1
		STA	vfVertBlock
		JSR	DrawCornerVertJoints

loc_7DFC4:				; ...
		JSR	SwitchPRGBank_2
		JSR	EraseRoomArea
		JSR	GetSavedRoomDataPtr
		LDY	#X_1_Y_0
		STY	vEnemyPlace
		JSR	GetCurrentRoomBlockDataPtr ; Y - block offset
					; Returns: Y - block id, vptrBlockData - pointer to raw	block data (bank switched to #6)
		CPY	#lbCastleArchColumnPart
		BEQ	loc_7DFF3
		CPY	#lbCastleSmallArch
		BEQ	loc_7DFF3
		CPY	#lbCastleLeftPartBigArch
		BEQ	loc_7DFF3
		CPY	#lbCastleRightPartBigArch
		BEQ	loc_7DFF3
		LDY	#lbBigColumnHighPart
		STY	vEnemyPlace
		JSR	GetLeftBorderBlocksPtr
		JSR	GetCurrentRoomBlockDataPtr ; Y - block offset
					; Returns: Y - block id, vptrBlockData - pointer to raw	block data (bank switched to #6)
		JMP	loc_7E048
; ---------------------------------------------------------------------------

loc_7DFF3:				; ...
		LDY	#X_9_Y_0
		STY	vEnemyPlace
		JSR	GetLeftBorderBlocksPtr
		JSR	GetCurrentRoomBlockDataPtr ; Y - block offset
					; Returns: Y - block id, vptrBlockData - pointer to raw	block data (bank switched to #6)
		CPY	#lbCastleOverDoor
		BNE	loc_7E048
		LDA	#2
		STA	vwTmp_17+1
		LDA	#$20 ; ' '
		STA	vwTmp_17
		JSR	CopyPtr17To47
		LDA	#X_9_Y_1
; End of function DrawCornersBlocks


; =============== S U B	R O U T	I N E =======================================


DrawLeftArchOverDoorPart:		; ...
		STA	vEnemyPlace
		LDA	#<(pPalaceLeftArchWithOverDoorPart)
		STA	vptrBlockData
		LDA	#>(pPalaceLeftArchWithOverDoorPart)
		STA	vptrBlockData+1
		LDY	#lbCastleOverDoor
		STY	vDupCastleOverDoor
		STY	vPreviousBlockId
		LDY	vEnemyPlace
		JSR	GetBlockIdFromPtr ; Y -	place in room
		LDA	#<(pPalaceChars_Arch)
		STA	vLevelBlocksCharsPtr
		LDA	#>(pPalaceChars_Arch)
		STA	vLevelBlocksCharsPtr+1
		JSR	__DrawBaseRoomBlocks
		JSR	CopyPtr47To17
		JSR	CopyPtr17To47
		LDA	#4
		STA	vCornerBlockId
		LDA	#1
		STA	vfVertBlock
		STA	byte_4EE
		JMP	DrawBlockJoints
; End of function DrawLeftArchOverDoorPart

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR DrawCornersBlocks

loc_7E048:				; ...
		STY	vDupCastleOverDoor
		STY	vPreviousBlockId
		LDY	#X_9_Y_1
		JSR	GetBlockIdFromPtr ; Y -	place in room
		STA	vCornerBlockId
		LDA	#<(PPU_PAGE_1_LINE_0+$1E)
		STA	vwTmp_17+1
		LDA	#>(PPU_PAGE_1_LINE_0+$1E)
		STA	vwTmp_17
		JSR	CopyPtr17To47
		JSR	FetchPtrAndDrawBlock
		JSR	UpdateSideDoorBlocks
		JSR	CheckAndDrawBgWall ; in	dungeon	gfx of wall
		LDA	#1
		STA	vfVertBlock
		JMP	DrawCornerVertJoints
; END OF FUNCTION CHUNK	FOR DrawCornersBlocks

; =============== S U B	R O U T	I N E =======================================


CopyPtr17To47:				; ...
		LDA	vwTmp_17
		STA	word_47
		LDA	vwTmp_17+1
		STA	word_47+1
		RTS
; End of function CopyPtr17To47


; =============== S U B	R O U T	I N E =======================================


GetLeftBorderBlocksPtr:			; ...
		LDA	vptrLeftBorderBlocksPtr
		STA	vC
		LDA	vptrLeftBorderBlocksPtr+1
		STA	vD
		LDA	vLeftBorderRoomId
		STA	vDoorRoom
		RTS
; End of function GetLeftBorderBlocksPtr


; =============== S U B	R O U T	I N E =======================================

; vLevelDataPtr	- pointer to blocks
; vDoorRoom - left border room id

GetLeftBorderBlocks:			; ...
		STY	vSaveY
		JSR	GetQuarterRoomId
		TAY
		JSR	GetLevelGeomDataPtr
		LDA	(vLevelDataPtr),Y
		BNE	loc_7E09D
		LDX	vLevelNumber
		LDA	pLeftBordersRooms,X

loc_7E09D:				; ...
		LDY	vSaveY

loc_7E09F:				; ...
		SEC
		SBC	#1
		STA	vDoorRoom
; End of function GetLeftBorderBlocks


; =============== S U B	R O U T	I N E =======================================


_GetCurrentRoomDataPtr:			; ...
		STA	v50
		JSR	GetRoomPtrById	; Input: A - room id
					; Return: $52,$53 - offset of room id (from #00	room)

lbGetRoomDataPtr:			; ...
		JSR	GetLevelDataPtr
		LDA	vLevelDataPtr
		CLC
		ADC	v52
		STA	vC
		LDA	vLevelDataPtr+1
		ADC	v53
		STA	vD
		RTS
; End of function _GetCurrentRoomDataPtr


; =============== S U B	R O U T	I N E =======================================

; Y - block offset
; Returns: Y - block id, vptrBlockData - pointer to raw	block data (bank switched to #6)

GetCurrentRoomBlockDataPtr:		; ...
		JSR	GetBlockIdFromPtr ; Y -	place in room
		TAY
		ASL	A
		TAX
		JMP	GetBlockDataPtr
; End of function GetCurrentRoomBlockDataPtr


; =============== S U B	R O U T	I N E =======================================


GetBlockDataPtr:			; ...
		JSR	SwitchPRGBank_4
		LDA	vLevelType
		BNE	lbGetCastleBlockDataPtr
		LDA	pDungeonBlocksLibrary,X
		STA	vptrBlockData
		LDA	pDungeonBlocksLibrary+1,X
		JMP	lbSwitchPRG6AndExit
; ---------------------------------------------------------------------------

lbGetCastleBlockDataPtr:		; ...
		LDA	pPalaceBlocksLibrary,X
		STA	vptrBlockData
		LDA	pPalaceBlocksLibrary+1,X

lbSwitchPRG6AndExit:			; ...
		STA	vptrBlockData+1
; End of function GetBlockDataPtr


; =============== S U B	R O U T	I N E =======================================


SwitchPRGBank_6:			; ...
		LDA	#6
		JMP	SwitchPRGBank
; End of function SwitchPRGBank_6


; =============== S U B	R O U T	I N E =======================================


CheckForBrokenPlate:			; ...
		LDA	vfRoomScreenDraw
		BNE	_GetBlockIdFromPtr
		JSR	GetBlockFromEnemyPlace
		BEQ	_GetBlockIdFromPtr
		CMP	#lbPlate
		BNE	_GetBlockIdFromPtr
		JSR	GetBitsForPlace
		BEQ	_GetBlockIdFromPtr
		LDA	vLevelType
		BNE	lbCastleBrokenPlate
		LDA	#<(pDungeon_DebrisPlate)
		STA	vptrBlockData
		LDA	#>(pDungeon_DebrisPlate)
		STA	vptrBlockData+1
		JMP	lbUpdatePlateAsBroken
; ---------------------------------------------------------------------------

lbCastleBrokenPlate:			; ...
		LDA	#<(pPalace_DebrisPlate)
		STA	vptrBlockData
		LDA	#>(pPalace_DebrisPlate)
		STA	vptrBlockData+1

lbUpdatePlateAsBroken:			; ...
		LDA	#lbPlateWithDebris
		STA	vPreviousBlockId
		RTS
; ---------------------------------------------------------------------------

_GetBlockIdFromPtr:			; ...
		JMP	GetBlockIdFromPtr ; Y -	place in room
; End of function CheckForBrokenPlate


; =============== S U B	R O U T	I N E =======================================


sub_7E11A:				; ...
		JSR	GetSavedRoomDataPtr
; End of function sub_7E11A


; =============== S U B	R O U T	I N E =======================================


sub_7E11D:				; ...
		LDA	#0
		STA	byte_4BE
		LDY	#$A

loc_7E124:				; ...
		TYA
		PHA
		JSR	CopyPtr17To47
		LDA	vPreviousBlockId
		ASL	A
		STA	vPrevBlockIdDataOffset
		JSR	GetBlockFromEnemyPlace
		STA	vRoomGuardPlace
		BEQ	loc_7E151
		CMP	#lbBrokenPlate
		BEQ	loc_7E151
		CMP	#lbBigColumnHighPart
		BEQ	loc_7E151
		LDA	vfRoomScreenDraw
		BEQ	loc_7E151
		LDX	#1
		LDA	vRoomGuardPlace
		CMP	#$14
		BNE	loc_7E14E
		TAX

loc_7E14E:				; ...
		STX	vRoomGuardPlace

loc_7E151:				; ...
		LDA	vRoomGuardPlace
		STA	vPreviousBlockId
		STA	vLevelBlocksCharsEOFMarker
		ASL	A
		TAX
		STX	vtmpCounter4F
		LDA	vC
		STA	word_5C
		LDA	vD
		STA	word_5C+1
		LDA	vRoomGuardPlace
		CMP	#$11
		BNE	loc_7E184
		LDA	vEnemyPlace
		ASL	A
		TAX
		LDA	pPPUOffsets+1,X
		STA	vExitDoorAnimPPUPtrHi
		LDA	pPPUOffsets,X
		CLC
		ADC	#$21 ; '!'
		STA	vExitDoorAnimPPUPtrLo
		STA	vfExitDoorCharLoad

loc_7E184:				; ...
		LDA	vRoomGuardPlace
		CMP	#6
		BEQ	loc_7E192
		CMP	#$F
		BNE	loc_7E1FA
		JMP	loc_7E19E
; ---------------------------------------------------------------------------

loc_7E192:				; ...
		TYA
		PHA
		LDA	#5
		JSR	GetLevelBlockCharsDataPtr ; A -	block id
					; returns: vLevelBlocksCharsPtr	- pointer
		JSR	CheckAndLoadLevelBlockChars ; vLevelBlocksCharsPtr - pointer to	block chars
					; Pointers and begin tile id will be placed at $0300 area
					; $75 -	first tile id at PPU char
		PLA
		TAY

loc_7E19E:				; ...
		JSR	SaveRoomDataPtr
		LDA	vPreviousBlockId
		PHA
		LDA	vPrevBlockIdDataOffset
		PHA
		TYA
		PHA
		INY
		JSR	GetBlockIdFromPtr ; Y -	place in room
		STA	vPreviousBlockId
		LDX	#$A
		LDA	vRoomGuardPlace
		CMP	#6
		BEQ	loc_7E1BC
		LDX	#2

loc_7E1BC:				; ...
		STX	vPrevBlockIdDataOffset
		JSR	LoadHorzJointForBlock ;	Input:
					;     vPrevBlockIdDataOffset - 2x(block	id)
					;
					; Output:
					;     A	- first	tile id	of loaded joint	chars
		PLA
		TAY
		DEY
		CPY	#9
		BEQ	loc_7E1D0
		CPY	#$13
		BEQ	loc_7E1D0
		CPY	#$FF
		BNE	loc_7E1D8

loc_7E1D0:				; ...
		TYA
		CLC
		ADC	#$A
		TAY
		JSR	GetLeftBorderBlocksPtr

loc_7E1D8:				; ...
		LDA	(vC),Y
		AND	#$1F
		ASL	A
		STA	vPrevBlockIdDataOffset
		LDX	#5
		LDA	vRoomGuardPlace
		CMP	#6
		BEQ	loc_7E1EA
		LDX	#1

loc_7E1EA:				; ...
		STX	vPreviousBlockId
		JSR	LoadHorzJointForBlock ;	Input:
					;     vPrevBlockIdDataOffset - 2x(block	id)
					;
					; Output:
					;     A	- first	tile id	of loaded joint	chars
		PLA
		STA	vPrevBlockIdDataOffset
		PLA
		STA	vPreviousBlockId
		JSR	RestoreRoomDataPtr

loc_7E1FA:				; ...
		JSR	GetNextFloorBlockId
		STA	vCornerBlockId
		LDA	word_5C
		STA	vC
		LDA	word_5C+1
		STA	vD
		LDX	vtmpCounter4F
		JSR	GetBlockDataPtr
		JSR	GetBlockFromEnemyPlace
		CMP	#lbLevel4MirrorPlate
		BNE	loc_7E22A
		LDA	vfLevel4ExitOpened
		BNE	loc_7E21E
		JSR	SetupPlatePtr
		JMP	loc_7E323
; ---------------------------------------------------------------------------

loc_7E21E:				; ...
		LDA	vEnemy.YPos
		CMP	#$48 ; 'H'
		BCS	loc_7E22A
		LDA	#1
		STA	vfPrinceWithinRoomHeight

loc_7E22A:				; ...
		LDA	vfRoomScreenDraw
		BNE	loc_7E272
		LDY	vEnemyPlace
		DEY
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbCastleArchColumnPart
		BEQ	loc_7E246
		CMP	#lbCastleSmallArch
		BEQ	loc_7E246
		CMP	#lbCastleLeftPartBigArch
		BEQ	loc_7E246
		CMP	#lbCastleRightPartBigArch
		BNE	loc_7E272

loc_7E246:				; ...
		JSR	GetBlockFromEnemyPlace
		CMP	#lbCastleOverDoor
		BNE	loc_7E272
		LDA	#lbCastleArchColumnPart|Modifier_07
		STA	vSavePreviousBlockId3_Residual
		STA	vPreviousBlockId
		LDA	#<(pPalaceRightArchWithOverDoorPart)
		STA	vptrBlockData
		LDA	#>(pPalaceRightArchWithOverDoorPart)
		STA	vptrBlockData+1
		LDY	#X_9_Y_1
		JSR	GetBlockIdFromPtr ; Y -	place in room
		STA	vCornerBlockId
		LDA	#<(pPalaceChars_Arch)
		STA	vLevelBlocksCharsPtr
		LDA	#>(pPalaceChars_Arch)
		STA	vLevelBlocksCharsPtr+1
		JSR	__DrawBaseRoomBlocks
		JMP	loc_7E4E7
; ---------------------------------------------------------------------------

loc_7E272:				; ...
		LDA	vfRoomScreenDraw
		BEQ	loc_7E283
		JSR	GetBlockFromEnemyPlace
		BEQ	loc_7E2C6
		CMP	#lbBigColumnHighPart
		BEQ	loc_7E2C6
		JMP	loc_7E29C
; ---------------------------------------------------------------------------

loc_7E283:				; ...
		LDA	v5E
		BEQ	loc_7E2C6
		LDY	vEnemyPlace
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbDoor
		BEQ	loc_7E29C
		CMP	#lbCastleOverDoorWithPlate
		BEQ	loc_7E29C
		CMP	#lbCutters
		BEQ	loc_7E29C
		JMP	loc_7E2C6
; ---------------------------------------------------------------------------

loc_7E29C:				; ...
		CMP	#lbBrickWall
		BEQ	loc_7E2C0
		CMP	#lbCastleOverDoor
		BNE	loc_7E2BA
		LDA	#<(pPalaceChars_OverDoor)
		STA	vLevelBlocksCharsPtr
		LDA	#>(pPalaceChars_OverDoor)
		STA	vLevelBlocksCharsPtr+1
		STA	vfLoadedPalaceTiles
		LDA	#<(pDungeon_OverDoorPlate)
		STA	vptrBlockData
		LDA	#>(pDungeon_OverDoorPlate)
		STA	vptrBlockData+1
		JMP	lbSkipLoadWallSpecialTiles
; ---------------------------------------------------------------------------

loc_7E2BA:				; ...
		JSR	SetupPlatePtr
		JMP	lbSkipLoadWallSpecialTiles
; ---------------------------------------------------------------------------

loc_7E2C0:				; ...
		JSR	LoadWallTilesPtr
		JMP	lbSkipLoadWallSpecialTiles
; ---------------------------------------------------------------------------

loc_7E2C6:				; ...
		LDA	vfJoypadLeft
		BEQ	loc_7E2DE
		LDA	vLevelBlocksCharsEOFMarker
		BEQ	loc_7E2DE
		CMP	#lbCastleOverDoor
		BEQ	loc_7E2DE
		CMP	#lbDoor
		BEQ	loc_7E2DE
		CMP	#lbBrickWall
		BEQ	loc_7E2DE
		JMP	loc_7E4E7
; ---------------------------------------------------------------------------

loc_7E2DE:				; ...
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBrickWall
		BNE	lbSkipLoadWallSpecialTiles
		INC	vBrickWallCounter
		LDA	vBrickWallCounter
		AND	#3
		CMP	#1
		BEQ	lbSkipLoadWallSpecialTiles
		JSR	GetBrickWallSpecialTiles

lbSkipLoadWallSpecialTiles:		; ...
		JSR	CheckForBrokenPlate
		CMP	#lbBrokenPlate
		BNE	loc_7E323
		JSR	GetBitsForPlace
		BEQ	loc_7E310
		LDA	#<(pDungeon_Space)
		STA	vptrBlockData
		LDA	#>(pDungeon_Space)
		STA	vptrBlockData+1
		LDA	#lbSpace
		STA	vPreviousBlockId
		JMP	loc_7E323
; ---------------------------------------------------------------------------

loc_7E310:				; ...
		LDA	v5E
		BNE	loc_7E323
		LDA	vSpriteOffsetY
		BNE	loc_7E323
		TYA
		LDX	vFallingPlateSlotOffset
		STA	vFallingPlatePlace,X
		INC	vFallingPlateSlotOffset

loc_7E323:				; ...
		JSR	CopyPtr17To47
		JSR	FetchPtrAndDrawBlock
		LDA	vSpriteOffsetY
		BNE	loc_7E337
		LDA	vfRoomScreenDraw
		BNE	loc_7E337
		LDA	v5E
		BEQ	loc_7E33A

loc_7E337:				; ...
		JMP	lbCheckAndDrawBlockJoints
; ---------------------------------------------------------------------------

loc_7E33A:				; ...
		LDY	vEnemyPlace
		LDA	(vC),Y
		AND	#$E0 ; '‡'
		CMP	#lbSpace|Modifier_03
		BNE	loc_7E37A
		JSR	GetBlockIdFromPtr ; Y -	place in room
		BNE	loc_7E37A
		LDA	#<(pDungeonWallWindow)
		STA	vptrBlockData
		LDA	#>(pDungeonWallWindow)
		STA	vptrBlockData+1
		LDA	vLevelType
		BEQ	loc_7E35F
		LDA	#<(pPalaceWallWindow)
		STA	vptrBlockData
		LDA	#>(pPalaceWallWindow)
		STA	vptrBlockData+1

loc_7E35F:				; ...
		JSR	CopyPtr47To17
		LDA	#<(pDungeonWallWindowChars)
		STA	vLevelBlocksCharsPtr
		LDA	#>(pDungeonWallWindowChars)
		STA	vLevelBlocksCharsPtr+1
		LDA	vLevelType
		BEQ	loc_7E377
		LDA	#<(pPalaceWallWindowChars)
		STA	vLevelBlocksCharsPtr
		LDA	#>(pPalaceWallWindowChars)
		STA	vLevelBlocksCharsPtr+1

loc_7E377:				; ...
		JSR	__DrawBaseRoomBlocks

loc_7E37A:				; ...
		LDA	v61
		BEQ	loc_7E3AE
		JSR	GetBlockFromEnemyPlace
		CMP	#lbPlateWithTorch
		BNE	loc_7E3AB
		INY
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbCutters
		BEQ	loc_7E3AB
		LDX	vAnimBlockOffset
		LDA	vEnemyPlace
		STA	vAnimBlockPlaces,X
		LDY	#ANIM_DUNGEON_TORCH_BLOCK
		LDA	vLevelType
		BEQ	loc_7E39E
		LDY	#ANIM_PALACE_TORCH_BLOCK

loc_7E39E:				; ...
		TYA
		STA	vAnimBlockPlaces+1,X
		LDA	vBlockPPUTileId
		STA	vTorchBlockPPUStartTile
		INC	vAnimBlockOffset
		INC	vAnimBlockOffset

loc_7E3AB:				; ...
		JSR	AcessoriesObjectsCheck

loc_7E3AE:				; ...
		JSR	GetBlockFromEnemyPlace
		CMP	#lbExitDoorLeftPart
		BNE	loc_7E3BA
		LDA	vBlockPPUTileId
		STA	vExitDoorAnimOffset

loc_7E3BA:				; ...
		JSR	SaveRoomDataPtr
		JSR	GetBlockFromEnemyPlace
		CMP	#lbDoor
		BNE	loc_7E431
		LDX	vAnimBlockOffset
		LDA	vEnemyPlace
		STA	vAnimBlockPlaces,X
		LDY	#ANIM_PALACE_DOOR_UP_BLOCK
		LDA	vLevelType
		BNE	loc_7E3D5
		LDY	#ANIM_DUNGEON_DOOR_UP_BLOCK

loc_7E3D5:				; ...
		LDA	vEnemyPlace
		SEC
		SBC	#9
		STY	vtmp_4C0
		TAY
		BCS	loc_7E3EF
		STX	vRoomGuardPlace
		JSR	GetTopBorderBlocks
		LDX	vRoomGuardPlace
		TYA
		CLC
		ADC	#$1E
		TAY

loc_7E3EF:				; ...
		LDA	(vC),Y
		LDY	vtmp_4C0
		AND	#$1F
		BEQ	loc_7E405
		CMP	#lbCastleOverDoor
		BEQ	loc_7E3FC

loc_7E3FC:				; ...
		LDY	#ANIM_DUNGEON_DOOR_BLOCK
		LDA	vLevelType
		BEQ	loc_7E405
		LDY	#ANIM_PALACE_DOOR_BLOCK

loc_7E405:				; ...
		TYA
		STA	vAnimBlockPlaces+1,X
		JSR	RestoreRoomDataPtr
		LDA	vLevelType
		BNE	loc_7E428
		LDY	vEnemyPlace
		INY
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbBrickWall
		BEQ	loc_7E420
		CMP	#lbDoubleColumns
		BNE	loc_7E428

loc_7E420:				; ...
		LDA	vAnimBlockPlaces+1,X
		ORA	#$40 ; '@'
		STA	vAnimBlockPlaces+1,X

loc_7E428:				; ...
		INC	vAnimBlockOffset
		INC	vAnimBlockOffset
		LDA	vBlockPPUTileId
		STA	vDoorBlockPPUStartTile

loc_7E431:				; ...
		JSR	GetBlockFromEnemyPlace
		CMP	#lbSpikesPlate
		BNE	loc_7E484
		LDX	vAnimBlockOffset
		LDA	vEnemyPlace
		CMP	#9
		BEQ	loc_7E484
		CMP	#19
		BEQ	loc_7E484
		CMP	#29
		BEQ	loc_7E484
		STA	vAnimBlockPlaces,X
		LDY	#ANIM_PALACE_SPIKES_BLOCK
		LDA	vLevelType
		BNE	loc_7E455
		LDY	#ANIM_DUNGEON_SPIKES_BLOCK

loc_7E455:				; ...
		TYA
		STA	vAnimBlockPlaces+1,X
		LDY	vEnemyPlace
		INY
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbDoubleColumns
		BNE	loc_7E46F
		LDA	vAnimBlockPlaces+1,X
		ORA	#$40 ; '@'
		STA	vAnimBlockPlaces+1,X
		JMP	loc_7E47B
; ---------------------------------------------------------------------------

loc_7E46F:				; ...
		CMP	#lbBrickWall
		BNE	loc_7E47B
		LDA	vAnimBlockPlaces+1,X
		ORA	#$80 ; 'Ä'
		STA	vAnimBlockPlaces+1,X

loc_7E47B:				; ...
		INC	vAnimBlockOffset
		INC	vAnimBlockOffset
		LDA	vBlockPPUTileId
		STA	vSpikesBlockPPUStartTile

loc_7E484:				; ...
		JSR	GetBlockFromEnemyPlace
		CMP	#lbCutters
		BNE	lbCheckAndDrawBlockJoints
		LDA	byte_4C4
		BEQ	loc_7E490

loc_7E490:				; ...
		DEY
		JSR	GetBlockIdFromPtr ; Y -	place in room
		LDY	#ANIM_PALACE_CUTTERS_BLOCK
		PHA
		LDA	vLevelType
		BNE	loc_7E49E
		LDY	#ANIM_DUNGEON_CUTTERS_BLOCK

loc_7E49E:				; ...
		PLA
		CMP	#lbDoubleColumns
		BNE	loc_7E4AC
		LDY	#ANIM_PALACE_CUTTERS_DBL_CLMNS_BLOCK
		LDA	vLevelType
		BNE	loc_7E4AC
		LDY	#ANIM_DUNGEON_CUTTERS_DBL_CLMNS_BLOCK

loc_7E4AC:				; ...
		LDX	vAnimBlockOffset
		LDA	vEnemyPlace
		STA	vAnimBlockPlaces,X
		TYA
		STA	vAnimBlockPlaces+1,X
		INC	vAnimBlockOffset
		INC	vAnimBlockOffset
		LDA	vBlockPPUTileId
		STA	vCuttersBlockPPUStartTile

lbCheckAndDrawBlockJoints:		; ...
		LDA	#0
		STA	vfVertBlock
		JSR	DrawBlockJoints
		LDA	#1
		STA	vfVertBlock
		LDY	vEnemyPlace
		INY
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbSpace
		BEQ	loc_7E4E4
		CMP	#lbCastleOverDoor
		BEQ	loc_7E4E4
		CMP	#lbBrokenPlate
		BEQ	loc_7E4E4
		JMP	loc_7E4E7
; ---------------------------------------------------------------------------

loc_7E4E4:				; ...
		JSR	DrawBlockJoints

loc_7E4E7:				; ...
		JSR	CheckAndDrawBgWall ; in	dungeon	gfx of wall
		LDA	word_47
		STA	vwTmp_17
		LDA	word_47+1
		CLC
		ADC	#4
		STA	vwTmp_17+1
		LDA	byte_4BE
		CMP	#7
		BNE	loc_7E50C
		LDA	vwTmp_17+1
		AND	#$E0 ; '‡'
		SEC
		SBC	#$1E
		STA	vwTmp_17+1
		LDA	vwTmp_17
		CLC
		ADC	#4
		STA	vwTmp_17

loc_7E50C:				; ...
		INC	byte_4BE
		INC	vEnemyPlace
		PLA
		TAY
		DEY
		BEQ	locret_7E51A
		JMP	loc_7E124
; ---------------------------------------------------------------------------

locret_7E51A:				; ...
		RTS
; End of function sub_7E11D


; =============== S U B	R O U T	I N E =======================================


DrawCornerVertJoints:			; ...
		LDA	vRoomId
		JSR	_GetCurrentRoomDataPtr
		JMP	DrawBlockJoints
; End of function DrawCornerVertJoints


; =============== S U B	R O U T	I N E =======================================


CopyPtr47To17:				; ...
		LDA	word_47
		STA	vwTmp_17
		LDA	word_47+1
		STA	vwTmp_17+1
		RTS
; End of function CopyPtr47To17


; =============== S U B	R O U T	I N E =======================================


GetNextFloorPlace:			; ...
		LDA	vEnemyPlace
		CLC
		ADC	#$A
		RTS
; End of function GetNextFloorPlace


; =============== S U B	R O U T	I N E =======================================


GetNextFloorBlockId:			; ...
		LDA	v5F
		BEQ	lbGetNextFloor
		JSR	GetBottomBorderBlocks
		JMP	lbBottomRoomFloor
; ---------------------------------------------------------------------------

lbGetNextFloor:				; ...
		JSR	GetNextFloorPlace
		CMP	#30
		BCC	lbNextFloorInCurrentRoom
		JSR	GetCurrentRoomDataPtr

lbBottomRoomFloor:			; ...
		LDA	vEnemyPlace
		SEC
		SBC	#20

lbNextFloorInCurrentRoom:		; ...
		TAY
		JMP	GetBlockIdFromPtr ; Y -	place in room
; End of function GetNextFloorBlockId


; =============== S U B	R O U T	I N E =======================================


FetchLevelCharsDataPtrFromPlace:	; ...
		LDY	vEnemyPlace
; End of function FetchLevelCharsDataPtrFromPlace


; =============== S U B	R O U T	I N E =======================================


FetchLevelCharsDataPtr:			; ...
		JSR	GetBlockIdFromPtr ; Y -	place in room
		BEQ	loc_7E56D
		TAX
		LDA	vfLevel4ExitOpened
		BNE	loc_7E564
		TXA
		CMP	#lbLevel4MirrorPlate ; level #4	mirror place
		BEQ	loc_7E58B

loc_7E564:				; ...
		LDA	v5E
		BNE	loc_7E579
		LDA	vfRoomScreenDraw
		BNE	loc_7E579

loc_7E56D:				; ...
		LDA	vfLowButton
		BEQ	loc_7E590
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbLowButton	; low button
		BNE	loc_7E590

loc_7E579:				; ...
		CPX	#lbBigColumnHighPart
		BEQ	loc_7E590
		LDA	v5E
		BEQ	loc_7E58B
		LDA	vPreviousBlockId
		CMP	#lbBrickWall
		BNE	loc_7E58B
		JMP	GetLevelBlockCharsDataPtr ; A -	block id
					; returns: vLevelBlocksCharsPtr	- pointer
; ---------------------------------------------------------------------------

loc_7E58B:				; ...
		LDA	#lbPlate
		JMP	GetLevelBlockCharsDataPtr ; A -	block id
					; returns: vLevelBlocksCharsPtr	- pointer
; ---------------------------------------------------------------------------

loc_7E590:				; ...
		JSR	CheckForBrokenPlate
; End of function FetchLevelCharsDataPtr


; =============== S U B	R O U T	I N E =======================================

; A - block id
; returns: vLevelBlocksCharsPtr	- pointer

GetLevelBlockCharsDataPtr:		; ...
		ASL	A
		TAX
		JSR	SwitchPRGBank_2
		LDA	vLevelType
		BNE	lbGetCastleCharsPtr
		LDA	pDungeonCharsLibrary,X
		STA	vLevelBlocksCharsPtr
		LDA	pDungeonCharsLibrary+1,X
		JMP	lbGetLevelCharsDataPtrExit
; ---------------------------------------------------------------------------

lbGetCastleCharsPtr:			; ...
		LDA	pPalaceCharsLibrary,X
		STA	vLevelBlocksCharsPtr
		LDA	pPalaceCharsLibrary+1,X

lbGetLevelCharsDataPtrExit:		; ...
		STA	vLevelBlocksCharsPtr+1
		JSR	CorrectCharsPointerForLevel5
		JMP	SwitchPRGBank_6
; End of function GetLevelBlockCharsDataPtr


; =============== S U B	R O U T	I N E =======================================

; vLevelBlocksCharsPtr - pointer to block chars
; Pointers and begin tile id will be placed at $0300 area
; $75 -	first tile id at PPU char

CheckAndLoadLevelBlockChars:		; ...
		LDX	#0
		STX	byte_6D9

lbCheckAndLoadLevelCharsLoop:		; ...
		LDA	vBlockCharsData.blockDataPtr,X
		CMP	vLevelBlocksCharsPtr
		BNE	lbNextBlockCharsData
		LDA	vBlockCharsData.blockDataPtr+1,X
		CMP	vLevelBlocksCharsPtr+1
		BEQ	lbBlockCharsDataAlreadyCached

lbNextBlockCharsData:			; ...
		INX
		INX
		INX
		CLC
		TXA
		CMP	vBlockCharsDataOffset
		BCS	lbLoadBlockChars
		JMP	lbCheckAndLoadLevelCharsLoop
; ---------------------------------------------------------------------------

lbLoadBlockChars:			; ...
		LDA	vLevelBlocksCharsPtr
		STA	vBlockCharsData.blockDataPtr,X
		LDA	vLevelBlocksCharsPtr+1
		STA	vBlockCharsData.blockDataPtr+1,X
		LDA	vLevelBlocksCharsNextTileId
		STA	vBlockCharsData.blockDataBeginTileId,X
		LDA	#3
		JSR	SwitchPRGBank
		LDA	vLevelBlocksCharsNextTileId
		STA	vBlockPPUTileId
		JSR	LoadLevelChars
		INC	vBlockCharsDataOffset
		INC	vBlockCharsDataOffset
		INC	vBlockCharsDataOffset
		JMP	SwitchPRGBank_6
; ---------------------------------------------------------------------------

lbBlockCharsDataAlreadyCached:		; ...
		LDA	vBlockCharsData.blockDataBeginTileId,X
		STA	vBlockPPUTileId
		RTS
; End of function CheckAndLoadLevelBlockChars


; =============== S U B	R O U T	I N E =======================================


LoadLevelChars:				; ...
		LDA	#0
		STA	vLevelBlocksCharsOffset

lbLoadLevelCharsFromOffset:		; ...
		JSR	SwitchPRGBank_5
		LDY	vLevelBlocksCharsOffset
		LDX	#0
		STX	vLevelBlocksCharsEOFMarker
		LDA	(vLevelBlocksCharsPtr),Y
		STA	vLevelCharsPtr
		BNE	lbLevelCharsCheckEOF1
		INC	vLevelBlocksCharsEOFMarker

lbLevelCharsCheckEOF1:			; ...
		CMP	#$FF
		BNE	lbLevelCharsGetHiPtrPart
		INX

lbLevelCharsGetHiPtrPart:		; ...
		INY
		LDA	(vLevelBlocksCharsPtr),Y
		STA	vLevelCharsPtr+1
		BNE	lbLevelCharsCheckEOF2
		INC	vLevelBlocksCharsEOFMarker

lbLevelCharsCheckEOF2:			; ...
		CMP	#$FF
		BNE	lbContinueLoad
		INX

lbContinueLoad:				; ...
		LDA	vfExternalRoomId
		BNE	lbCheckEOFOrLoad
		LDA	vEnemyPlace
		CMP	#29
		BEQ	lbCheckBufSize
		CMP	#9
		BNE	lbCheckEOFOrLoad

lbCheckBufSize:				; ...
		CPY	#$26 ; '&'
		BCS	lbLoadLevelCharsExit

lbCheckEOFOrLoad:			; ...
		LDA	vLevelBlocksCharsEOFMarker
		CMP	#2
		BEQ	lbLoadLevelCharsNext
		CPX	#2
		BNE	lbLoadLevelChars

lbLoadLevelCharsExit:			; ...
		RTS
; ---------------------------------------------------------------------------

lbLoadLevelChars:			; ...
		LDX	#4

lbLoopDecodeLevelCharsPtr:		; ...
		ASL	vLevelCharsPtr
		ROL	vLevelCharsPtr+1
		DEX
		BNE	lbLoopDecodeLevelCharsPtr
		LDA	#$80 ; 'Ä'
		ADC	vLevelCharsPtr+1
		STA	vLevelCharsPtr+1
		LDA	vMirrorImageActionPtr
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	vMirrorImageActionPtr+1
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		CLC
		ADC	#$10
		STA	vMirrorImageActionPtr+1
		LDA	vMirrorImageActionPtr
		ADC	#0
		STA	vMirrorImageActionPtr
		LDA	#3
		JSR	SwitchPRGBank
		LDX	#$10
		LDY	#0

lbLoadLevelCharsPPULoop:		; ...
		LDA	(vLevelCharsPtr),Y
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INY
		DEX
		BNE	lbLoadLevelCharsPPULoop
		LDA	v60
		CMP	#$FD ; '˝'
		BCC	lbLoadLevelCharsIncNext
		RTS
; ---------------------------------------------------------------------------

lbLoadLevelCharsIncNext:		; ...
		INC	v60
		INC	vLevelBlocksCharsNextTileId

lbLoadLevelCharsNext:			; ...
		INC	vLevelBlocksCharsOffset
		INC	vLevelBlocksCharsOffset
		JMP	lbLoadLevelCharsFromOffset
; End of function LoadLevelChars


; =============== S U B	R O U T	I N E =======================================

; Add A*0x20 to	word(vtmp17)

AddToPtr17:				; ...
		BEQ	lbAddToPtr17Exit
		TAX

lbAddToPtr17Loop:			; ...
		JSR	IncPtr17For32
		DEC	vtmpCounter19+1
		DEX
		BNE	lbAddToPtr17Loop

lbAddToPtr17Exit:			; ...
		RTS
; End of function AddToPtr17


; =============== S U B	R O U T	I N E =======================================


IncPtr17For32:				; ...
		LDA	vwTmp_17+1
		CLC
		ADC	#$20 ; ' '
		STA	vwTmp_17+1
		LDA	vwTmp_17
		ADC	#0
		STA	vwTmp_17
		RTS
; End of function IncPtr17For32


; =============== S U B	R O U T	I N E =======================================


CorrectCharsPointerForLevel5:		; ...
		JSR	SwitchPRGBank_2
		JSR	_CorrectCharsPointerForLevel5
		JMP	SwitchPRGBank_6
; End of function CorrectCharsPointerForLevel5


; =============== S U B	R O U T	I N E =======================================


FetchPtrAndDrawBlock:			; ...
		LDA	vfLoadedPalaceTiles
		BNE	loc_7E6C3
		JSR	FetchLevelCharsDataPtrFromPlace

loc_7E6C3:				; ...
		LDA	#0
		STA	vfLoadedPalaceTiles
		JSR	CorrectCharsPointerForLevel5
; End of function FetchPtrAndDrawBlock


; =============== S U B	R O U T	I N E =======================================


__DrawBaseRoomBlocks:			; ...
		JSR	CheckAndLoadLevelBlockChars ; vLevelBlocksCharsPtr - pointer to	block chars
					; Pointers and begin tile id will be placed at $0300 area
					; $75 -	first tile id at PPU char
		LDA	#$A
		STA	vtmpCounter19+1
		JSR	SwitchPRGBank_5
		LDY	#0
		LDA	(vptrBlockData),Y
		JSR	AddToPtr17	; Add A*0x20 to	word(vtmp17)
		JSR	SwitchPRGBank_5
		LDA	vSpriteOffsetY
		BEQ	loc_7E6E8
		LDA	#3
		STA	vtmpCounter19+1

loc_7E6E8:				; ...
		INY

loc_7E6E9:				; ...
		LDX	#7
		LDA	vwTmp_17+1
		STA	vtmpCounter19
		LDA	vwTmp_17
		STA	v2E

loc_7E6F3:				; ...
		LDA	v5E
		BEQ	loc_7E6FD
		LDA	vtmpCounter19+1
		CMP	#9
		BCC	loc_7E737

loc_7E6FD:				; ...
		LDA	(vptrBlockData),Y
		BEQ	loc_7E737
		LDA	vfRoomScreenDraw
		BEQ	loc_7E714
		LDA	vwTmp_17
		CMP	#$20 ; ' '
		BCC	loc_7E737
		CMP	#$23 ; '#'
		BCC	loc_7E714
		CMP	#$24 ; '$'
		BCC	loc_7E737

loc_7E714:				; ...
		LDA	vwTmp_17
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	vwTmp_17+1
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	(vptrBlockData),Y
		CLC
		ADC	vBlockPPUTileId
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		STX	v52
		STY	v67
		JSR	SwitchPRGBank_4
		JSR	sub_4BF30
		JSR	SwitchPRGBank_5
		LDY	v67
		LDX	v52

loc_7E737:				; ...
		INC	vwTmp_17+1
		LDA	vwTmp_17+1
		AND	#$1F
		BNE	loc_7E754
		LDA	vwTmp_17+1
		AND	#$E0 ; '‡'
		SEC
		SBC	#$20 ; ' '
		STA	vwTmp_17+1
		LDA	vSpriteOffsetY
		BNE	loc_7E754
		LDA	vwTmp_17
		CLC
		ADC	#4
		STA	vwTmp_17

loc_7E754:				; ...
		INY
		DEX
		BNE	loc_7E6F3
		LDA	vtmpCounter19
		STA	vwTmp_17+1
		LDA	v2E
		STA	vwTmp_17
		JSR	IncPtr17For32
		DEC	vtmpCounter19+1
		BEQ	loc_7E76A
		JMP	loc_7E6E9
; ---------------------------------------------------------------------------

loc_7E76A:				; ...
		JMP	SwitchPRGBank_6
; End of function __DrawBaseRoomBlocks


; =============== S U B	R O U T	I N E =======================================


AcessoriesObjectsCheck:			; ...
		JSR	LoadSwordObject
		JSR	LoadPotionObject
		JMP	lbLoadSpikesObject
; ---------------------------------------------------------------------------

lbLoadSpikesObject:			; ...
		LDA	#<(pSpikesObjectSlot)
		STA	vSlotDataPtr
		LDA	#>(pSpikesObjectSlot)
		STA	vSlotDataPtr+1
		JSR	GetBlockFromEnemyPlace
		CMP	#lbSpikesPlate
		BNE	locret_7E7A7
		JSR	SwitchPRGBank_2
		JSR	SetupObjectSlotData
		JSR	SwitchPRGBank_6
		INC	vEnemyPlace
		JSR	GetBlockFromEnemyPlace
		DEC	vEnemyPlace
		CMP	#lbBrickWall
		BEQ	loc_7E7A0
		CMP	#lbDoubleColumns
		BEQ	loc_7E7A0
		RTS
; ---------------------------------------------------------------------------

loc_7E7A0:				; ...
		STX	vwEnemySlotOffset
		LDA	#1
		STA	vEnemy.YPos+1,X

locret_7E7A7:				; ...
		RTS
; End of function AcessoriesObjectsCheck


; =============== S U B	R O U T	I N E =======================================


LoadSwordObject:			; ...
		JSR	GetBitsForPlace
		BNE	locret_7E7A7
		LDA	#<(pSwordObjectSlot)
		STA	vSlotDataPtr
		LDA	#>(pSwordObjectSlot)
		STA	vSlotDataPtr+1
		JSR	GetBlockFromEnemyPlace
		CMP	#lbPlateWithSword
		BNE	locret_7E7A7
		STA	vfSwordPresent
		JSR	SwitchPRGBank_2
		JMP	SetupObjectSlotData
; End of function LoadSwordObject


; =============== S U B	R O U T	I N E =======================================


LoadPotionObject:			; ...
		JSR	GetBitsForPlace
		BNE	loc_7E7F3
		LDA	#<(pSmallPotionJar)
		STA	vSlotDataPtr
		LDA	#>(pSmallPotionJar)
		STA	vSlotDataPtr+1
		LDY	vEnemyPlace
		LDA	(vC),Y
		AND	#lbSpace|Modifier_02
		BEQ	loc_7E7E3
		LDA	#<(pBigPotionJar)
		STA	vSlotDataPtr
		LDA	#>(pBigPotionJar)
		STA	vSlotDataPtr+1

loc_7E7E3:				; ...
		JSR	GetBlockFromEnemyPlace
		CMP	#lbHealthPotion
		BNE	loc_7E7F3
		JSR	SwitchPRGBank_2
		JSR	SetupObjectSlotData
		JSR	LoadPotionSmokeObject

loc_7E7F3:				; ...
		JMP	SwitchPRGBank_6
; End of function LoadPotionObject


; =============== S U B	R O U T	I N E =======================================


LoadPotionSmokeObject:			; ...
		LDA	#<(pPotionSmokeObject)
		STA	vSlotDataPtr
		LDA	#>(pPotionSmokeObject)
		STA	vSlotDataPtr+1
		JMP	SetupObjectSlotData
; End of function LoadPotionSmokeObject


; =============== S U B	R O U T	I N E =======================================


SetupObjectSlotData:			; ...
		LDA	vwTmp_17
		STA	vPrinceCharsPPUPtr ; RAM/PPU ptr to buffer to write
		LDA	vwTmp_17+1
		STA	vPrinceCharsPPUPtr+1 ; RAM/PPU ptr to buffer to	write
		JSR	FindFreeSlotPtr	; return: Y - slot offset
		STY	vwEnemySlotOffset
		JSR	WriteSlotData	; Y - slot ptr
					; 2F,30	- ptr to data for write
		JSR	SetupEnemyPlace	; vEnemyPlace -	is a place to be converted
					; vwEnemySlotOffset - offset of	slot to	write converted	point
		LDA	vPrinceCharsPPUPtr ; RAM/PPU ptr to buffer to write
		STA	vwTmp_17
		LDA	vPrinceCharsPPUPtr+1 ; RAM/PPU ptr to buffer to	write
		STA	vwTmp_17+1
		LDX	vwEnemySlotOffset
		LDA	vEnemyPlace
		STA	vEnemy.nUnknown4,X
		RTS
; End of function SetupObjectSlotData


; =============== S U B	R O U T	I N E =======================================

; vEnemyPlace -	is a place to be converted
; vwEnemySlotOffset - offset of	slot to	write converted	point

SetupEnemyPlace:			; ...
		LDY	vwEnemySlotOffset
		LDA	vEnemyPlace
		ASL	A
		ADC	vEnemyPlace
		TAX
		JSR	UnsafeSwitchPRGBank_2
		LDA	pObjectPlaceValues,X
		STA	vEnemy.XPos,Y
		LDA	pObjectPlaceValues.XPos+1,X
		STA	vEnemy.XPos+1,Y
		LDA	pObjectPlaceValues.YPos,X
		STA	vEnemy.YPos,Y
		STY	vtmp_4C0
		JSR	_RevertPRGBank
		LDY	vtmp_4C0
		RTS
; End of function SetupEnemyPlace

; ---------------------------------------------------------------------------
		LDY	vPrevBlockIdDataOffset
		JSR	GetBlockIdFromPtr ; Y -	place in room
		ASL	A
		TAX
		LDA	pDungeonCharsLibrary,X
		STA	vLevelBlocksCharsPtr
		LDA	pDungeonCharsLibrary+1,X
		STA	vLevelBlocksCharsPtr+1
; START	OF FUNCTION CHUNK FOR DrawBlockJoints

lbDrawBlockJointsExit:			; ...
		RTS
; END OF FUNCTION CHUNK	FOR DrawBlockJoints

; =============== S U B	R O U T	I N E =======================================


DrawBlockJoints:			; ...

; FUNCTION CHUNK AT BB57 SIZE 0000001F BYTES
; FUNCTION CHUNK AT E85F SIZE 00000001 BYTES
; FUNCTION CHUNK AT E8B6 SIZE 0000002B BYTES
; FUNCTION CHUNK AT F9E0 SIZE 00000055 BYTES

		LDA	v5E
		BNE	lbDrawBlockJointsExit
		JSR	CopyPtr47To17
		JSR	SwitchPRGBank_4
		LDA	vfVertBlock
		BNE	lbDrawVertBlockJoints
		JMP	lbLoadBlockJointsAndDraw
; ---------------------------------------------------------------------------

lbDrawVertBlockJoints:			; ...
		LDA	byte_4EE
		BNE	loc_7E883
		JSR	sub_7FA35
		JSR	sub_7FA35
		JSR	sub_7FA35
		JSR	sub_7FA35

loc_7E883:				; ...
		LDA	#0
		STA	byte_4EE
		LDA	vPreviousBlockId
		ASL	A
		TAX
		JSR	LoadBlockVertJoints ; Input: X - doubled block id
					; Output: vptrBlockData	- pointer to vert joints data for block

__DoDrawRoomBlocksJoints_PRG6:		; ...
		JSR	SwitchPRGBank_6
		JMP	__DrawRoomBlocksJoints
; End of function DrawBlockJoints


; =============== S U B	R O U T	I N E =======================================

; Input: X - doubled block id
; Output: vptrBlockData	- pointer to vert joints data for block

LoadBlockVertJoints:			; ...
		JSR	SwitchPRGBank_2
		LDA	vLevelType
		BNE	lbPalaceBlocksVertJoints
		LDA	pDungeonBlocksVertJoints,X
		STA	vptrBlockData
		LDA	pDungeonBlocksVertJoints+1,X
		JMP	lbLoadBlocksVertJointsExit
; ---------------------------------------------------------------------------

lbPalaceBlocksVertJoints:		; ...
		LDA	pPalaceBlocksVertJoints,X
		STA	vptrBlockData
		LDA	pPalaceBlocksVertJoints+1,X

lbLoadBlocksVertJointsExit:		; ...
		STA	vptrBlockData+1
		JMP	SwitchPRGBank_6
; End of function LoadBlockVertJoints

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR DrawBlockJoints

__DrawRoomBlocksJoints:			; ...
		LDY	#0

lbDrawRoomBlocksJointsLoop:		; ...
		LDA	(vptrBlockData),Y
		CMP	#$FF
		BEQ	lbDrawRoomBlocksJointsExit
		LDA	vfVertBlock
		BEQ	lbDrawRoomBlocksJointsCheckHorzNeighbor
		LDA	(vptrBlockData),Y
		CMP	vCornerBlockId
		BNE	lbDrawRoomBlocksJointsSkip
		JMP	__DoDrawRoomBlocksJoints
; ---------------------------------------------------------------------------

lbDrawRoomBlocksJointsSkip:		; ...
		JMP	lbDrawRoomBlocksJointsNext
; ---------------------------------------------------------------------------

lbDrawRoomBlocksJointsCheckHorzNeighbor: ; ...
		LDA	(vptrBlockData),Y
		CMP	vPreviousBlockId
		BNE	lbDrawRoomBlocksJointsNext
		JMP	__DoDrawRoomBlocksJoints
; ---------------------------------------------------------------------------

lbDrawRoomBlocksJointsNext:		; ...
		INY
		INY
		INY
		INY
		JMP	lbDrawRoomBlocksJointsLoop
; ---------------------------------------------------------------------------

lbDrawRoomBlocksJointsExit:		; ...
		RTS
; END OF FUNCTION CHUNK	FOR DrawBlockJoints

; =============== S U B	R O U T	I N E =======================================


InitDoorsRoomBits:			; ...
		LDA	#0
		STA	vDupEnemyPlace
		LDX	#$1E

loc_7E8E8:				; ...
		TXA
		PHA
		JSR	GetSavedRoomDataPtr
		LDA	vDupEnemyPlace
		STA	vEnemyPlace
		CPX	#NO_PLACE
		BEQ	loc_7E909
		CPX	#X_0_Y_2
		BEQ	loc_7E909
		CPX	#X_0_Y_1
		BEQ	loc_7E909
		LDA	#0
		STA	v54
		JSR	GetSavedRoomDataPtr
		JMP	loc_7E913
; ---------------------------------------------------------------------------

loc_7E909:				; ...
		JSR	GetLeftBorderBlocksPtr
		JSR	IncrementPlaceFloor
		LDA	#1
		STA	v54

loc_7E913:				; ...
		LDA	v54
		STA	vtmp_4C0
		LDA	#2
		STA	vRoomGuardPlace
		JSR	CheckAnimObjState_Door
		CPX	#0
		BEQ	loc_7E951
		LDA	vtmp_4C0
		STA	v54
		LDY	vEnemyPlace
		LDA	(vC),Y
		CMP	#lbDoor|Modifier_01
		BEQ	loc_7E937
		JSR	IsObjectLoBitSet
		BEQ	loc_7E951

loc_7E937:				; ...
		JSR	IsObjectHiBitSet
		BNE	loc_7E951
		JSR	GetBitsByRoomId	; input:
					;  $54 or $6f0 True - get by vDoorRoom id
					;  $4b1	- place	in room
					; return:
					;  $6D - array offset
					;  $6E (and A) - bit mask (2 bits)
					;  X - bits pattern id
		LDA	pObjectBitmaskLo,X
		STA	vLevelDataPtr+1
		JSR	SetBitsToObjectsBitsMask
		LDA	word_47
		CLC
		ADC	#4
		TAY
		LDA	#$17
		STA	(v21),Y

loc_7E951:				; ...
		INC	vDupEnemyPlace
		PLA
		TAX
		DEX
		BNE	loc_7E8E8
		RTS
; End of function InitDoorsRoomBits

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_4ABC9

loc_7E95A:				; ...
		TYA
		PHA
		LDA	#0
		LDX	#sePrinceInjure
		CPY	#$E
		BNE	loc_7E967
		LDA	#3
		INX

loc_7E967:				; ...
		STA	vfTypeOfBgColor
		LDA	#$FF
		JSR	PlaySound_Wrapper ; X -	sound id
		PLA
		TAY
		JSR	SwitchPRGBank_5
		JSR	InjureObject	; Y=False - Prince
					; Y=True - Guard
		BCC	loc_7E99E
		CPY	#0
		BEQ	loc_7E999
		STY	vSaveY
		JSR	SwitchPRGBank_4
		JSR	IsGuardPresentInRoom ; exits from subroutine if	not present
		LDY	vSaveY
		LDA	vEnemy.nDirection,Y
		AND	#$80 ; 'Ä'
		LSR	A
		ORA	#$80 ; 'Ä'
		STA	vwTmp_17
		LDA	vGuards.nRoomPlace,X
		ORA	vwTmp_17
		STA	vGuards.nRoomPlace,X

loc_7E999:				; ...
		LDA	#oaMovingInFight2
		JMP	SetupEnemyActionAndSwitchToPRG4
; ---------------------------------------------------------------------------

loc_7E99E:				; ...
		JSR	SwitchPRGBank_4
		JMP	loc_4AD19
; END OF FUNCTION CHUNK	FOR sub_4ABC9

; =============== S U B	R O U T	I N E =======================================

; Y=False - Prince
; Y=True - Guard

KillObject:				; ...
		JSR	SwitchPRGBank_5
		JSR	InjureObject	; Y=False - Prince
					; Y=True - Guard
		JSR	InjureObject	; Y=False - Prince
					; Y=True - Guard
		JSR	InjureObject	; Y=False - Prince
					; Y=True - Guard
		JSR	InjureObject	; Y=False - Prince
					; Y=True - Guard
		JSR	InjureObject	; Y=False - Prince
					; Y=True - Guard
		JMP	SwitchPRGBank_4
; End of function KillObject


; =============== S U B	R O U T	I N E =======================================


KillAndSwitchToPRG5:			; ...
		JSR	KillObject	; Y=False - Prince
					; Y=True - Guard
		JMP	SwitchPRGBank_5
; End of function KillAndSwitchToPRG5


; =============== S U B	R O U T	I N E =======================================


KillAndSwitchToPRG2:			; ...
		JSR	KillObject	; Y=False - Prince
					; Y=True - Guard
		JMP	SwitchPRGBank_2
; End of function KillAndSwitchToPRG2


; =============== S U B	R O U T	I N E =======================================


SetupPlatePtr:				; ...
		LDA	#<(pDungeon_Plate)
		STA	vptrBlockData
		LDA	#>(pDungeon_Plate)
		STA	vptrBlockData+1
		LDA	vLevelType
		BEQ	lbExitSetupDataPtr
		LDA	#<(pPalace_Plate)
		STA	vptrBlockData
		LDA	#>(pPalace_Plate)
		STA	vptrBlockData+1

lbExitSetupDataPtr:			; ...
		RTS
; End of function SetupPlatePtr


; =============== S U B	R O U T	I N E =======================================


sub_7E9DB:				; ...
		JSR	SwitchPRGBank_5
		LDY	#0
		LDX	#$B
		JSR	DumpBlockDataFromPtr
		LDX	#$12
		JSR	DumpBlockDataFromPtr

loc_7E9EA:				; ...
		JMP	SwitchPRGBank_2
; End of function sub_7E9DB


; =============== S U B	R O U T	I N E =======================================


sub_7E9ED:				; ...
		JSR	SwitchPRGBank_5
		LDY	#0
		LDX	#7
		JSR	DumpBlockDataFromPtr
		LDX	#$E
		JSR	DumpBlockDataFromPtr
		JMP	loc_7E9EA
; End of function sub_7E9ED


; =============== S U B	R O U T	I N E =======================================


LoadWallTilesPtr:			; ...
		LDA	vLevelType
		BEQ	GetBrickWallSpecialTiles
		JSR	LoadPalaceWallTilesPtr
		STA	vfLoadedPalaceTiles
		LDA	#<(pPalaceChars_Wall)
		STA	vLevelBlocksCharsPtr
		LDA	#>(pPalaceChars_Wall)
		STA	vLevelBlocksCharsPtr+1
		RTS
; End of function LoadWallTilesPtr


; =============== S U B	R O U T	I N E =======================================


GetBrickWallSpecialTiles:		; ...
		LDA	#<(pDungeonSpecialWall)
		STA	vptrBlockData
		LDA	#>(pDungeonSpecialWall)
		STA	vptrBlockData+1
		LDA	vLevelType
		BEQ	locret_7EA28
; End of function GetBrickWallSpecialTiles


; =============== S U B	R O U T	I N E =======================================


LoadPalaceWallTilesPtr:			; ...
		LDA	#<(pPalace_Wall)
		STA	vptrBlockData
		LDA	#>(pPalace_Wall)
		STA	vptrBlockData+1

locret_7EA28:				; ...
		RTS
; End of function LoadPalaceWallTilesPtr


; =============== S U B	R O U T	I N E =======================================


StoreRoomDataPtr:			; ...
		LDA	vLevelDataPtr+1
		STA	vD
		LDA	vLevelDataPtr
		STA	vC
		RTS
; End of function StoreRoomDataPtr


; =============== S U B	R O U T	I N E =======================================

; in dungeon gfx of wall

CheckAndDrawBgWall:			; ...
		LDY	vEnemyPlace
		LDA	vLevelType
		BEQ	lbCheckAndDrawBgWall ; in dungeon gfx of wall
		RTS
; ---------------------------------------------------------------------------

lbCheckAndDrawBgWall:			; ...
		LDA	(vC),Y		; in dungeon gfx of wall
		AND	#$E0 ; '‡'
		CMP	#lbSpace|Modifier_01
		BNE	lbCheckAndDrawBgWallExit
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbExitDoorRightPart ; exit door (right	part)
		BEQ	lbCheckAndDrawBgWallExit
		CMP	#lbExitDoorLeftPart ; exit door	(left part)
		BEQ	lbCheckAndDrawBgWallExit
		CMP	#lbBrickWall	; brick	wall
		BEQ	lbCheckAndDrawBgWallExit
		CMP	#lbLowButton	; low button
		BEQ	lbCheckAndDrawBgWallExit
		CMP	#lbHighButton	; high button
		BEQ	lbCheckAndDrawBgWallExit
		CMP	#lbDoubleColumns ; double columns
		BEQ	lbCheckAndDrawBgWallExit
		CMP	#lbDoor		; door
		BEQ	lbCheckAndDrawBgWallExit
		CMP	#lbCastleOverDoor ; over door
		BEQ	lbCheckAndDrawBgWallExit
		LDA	#<(pDungeonBgWall)
		STA	vptrBlockData
		LDA	#>(pDungeonBgWall)
		STA	vptrBlockData+1
		LDA	vLevelType
		BEQ	lbDoDrawBgWall
		LDA	#<(pPalaceChars_Base)
		STA	vLevelBlocksCharsPtr
		LDA	#>(pPalaceChars_Base)
		STA	vLevelBlocksCharsPtr+1
		JSR	CorrectCharsPointerForLevel5
		LDA	(vC),Y
		AND	#$E0 ; '‡'
		CMP	#lbSpace|Modifier_02
		BEQ	lbRenderModifiedBgLine
		LDA	#<(pPalace_SpaceBgLine)
		STA	vptrBlockData
		LDA	#>(pPalace_SpaceBgLine)
		STA	vptrBlockData+1
		JMP	loc_7EA99
; ---------------------------------------------------------------------------

lbRenderModifiedBgLine:			; ...
		LDA	#<(pPalace_SpaceBgLineResidual)
		STA	vptrBlockData
		LDA	#>(pPalace_SpaceBgLineResidual)
		STA	vptrBlockData+1

loc_7EA99:				; ...
		JSR	CopyPtr47To17
		JMP	__DrawBaseRoomBlocks
; ---------------------------------------------------------------------------

lbDoDrawBgWall:				; ...
		JSR	CopyPtr47To17
		JMP	FetchPtrAndDrawBlock
; ---------------------------------------------------------------------------

lbCheckAndDrawBgWallExit:		; ...
		RTS
; End of function CheckAndDrawBgWall


; =============== S U B	R O U T	I N E =======================================


sub_7EAA6:				; ...

; FUNCTION CHUNK AT D3C6 SIZE 00000019 BYTES

		LDA	byte_4F6
		BNE	loc_7EAAF
		LDA	vfJoypadLeft
		BNE	lbCheckAndDrawBgWallExit

loc_7EAAF:				; ...
		LDA	vEnemy.nPose
		CMP	#pPrincePose07_offset -	pPrincePosesLo
		BEQ	loc_7EABD
		CMP	#pPrincePose0B_offset -	pPrincePosesLo
		BEQ	loc_7EABD
		JMP	loc_7D3C6
; ---------------------------------------------------------------------------

loc_7EABD:				; ...
		LDA	vfJoypadRight
		BEQ	loc_7EAC4
		JMP	loc_7D3C6
; ---------------------------------------------------------------------------

loc_7EAC4:				; ...
		LDA	#oaStopping
		JMP	SetupPrinceAction
; End of function sub_7EAA6


; =============== S U B	R O U T	I N E =======================================


SetupWavingPlateObject:			; ...

; FUNCTION CHUNK AT 80A9 SIZE 00000050 BYTES

		JSR	FindFreeSlotPtr	; return: Y - slot offset
		LDA	#<(pBrokenPlateWaveObjects)
		STA	vSlotDataPtr
		LDA	#>(pBrokenPlateWaveObjects)
		STA	vSlotDataPtr+1
		JSR	WriteSlotData	; Y - slot ptr
					; 2F,30	- ptr to data for write
		JMP	loc_580A9
; End of function SetupWavingPlateObject

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR ShowNewLevelPassword

_ResetChoiceLevelFlag:			; ...
		JSR	SwitchPRGBank_2
		JSR	ResetChoiceLevelFlag
		JMP	SwitchPRGBank_5
; END OF FUNCTION CHUNK	FOR ShowNewLevelPassword

; =============== S U B	R O U T	I N E =======================================


_RevertPRGBank:				; ...
		LDA	vSelectedPRGBank
		TAY
		STA	pBankList,Y
		RTS
; End of function _RevertPRGBank

; ---------------------------------------------------------------------------
pJointTiles_09:	.BYTE	 0,   1,   2,	3,   4 ; ...
					; pointer can be safely	changed	to $EBFF
pJointTiles_0B:	.BYTE	 0,   0,   0,	0,   0 ; ...
					; pointer can be safely	changed	to $C000
pLevelType:	.BYTE	0,  0,	0,  1,	1,  1,	0,  0,	0,  1,	1,  0,	0 ; ...
pLeftBordersRooms:.BYTE	   1,	3, $12,	$14, $15,   5, $15,   9,  $D,  $F, $17,	 $E,   1,   6 ;	...
pTopBordersRooms:.BYTE	  2,  $B, $13,	$A, $12,   2, $10,   8,	 $B,  $F, $17, $18, $17,   1 ; ...
pRightBordersRoom_Residual:.BYTE    2,	 1,   0,  $A,	8,   7,	  9,   6,  $B,	$B, $14, $14, $17,   1
pBottomBordersRooms:.BYTE    2,	 $A,   0,  $A,	 8,   4,  $F,	7,  $B,	 $B, $14,  $D, $17,   1	; ...
pLevelRoomData:	.WORD pLevel1_Rooms	; ...
		.WORD pLevel2_Rooms
		.WORD pLevel3_Rooms
		.WORD pLevel4_Rooms
		.WORD pLevel5_Rooms
		.WORD pLevel6_Rooms
		.WORD pLevel7_Rooms
		.WORD pLevel8_Rooms
		.WORD pLevel9_Rooms
		.WORD pLevel10_Rooms
		.WORD pLevel11_Rooms
		.WORD pLevel12_Rooms
		.WORD pLevel13_Rooms
		.WORD pLevel14_Rooms
pLevelHeaderData:.WORD pLevel1_Header	; ...
		.WORD pLevel2_Header
		.WORD pLevel3_Header
		.WORD pLevel4_Header
		.WORD pLevel5_Header
		.WORD pLevel6_Header
		.WORD pLevel7_Header
		.WORD pLevel8_Header
		.WORD pLevel9_Header
		.WORD pLevel10_Header
		.WORD pLevel11_Header
		.WORD pLevel12_Header
		.WORD pLevel13_Header
		.WORD pLevel14_Header
pLevelGeomData:	.WORD pLevel1_Geom	; ...
		.WORD pLevel2_Geom
		.WORD pLevel3_Geom
		.WORD pLevel4_Geom
		.WORD pLevel5_Geom
		.WORD pLevel6_Geom
		.WORD pLevel7_Geom
		.WORD pLevel8_Geom
		.WORD pLevel9_Geom
		.WORD pLevel10_Geom
		.WORD pLevel11_Geom
		.WORD pLevel12_Geom
		.WORD pLevel13_Geom
		.WORD pLevel14_Geom
pObjectBitmask:	.BYTE 11000000b,110000b,1100b, 11b ; ...
		.BYTE 11000000b,110000b,1100b, 11b
		.BYTE 11000000b,110000b,1100b, 11b
pObjectBitmaskLo:.BYTE 1000000b,10000b,100b,   1 ; ...
		.BYTE 1000000b,10000b,100b,   1
		.BYTE 1000000b,10000b,100b,   1
pObjectBitmaskHi:.BYTE 10000000b,100000b,1000b,	10b ; ...
		.BYTE 10000000b,100000b,1000b, 10b
		.BYTE 10000000b,100000b,1000b, 10b
pPPUOffsets:	.WORD PPU_PAGE_0_LINE_0+2 ; ...
		.WORD PPU_PAGE_0_LINE_0+6
		.WORD PPU_PAGE_0_LINE_0+$A
		.WORD PPU_PAGE_0_LINE_0+$E
		.WORD PPU_PAGE_0_LINE_0+$12
		.WORD PPU_PAGE_0_LINE_0+$16
		.WORD PPU_PAGE_0_LINE_0+$1A
		.WORD PPU_PAGE_0_LINE_0+$1E
		.WORD PPU_PAGE_1_LINE_0+2
		.WORD PPU_PAGE_1_LINE_0+6
		.WORD PPU_PAGE_0_LINE_8+2
		.WORD PPU_PAGE_0_LINE_8+6
		.WORD PPU_PAGE_0_LINE_8+$A
		.WORD PPU_PAGE_0_LINE_8+$E
		.WORD PPU_PAGE_0_LINE_8+$12
		.WORD PPU_PAGE_0_LINE_8+$16
		.WORD PPU_PAGE_0_LINE_8+$1A
		.WORD PPU_PAGE_0_LINE_8+$1E
		.WORD PPU_PAGE_1_LINE_8+2
		.WORD PPU_PAGE_1_LINE_8+6
		.WORD PPU_PAGE_0_LINE_16+2
		.WORD PPU_PAGE_0_LINE_16+6
		.WORD PPU_PAGE_0_LINE_16+$A
		.WORD PPU_PAGE_0_LINE_16+$E
		.WORD PPU_PAGE_0_LINE_16+$12
		.WORD PPU_PAGE_0_LINE_16+$16
		.WORD PPU_PAGE_0_LINE_16+$1A
		.WORD PPU_PAGE_0_LINE_16+$1E
		.WORD PPU_PAGE_1_LINE_16+2
		.WORD PPU_PAGE_1_LINE_16+6
pJointTiles_00:	.BYTE	 0,   1,   2,	3,   0,	  0 ; ...
pJointTiles_01:	.BYTE	 0,   0,   0,	1,   0,	  0 ; ...
pJointTiles_02:	.BYTE	 0,   1,   0,	2,   0,	  0 ; ...
pJointTiles_03:	.BYTE	 1,   2,   3,	4,   0,	  0 ; ...
pJointTiles_04:	.BYTE	 0,   1,   2,	0,   0,	  0 ; ...
pJointTiles_05:	.BYTE	 0,   0,   1,	2,   3,	  0 ; ...
pJointTiles_06:	.BYTE	 0,   0,   0,	1,   2,	  0 ; ...
pJointTiles_07:	.BYTE	 0,   0,   1,	2,   3,	  0 ; ...
pJointTiles_08:	.BYTE	 0,   0,   0,	1,   2,	  0 ; ...
pJointCharsBits_68:.WORD PTR_81F0|BANK_0 ; ...
		.WORD PTR_8200|BANK_0
		.WORD PTR_8210|BANK_0
		.BYTE $FF
		.BYTE $FF
pPalaceVertJoint_BigClmn:BLOCK_JOINT lbBigColumnHighPart, $59,	pJointTiles_08	; ...
		.BYTE $FF
pDungeonVertJoint_BigClmnHi:BLOCK_JOINT	lbHighButton, $61, pJointTiles_06 ; ...
		.BYTE $FF
pDungeonVertJoint_TorchPlate:BLOCK_JOINT lbBigColumnHighPart, $2E, pJointTiles_06 ; ...
pDungeonVertJoint_Door:BLOCK_JOINT lbDoubleColumns, $27, pJointTiles_06 ; ...
pDungeonVertJoint_LoBtn:BLOCK_JOINT lbBrickWall, $25, pJointTiles_05 ; ...
		.BYTE $FF
pDungeonVertJoint_DblClmns:BLOCK_JOINT lbDoubleColumns, $27, pJointTiles_06 ;	...
		BLOCK_JOINT lbHighButton, $2B,	pJointTiles_06
		BLOCK_JOINT lbBrickWall, $25, pJointTiles_05
		.BYTE $FF
pPalaceVertJoint_Wall:BLOCK_JOINT lbCastleOverDoorWithPlate, $63, pJointTiles_08 ; ...
		BLOCK_JOINT lbDoubleColumns, $62, pJointTiles_08
		BLOCK_JOINT lbBrickWall, $55, pJointTiles_07
		.BYTE $FF
pDungeonVertJoint_Wall:BLOCK_JOINT lbDoubleColumns, $26, pJointTiles_06 ; ...
		BLOCK_JOINT lbBrickWall, $28, pJointTiles_05
		BLOCK_JOINT lbPlateWithDebris,	$29, pJointTiles_05
		BLOCK_JOINT lbHighButton, $2A,	pJointTiles_05
		BLOCK_JOINT lbDoor, $69, pJointTiles_05
		.BYTE $FF
pDungeonVertJoint_Cutters:BLOCK_JOINT lbBigColumnHighPart, $59, pJointTiles_08 ; ...
pPalaceVertJoint_MirrorPlate:BLOCK_JOINT lbCastleOverDoor, $58, pJointTiles_07 ; ...
		BLOCK_JOINT lbDoubleColumns, $57, pJointTiles_08
pPalaceVertJoint_Spikes:BLOCK_JOINT lbBrickWall, $56, pJointTiles_07 ; ...
		.BYTE $FF
pPalaceVertJoint_Door:BLOCK_JOINT lbCastleOverDoor, $5A, pJointTiles_0D ; ...
		BLOCK_JOINT lbCastleOverDoorWithPlate,	$5A, pJointTiles_0D
		BLOCK_JOINT lbBrickWall, $25, pJointTiles_0B ; pointer can be	safely changed to $C000
		.BYTE $FF
pDungeonVertJoint_Spikes:BLOCK_JOINT lbBrickWall, $25,	pJointTiles_05	; ...
		BLOCK_JOINT lbDoubleColumns, $64, pJointTiles_06
		.BYTE $FF
pDungeonVertJoint_Plate:BLOCK_JOINT lbDoubleColumns, $27, pJointTiles_06 ; ...
		BLOCK_JOINT lbBrickWall, $25, pJointTiles_05
		BLOCK_JOINT lbDoor, $2C, pJointTiles_05
		BLOCK_JOINT lbBigColumnHighPart, $2E, pJointTiles_06
		.BYTE $FF
pPalaceHorzJoint_Cutters:BLOCK_JOINT lbLowButton, $32,	pJointTiles_00	; ...
		BLOCK_JOINT lbHighButton, $31,	pJointTiles_00
		BLOCK_JOINT lbDoubleColumns, $30, pJointTiles_00
		BLOCK_JOINT lbPressedButton, $2F, pJointTiles_00
		BLOCK_JOINT lbHealthPotion, $2F, pJointTiles_00
pPalaceHorzJoint_ExitDoorRght:BLOCK_JOINT lbPlateWithTorch, $2F, pJointTiles_00 ; ...
pPalaceHorzJoint_MirrorPlate:BLOCK_JOINT lbPlate, $2F,	pJointTiles_00	; ...
		.BYTE $FF
pDungeonHorzJoint_Space:BLOCK_JOINT lbPlateWithDebris,	$D2, pJointTiles_00 ; ...
pPalaceHorzJoint_Space:.BYTE $FF	; ...
pDungeonHorzJoint_Cutters:BLOCK_JOINT lbHighButton, 3,	pJointTiles_00	; ...
		BLOCK_JOINT lbDoubleColumns, 1, pJointTiles_01
pDungeonHorzJoint_ExitDoorRght:BLOCK_JOINT lbPlateWithTorch, 0, pJointTiles_00 ; ...
		BLOCK_JOINT lbPlate, 0, pJointTiles_00
		.BYTE $FF
pPalaceHorzJoint_Door:BLOCK_JOINT lbPressedButton, $67, pJointTiles_09 ; ...
					; pointer can be safely	changed	to $EBFF
		BLOCK_JOINT lbPlateWithDebris,	$35, pJointTiles_03
		BLOCK_JOINT lbPlate, $40, pJointTiles_00
		BLOCK_JOINT lbPlateWithTorch, $40, pJointTiles_00
		BLOCK_JOINT lbDoor, $41, pJointTiles_00
		BLOCK_JOINT lbHighButton, $42,	pJointTiles_00
		BLOCK_JOINT lbLowButton, $43, pJointTiles_00
		BLOCK_JOINT lbDoubleColumns, $30, pJointTiles_00
		BLOCK_JOINT lbBrokenPlate, $2F, pJointTiles_00
		.BYTE $FF
pPalaceHorzJoint_DblColumns:BLOCK_JOINT	lbPlate, $3A, pJointTiles_00 ; ...
		BLOCK_JOINT lbPlateWithTorch, $3A, pJointTiles_00
		BLOCK_JOINT lbDoor, $3A, pJointTiles_00
		BLOCK_JOINT lbHighButton, $3B,	pJointTiles_00
		BLOCK_JOINT lbPlateWithDebris,	$3C, pJointTiles_03
		BLOCK_JOINT lbLowButton, $3D, pJointTiles_00
		BLOCK_JOINT lbDoubleColumns, $3E, pJointTiles_00
		BLOCK_JOINT lbSpikesPlate, $3F, pJointTiles_00
		BLOCK_JOINT lbBrokenPlate, $3A, pJointTiles_00
		BLOCK_JOINT lbHealthPotion, $3A, pJointTiles_00
		.BYTE $FF
pPalaceHorzJoint_DebrisPlate:BLOCK_JOINT lbPlateWithDebris, $49, pJointTiles_03 ; ...
		BLOCK_JOINT lbDoubleColumns, $4A, pJointTiles_00
		BLOCK_JOINT lbPlate, $4B, pJointTiles_03
		BLOCK_JOINT lbDoor, $4B, pJointTiles_03
		BLOCK_JOINT lbPlateWithTorch, $4B, pJointTiles_03
		.BYTE $FF
pPalaceHorzJoint_OverDoor:BLOCK_JOINT lbPlate,	$47, pJointTiles_00 ; ...
		BLOCK_JOINT lbDoubleColumns, $48, pJointTiles_00
		.BYTE $FF
pPalaceHorzJoint_BrokenPlate:BLOCK_JOINT lbPlateWithSkeleton, $45, pJointTiles_00 ; ...
		BLOCK_JOINT lbHighButton, $46,	pJointTiles_00
		BLOCK_JOINT lbExitDoorLeftPart, $45, pJointTiles_00
pPalaceHorzJoint_OverDoorPlate:BLOCK_JOINT lbHighButton, $44, pJointTiles_00 ; ...
pPalaceHorzJoint_Plate:BLOCK_JOINT lbPressedButton, $67, pJointTiles_09 ; ...
					; pointer can be safely	changed	to $EBFF
		BLOCK_JOINT lbExitDoorLeftPart, $2F, pJointTiles_00
		BLOCK_JOINT lbExitDoorRightPart, $2F, pJointTiles_00
		BLOCK_JOINT lbPlateWithDebris,	$35, pJointTiles_03
		BLOCK_JOINT lbSpikesPlate, $34, pJointTiles_00
		BLOCK_JOINT lbHighButton, $31,	pJointTiles_00
		BLOCK_JOINT lbLowButton, $32, pJointTiles_00
		BLOCK_JOINT lbBigColumnLowPart, $33, pJointTiles_02
		BLOCK_JOINT lbDoubleColumns, $30, pJointTiles_00
		BLOCK_JOINT lbCastleOneColumn,	$30, pJointTiles_00
		BLOCK_JOINT lbPlate, $2F, pJointTiles_00
		BLOCK_JOINT lbLevel4MirrorPlate, $2F, pJointTiles_00
		BLOCK_JOINT lbPlateWithTorch, $2F, pJointTiles_00
		BLOCK_JOINT lbDoor, $2F, pJointTiles_00
		BLOCK_JOINT lbBrokenPlate, $2F, pJointTiles_00
		BLOCK_JOINT lbHealthPotion, $2F, pJointTiles_00
		BLOCK_JOINT lbCastleOverDoorWithPlate,	$2F, pJointTiles_00
pDungeonHorzJoint_OverDoor:.BYTE $FF	; ...
pDungeonHorzJoint_Plate:BLOCK_JOINT lbPlateWithSkeleton, 6, pJointTiles_00 ; ...
		BLOCK_JOINT lbSpikesPlate, 4, pJointTiles_00
		BLOCK_JOINT lbPlate, 0, pJointTiles_00
		BLOCK_JOINT lbDoubleColumns, 1, pJointTiles_01
		BLOCK_JOINT lbPlateWithTorch, 0, pJointTiles_00
		BLOCK_JOINT lbDoor, 0,	pJointTiles_00
		BLOCK_JOINT lbBrokenPlate, 0, pJointTiles_00
		BLOCK_JOINT lbPlateWithSword, 0, pJointTiles_00
		BLOCK_JOINT lbHealthPotion, 0,	pJointTiles_00
		BLOCK_JOINT lbBigColumnLowPart, 2, pJointTiles_02
		BLOCK_JOINT lbHighButton, 3, pJointTiles_00
		.BYTE $FF
pDungeonHorzJoint_Spikes:BLOCK_JOINT lbPlate, 6, pJointTiles_00 ; ...
		BLOCK_JOINT lbSpikesPlate, 7, pJointTiles_00
		BLOCK_JOINT lbDoor, 6,	pJointTiles_00
		BLOCK_JOINT lbPlateWithTorch, 6, pJointTiles_00
		BLOCK_JOINT lbDoubleColumns, 1, pJointTiles_01
		BLOCK_JOINT lbPlateWithDebris,	8, pJointTiles_03
		.BYTE $FF
pPalaceHorzJoint_Spikes:BLOCK_JOINT lbCastleOneColumn,	$36, pJointTiles_00 ; ...
		BLOCK_JOINT lbPlate, $39, pJointTiles_00
		BLOCK_JOINT lbSpikesPlate, $37, pJointTiles_00
		BLOCK_JOINT lbDoor, $36, pJointTiles_00
		BLOCK_JOINT lbPlateWithTorch, $39, pJointTiles_00
		BLOCK_JOINT lbDoubleColumns, $37, pJointTiles_01
		BLOCK_JOINT lbPlateWithDebris,	$38, pJointTiles_03
		.BYTE $FF
pDungeonHorzJoint_DblColumns:BLOCK_JOINT lbPlate, 9, pJointTiles_00 ;	...
		BLOCK_JOINT lbPlateWithTorch, 9, pJointTiles_00
		BLOCK_JOINT lbBrokenPlate, 9, pJointTiles_00
		BLOCK_JOINT lbHealthPotion, 9,	pJointTiles_00
		BLOCK_JOINT lbLowButton, 9, pJointTiles_00
		BLOCK_JOINT lbDoor, 9,	pJointTiles_00
		BLOCK_JOINT lbExitDoorLeftPart, 9, pJointTiles_00
		BLOCK_JOINT lbPlateWithDebris,	$A, pJointTiles_00
		BLOCK_JOINT lbHighButton, $B, pJointTiles_03
		BLOCK_JOINT lbPlateWithSkeleton, $C, pJointTiles_00
		BLOCK_JOINT lbSpikesPlate, $D,	pJointTiles_00
		BLOCK_JOINT lbDoubleColumns, $E, pJointTiles_01
		.BYTE $FF
pDungeonHorzJoint_Door:BLOCK_JOINT lbDoubleColumns, 1,	pJointTiles_01	; ...
		BLOCK_JOINT lbHighButton, 3, pJointTiles_00
		BLOCK_JOINT lbPlate, $10, pJointTiles_00
		BLOCK_JOINT lbDoor, $10, pJointTiles_00
		BLOCK_JOINT lbBrickWall, $10, pJointTiles_00
		BLOCK_JOINT lbPlateWithTorch, $10, pJointTiles_00
		BLOCK_JOINT lbPressedButton, $66, pJointTiles_00
		.BYTE $FF
pDungeonHorzJoint_BigClmnLo:BLOCK_JOINT	lbPlate, $12, pJointTiles_00 ; ...
		BLOCK_JOINT lbPlateWithTorch, $12, pJointTiles_00
		BLOCK_JOINT lbExitDoorLeftPart, $12, pJointTiles_00
		BLOCK_JOINT lbHighButton, $13,	pJointTiles_00
		BLOCK_JOINT lbHealthPotion, $12, pJointTiles_00
		.BYTE $FF
pPalaceHorzJoint_BigClmnLo:BLOCK_JOINT lbPlate, $45, pJointTiles_00 ;	...
		BLOCK_JOINT lbDoor, $45, pJointTiles_00
		BLOCK_JOINT lbExitDoorLeftPart, $45, pJointTiles_00
		BLOCK_JOINT lbPlateWithTorch, $45, pJointTiles_00
		BLOCK_JOINT lbHighButton, $46,	pJointTiles_00
		BLOCK_JOINT lbHealthPotion, $45, pJointTiles_00
		.BYTE $FF
pDungeonHorzJoint_HiBtn:BLOCK_JOINT lbPlate, $1A, pJointTiles_00 ; ...
		BLOCK_JOINT lbPlateWithTorch, $1A, pJointTiles_00
		BLOCK_JOINT lbDoor, $18, pJointTiles_00
		BLOCK_JOINT lbDoubleColumns, $19, pJointTiles_01
		BLOCK_JOINT lbLowButton, $1A, pJointTiles_00
		.BYTE $FF
pPalaceHorzJoint_LoBtn:BLOCK_JOINT lbSpikesPlate, $34,	pJointTiles_00	; ...
		BLOCK_JOINT lbLowButton, $32, pJointTiles_00
		BLOCK_JOINT lbDoubleColumns, $30, pJointTiles_00
		BLOCK_JOINT lbPlateWithTorch, $2F, pJointTiles_00
		BLOCK_JOINT lbPlate, $2F, pJointTiles_00
		BLOCK_JOINT lbPressedButton, $67, pJointTiles_09 ; pointer can be safely changed to $EBFF
		BLOCK_JOINT lbDoor, $2F, pJointTiles_00
		.BYTE $FF
pPalaceHorzJoint_HiBtn:BLOCK_JOINT lbPlate, $4D, pJointTiles_00 ; ...
		BLOCK_JOINT lbPlateWithTorch, $4D, pJointTiles_00
		BLOCK_JOINT lbCastleOverDoorWithPlate,	$4D, pJointTiles_00
		BLOCK_JOINT lbDoor, $4D, pJointTiles_00
		BLOCK_JOINT lbCastleOneColumn,	$4E, pJointTiles_00
		BLOCK_JOINT lbDoubleColumns, $4E, pJointTiles_00
		BLOCK_JOINT lbBigColumnLowPart, $4F, pJointTiles_0C
		.BYTE $FF
pPalaceHorzJoint_PrsBtn:BLOCK_JOINT lbPlate, $68, pJointTiles_00 ; ...
		BLOCK_JOINT lbDoubleColumns, $67, pJointTiles_09 ; pointer can be safely changed to $EBFF
		BLOCK_JOINT lbPlateWithTorch, $68, pJointTiles_00
pDungeonHorzJoint_PrsBtn:BLOCK_JOINT lbBrokenPlate, $66, pJointTiles_00 ; ...
		BLOCK_JOINT lbDoor, $66, pJointTiles_00
		BLOCK_JOINT lbPlate, $66, pJointTiles_00
		BLOCK_JOINT lbHealthPotion, $66, pJointTiles_00
		BLOCK_JOINT lbPlateWithTorch, $66, pJointTiles_00
		.BYTE $FF
pJointTiles_0C:	.BYTE	 0,   2,   0,	3 ; ...
pJointTiles_0D:	.BYTE	 0,   0,   1,	2,   3,	  4 ; ...
pDungeonHorzJoint_LoBtn:BLOCK_JOINT lbLowButton, 0, pJointTiles_00 ; ...
		BLOCK_JOINT lbSpikesPlate, 6, pJointTiles_00
		BLOCK_JOINT lbDoubleColumns, 1, pJointTiles_01
		BLOCK_JOINT lbPlateWithTorch, 0, pJointTiles_00
		BLOCK_JOINT lbBrokenPlate, 0, pJointTiles_00
		BLOCK_JOINT lbDoor, 0,	pJointTiles_00
		BLOCK_JOINT lbPlate, 0, pJointTiles_00
		BLOCK_JOINT lbHighButton, 3, pJointTiles_00
		.BYTE $FF
pPalaceVertJoint_HiBtn:BLOCK_JOINT lbBrickWall, $5F, pJointTiles_07 ;	...
		BLOCK_JOINT lbDoubleColumns, $60, pJointTiles_08
		BLOCK_JOINT lbBigColumnHighPart, $61, pJointTiles_08
		.BYTE $FF
pDungeonVertJoint_HiBtn:BLOCK_JOINT lbBrickWall, $2A, pJointTiles_05 ; ...
		BLOCK_JOINT lbDoubleColumns, $2B, pJointTiles_06
		BLOCK_JOINT lbBigColumnHighPart, $65, pJointTiles_06
		.BYTE $FF
pPalaceVertJoint_DebrisPlate:BLOCK_JOINT lbBrickWall, $5E, pJointTiles_07 ; ...
		BLOCK_JOINT lbDoubleColumns, $58, pJointTiles_08
pPalaceVertJoint_OverDoor:BLOCK_JOINT lbDoor, $5C, pJointTiles_07 ; ...
		BLOCK_JOINT lbCastleOverDoor, $5D, pJointTiles_07
		BLOCK_JOINT lbCastleOverDoorWithPlate,	$5D, pJointTiles_07
		.BYTE $FF
pPalaceVertJoint_OverDoorPlate:BLOCK_JOINT lbCastleOverDoor, $5B, pJointTiles_07 ; ...
		BLOCK_JOINT lbCastleOverDoorWithPlate,	$5B, pJointTiles_07
		BLOCK_JOINT lbDoor, $5C, pJointTiles_07
		.BYTE $FF
pDungeonHorzJoint_DebrisPlate:BLOCK_JOINT lbPlate, $14, pJointTiles_00 ; ...
		BLOCK_JOINT lbDoubleColumns, 1, pJointTiles_01
		BLOCK_JOINT lbPlateWithTorch, $14, pJointTiles_00
		BLOCK_JOINT lbDoor, $14, pJointTiles_00
		BLOCK_JOINT lbPlateWithDebris,	$15, pJointTiles_03
		BLOCK_JOINT lbSpikesPlate, $16, pJointTiles_00
		BLOCK_JOINT lbPlateWithSkeleton, $17, pJointTiles_04
		.BYTE $FF
pPalaceHorzJoint_Wall:BLOCK_JOINT lbPlate, $50, pJointTiles_00 ; ...
		BLOCK_JOINT lbHealthPotion, $50, pJointTiles_00
		BLOCK_JOINT lbBrokenPlate, $50, pJointTiles_00
		BLOCK_JOINT lbPlateWithTorch, $50, pJointTiles_00
		BLOCK_JOINT lbSpikesPlate, $51, pJointTiles_00
		BLOCK_JOINT lbDoubleColumns, $52, pJointTiles_00
		BLOCK_JOINT lbPlateWithDebris,	$53, pJointTiles_03
		BLOCK_JOINT lbHighButton, $54,	pJointTiles_00
		BLOCK_JOINT lbLowButton, $50, pJointTiles_00
		.BYTE $FF
pDungeonHorzJoint_Wall:BLOCK_JOINT lbPlateWithDebris, $1B, pJointTiles_03 ; ...
		BLOCK_JOINT lbPlate, $1C, pJointTiles_00
		BLOCK_JOINT lbPressedButton, $1C, pJointTiles_00
		BLOCK_JOINT lbBrokenPlate, $1C, pJointTiles_00
		BLOCK_JOINT lbPlateWithTorch, $1C, pJointTiles_00
		BLOCK_JOINT lbHealthPotion, $1C, pJointTiles_00
		BLOCK_JOINT lbSpikesPlate, $1D, pJointTiles_00
		BLOCK_JOINT lbDoubleColumns, $1E, pJointTiles_01
		BLOCK_JOINT lbPlateWithSkeleton, $1F, pJointTiles_00
		BLOCK_JOINT lbHighButton, $20,	pJointTiles_00
		.BYTE $FF
		BLOCK_JOINT lbSpikesPlate, $34, pJointTiles_00
		BLOCK_JOINT lbHighButton, $31,	pJointTiles_00
		BLOCK_JOINT lbDoor, $2F, pJointTiles_00
		BLOCK_JOINT lbBrokenPlate, $2F, pJointTiles_00
pPalaceHorzJoint_Window:BLOCK_JOINT lbPlateWithTorch, $2F, pJointTiles_00 ; ...
		BLOCK_JOINT lbPlate, $2F, pJointTiles_00
		.BYTE $FF
pDungeonHorzJoint_SwordPlate:BLOCK_JOINT lbPlate, 0, pJointTiles_00 ;	...
		BLOCK_JOINT lbPlateWithSkeleton, $24, pJointTiles_00
		.BYTE $FF
pDungeonHorzJoint_SkeletonPlate:BLOCK_JOINT lbDoubleColumns, $21, pJointTiles_01 ; ...
		BLOCK_JOINT lbPlateWithDebris,	$22, pJointTiles_03
		BLOCK_JOINT lbPlate, $23, pJointTiles_00
		BLOCK_JOINT lbPlateWithTorch, $23, pJointTiles_00
		.BYTE $FF

; =============== S U B	R O U T	I N E =======================================


sub_7EFF2:				; ...
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BEQ	loc_7F009
		LDA	byte_765
		BNE	loc_7F003
		LDA	vEnemy.nAction
		CMP	#oaStopping
		BNE	loc_7F009

loc_7F003:				; ...
		LDA	vRoomId
		CMP	#2
		BNE	loc_7F01B

loc_7F009:				; ...
		LDA	vfFalling
		BNE	locret_7F01A
		LDA	vfWaitRestartLevel
		BNE	locret_7F01A
		LDA	vEnemy.nUnknown1
		CMP	#$F
		BNE	loc_7F033

locret_7F01A:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7F01B:				; ...
		LDA	byte_765
		BNE	locret_7F01A
		LDA	vJoypad1
		AND	#Btn_Start
		BEQ	locret_7F01A
		STA	byte_762
		JSR	SwitchPRGBank_2
		JSR	ValidatePassword
		JMP	loc_7D83C
; ---------------------------------------------------------------------------

loc_7F033:				; ...
		JSR	loc_5839F
		LDA	vLevelStatusText
		CMP	#4
		BEQ	loc_7F08D
		LDA	vfSword
		BEQ	loc_7F075
		CMP	#2
		BEQ	loc_7F090
		LDA	byte_4ED
		BNE	loc_7F08D
		JSR	GetDeltaHeight
		CMP	#$E2 ; '‚'
		BCS	loc_7F056
		CMP	#$1E
		BCS	loc_7F075

loc_7F056:				; ...
		LDA	vfMirrorPresent
		BNE	loc_7F075
		LDA	vfDisableGuardAnimation
		BNE	loc_7F075
		LDA	vfGuardPresent
		BEQ	loc_7F075
		STA	byte_4F6
		LDA	vEnemy.nDirection
		CMP	vEnemy.nDirection+$E
		BEQ	loc_7F075
		JSR	CheckObjectsDistance
		BCC	loc_7F084

loc_7F075:				; ...
		JSR	CheckJoyAndJumpForward
		JSR	TurnBack
		JSR	CheckAndFlashScreenGrabSwordMode
		JSR	sub_7D7EC
		JSR	sub_7F3F4

loc_7F084:				; ...
		JSR	CheckAndSetupStealMode
		JSR	sub_7F49F
		JSR	sub_7F6E3

loc_7F08D:				; ...
		JSR	sub_7F882

loc_7F090:				; ...
		LDA	vEnemy.nDirection
		CMP	vEnemy.nDirection+$E
		BNE	loc_7F09B
		JMP	locret_7F110
; ---------------------------------------------------------------------------

loc_7F09B:				; ...
		LDY	#0
		JSR	CheckObjectFightPose
		LDA	vEnemy.nAction
		CMP	#oaGetOutSword1
		BEQ	locret_7F110
		CMP	#oaMovingInFight2
		BEQ	locret_7F110
		LDA	vfSword
		CMP	#2
		BEQ	loc_7F0BA
		JSR	SwitchPRGBank_5
		JSR	CheckObjectsDistance
		BCS	locret_7F110

loc_7F0BA:				; ...
		LDA	vfSword
		BEQ	locret_7F110
		LDY	#0
		JSR	CheckAndSheatheSword
		JSR	GetDeltaHeight
		CMP	#$E2 ; '‚'
		BCS	loc_7F0CF
		CMP	#$1E
		BCS	locret_7F110

loc_7F0CF:				; ...
		LDA	vfGuardPresent
		BEQ	locret_7F110
		LDA	vfMirrorPresent
		BNE	locret_7F110
		JSR	CheckAndGetOutSword
		LDA	vfSword
		CMP	#2
		BNE	locret_7F110
		LDA	vfDisableGuardAnimation
		BNE	locret_7F110
		TAY
		JSR	CheckJoyAndAttack
		JSR	CheckJoyAndReflectAttack
		JSR	FightModeForwardMovements
		JSR	FightModeBackwardMovements
		JSR	GuardMovements
		BCS	locret_7F110
		JSR	SwitchPRGBank_4
		LDA	vEnemy.nAction+$E
		CMP	#$38 ; '8'
		BEQ	locret_7F110
		LDY	#0
		JMP	loc_4ACD6
; End of function sub_7EFF2


; =============== S U B	R O U T	I N E =======================================


GetDeltaHeight:				; ...
		LDA	vEnemy.YPos+$E
		SEC
		SBC	vEnemy.YPos

locret_7F110:				; ...
		RTS
; End of function GetDeltaHeight

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7D17A

lbGrabTheSword:				; ...
		LDA	#0
		STA	v54
		LDA	vEnemy.nPose
		CMP	#pPrincePose6C_offset -	pPrincePosesLo
		BNE	loc_7F13B
		LDA	vEnemy.nUnknown1
		BNE	loc_7F13B
		JSR	GetBitsForPlace	; $4b1 - place in room
		BNE	loc_7F13B
		JSR	UpdateObjectBits
		LDA	#$11
		JSR	FindEnemyById_Wrapper ;	$A - enemy id to search
					; return: Y=0 -	not found, Y=1 - found,	X - slot offset
		LDA	#1
		STA	vfSword
		STA	vEnemy.XPos+1,X
		LDA	#oaGrabTheSword
		JMP	SetupPrinceAction
; ---------------------------------------------------------------------------

loc_7F13B:				; ...
		JMP	CheckFallingInjure
; END OF FUNCTION CHUNK	FOR sub_7D17A

; =============== S U B	R O U T	I N E =======================================


DoObjectAction:				; ...

; FUNCTION CHUNK AT F190 SIZE 00000030 BYTES

		JSR	SwitchPRGBank_4
		JSR	HideSprites

lbCheckAndHandleObjectAction:		; ...
		JSR	SwitchPRGBank_5
		LDX	vCurrentObjectOffset
		LDA	vEnemy.nEnemyID,X
		AND	#$80 ; 'Ä'
		BEQ	lbIncrementCurrentObjectOffset
		LDA	vEnemy.nEnemyID,X
		CMP	#$FF
		BNE	lbHandleObjectAction
		RTS
; ---------------------------------------------------------------------------

lbHandleObjectAction:			; ...
		LDA	vEnemy.ptrAction,X
		STA	v21
		LDA	vEnemy.ptrAction+1,X
		STA	v22

lbHandleObjectActionLoop:		; ...
		LDY	#0
		LDA	(v21),Y
		BEQ	lbStepActionAndRenderObject
		CMP	#$F1 ; 'Ò'
		BCC	lbStepActionAndRenderObject
		EOR	#$FF
		CLC
		ADC	#1
		ASL	A
		TAX
		LDA	pActionProcLibrary,X
		STA	word_23
		LDA	pActionProcLibrary+1,X
		STA	word_23+1
		JSR	IncrementActionPtrExitAndCallAction
		JSR	IncrementActionPtr
		JSR	SwitchPRGBank_5
		JMP	lbHandleObjectActionLoop
; End of function DoObjectAction


; =============== S U B	R O U T	I N E =======================================


IncrementActionPtr:			; ...
		INC	v21
		BNE	lbIncrementActionPtrExit
		INC	v22

lbIncrementActionPtrExit:		; ...
		RTS
; End of function IncrementActionPtr

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR DoObjectAction

lbStepActionAndRenderObject:		; ...
		LDX	vCurrentObjectOffset
		STA	vEnemy.nPose,X
		JSR	IncrementActionPtr
		LDA	v21
		STA	vEnemy.ptrAction,X
		LDA	v22
		STA	vEnemy.ptrAction+1,X
		JSR	SwitchPRGBank_4
		LDA	vEnemy.nPose,X
		BNE	lbRenderObjectSprites
		INC	vActiveObjectCounter
		JMP	lbIncrementCurrentObjectOffset
; ---------------------------------------------------------------------------

lbRenderObjectSprites:			; ...
		JSR	RenderObjectSprites
		LDA	vSavedObjectOffsetId
		STA	vSpriteOffsetId

lbIncrementCurrentObjectOffset:		; ...
		LDA	vCurrentObjectOffset
		CLC
		ADC	#$E
		STA	vCurrentObjectOffset
		JMP	lbCheckAndHandleObjectAction
; END OF FUNCTION CHUNK	FOR DoObjectAction

; =============== S U B	R O U T	I N E =======================================


IncrementActionPtrExitAndCallAction:	; ...
		JSR	IncrementActionPtr
		JMP	(word_23)
; End of function IncrementActionPtrExitAndCallAction

; ---------------------------------------------------------------------------

sbr_Action_0D_PlayMusic:		; ...
		LDA	vfDemoPlay
		BNE	loc_7F1F2
		LDA	(v21),Y
		TAX
		LDA	vCurrentObjectOffset
		BEQ	lbInitSoundEngine_Wrapper
		CPX	#1
		BEQ	loc_7F1F2	; here we've a music id in X

; =============== S U B	R O U T	I N E =======================================


lbInitSoundEngine_Wrapper:		; ...
		JSR	SwitchPRGBank_6
		TXA
		JMP	PlayMusic
; End of function lbInitSoundEngine_Wrapper

; ---------------------------------------------------------------------------

sbr_Action_0E_PlayActionSound:		; ...
		LDA	(v21),Y
		TAX
		LDA	vCurrentObjectOffset
		BEQ	loc_7F1ED
		LDA	vfDisableGuardAnimation
		BEQ	loc_7F1ED
		CPX	#seBreakSound
		BEQ	loc_7F1F2

loc_7F1ED:				; ...
		LDA	#$20 ; ' '
		JSR	PlaySound_Wrapper ; X -	sound id

loc_7F1F2:				; ...
		JMP	SwitchPRGBank_5
; ---------------------------------------------------------------------------

sbr_Action_0F_LevelFinished:		; ...
		LDX	#mVictory
		JSR	lbInitSoundEngine_Wrapper
		STX	vfLevelFinished
		JSR	SwitchPRGBank_5
		JMP	lbDecrementObjectActionPtr

; =============== S U B	R O U T	I N E =======================================

; $A - enemy id	to search
; return: Y=0 -	not found, Y=1 - found,	X - slot offset

FindEnemyById_Wrapper:			; ...
		STA	vwTmp_17
		JSR	UnsafeSwitchPRGBank_2
		JSR	BeginFindEnemyById ; $17 - enemy id to search
					; return: Y=0 -	not found, Y=1 - found,	X - slot offset
		STY	vRoomGuardPlace
		JSR	_RevertPRGBank
		LDY	vRoomGuardPlace
		RTS
; End of function FindEnemyById_Wrapper


; =============== S U B	R O U T	I N E =======================================

; X - current slot offset

GetNextSlot:				; ...
		TXA
		CLC
		ADC	#$E
		TAX
		RTS
; End of function GetNextSlot


; =============== S U B	R O U T	I N E =======================================


SetupPrinceFromHeader:			; ...

; FUNCTION CHUNK AT BA80 SIZE 00000059 BYTES

		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BNE	lbSetupPrinceObject
		LDY	#0
		JSR	GetLevelHeaderDataPtr
		LDA	(vLevelDataPtr),Y
		SEC
		SBC	#1
		STA	vRoomId
		STA	vEnteredRoomId

lbSetupPrinceObject:			; ...
		JSR	SwitchPRGBank_2
		JSR	InitRandomAddit
		JSR	SetupPrinceObjectSlot
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BEQ	lbSetupPrincePosFromHeader
		LDA	#0
		STA	vLevelType
		RTS
; ---------------------------------------------------------------------------

lbSetupPrincePosFromHeader:		; ...
		JSR	SwitchPRGBank_6
		LDY	#1
		JSR	GetLevelHeaderDataPtr
		LDA	(vLevelDataPtr),Y
		STA	vEnemyPlace
		INY
		LDA	vLevelNumber
		CMP	#Level_7
		BEQ	lbForcePrinceDirectionAndSetup
		LDA	(vLevelDataPtr),Y
		AND	#$80 ; 'Ä'      ; if prince looks right, make his action to turn to right
		BEQ	lbSwitchPRG4AndSetupPrince
		LDA	#oaTurnBack1
		JSR	SetupPrinceAction
		JMP	lbSwitchPRG4AndSetupPrince
; ---------------------------------------------------------------------------

lbForcePrinceDirectionAndSetup:		; ...
		LDA	#0
		STA	vEnemy.nDirection

lbSwitchPRG4AndSetupPrince:		; ...
		JSR	SwitchPRGBank_4
		JMP	lbSetupPrinceCustomPositionAction
; End of function SetupPrinceFromHeader


; =============== S U B	R O U T	I N E =======================================


SetupLevelGuardsArrayFromHeader:	; ...
		LDA	#$15
		STA	vExitOpenedStatusTimer
		LDA	#0
		STA	vwTmp_17
		STA	vwTmp_17+1
		JSR	SwitchPRGBank_6

lbSetupLevelGuardsArrayFromHeaderLoop:	; ...
		LDA	vwTmp_17+1
		CLC
		ADC	#3
		TAY
		JSR	GetLevelHeaderDataPtr
		LDA	(vLevelDataPtr),Y
		AND	#$1F
		CMP	#$1E
		BCS	lbRoomWithoutGuard
		LDX	vwTmp_17
		STA	vGuards.nRoomPlace,X
		LDA	vwTmp_17+1
		STA	vGuards.nRoomId,X
		INC	vwTmp_17
		INC	vwTmp_17

lbRoomWithoutGuard:			; ...
		INC	vwTmp_17+1
		LDA	vwTmp_17+1
		CMP	#$19
		BNE	lbSetupLevelGuardsArrayFromHeaderLoop
		LDX	vwTmp_17
		LDA	#$FF
		STA	vGuards.nRoomId,X
		RTS
; End of function SetupLevelGuardsArrayFromHeader


; =============== S U B	R O U T	I N E =======================================

; return: Y - slot offset

FindFreeSlotPtr:			; ...
		LDA	#<(vEnemy)
		STA	v21
		LDA	#>(vEnemy)
		STA	v22
		LDY	#0

lbFindFreeSlotPtrLoop:			; ...
		LDX	#0
		LDA	(v21),Y
		CMP	#$FF
		BNE	lbFindFreeSlotFirstPassFail
		INX

lbFindFreeSlotFirstPassFail:		; ...
		INY
		LDA	(v21),Y
		CMP	#$FF
		BNE	lbFindFreeSlotSecondPassFail
		INX

lbFindFreeSlotSecondPassFail:		; ...
		INY
		CPX	#2
		BEQ	lbFindFreeSlotPassed
		JMP	lbFindFreeSlotPtrLoop
; ---------------------------------------------------------------------------

lbFindFreeSlotPassed:			; ...
		DEY
		DEY
		RTS
; End of function FindFreeSlotPtr


; =============== S U B	R O U T	I N E =======================================


SwitchPRGBank:				; ...
		STY	vSaveY
		TAY
		STA	vSelectedPRGBank
		STA	pBankList,Y
		LDY	vSaveY
		RTS
; End of function SwitchPRGBank


; =============== S U B	R O U T	I N E =======================================


SetupVariousLevelStuff:			; ...
		JSR	SwitchPRGBank_2
		JSR	SetupBuffers_Palettes_Health
		JSR	SwitchPRGBank_4
		JSR	LoadLevelTextTiles
		JMP	SwitchPRGBank_5
; End of function SetupVariousLevelStuff


; =============== S U B	R O U T	I N E =======================================


LoadTextTiles:				; ...
		JSR	SwitchPRGBank_4
		JSR	_LoadTextTiles
		JMP	SwitchPRGBank_2
; End of function LoadTextTiles


; =============== S U B	R O U T	I N E =======================================


WaitNMI_PRG6:				; ...
		LDA	#0
		STA	vfNMISwitchedToPRG6

lbWaitNMI_PRG6:				; ...
		LDA	vfNMISwitchedToPRG6
		BEQ	lbWaitNMI_PRG6
		RTS
; End of function WaitNMI_PRG6

; ---------------------------------------------------------------------------
		JSR	SwitchPRGBank
		STX	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#0
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDX	#$10

loc_7F30F:				; ...
		LDY	#0

loc_7F311:				; ...
		LDA	(vwTmp_17),Y
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INY
		BNE	loc_7F311
		INC	vwTmp_17+1
		DEX
		BNE	loc_7F30F
		JMP	SwitchPRGBank_5

; =============== S U B	R O U T	I N E =======================================

; Decode pointers as follows:
; Encoded pointer: (A)(B)
; Decoded pointer:
;  0x8000 + ( 0x1000 * ( B & 3 ) ) + 0x10 * A
;  ( A  2 ) -	data PRG bank offset (will be added to $52)
;
; Input:
;  $4F - current offset
;  $52 - data PRG bank ( 0 - prince, 3 - bg )
;  $65 - type of pointer? ( 0 -	prince )
;
; Output:
;   vGuardPlace	will be	zeroed if at least one tile was	loaded

DecodeTilesToRAM:			; ...
		LDA	#0
		STA	v53		; flag specifies that vPrinceCharsPPUPtr points	to RAM (=#00) or PPU (!=#00)

DecodeTiles:				; ...
		JSR	SwitchPRGBank_5
		JSR	LoadPointerToEncodedLibrary

DecodeCharsPointer:			; ...
		JSR	SwitchPRGBank_5	; if at	least one tile was loaded, vGuardRoomPlace will	be resetted
		LDA	#0
		STA	vwTmp_17
		STA	vtmpCounter19
		LDY	vtmpCounter4F
		INY
		LDA	(vEncodedPointerDataPtr),Y
		BNE	lbCheckEncodedPointersEOF
		INC	vtmpCounter19	; we've first zero in encoded pointer

lbCheckEncodedPointersEOF:		; ...
		CMP	#$FF		; we've first marker 0xFF
		BNE	lbDecodePointer
		INC	vwTmp_17

lbDecodePointer:			; ...
		TAX
		AND	#3
		CLC
		ADC	#8
		STA	vCharsDataPtr+1	; load high part of pointer - it is low	2 bits.	And add	8, so hi part of pointer will be 0x80+0x10*X (X	- low 2	bits)
		TXA
		LSR	A
		LSR	A
		STA	word_47		; load bank id offset from second byte of encoded pointer. It is high 6	bits
		LDY	vtmpCounter4F
		LDA	(vEncodedPointerDataPtr),Y
		BNE	lbCheckEncodedPointers2EOF
		INC	vtmpCounter19	; second zero in encoded pointer

lbCheckEncodedPointers2EOF:		; ...
		CMP	#$FF
		BNE	lbDecodePointer2
		INC	vwTmp_17	; second marker	0xFF

lbDecodePointer2:			; ...
		LDX	#4		; move high 4 bits of first byte of encoded pointer to high part of pointer.
					; So we	get a real pointer: 0x8000 + 0x1000*(BYTE2 & 3)	+ 0x10 * BYTE1

lbDecodeLoNibble:			; ...
		ASL	A
		ROL	vCharsDataPtr+1	; pointer to pointer of	chars data or pointer to chars data
		DEX
		BNE	lbDecodeLoNibble
		STA	vCharsDataPtr	; pointer to pointer of	chars data or pointer to chars data
		LDA	vfDisallowLoadEmptyTile	; in game mode it will be 0 ?
		BNE	lbCheckOrSendCharsToBuffer
		LDA	vtmpCounter19
		CMP	#2		; two zeroes means empty tile, so skip it to load
		BNE	lbCheckOrSendCharsToBuffer
		JMP	lbContinueDecodeLoop
; ---------------------------------------------------------------------------

lbCheckOrSendCharsToBuffer:		; ...
		LDA	vwTmp_17
		CMP	#2		; two markers of 0xFF means end	of list, exiting...
		BNE	lbSendCharsDataToBuffer
		RTS
; ---------------------------------------------------------------------------

lbSendCharsDataToBuffer:		; ...
		LDA	#0
		STA	vRoomGuardPlace
		LDA	word_47		; bank id offset from encoded pointer
		CLC
		ADC	v52		; add it to start bank of tiles
		JSR	SwitchPRGBank
		LDA	v53		; if $53 is not	zero, then data	will be	sent into the RAM instead of PPU
		BEQ	lbSendPrinceCharsToBuffer
		LDA	vPrinceCharsPPUPtr ; RAM/PPU ptr to buffer to write
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	vPrinceCharsPPUPtr+1 ; RAM/PPU ptr to buffer to	write
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDY	#0
		LDX	#$10

lbSendBgCharsLoop:			; ...
		LDA	(vCharsDataPtr),Y ; send bits of a tile	into the CHR-RAM (10 bytes)
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INY
		DEX
		BNE	lbSendBgCharsLoop
		LDA	vPrinceCharsPPUPtr+1 ; RAM/PPU ptr to buffer to	write
		CLC
		ADC	#$10
		STA	vPrinceCharsPPUPtr+1 ; RAM/PPU ptr to buffer to	write
		BCC	lbExitThisDecodeIter
		INC	vPrinceCharsPPUPtr ; if	we've overflow of lo part of PPU pointer, increment high part

lbExitThisDecodeIter:			; ...
		JMP	lbContinueDecodeLoop
; ---------------------------------------------------------------------------

lbSendPrinceCharsToBuffer:		; ...
		LDY	#0
		LDX	#$10

lbSendPrinceCharsToBufferLoop:		; ...
		LDA	(vCharsDataPtr),Y ; pointer to pointer of chars	data or	pointer	to chars data
		STA	(vPrinceCharsPPUPtr),Y ; RAM/PPU ptr to	buffer to write
		INY
		DEX
		BNE	lbSendPrinceCharsToBufferLoop
		LDA	vPrinceCharsPPUPtr ; RAM/PPU ptr to buffer to write
		CLC
		ADC	#$10
		STA	vPrinceCharsPPUPtr ; RAM/PPU ptr to buffer to write
		BCC	lbContinueDecodeLoop
		INC	vPrinceCharsPPUPtr+1 ; RAM/PPU ptr to buffer to	write

lbContinueDecodeLoop:			; ...
		JSR	IncrementCharsLoopOffset
		JMP	DecodeCharsPointer ; if	at least one tile was loaded, vGuardRoomPlace will be resetted
; End of function DecodeTilesToRAM


; =============== S U B	R O U T	I N E =======================================

; A - enemy ID
; $49 -	unknown4
;
; returns:
; X - slot offset

FindEnemy:				; ...
		LDY	#0
		STA	vwTmp_17
		LDX	#0

lbFindEnemyLoop:			; ...
		LDA	vEnemy.nEnemyID,X
		CMP	#$FF
		BEQ	lbFindEnemyBailOut
		AND	#$7F ; ''
		CMP	vwTmp_17
		BEQ	lbFindEnemyCheck

lbFindEnemyNext:			; ...
		JSR	GetNextSlot	; X - current slot offset
		JMP	lbFindEnemyLoop
; ---------------------------------------------------------------------------

lbFindEnemyCheck:			; ...
		LDA	vEnemy.nUnknown4,X
		CMP	v49
		BNE	lbFindEnemyNext
		RTS
; ---------------------------------------------------------------------------

lbFindEnemyBailOut:			; ...
		LDY	#$FF
		RTS
; End of function FindEnemy


; =============== S U B	R O U T	I N E =======================================


sub_7F3F4:				; ...
		JSR	GetSavedRoomDataPtr
		LDA	#0
		STA	vfExternalRoomId
		STA	v54
		LDA	vEnemy.nPose
		CMP	#pPrincePose01_offset -	pPrincePosesLo
		BCS	loc_7F40A
		LDA	#oaRunning1
		STA	vEnemy.nAction

loc_7F40A:				; ...
		LDA	vEnemy.nPose
		CMP	#pPrincePose1A_offset -	pPrincePosesLo
		BNE	loc_7F414
		JMP	loc_7F41B
; ---------------------------------------------------------------------------

loc_7F414:				; ...
		LDA	vEnemy.nPose
		CMP	#pPrincePose2B_offset -	pPrincePosesLo
		BNE	loc_7F443

loc_7F41B:				; ...
		JSR	sub_7D499
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBrokenPlate
		BNE	loc_7F42A
		JSR	GetBitsForPlace
		BNE	loc_7F42F

loc_7F42A:				; ...
		JSR	GetBlockFromEnemyPlace
		BNE	loc_7F443

loc_7F42F:				; ...
		LDX	#$15
		LDA	#0
		STA	vFallingHeight
		LDA	vEnemy.nAction
		CMP	#oaRunningJump
		BEQ	loc_7F43F
		LDX	#oaStartFalling1

loc_7F43F:				; ...
		TXA
		JMP	SetupPrinceAction
; ---------------------------------------------------------------------------

loc_7F443:				; ...
		JSR	sub_7D499
		JSR	GetBlockFromEnemyPlace
		BEQ	locret_7F450
		JSR	IsObjectCurrentRoomHiBitSet
		BEQ	loc_7F451

locret_7F450:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7F451:				; ...
		JSR	sub_7F649
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBrickWall
		BEQ	locret_7F49E
		LDA	vfJumpingLeft
		BNE	loc_7F470
		LDA	vfJoypadLeft
		BEQ	loc_7F499
		LDA	vJoypad1
		AND	#Btn_A
		BEQ	loc_7F499
		LDA	#1
		STA	vfJumpingLeft

loc_7F470:				; ...
		LDA	vEnemy.nPose
		CMP	#pPrincePose01_offset -	pPrincePosesLo
		BCS	locret_7F49E
		CMP	#pPrincePose06_offset -	pPrincePosesLo
		BCC	locret_7F49E
		CMP	#pPrincePose0E_offset -	pPrincePosesLo
		BCS	locret_7F49E
		LDA	vfMenuButtonPressed ; Prevents to blinking option while	joy button pressed
		BNE	loc_7F499
		LDA	#$C8 ; '»'
		STA	vfMenuButtonPressed ; Prevents to blinking option while	joy button pressed
		STA	vEnemy.nAction
		LDA	#0
		STA	vFallingHeight
		LDA	#oaRunningJump
		JSR	SetupPrinceAction
		JMP	loc_7F499
; ---------------------------------------------------------------------------

loc_7F499:				; ...
		LDA	#0
		STA	vfJumpingLeft

locret_7F49E:				; ...
		RTS
; End of function sub_7F3F4


; =============== S U B	R O U T	I N E =======================================


sub_7F49F:				; ...

; FUNCTION CHUNK AT 8ACC SIZE 0000001D BYTES

		LDA	vEnemy.nUnknown1
		CMP	#4
		BEQ	locret_7F4B1
		CMP	#1
		BNE	loc_7F4AD
		JMP	loc_7F540
; ---------------------------------------------------------------------------

loc_7F4AD:				; ...
		CMP	#3
		BNE	loc_7F4B2

locret_7F4B1:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7F4B2:				; ...
		LDA	vfMenuButtonPressed ; Prevents to blinking option while	joy button pressed
		BNE	loc_7F4E0
		LDA	vJoypad1
		AND	#Btn_A
		BNE	loc_7F4E0
		LDA	vEnemy.nAction
		CMP	#oaTurnBack1
		BEQ	loc_7F4E0
		CMP	#oaStartFallingAndInjure
		BEQ	loc_7F4E0
		CMP	#oaMoveUp
		BEQ	loc_7F4E0
		CMP	#oaJumpUpAndSwing2
		BEQ	loc_7F4E0
		CMP	#oaJumpUpAndSwing1
		BEQ	loc_7F4E0
		CMP	#oaClimbUpFailed
		BEQ	loc_7F4E0
		LDA	vfJoypadLeft
		BEQ	loc_7F4E0
		JMP	loc_7F4E3
; ---------------------------------------------------------------------------

loc_7F4E0:				; ...
		JMP	loc_7F540
; ---------------------------------------------------------------------------

loc_7F4E3:				; ...
		JSR	sub_7F649
		JSR	GetBitsForPlace
		BNE	loc_7F536
		JSR	GetBlockFromEnemyPlace
		CMP	#lbLevel4MirrorPlate
		BEQ	loc_7F4FF
		CMP	#lbBrickWall
		BEQ	loc_7F4FF
		CMP	#lbDoor
		BNE	loc_7F536
		LDA	vEnemy.nDirection
		BNE	loc_7F536

loc_7F4FF:				; ...
		LDA	#1
		STA	vfMenuButtonPressed ; Prevents to blinking option while	joy button pressed
		LDA	vEnemy.nUnknown1
		BNE	loc_7F50E
		LDA	#oaStartSteal4
		JMP	SetupPrinceAction
; ---------------------------------------------------------------------------

loc_7F50E:				; ...
		LDY	#$A
		LDA	vEnemy.nDirection
		BNE	loc_7F528
		LDY	#$48 ; 'H'
		LDA	vEnemyPlace
		CMP	#9
		BEQ	loc_7F526
		CMP	#$13
		BEQ	loc_7F526
		CMP	#$1D
		BNE	loc_7F528

loc_7F526:				; ...
		LDY	#$28 ; '('

loc_7F528:				; ...
		LDA	vDupEnemyPlace
		STA	vEnemyPlace
		JSR	MovePrinceHorz	; Y - offset to	move
		LDA	#oaStartSteal2
		JMP	SetupPrinceAction
; ---------------------------------------------------------------------------

loc_7F536:				; ...
		LDA	vEnemy.nUnknown1
		BNE	loc_7F540
		LDA	#oaRunning1
		JSR	SetupPrinceAction

loc_7F540:				; ...
		JSR	SwitchPRGBank_5
		JSR	sub_7EAA6
		JSR	sub_7D838
		JSR	SwitchPRGBank_5
		JMP	loc_58ACC
; End of function sub_7F49F

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR CheckAndSetupStealMode

locret_7F54F:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7F550:				; ...
		LDA	#$F
		STA	byte_360
		LDA	#2
		STA	byte_361
		RTS
; END OF FUNCTION CHUNK	FOR CheckAndSetupStealMode

; =============== S U B	R O U T	I N E =======================================


CheckAndSetupStealMode:			; ...

; FUNCTION CHUNK AT F54F SIZE 0000000C BYTES

		LDA	vEnemy.nPose
		CMP	#pPrincePose01_offset -	pPrincePosesLo
		BNE	locret_7F54F
		LDA	byte_361
		CMP	#1
		BNE	loc_7F56C
		JMP	loc_7F63C
; ---------------------------------------------------------------------------

loc_7F56C:				; ...
		LDA	vJoypad1
		AND	#Btn_B
		BEQ	loc_7F550
		LDA	vEnemy.XPos+1
		BNE	loc_7F584
		LDA	vEnemy.XPos
		CMP	#$14
		BCS	loc_7F584
		LDA	#oaStartSteal5
		JMP	loc_7F631
; ---------------------------------------------------------------------------

loc_7F584:				; ...
		JSR	GetSavedRoomDataPtr
		LDA	#$1E
		STA	vRoomGuardPlace
		LDA	#$14
		STA	vtmp_4C0
		JSR	sub_7F649
		JSR	GetBlockFromEnemyPlace
		CMP	#lbCutters
		BEQ	loc_7F5B2
		INC	vEnemyPlace
		JSR	GetBlockFromEnemyPlace
		CMP	#lbCutters
		BEQ	loc_7F5B2
		DEC	vEnemyPlace
		DEC	vEnemyPlace
		JSR	GetBlockFromEnemyPlace
		CMP	#lbCutters
		BNE	loc_7F5BC

loc_7F5B2:				; ...
		LDA	#$A
		STA	vRoomGuardPlace
		LDA	#6
		STA	vtmp_4C0

loc_7F5BC:				; ...
		LDA	#0
		STA	vtmpCounter4F
		STA	v54
		STA	v50

loc_7F5C4:				; ...
		LDA	vEnemy.nDirection
		BNE	loc_7F5D6
		LDA	vtmpCounter4F
		CLC
		ADC	vRoomGuardPlace
		TAX
		JSR	sub_7FA60
		JMP	loc_7F5EC
; ---------------------------------------------------------------------------

loc_7F5D6:				; ...
		LDX	vtmpCounter4F
		JSR	MovePrinceRight	; $17,$18 - offset to move
		LDA	vwTmp_17
		SEC
		SBC	vtmp_4C0
		STA	vwTmp_17
		LDA	vwTmp_17+1
		SBC	#0
		STA	vwTmp_17+1
		JSR	sub_7D12C

loc_7F5EC:				; ...
		JSR	sub_7D147
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBrokenPlate
		BNE	loc_7F5FB
		JSR	GetBitsForPlace
		BNE	loc_7F615

loc_7F5FB:				; ...
		JSR	GetBlockFromEnemyPlace
		BEQ	loc_7F615
		CMP	#lbCutters
		BEQ	loc_7F615
		INC	v50
		INC	vtmpCounter4F
		INC	v50
		INC	vtmpCounter4F
		LDA	v50
		CMP	#$20 ; ' '
		BNE	loc_7F5C4
		JMP	loc_7F644
; ---------------------------------------------------------------------------

loc_7F615:				; ...
		LDA	#$F0 ; ''
		ORA	byte_360
		STA	byte_360
		LSR	vtmpCounter4F
		LDA	vtmpCounter4F
		BEQ	loc_7F634
		CMP	#$E
		BCS	loc_7F644
		LDA	#0
		STA	byte_360
		LDA	#oaStartSteal1
		CLC
		ADC	vtmpCounter4F

loc_7F631:				; ...
		JMP	SetupPrinceAction
; ---------------------------------------------------------------------------

loc_7F634:				; ...
		LDA	byte_360
		CMP	#$FF
		BEQ	loc_7F63C
		RTS
; ---------------------------------------------------------------------------

loc_7F63C:				; ...
		LDA	byte_361
		BEQ	loc_7F644
		DEC	byte_361

loc_7F644:				; ...
		LDA	#oaStartSteal14
		JMP	SetupPrinceAction
; End of function CheckAndSetupStealMode


; =============== S U B	R O U T	I N E =======================================


sub_7F649:				; ...
		JSR	GetSavedRoomDataPtr
		LDX	#$28 ; '('
		LDA	vEnemy.nDirection
		BEQ	loc_7F655
		LDX	#4

loc_7F655:				; ...
		JSR	sub_7FA60
		JMP	sub_7D147
; End of function sub_7F649

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7D838

loc_7F65B:				; ...
		JSR	GetSavedRoomDataPtr
		LDA	vEnemy.nDirection
		BNE	loc_7F66E
		LDX	#0
		JSR	MovePrinceRight	; $17,$18 - offset to move
		JSR	sub_7D12C
		JMP	loc_7F673
; ---------------------------------------------------------------------------

loc_7F66E:				; ...
		LDX	#$2C ; ','
		JSR	sub_7FA60

loc_7F673:				; ...
		JSR	sub_7D147
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBigColumnLowPart
		BEQ	locret_7F6E2
		CMP	#lbBrokenPlate
		BNE	loc_7F688
		JSR	GetBitsForPlace
		CMP	#3		; to allow get down from hole from fall	down space change it to:
					; * BNE	loc_7F68D
					; * BEQ	(exit)
					; or to
					; * CMP	#0
					; * BNE	loc_7F68D
		BEQ	loc_7F68D

loc_7F688:				; ...
		JSR	GetBlockIdFromPtr ; Y -	place in room
		BNE	locret_7F6E2

loc_7F68D:				; ...
		JSR	sub_7D499
		LDA	vDupEnemyPlace
		STA	vEnemyPlace
		LDX	#$38 ; '8'
		LDA	vEnemy.XPos+1
		CMP	#1
		BNE	loc_7F6A4
		LDA	vEnemy.XPos
		CMP	#$20 ; ' '

loc_7F6A4:				; ...
		BCS	loc_7F6BB
		LDX	#$30 ; '0'
		LDA	vEnemy.XPos+1
		CMP	#0
		BNE	loc_7F6B4
		LDA	vEnemy.XPos
		CMP	#$18

loc_7F6B4:				; ...
		BCS	loc_7F6BB
		LDX	#$12
		JMP	loc_7F6C1
; ---------------------------------------------------------------------------

loc_7F6BB:				; ...
		LDA	vDupEnemyPlace
		STA	vRemoteActionPlace ; do	action at this place while it is not equal to 0xFF

loc_7F6C1:				; ...
		LDA	vEnemy.nDirection
		BEQ	loc_7F6D8
		LDX	#$22 ; '"'
		LDA	vEnemy.XPos+1
		CMP	#0
		BNE	loc_7F6D4
		LDA	vEnemy.XPos
		CMP	#$44 ; 'D'

loc_7F6D4:				; ...
		BCS	loc_7F6D8
		LDX	#$1A

loc_7F6D8:				; ...
		TXA
		TAY
		JSR	MovePrinceHorz	; Y - offset to	move
		LDA	#oaSlipDown
		JMP	SetupPrinceAction
; ---------------------------------------------------------------------------

locret_7F6E2:				; ...
		RTS
; END OF FUNCTION CHUNK	FOR sub_7D838

; =============== S U B	R O U T	I N E =======================================


sub_7F6E3:				; ...

; FUNCTION CHUNK AT F78E SIZE 0000002E BYTES

		LDA	v12
		BEQ	loc_7F6EC
		LDA	#0
		STA	byte_4C9

loc_7F6EC:				; ...
		JSR	sub_7D4B5
		LDA	vEnemy.nAction
		CMP	#oaShortJumpUp1
		BEQ	locret_7F6E2
		CMP	#oaStartFalling4
		BEQ	locret_7F6E2
		CMP	#oaClimbUpFailed
		BNE	loc_7F708
		LDA	vEnemy.nUnknown1
		CMP	#5
		BNE	loc_7F708
		JMP	loc_7F754
; ---------------------------------------------------------------------------

loc_7F708:				; ...
		LDA	vEnemy.nUnknown1
		CMP	#6
		BEQ	loc_7F716
		CMP	#2
		BEQ	loc_7F716
		JMP	lbCheckClimbUpExit
; ---------------------------------------------------------------------------

loc_7F716:				; ...
		LDA	vEnemy.nAction
		CMP	#oaBeginFalling
		BEQ	loc_7F735
		CMP	#oaStartFalling4
		BEQ	loc_7F735
		CMP	#oaShortJumpUp1
		BEQ	loc_7F735
		JSR	GetBlockFromEnemyPlace
		CMP	#lbCastleOverDoor
		BEQ	loc_7F730
		CMP	#lbBrickWall
		BNE	loc_7F735

loc_7F730:				; ...
		LDA	#oaGrabLedge
		JSR	SetupPrinceAction

loc_7F735:				; ...
		JSR	CheckClimbUp
		LDA	vEnemy.nAction
		CMP	#oaMoveUp
		BNE	loc_7F742
		JMP	lbCheckClimbUpExit
; ---------------------------------------------------------------------------

loc_7F742:				; ...
		LDA	vfLockJoypad
		BNE	loc_7F754
		LDA	vJoypad1
		AND	#Btn_Up|Btn_B|Btn_A
		BEQ	loc_7F754
		JSR	GetPreviousFloor
		JMP	lbCheckClimbUpExit
; ---------------------------------------------------------------------------

loc_7F754:				; ...
		LDX	#$E
		LDA	vEnemy.nDirection
		BEQ	loc_7F75D
		LDX	#$14

loc_7F75D:				; ...
		JSR	loc_7F655
		JSR	GetSavedRoomDataPtr
		LDY	vDupEnemyPlace
		JSR	GetBlockIdFromPtr ; Y -	place in room
		BEQ	loc_7F78E
		CMP	#lbCastleOverDoor
		BEQ	loc_7F78E
		CMP	#lbBigColumnHighPart
		BEQ	loc_7F78E
		LDX	#lbLowButton
		LDA	vEnemy.nDirection
		BNE	loc_7F77C
		LDX	#4

loc_7F77C:				; ...
		TXA
		JSR	IncrementFallingHorz
		LDA	#oaShortJumpUp1
		JMP	SetupPrinceAction
; End of function sub_7F6E3


; =============== S U B	R O U T	I N E =======================================


sub_7F785:				; ...
		INY
		LDA	vEnemy.nDirection
		BEQ	locret_7F78D
		DEY
		DEY

locret_7F78D:				; ...
		RTS
; End of function sub_7F785

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7F6E3

loc_7F78E:				; ...
		JSR	sub_7F649
		JSR	GetBlockFromEnemyPlace
		BEQ	loc_7F7A2
		CMP	#lbBigColumnHighPart
		BEQ	loc_7F7A2
		CMP	#lbCastleOverDoor
		BEQ	loc_7F7A2
		CMP	#lbBrickWall
		BNE	loc_7F7AC

loc_7F7A2:				; ...
		LDA	#6
		JSR	IncrementFallingHorz
		LDX	#oaStartFalling4
		JMP	loc_7F7B8
; ---------------------------------------------------------------------------

loc_7F7AC:				; ...
		LDA	vEnemy.nDirection
		BNE	loc_7F7B6
		LDA	#4
		JSR	DecrementFallingHorz

loc_7F7B6:				; ...
		LDX	#oaShortJumpUp1

loc_7F7B8:				; ...
		TXA
		JMP	SetupPrinceAction
; END OF FUNCTION CHUNK	FOR sub_7F6E3

; =============== S U B	R O U T	I N E =======================================


GetPreviousFloor:			; ...
		LDA	vRemoteActionPlace ; do	action at this place while it is not equal to 0xFF
		CMP	#$FF
		BNE	locret_7F7CE
		LDA	vEnemyPlace
		SEC
		SBC	#$A
		BCC	locret_7F7CE
		STA	vRemoteActionPlace ; do	action at this place while it is not equal to 0xFF

locret_7F7CE:				; ...
		RTS
; End of function GetPreviousFloor

; ---------------------------------------------------------------------------
		LDA	vEnemy.nDirection
		BNE	loc_7F7DC
		LDA	#4
		JSR	IncrementFallingHorz
		JMP	locret_7F7E1
; ---------------------------------------------------------------------------

loc_7F7DC:				; ...
		LDA	#4
		JMP	DecrementFallingHorz
; ---------------------------------------------------------------------------

locret_7F7E1:				; ...
		RTS

; =============== S U B	R O U T	I N E =======================================


CheckClimbUp:				; ...
		LDA	vJoypad1
		AND	#Btn_Up
		BEQ	lbCheckClimbUpExit
		JSR	GetPreviousFloor
		LDY	#$3A ; ':'
		LDA	vEnemy.XPos+1
		BNE	loc_7F7FA
		LDA	vEnemy.XPos
		CMP	#$32 ; '2'
		BCC	loc_7F804

loc_7F7FA:				; ...
		LDA	vEnemy.nDirection
		BEQ	loc_7F801
		LDY	#$18

loc_7F801:				; ...
		JSR	MovePrinceHorz	; Y - offset to	move

loc_7F804:				; ...
		LDA	#oaMoveUp
		JSR	SetupPrinceAction
		JSR	SwitchPRGBank_6
		LDY	vRemoteActionPlace ; do	action at this place while it is not equal to 0xFF
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbDoor
		BNE	lbCheckClimbUpAllow
		LDA	vDupEnemyPlace
		STA	vEnemyPlace
		LDA	vDupEnemyPlace
		SEC
		SBC	#$A
		STA	vDupEnemyPlace
		LDA	vLevelNumber
		CMP	#Level_6	; disallow climb up in level #6	before door even if door opened
		BEQ	lbLevel6ForbidClibmUp
		JSR	CheckAnimObjState_Door
		CMP	#$1A
		BCC	lbCheckClimbUpAllow

lbLevel6ForbidClibmUp:			; ...
		LDY	#$18
		LDA	vEnemy.XPos
		CMP	#$50 ; 'P'
		BCC	lbSetupPosAndForbidClimbUp
		LDY	#$38 ; '8'

lbSetupPosAndForbidClimbUp:		; ...
		JSR	MovePrinceHorz	; Y - offset to	move
		LDA	#oaClimbUpFailed
		JSR	SetupPrinceAction

lbCheckClimbUpAllow:			; ...
		JMP	SwitchPRGBank_5
; End of function CheckClimbUp


; =============== S U B	R O U T	I N E =======================================


IncrementFallingHorz:			; ...
		STA	vwTmp_17
		LDA	vEnemy.XPos
		CLC
		ADC	vwTmp_17
		STA	vEnemy.XPos
		LDA	vEnemy.XPos+1
		ADC	#0
		STA	vEnemy.XPos+1

lbCheckClimbUpExit:			; ...
		RTS
; End of function IncrementFallingHorz


; =============== S U B	R O U T	I N E =======================================


DecrementFallingHorz:			; ...
		STA	vwTmp_17
		LDA	vEnemy.XPos
		SEC
		SBC	vwTmp_17
		STA	vEnemy.XPos
		LDA	vEnemy.XPos+1
		SBC	#0
		STA	vEnemy.XPos+1
		RTS
; End of function DecrementFallingHorz


; =============== S U B	R O U T	I N E =======================================

; $17,$18 - offset to move

MovePrinceRight:			; ...
		STX	vwTmp_17
		LDA	vEnemy.XPos
		CLC
		ADC	vwTmp_17
		STA	vwTmp_17
		LDA	vEnemy.XPos+1
		ADC	#0
		STA	vwTmp_17+1
		RTS
; End of function MovePrinceRight


; =============== S U B	R O U T	I N E =======================================


sub_7F882:				; ...

; FUNCTION CHUNK AT A804 SIZE 00000022 BYTES

		LDA	vFallingHeight
		CMP	#6
		BCS	loc_7F898
		LDA	byte_4C9
		BEQ	loc_7F891
		JMP	loc_7F93C
; ---------------------------------------------------------------------------

loc_7F891:				; ...
		LDA	vEnemy.YPos
		CMP	#$A0 ; '†'
		BCC	loc_7F89B

loc_7F898:				; ...
		JMP	loc_7F9A1
; ---------------------------------------------------------------------------

loc_7F89B:				; ...
		LDA	vJoypad1
		AND	#Btn_B|Btn_A
		BEQ	loc_7F898
		LDA	vEnemy.nAction
		CMP	#oaMoveUp
		BEQ	loc_7F8B9
		CMP	#oaBeginFalling
		BEQ	loc_7F8BC
		CMP	#oaStartFalling4
		BEQ	loc_7F8BC
		CMP	#oaStartFalling1
		BEQ	loc_7F8BC
		CMP	#oaStartFalling3
		BEQ	loc_7F8BC

loc_7F8B9:				; ...
		JMP	loc_7F9A1
; ---------------------------------------------------------------------------

loc_7F8BC:				; ...
		JSR	GetSavedRoomDataPtr
		LDX	#$2D ; '-'
		LDA	vEnemy.nDirection
		BEQ	loc_7F8C8
		LDX	#5

loc_7F8C8:				; ...
		JSR	sub_7FA60
		LDA	vEnemy.YPos
		CLC
		ADC	#$10
		SEC
		JSR	loc_7D164
		LDA	vEnemyPlace
		CMP	byte_4CA
		BNE	loc_7F8DE
		RTS
; ---------------------------------------------------------------------------

loc_7F8DE:				; ...
		LDA	vEnemyPlace
		STA	byte_4CA
		LDA	vEnemyPlace
		SEC
		SBC	#$A
		BCS	loc_7F8F7
		ADC	#$1E
		PHA
		JSR	GetTopBorderBlocks
		LDA	#1
		STA	v54
		PLA

loc_7F8F7:				; ...
		TAY
		STA	vEnemyPlace
		JSR	GetBlockIdFromPtr ; Y -	place in room
		CMP	#lbBrokenPlate
		BNE	loc_7F90A
		JSR	GetBitsForPlace
		BEQ	loc_7F90A
		JMP	loc_7F9A1
; ---------------------------------------------------------------------------

loc_7F90A:				; ...
		JSR	GetBlockIdFromPtr ; Y -	place in room
		BEQ	loc_7F91F
		CMP	#9
		BEQ	loc_7F91F
		CMP	#7
		BEQ	loc_7F91F
		CMP	#$C
		BEQ	loc_7F91F
		CMP	#$14
		BNE	loc_7F922

loc_7F91F:				; ...
		JMP	loc_7F9A1
; ---------------------------------------------------------------------------

loc_7F922:				; ...
		STA	vRoomGuardPlace
		LDA	vEnemy.nDirection
		BEQ	loc_7F931
		LDA	vRoomGuardPlace
		CMP	#4
		BEQ	loc_7F9A1

loc_7F931:				; ...
		JSR	sub_7F785
		STY	vEnemyPlace
		LDA	#1
		STA	byte_4C9

loc_7F93C:				; ...
		LDA	vEnemy.nPose
		CMP	#pPrincePose6A_offset -	pPrincePosesLo
		BEQ	loc_7F947
		CMP	#pPrincePose69_offset -	pPrincePosesLo
		BNE	loc_7F9A1

loc_7F947:				; ...
		LDA	byte_4CA
		STA	vEnemyPlace
		JSR	GetPreviousFloor
		LDX	#oaGrabLedge
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBrickWall
		BEQ	loc_7F962
		CMP	#lbCastleOverDoor
		BEQ	loc_7F962
		LDX	#oaSwinging
		STX	v405

loc_7F962:				; ...
		TXA
		JSR	SetupPrinceAction
		LDX	#seWallBreak
		JSR	PlaySound_Wrapper ; X -	sound id
		LDA	#2
		STA	vEnemy.nUnknown1
		LDA	#0
		STA	byte_4C9
		STA	byte_4CA
		STA	vFallingHeight
		LDY	#$19
		LDA	vEnemy.nDirection
		BNE	loc_7F99B
		LDY	#$38 ; '8'
		LDA	vEnemyPlace
		CMP	#9
		BEQ	loc_7F993
		CMP	#$13
		BEQ	loc_7F993
		CMP	#$1D
		BNE	loc_7F99B

loc_7F993:				; ...
		SEC
		SBC	#9
		STA	vEnemyPlace
		LDY	#$18

loc_7F99B:				; ...
		LDX	#$3F ; '?'
		TYA
		JMP	SetupPrincePosition ; A	- additional for X
					; X - additional for Y
					; vEnemyPlace -	position in room
; ---------------------------------------------------------------------------

loc_7F9A1:				; ...
		JSR	SwitchPRGBank_2
		JMP	loc_2A804
; End of function sub_7F882


; =============== S U B	R O U T	I N E =======================================


LoadJointChars:				; ...
		INY
		TYA
		PHA
		LDA	(vptrBlockData),Y
		ASL	A
		TAX
		JSR	SwitchPRGBank_2
		LDA	(vptrBlockData),Y
		CMP	#$D2 ; '“'      ; Load horz joint for space with debris plate
					; But tiles is not correct for this joint
		BNE	loc_7F9C2
		LDA	#<(pJointCharsEncPtr_D2)
		STA	vLevelBlocksCharsPtr
		LDA	#>(pJointCharsEncPtr_D2)
		STA	vLevelBlocksCharsPtr+1
		JMP	loc_7F9CC
; ---------------------------------------------------------------------------

loc_7F9C2:				; ...
		LDA	pJointCharsEncPtrLibrary,X
		STA	vLevelBlocksCharsPtr
		LDA	pJointCharsEncPtrLibrary+1,X
		STA	vLevelBlocksCharsPtr+1

loc_7F9CC:				; ...
		JSR	SwitchPRGBank_6
		JSR	CheckAndLoadLevelBlockChars ; vLevelBlocksCharsPtr - pointer to	block chars
					; Pointers and begin tile id will be placed at $0300 area
					; $75 -	first tile id at PPU char
		PLA
		TAY
		INY
		LDA	(vptrBlockData),Y
		TAX
		INY
		LDA	(vptrBlockData),Y
		STA	vptrBlockData+1
		STX	vptrBlockData
		RTS
; End of function LoadJointChars

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR DrawBlockJoints

__DoDrawRoomBlocksJoints:		; ...
		JSR	LoadJointChars
		LDY	#0
		LDA	#2
		STA	vtmpCounter19+1

loc_7F9E9:				; ...
		LDX	#3
		LDA	vwTmp_17+1
		STA	vtmpCounter19
		LDA	vwTmp_17
		STA	v2E
		INC	vwTmp_17

loc_7F9F5:				; ...
		LDA	(vptrBlockData),Y
		BEQ	loc_7FA1E
		LDA	vfRoomScreenDraw
		BEQ	loc_7FA0C
		LDA	vwTmp_17
		CMP	#$20 ; ' '
		BCC	loc_7FA1E
		CMP	#$23 ; '#'
		BCC	loc_7FA0C
		CMP	#$24 ; '$'
		BCC	loc_7FA1E

loc_7FA0C:				; ...
		LDA	vwTmp_17
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	vwTmp_17+1
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	(vptrBlockData),Y
		CLC
		ADC	vBlockPPUTileId
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.

loc_7FA1E:				; ...
		JSR	sub_7FA35
		INY
		DEX
		BNE	loc_7F9F5
		LDA	vtmpCounter19
		STA	vwTmp_17+1
		LDA	v2E
		STA	vwTmp_17
		JSR	IncPtr17For32
		DEC	vtmpCounter19+1
		BNE	loc_7F9E9
		RTS
; END OF FUNCTION CHUNK	FOR DrawBlockJoints

; =============== S U B	R O U T	I N E =======================================


sub_7FA35:				; ...
		LDA	vwTmp_17+1
		CLC
		ADC	#1
		STA	vwTmp_17+1
		AND	#$1F
		BNE	locret_7FA50
		LDA	vwTmp_17+1
		AND	#$E0 ; '‡'
		SEC
		SBC	#$20 ; ' '
		STA	vwTmp_17+1
		LDA	vwTmp_17
		CLC
		ADC	#4
		STA	vwTmp_17

locret_7FA50:				; ...
		RTS
; End of function sub_7FA35


; =============== S U B	R O U T	I N E =======================================


GuardMovements:				; ...
		JSR	SwitchPRGBank_5
		JSR	sub_588AC
		PHA
		JSR	SwitchPRGBank_4
		PLA
		RTS
; End of function GuardMovements

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_4ABC9

loc_7FA5D:				; ...
		JMP	loc_7FC3F
; END OF FUNCTION CHUNK	FOR sub_4ABC9

; =============== S U B	R O U T	I N E =======================================


sub_7FA60:				; ...
		JSR	MovePrinceLeft	; X - offset to	move
		JMP	sub_7D12C
; End of function sub_7FA60


; =============== S U B	R O U T	I N E =======================================


sub_7FA66:				; ...
		JSR	MovePrinceRight	; $17,$18 - offset to move
		JMP	sub_7D12C
; End of function sub_7FA66


; =============== S U B	R O U T	I N E =======================================

; X - offset to	move

MovePrinceLeft:				; ...
		STX	vwTmp_17
		LDA	vEnemy.XPos
		SEC
		SBC	vwTmp_17
		STA	vwTmp_17
		BCS	loc_7FA81
		LDA	vEnemy.XPos+1
		BNE	loc_7FA81
		LDA	#0
		STA	vwTmp_17

loc_7FA81:				; ...
		LDA	vEnemy.XPos+1
		SBC	#0
		STA	vwTmp_17+1
		RTS
; End of function MovePrinceLeft


; =============== S U B	R O U T	I N E =======================================


sub_7FA89:				; ...
		TYA
		CLC
		ADC	#9
		TAY
		LDA	(v21),Y
		RTS
; End of function sub_7FA89


; =============== S U B	R O U T	I N E =======================================


sub_7FA91:				; ...

; FUNCTION CHUNK AT B51F SIZE 00000020 BYTES
; FUNCTION CHUNK AT B382 SIZE 00000035 BYTES
; FUNCTION CHUNK AT FC45 SIZE 000001BB BYTES

		LDA	vfMirrorPresent
		BEQ	loc_7FA9B
		LDA	#$FF
		STA	vRemoteActionPlace ; do	action at this place while it is not equal to 0xFF

loc_7FA9B:				; ...
		LDA	v12
		BNE	locret_7FAA9
		LDA	vfPushedButton
		BNE	locret_7FAA9
		LDA	vfAllowRenderPushButtonAnim
		BEQ	loc_7FAAA

locret_7FAA9:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7FAAA:				; ...
		JSR	GetSavedRoomDataPtr
		LDA	#0
		STA	v54
		LDA	vFallingPlateCheckPlace
		STA	vEnemyPlace
		CMP	#$FF
		BNE	loc_7FB11
		LDA	vPressedButtonAction
		BNE	loc_7FAD8
		LDA	vEnemy.nPose
		CMP	#pPrincePose6A_offset -	pPrincePosesLo ; falling sprite
		BEQ	locret_7FAD7
		CMP	#pPrincePose10_offset2 - pPrincePosesLo
		BCC	loc_7FAD8
		CMP	#pPrincePose2B_offset -	pPrincePosesLo
		BCS	loc_7FAD8
		CMP	#pPrincePose1A_offset -	pPrincePosesLo
		BCC	locret_7FAD7
		CMP	#pPrincePose26_offset -	pPrincePosesLo
		BCC	loc_7FAD8

locret_7FAD7:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7FAD8:				; ...
		LDX	#$1E
		LDA	vEnemy.nDirection
		BNE	loc_7FAE1
		LDX	#$16

loc_7FAE1:				; ...
		JSR	sub_7FA60
		LDA	v405
		BNE	locret_7FAD7
		LDA	vEnemy.nAction
		CMP	#oaTurnBack1
		BEQ	locret_7FAD7
		CMP	#oaSwinging
		BEQ	locret_7FAD7
		LDX	#$24 ; '$'
		CMP	#oaShortJumpUp2
		BEQ	loc_7FB02
		CMP	#oaJumping1
		BEQ	loc_7FB02
		CMP	#oaRunningJump
		BNE	loc_7FB09

loc_7FB02:				; ...
		LDA	#$1E
		CLC
		ADC	vfVertBlock
		TAX

loc_7FB09:				; ...
		STX	vwTmp_17
		JSR	loc_7D15E
		JMP	loc_7FB17
; ---------------------------------------------------------------------------

loc_7FB11:				; ...
		LDA	vFallingPlateRoom
		JSR	_GetCurrentRoomDataPtr

loc_7FB17:				; ...
		LDA	vRemoteActionPlace ; do	action at this place while it is not equal to 0xFF
		CMP	#$FF
		BEQ	loc_7FB22
		CMP	#$1D
		BCC	loc_7FB2A

loc_7FB22:				; ...
		LDA	vPressedButtonAction
		BNE	loc_7FB30
		LDA	vEnemyPlace

loc_7FB2A:				; ...
		STA	vEnemyPlace
		STA	vPushedButtonPlace

loc_7FB30:				; ...
		JSR	GetBlockFromEnemyPlace
		CMP	#lbLowButton
		BEQ	loc_7FB3B
		CMP	#lbHighButton
		BNE	loc_7FB77

loc_7FB3B:				; ...
		LDA	#0
		STA	byte_6D5
		LDA	vPushedButtonPlace
		STA	vEnemyPlace
		CMP	#9
		BEQ	loc_7FB59
		CMP	#$13
		BEQ	loc_7FB59
		CMP	#$1D
		BEQ	loc_7FB59
		TAY
		INY
		JSR	GetBlockIdFromPtr ; Y -	place in room
		BNE	loc_7FB5B

loc_7FB59:				; ...
		LDA	#lbPlate

loc_7FB5B:				; ...
		STA	vPreviousBlockId
		LDY	vEnemyPlace
		LDA	(vC),Y
		STA	vPressedButtonBlockId
		JSR	GetBlockFromEnemyPlace
		STA	byte_4C8
		CMP	#lbLowButton
		BNE	loc_7FB73

loc_7FB70:				; ...
		JMP	loc_7FC02
; ---------------------------------------------------------------------------

loc_7FB73:				; ...
		CMP	#lbHighButton
		BEQ	loc_7FB70

loc_7FB77:				; ...
		LDA	vPressedButtonAction
		BEQ	locret_7FB89
		CMP	#4
		BEQ	loc_7FB83
		JMP	loc_7FC02
; ---------------------------------------------------------------------------

loc_7FB83:				; ...
		JSR	SwitchPRGBank_4
		JMP	loc_4B398
; ---------------------------------------------------------------------------

locret_7FB89:				; ...
		RTS
; ---------------------------------------------------------------------------

lbCheckExitButton:			; ...
		LDA	vLevelNumber
		CMP	#Level_4
		BNE	lbCheckUsualExitButton
		LDY	vEnemyPlace
		LDA	(vC),Y
		AND	#$EF ; 'Ô'
		CMP	#lbHighButton|Modifier_06
		BNE	lbCheckUsualExitButton
		LDA	#1
		STA	vfLevel4ExitOpened
		STA	vfMirrorPresent
		JMP	loc_7FBCF
; ---------------------------------------------------------------------------

lbCheckUsualExitButton:			; ...
		LDA	(vC),Y
		AND	#$EF ; 'Ô'
		CMP	#lbHighButton|Modifier_03
		BNE	loc_7FBC4
		LDA	#0
		STA	v54
		STA	vfExternalRoomId
		LDA	#3
		STA	vEnemyPlace
		JSR	GetBitsForPlace
		BNE	loc_7FBC4
		LDA	#1
		STA	vfMirrorExitOpened

loc_7FBC4:				; ...
		LDY	vPushedButtonPlace
		LDA	(vC),Y
		AND	#$E0 ; '‡'
		CMP	#lbSpace|Modifier_03
		BNE	locret_7FC01

loc_7FBCF:				; ...
		LDA	vfExitOpened
		BNE	locret_7FC01
		LDA	vfExitDoorCharLoad
		BNE	loc_7FBEF
		LDX	#seExitOpened
		LDA	#$FF
		JSR	PlaySound_Wrapper ; X -	sound id

loc_7FBE0:				; ...
		LDA	#$20 ; ' '
		STA	vLevelStatusText
		LDA	#0
		STA	vLevelStatusTimer+1
		LDA	#$32 ; '2'
		STA	vLevelStatusTimer

loc_7FBEF:				; ...
		LDA	#$22 ; '"'
		STA	vDrawExitDoorLine
		STA	vfExitOpened
		LDA	vfExitDoorCharLoad
		BEQ	locret_7FC01
		LDA	#2
		STA	vfExitDoorAnimation

locret_7FC01:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_7FC02:				; ...
		LDA	vPressedButtonAction
		CMP	#4
		BEQ	lbCheckExitButton
		LDA	vFallingPlateCheckPlace
		CMP	#$FF
		BEQ	loc_7FC1D
		LDA	vFallingPlateRoom
		CMP	vRoomId
		BEQ	loc_7FC1D
		JSR	PlayPushedButtonSound
		JMP	loc_7FDD2
; ---------------------------------------------------------------------------

loc_7FC1D:				; ...
		JSR	SwitchPRGBank_2
		LDA	vPressedButtonAction
		BNE	lbPressedButtonBlockRender
		STA	vfAllowRenderAnimBg
		JMP	loc_2B51F
; End of function sub_7FA91


; =============== S U B	R O U T	I N E =======================================


PlayPushedButtonSound:			; ...
		JSR	SwitchPRGBank_6
		LDX	#seCuttersClap
		LDA	#0
		STA	v54
		LDA	#$FF
		JSR	j__PlaySound
		LDA	#$FF
		LDX	#seMetallClank
		JMP	j__PlaySound
; End of function PlayPushedButtonSound

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_4AC83

loc_7FC3F:				; ...
		JSR	PlayPushedButtonSound
		JMP	SwitchPRGBank_4
; END OF FUNCTION CHUNK	FOR sub_4AC83
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7FA91

lbPressedButtonBlockRender:		; ...
		JSR	SwitchPRGBank_2
		JSR	GetPushedButtonTilesPtr
		JSR	GetLevelBlockCharsDataPtr ; A -	block id
					; returns: vLevelBlocksCharsPtr	- pointer
		JSR	CheckAndLoadLevelBlockChars ; vLevelBlocksCharsPtr - pointer to	block chars
					; Pointers and begin tile id will be placed at $0300 area
					; $75 -	first tile id at PPU char
		JSR	SwitchPRGBank_5
		LDX	#$15
		LDY	#0
		STY	v54

loc_7FC5A:				; ...
		LDA	(v21),Y
		BEQ	loc_7FC65
		CMP	#$FF
		BEQ	loc_7FC65
		CLC
		ADC	vBlockPPUTileId

loc_7FC65:				; ...
		STA	vPasswordChars+5,Y
		INY
		DEX
		BNE	loc_7FC5A
		JSR	PlayPushedButtonSound
		LDA	vEnemyPlace
		CMP	#9
		BEQ	loc_7FCBE
		CMP	#19
		BEQ	loc_7FCBE
		CMP	#29
		BEQ	loc_7FCBE
		INC	vEnemyPlace
		JSR	GetSavedRoomDataPtr
		JSR	GetBlockFromEnemyPlace
		BNE	loc_7FCBE
		JSR	GetBitsForPlace
		BEQ	loc_7FC94
		DEC	vEnemyPlace
		JMP	loc_7FCBE
; ---------------------------------------------------------------------------

loc_7FC94:				; ...
		DEC	vEnemyPlace
		LDA	#$90 ; 'ê'
		STA	byte_499
		JSR	RenderBlockJoints
		LDX	#$B
		LDY	#0
		JSR	DumpBlockData	; Y - offset of	block data
					; X - offset to	write
		LDX	#$12
		JSR	DumpBlockData	; Y - offset of	block data
					; X - offset to	write
		LDA	vCornerBlockId
		CMP	#lbBrickWall
		BNE	loc_7FCBE
		LDY	#$F
		LDA	vLevelType
		BEQ	loc_7FCBA
		LDY	#1

loc_7FCBA:				; ...
		TYA
		STA	word_77F

loc_7FCBE:				; ...
		LDA	vPushedButtonPlace
		STA	vEnemyPlace
		JSR	GetSavedRoomDataPtr
		LDA	#0
		STA	v54
		JSR	GetPointerForDebrisPlate ; Output: ($21, $22) -	pointer	to debris block	description
		LDA	vEnemyPlace
		CMP	#9
		BEQ	loc_7FCFB

loc_7FCD5:
		CMP	#$13
		BEQ	loc_7FCFB
		CMP	#$1D
		BEQ	loc_7FCFB
		JSR	GetBlockFromEnemyPlace
		CMP	#lbLowButton
		BEQ	loc_7FCFB
		INC	vEnemyPlace
		JSR	GetBlockFromEnemyPlace
		BEQ	loc_7FCFB
		CMP	#lbBrokenPlate
		BNE	loc_7FCF5
		JSR	GetBitsForPlace
		BNE	loc_7FCFB

loc_7FCF5:				; ...
		DEC	vEnemyPlace
		JSR	sub_7C686

loc_7FCFB:				; ...
		LDA	vPushedButtonPlace
		STA	vEnemyPlace
		JSR	GetSavedRoomDataPtr
		LDA	#0
		STA	vfVertBlock
		STA	v5F
		LDA	#7
		STA	vRoomGuardPlace
		ASL	A
		STA	vtmp_4C0
		LDA	vPushedButtonPlace
		STA	vEnemyPlace
		DEC	vEnemyPlace
		LDA	vPushedButtonPlace
		BEQ	loc_7FD2A
		CMP	#10
		BEQ	loc_7FD2A
		CMP	#20
		BNE	loc_7FD33

loc_7FD2A:				; ...
		JSR	IncrementPlaceFloor
		INC	vEnemyPlace
		JSR	GetLeftBorderBlocksPtr

loc_7FD33:				; ...
		LDX	#lbPressedButton
		LDA	byte_4C8
		CMP	#lbLowButton
		BEQ	loc_7FD3E
		LDX	#lbPlate

loc_7FD3E:				; ...
		STX	vPreviousBlockId
		LDA	vPreviousBlockId
		PHA
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBrokenPlate
		BNE	loc_7FD51
		JSR	GetBitsForPlace
		BNE	loc_7FD5C

loc_7FD51:				; ...
		JSR	GetBlockIdFromPtr ; Y -	place in room
		BEQ	loc_7FD5C
		JSR	GetBlockFromEnemyPlace
		JSR	sub_7FE0B

loc_7FD5C:				; ...
		PLA
		STA	vPreviousBlockId
		JSR	GetSavedRoomDataPtr
		LDA	vPushedButtonPlace
		STA	vEnemyPlace
		INC	vEnemyPlace
		JSR	GetBlockFromEnemyPlace
		CMP	#lbBrickWall
		BNE	loc_7FD79
		JSR	SwitchPRGBank_2
		JSR	sub_2A8EE

loc_7FD79:				; ...
		JSR	SwitchPRGBank_6
		LDA	#0
		STA	v54
		LDA	vPushedButtonPlace
		STA	vEnemyPlace
		CMP	#9
		BEQ	loc_7FDC7
		CMP	#19
		BEQ	loc_7FDC7
		CMP	#29
		BEQ	loc_7FDC7
		JSR	GetSavedRoomDataPtr
		LDA	#$B
		STA	vRoomGuardPlace
		LDA	#$12
		STA	vtmp_4C0
		INC	vEnemyPlace
		JSR	GetBlockFromEnemyPlace
		BEQ	loc_7FDC7
		CMP	#lbDoor
		BEQ	loc_7FDB0
		JSR	GetBitsForPlace
		BNE	loc_7FDC7

loc_7FDB0:				; ...
		LDA	vPreviousBlockId
		ASL	A
		STA	vPrevBlockIdDataOffset
		LDY	vEnemyPlace
		DEC	vEnemyPlace
		JSR	GetBlockIdFromPtr ; Y -	place in room
		BEQ	loc_7FDC7
		STA	vPreviousBlockId
		JSR	sub_7FE0E

loc_7FDC7:				; ...
		LDA	vPushedButtonPlace
		STA	vEnemyPlace
		LDA	#6
		JSR	SwitchPRGBank

loc_7FDD2:				; ...
		LDA	vFallingPlateCheckPlace
		CMP	#$FF
		BEQ	loc_7FDE1
		STA	vEnemyPlace
		LDA	vFallingPlateRoom
		STA	vRoomId

loc_7FDE1:				; ...
		LDA	vPressedButtonBlockId
		CMP	#lbSpace|Modifier_03
		BEQ	loc_7FDEB
		JSR	FindDoorLink

loc_7FDEB:				; ...
		LDA	vFallingPlateCheckPlace
		CMP	#$FF
		BEQ	loc_7FDFA
		LDA	#$FF
		STA	vFallingPlateCheckPlace
		JMP	GetSavedRoomDataPtr
; ---------------------------------------------------------------------------

loc_7FDFA:				; ...
		JSR	SwitchPRGBank_4
		JMP	loc_4B382
; END OF FUNCTION CHUNK	FOR sub_7FA91

; =============== S U B	R O U T	I N E =======================================

; Y - offset of	block data
; X - offset to	write

DumpBlockData:				; ...
		LDA	vptrBlockData
		STA	v21
		LDA	vptrBlockData+1
		STA	v22
		JMP	DumpBlockDataFromPtr
; End of function DumpBlockData


; =============== S U B	R O U T	I N E =======================================


sub_7FE0B:				; ...
		ASL	A
		STA	vPrevBlockIdDataOffset
; End of function sub_7FE0B


; =============== S U B	R O U T	I N E =======================================


sub_7FE0E:				; ...
		JSR	LoadHorzJointForBlock ;	Input:
					;     vPrevBlockIdDataOffset - 2x(block	id)
					;
					; Output:
					;     A	- first	tile id	of loaded joint	chars
		LDA	byte_6D9
		BEQ	loc_7FE17
		RTS
; ---------------------------------------------------------------------------

loc_7FE17:				; ...
		LDX	vRoomGuardPlace
		LDY	#0
		JSR	DumpBlockData	; Y - offset of	block data
					; X - offset to	write
		LDX	vtmp_4C0
		JMP	DumpBlockData	; Y - offset of	block data
; End of function sub_7FE0E		; X - offset to	write


; =============== S U B	R O U T	I N E =======================================


ValidateObjectLeftX:			; ...
		LDY	#0
		LDA	vEnemy.nAction
		CMP	#oaRunningTurnBack
		BEQ	lbValidateObjectRightXExit
		LDA	vEnemy.nDirection
		BEQ	lbValidateObjectRightXExit
		LDA	vEnemy.XPos+1
		BNE	lbValidateObjectRightXExit
		LDA	vEnemy.XPos
		CMP	#$32 ; '2'
		BCS	lbValidateObjectRightXExit
		LDY	#1

lbValidateObjectRightXExit:		; ...
		CPY	#0
		RTS
; End of function ValidateObjectLeftX


; =============== S U B	R O U T	I N E =======================================


ValidateObjectRightX:			; ...
		LDA	vEnemy.nAction
		CMP	#oaRunningTurnBack
		BEQ	loc_7FE64
		LDA	vEnemy.nDirection
		BNE	loc_7FE64
		LDY	#0
		LDA	vEnemy.XPos+1
		BEQ	loc_7FE64
		CMP	#$F0 ; ''
		BCS	loc_7FE64
		LDA	vEnemy.XPos
		CMP	#$30 ; '0'
		BCC	loc_7FE64
		LDY	#1

loc_7FE64:				; ...
		CPY	#0
; End of function ValidateObjectRightX

; START	OF FUNCTION CHUNK FOR CheckJoyAndAttack

locret_7FE66:				; ...
		RTS
; END OF FUNCTION CHUNK	FOR CheckJoyAndAttack

; =============== S U B	R O U T	I N E =======================================


CheckJoyAndAttack:			; ...

; FUNCTION CHUNK AT FE66 SIZE 00000001 BYTES

		LDA	vJoypad1
		AND	#Btn_A
		BEQ	locret_7FE66
		LDA	vEnemy.nAction
		CMP	#oaMoveSword1
		BEQ	locret_7FE66
		LDA	#oaAttack1
		JMP	SetupPrinceAction
; End of function CheckJoyAndAttack


; =============== S U B	R O U T	I N E =======================================


CheckJoyAndReflectAttack:		; ...
		LDA	vJoypad1
		AND	#Btn_B
		BEQ	locret_7FE66
		JSR	CheckObjectFightPose
		CMP	#$AB ; '´'
		BNE	locret_7FE66
		LDA	#oaReflectAttack2
		JMP	SetupPrinceAction
; End of function CheckJoyAndReflectAttack


; =============== S U B	R O U T	I N E =======================================


HideObjects_xE:				; ...
		LDA	#$E
		JSR	FindEnemyById_Wrapper ;	$A - enemy id to search
					; return: Y=0 -	not found, Y=1 - found,	X - slot offset
		STX	vwEnemySlotOffset
		LDY	#3

lbHideObjects_xELoop:			; ...
		LDA	vEnemy.nEnemyID,X
		AND	#$7F ; ''
		STA	vEnemy.nEnemyID,X
		JSR	GetNextSlot	; X - current slot offset
		DEY
		BNE	lbHideObjects_xELoop
		RTS
; End of function HideObjects_xE


; =============== S U B	R O U T	I N E =======================================


RenderPalaceBackground:			; ...
		LDA	vLevelType
		BNE	lbDoRenderPalaceBackground
		RTS
; ---------------------------------------------------------------------------

lbDoRenderPalaceBackground:		; ...
		JSR	SwitchPRGBank_4
		JSR	DoRenderPalaceBgWithPPUPtr
		LDY	#<(PPU_PAGE_1_LINE_0)
		LDX	#>(PPU_PAGE_1_LINE_0)

_DoRenderPalaceBgWithPPUPtr:		; ...
		STY	word_47+1
		STX	word_47
		LDA	#8

lbDoRenderPalaceBackgroundLoop:		; ...
		PHA
		LDA	#<(pPalaceChars_Base)
		STA	vLevelBlocksCharsPtr
		LDA	#>(pPalaceChars_Base)
		STA	vLevelBlocksCharsPtr+1
		JSR	CorrectCharsPointerForLevel5
		LDA	#<(pPalace_SpaceBgLine)
		STA	vptrBlockData
		LDA	#>(pPalace_SpaceBgLine)
		STA	vptrBlockData+1
		JSR	CopyPtr47To17
		JSR	__DrawBaseRoomBlocks
		LDA	word_47+1
		CLC
		ADC	#4
		STA	word_47+1
		PLA
		SEC
		SBC	#1
		BNE	lbDoRenderPalaceBackgroundLoop
		JMP	SwitchPRGBank_4
; End of function RenderPalaceBackground

; ---------------------------------------------------------------------------
pJointCharsBits_2D:.WORD PTR_8890|BANK_0 ; ...
		.WORD PTR_88A0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_2B:.WORD PTR_8870|BANK_0 ; ...
		.WORD PTR_8880|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_29:.WORD PTR_8630|BANK_0 ; ...
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_28:.WORD PTR_81A0|BANK_0 ; ...
		.WORD PTR_81B0|BANK_0
		.WORD PTR_81C0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_63:.WORD PTR_83D0|BANK_0 ; ...
		.WORD PTR_83E0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_2C:.WORD PTR_83F0|BANK_0 ; ...
		.WORD PTR_8400|BANK_0
		.WORD PTR_8410|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_2A:.WORD PTR_8840|BANK_0 ; ...
		.WORD PTR_8850|BANK_0
		.WORD PTR_8860|BANK_0
		.BYTE $FF
		.BYTE $FF
; ---------------------------------------------------------------------------

NMI:					; ...
		PHA
		TXA
		PHA
		TYA
		PHA
		LDA	#0
		STA	PPU_CR_2	; PPU Control Register #2 (W)
					;
					; D7-D5: Full Background Colour	(when D0 == 1)
					; D7-D5: Colour	Intensity (when	D0 == 0)
					;    D4: Sprite	Visibility
					;    D3: Background Visibility
					;    D2: Sprite	Clipping
					;    D1: Background Clipping
					;    D0: Display Type
		LDA	vfSkipNMI
		BEQ	lbDoNMI
		JMP	lbSkipNMI
; ---------------------------------------------------------------------------

lbDoNMI:				; ...
		JSR	UnsafeSwitchPRGBank_2
		JSR	RenderMenuScreen
		LDA	vfSpriteAnimation
		BEQ	lbSwitchPRGBank_4
		LDA	#5
		STA	pBankList+5
		JSR	SetupSprite0AndDMA

lbSwitchPRGBank_4:			; ...
		LDA	#4
		STA	pBankList+4
		LDA	vfSetupLevelPalette
		BNE	lbNMISetupPalette
		LDA	vfRenderPrinceTiles
		BEQ	lbRenderAnimBg
		JSR	WritePrinceTiles
		JMP	lbNMISetupPalette
; ---------------------------------------------------------------------------

lbRenderAnimBg:				; ...
		LDA	vfAllowRenderAnimBg
		BEQ	lbRenderPushButtonAnim
		JSR	RenderAnimBgBuffer
		JMP	loc_7FFBA
; ---------------------------------------------------------------------------

lbRenderPushButtonAnim:			; ...
		LDA	vfAllowRenderPushButtonAnim
		BEQ	lbRenderPushButton
		JSR	PushButtonAnim
		JMP	lbNMISetupPalette
; ---------------------------------------------------------------------------

lbRenderPushButton:			; ...
		LDA	vfPushedButton
		BEQ	lbCheckAndRenderExitDoorAnim
		JSR	PushButton
		JMP	lbNMISetupPalette
; ---------------------------------------------------------------------------

lbCheckAndRenderExitDoorAnim:		; ...
		LDA	vfExitDoorAnimation
		BEQ	loc_7FF83
		LDA	vRoomId
		CMP	#2
		BNE	lbDoRenderExitDoorAnim
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BNE	loc_7FF83

lbDoRenderExitDoorAnim:			; ...
		JSR	UnsafeSwitchPRGBank_2
		JSR	OpeningExitDoor
		JMP	lbNMISetupPalette
; ---------------------------------------------------------------------------

loc_7FF83:				; ...
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BEQ	loc_7FF96
		LDA	byte_762
		BNE	loc_7FF93
		JSR	UnsafeSwitchPRGBank_2
		JSR	DrawPasswordDigits

loc_7FF93:				; ...
		JMP	lbNMISetupPalette
; ---------------------------------------------------------------------------

loc_7FF96:				; ...
		JSR	ShowLevelStatus
		JSR	RenderSpaceBlockAfterFallenPlate
		LDA	#5
		STA	pBankList+5
		LDA	vUpdateHealthBar
		BEQ	lbNMISetupPalette
		JSR	DrawGuardHealthBar
		DEC	vUpdateHealthBar

lbNMISetupPalette:			; ...
		JSR	UnsafeSwitchPRGBank_2
		JSR	SetupPalette
		LDA	#5
		STA	pBankList+5
		JSR	HandleBgColor

loc_7FFBA:				; ...
		JSR	UnsafeSwitchPRGBank_2
		JSR	PatchDoorJoint
		LDA	#0
		STA	vfRenderPrinceTiles
		LDA	#5
		STA	pBankList+5
		JSR	UpdatePPUStatus
		JSR	ReadJoypad

lbSkipNMI:				; ...
		LDA	#6
		STA	pBankList+6
		STA	vfNMISwitchedToPRG6
		JSR	SoundEffectEngine
		LDA	vfFreezeMusic
		BNE	lbSkipSoundEngine
		LDA	vfEnableMusic
		BNE	lbSkipSoundEngine
		JSR	SoundEngine

lbSkipSoundEngine:			; ...
		JSR	_RevertPRGBank
		PLA
		TAY
		PLA
		TAX
		PLA

IRQ:					; ...
		RTI
; ---------------------------------------------------------------------------
pBankList:	.BYTE	0,  1,	2,  3,	4,  5,	6,  7 ;	...
		.BYTE 0
		.BYTE $FF
.PAD $FFFA,$FF
		.WORD NMI
		.WORD RESET
		.WORD IRQ
