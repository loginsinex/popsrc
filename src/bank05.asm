
.base $8000

		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
; ---------------------------------------------------------------------------

LoadPointerToEncodedLibrary:		; ...
		LDA	#0
		STA	vtmpCounter4F
		LDA	#<(pPrinceEncPtrCharsLibrary)
		STA	vCharsDataPtr	; pointer to pointer of	chars data or pointer to chars data
		LDA	#>(pPrinceEncPtrCharsLibrary)
		STA	vCharsDataPtr+1	; pointer to pointer of	chars data or pointer to chars data
		LDA	vSpriteOffsetX
		BEQ	lbGetEncodedPointerOffset
		LDA	#<(pBgEncPtrCharsLibrary)
		STA	vCharsDataPtr	; pointer to pointer of	chars data or pointer to chars data
		LDA	#>(pBgEncPtrCharsLibrary)
		STA	vCharsDataPtr+1	; pointer to pointer of	chars data or pointer to chars data

lbGetEncodedPointerOffset:		; ...
		LDA	vCharsDataId,X
		ASL	A
		TAY
		LDA	vCharsDataId,X
		CMP	#$80 ; '€'
		BCC	lbLoadEncodedDataPtr
		INC	vCharsDataPtr+1	; pointer to pointer of	chars data or pointer to chars data

lbLoadEncodedDataPtr:			; ...
		LDA	(vCharsDataPtr),Y ; pointer to pointer of chars	data or	pointer	to chars data
		STA	vEncodedPointerDataPtr
		INY
		LDA	(vCharsDataPtr),Y ; pointer to pointer of chars	data or	pointer	to chars data
		STA	vEncodedPointerDataPtr+1
		RTS

; =============== S U B	R O U T	I N E =======================================


sub_58038:				; ...
		LDA	vfDisableGuardAnimation
		BNE	locret_5805B
		LDA	vfSword
		CMP	#2
		BEQ	locret_5805B
		LDX	#0
		LDA	vEnemy.XPos+1
		CMP	vEnemy.XPos+$F
		BNE	loc_58054
		LDA	vEnemy.XPos
		CMP	vEnemy.XPos+$E

loc_58054:				; ...
		BCC	loc_58058
		LDX	#$FF

loc_58058:				; ...
		STX	vEnemy.nDirection+$E

locret_5805B:				; ...
		RTS
; End of function sub_58038


; =============== S U B	R O U T	I N E =======================================


HandleBgColor:				; ...
		LDA	vChangedBgTimer
		BEQ	lbHandleBgColorExit
		CMP	#1
		BEQ	lbResetCounterAndSetBlackBg
		LDA	vPPU_CR_2
		CMP	#$18
		BNE	lbSetBlackBg
		DEC	vChangedBgTimer
		JSR	InitPPUBgPalPtr
		LDX	#$16
		LDA	vfTypeOfBgColor
		CMP	#3
		BNE	lbCheckCol2
		LDX	#$33 ; '3'

lbCheckCol2:				; ...
		CMP	#2
		BNE	lbCheckCol1
		LDX	#$36 ; '6'

lbCheckCol1:				; ...
		CMP	#1
		BNE	lbSetCol
		LDX	#$37 ; '7'

lbSetCol:				; ...
		STX	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		JMP	lbHandleBgColorExit
; ---------------------------------------------------------------------------

lbResetCounterAndSetBlackBg:		; ...
		DEC	vChangedBgTimer

lbSetBlackBg:				; ...
		JSR	InitPPUBgPalPtr
		LDA	#$F
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.

lbHandleBgColorExit:			; ...
		LDA	#0
		STA	vfSpriteAnimation
		RTS
; End of function HandleBgColor


; =============== S U B	R O U T	I N E =======================================


InitPPUBgPalPtr:			; ...
		LDA	#>(PPU_PALETTE_BG)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_PALETTE_BG)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		RTS
; End of function InitPPUBgPalPtr

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR SetupWavingPlateObject

loc_580A9:				; ...
		LDY	#0
		STY	vCurrentFallingPlateHandlingOffset

loc_580AE:				; ...
		LDA	#0
		STA	v54
		LDA	vCurrentFallingPlateHandlingOffset
		ASL	A
		ASL	A
		TAX
		LDA	vFallingPlateData.fplPlace,X
		CMP	#$FF
		BNE	loc_580C8

loc_580BF:				; ...
		INC	vCurrentFallingPlateHandlingOffset
		INY
		CPY	#3
		BNE	loc_580AE
		RTS
; ---------------------------------------------------------------------------

loc_580C8:				; ...
		STA	vEnemyPlace
		STY	byte_4B3
		STX	vRoomGuardPlace
		JSR	loc_7C1BC
		LDA	#>(pActionBrokenPlate)
		STA	vEnemy.ptrAction+1,X
		LDA	#<(pActionBrokenPlate)
		STA	vEnemy.ptrAction,X
		STX	vtmp_4C0
		LDX	vRoomGuardPlace
		LDA	vRoomId
		CMP	vFallingPlateData.fplRoom,X
		BEQ	loc_580F3
		LDX	vtmp_4C0
		LDA	#2
		STA	vEnemy.XPos+1,X

loc_580F3:				; ...
		LDY	byte_4B3
		JMP	loc_580BF
; END OF FUNCTION CHUNK	FOR SetupWavingPlateObject

; =============== S U B	R O U T	I N E =======================================


WaitHealthBarScanline:			; ...
		LDA	vfAllowUpdateHealthBarTiles
		BEQ	lbWaitHealthBarScanlineExit

lbWaitSprite0HitPass1:			; ...
		LDA	PPU_SR		; PPU Status Register (R)
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
		AND	#$40 ; '@'
		BNE	lbWaitSprite0HitPass1

lbWaitSprite0HitPass2:			; ...
		LDA	PPU_SR		; PPU Status Register (R)
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
		AND	#$40 ; '@'
		BEQ	lbWaitSprite0HitPass2
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BNE	lbSkipShowBg
		LDA	#8
		STA	PPU_CR_2	; PPU Control Register #2 (W)
					;
					; D7-D5: Full Background Colour	(when D0 == 1)
					; D7-D5: Colour	Intensity (when	D0 == 0)
					;    D4: Sprite	Visibility
					;    D3: Background Visibility
					;    D2: Sprite	Clipping
					;    D1: Background Clipping
					;    D0: Display Type

lbSkipShowBg:				; ...
		LDA	#$88 ; 'ˆ'
		STA	PPU_CR_1	; PPU Control Register #1 (W)
					;
					;    D7: Execute NMI on	VBlank
					;    D6: PPU Master/Slave Selection
					;    D5: Sprite	Size
					;    D4: Background Pattern Table Address
					;    D3: Sprite	Pattern	Table Address
					;    D2: PPU Address Increment
					; D1-D0: Name Table Address
		LDA	vScreenScroll
		STA	VRAM_AR_1	; VRAM Address Register	#1 (W2)
					;
					; Commonly used	used to	"pan/scroll" the screen	(sprites
					; excluded) horizontally and vertically. However, there
					; is no	actual panning hardware	inside the NES.	This
					; register controls VRAM addressing lines.
		LDA	#0
		STA	VRAM_AR_1	; VRAM Address Register	#1 (W2)
					;
					; Commonly used	used to	"pan/scroll" the screen	(sprites
					; excluded) horizontally and vertically. However, there
					; is no	actual panning hardware	inside the NES.	This
					; register controls VRAM addressing lines.

lbWaitHealthBarScanlineExit:		; ...
		RTS
; End of function WaitHealthBarScanline


; =============== S U B	R O U T	I N E =======================================


HandleFalling:				; ...
		LDA	vRoomHorzScroll
		STA	vPPU_ScrollHorz
		LDA	vfFalling
		BNE	lbSetupFalling
		JSR	sub_587E9

lbSetupFalling:				; ...
		LDA	vEnemy.nUnknown1
		CMP	#4
		BNE	lbFallingExit
		LDX	#1
		LDA	vfGotMagicPotion
		BEQ	lbSetupHorzSpeed
		LDA	#$12
		STA	vFallingVertSpeed
		JMP	lbMoveFallingHorz
; ---------------------------------------------------------------------------

lbSetupHorzSpeed:			; ...
		LDX	vFallingHorzSpeed
		INC	vFallingHeight

lbMoveFallingHorz:			; ...
		STX	vwTmp_17
		LDA	vEnemy.nDirection
		BNE	lbFallingTrajectory
		LDA	vwTmp_17
		JSR	DecrementFallingHorz
		JMP	lbIncrementFallingVert
; ---------------------------------------------------------------------------

lbFallingTrajectory:			; ...
		LDA	vwTmp_17
		JSR	IncrementFallingHorz

lbIncrementFallingVert:			; ...
		LDA	vFallingIncrement
		CLC
		ADC	vFallingDelta
		STA	vFallingIncrement
		LDA	vFallingVertSpeed
		ADC	#0
		ORA	#2
		CMP	#$1C
		BCS	lbFallingSpeedLimited
		STA	vFallingVertSpeed

lbFallingSpeedLimited:			; ...
		TAX
		LDA	vfGotMagicPotion
		BEQ	loc_58183
		LDX	#4

loc_58183:				; ...
		STX	vwTmp_17
		LDA	vEnemy.YPos
		CLC
		ADC	vwTmp_17
		STA	vEnemy.YPos

lbFallingExit:				; ...
		RTS
; End of function HandleFalling

; ---------------------------------------------------------------------------
pHealthBarTiles:.BYTE 0, 0, 0, 0, 0, 0,	0, 0; bitsTileLo ; ...
		.BYTE 0, 3, $F,	$3F, $7F, $3F, $F, 3; bitsTileHi
		.BYTE 0, 0, 0, 0, 0, 0,	0, 0; bitsTileLo
		.BYTE 0, 3, $D,	$31, $41, $31, $D, 3; bitsTileHi
		.BYTE 0, $C0, $F0, $FC,	$FE, $FC, $F0, $C0; bitsTileLo
		.BYTE 0, 0, 0, 0, 0, 0,	0, 0; bitsTileHi
		.BYTE 0, $C0, $B0, $8C,	$82, $8C, $B0, $C0; bitsTileLo
		.BYTE 0, 0, 0, 0, 0, 0,	0, 0; bitsTileHi
		.BYTE 0, 0, 0, 0, 0, 0,	0, 0; bitsTileLo
		.BYTE $FF, 0, 0, 0, 0, 0, 0, 0;	bitsTileHi

; =============== S U B	R O U T	I N E =======================================


InitHealthBar:				; ...
		LDX	#$FF
		STX	byte_6D9
		LDA	#0
		STA	vMaximumHealth
		LDA	vLevelNumber
		CMP	#Level_14
		BNE	loc_581F5
		LDA	vRoomId
		CMP	#4
		BEQ	loc_58217

loc_581F5:				; ...
		LDA	#>(PPU_CG_PAGE_1_TILE_FF)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_CG_PAGE_1_TILE_FF)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDX	#$10
		LDY	#$40 ; '@'
		JSR	LoadHealthBarTile
		LDA	#>(PPU_CG_PAGE_0_TILE_FB)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_CG_PAGE_0_TILE_FB)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDX	#$50 ; 'P'
		LDY	#0
		JSR	LoadHealthBarTile

loc_58217:				; ...
		LDA	#>(PPU_PAGE_0_LINE_26)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_PAGE_0_LINE_26)
		JSR	SetHealthBarAttr
		LDA	#>(PPU_PAGE_1_LINE_26)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_PAGE_1_LINE_26)
		JSR	SetHealthBarAttr
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BNE	loc_58241
		LDA	#>(PPU_ATTR_PAGE_0_LINES_24_25_26_27)
		STA	vwTmp_17
		JSR	sub_582A3
		LDA	#>(PPU_ATTR_PAGE_1_LINES_24_25_26_27)
		STA	vwTmp_17
		JSR	sub_582A3
		JSR	DrawGuardHealthBar

loc_58241:				; ...
		LDA	#>(PPU_PAGE_0_LINE_27)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_PAGE_0_LINE_27)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#0
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		LDA	#0
		STA	vPrinceHiPPUSwitch
		STA	vSpriteOffsetId
		STA	vfSkipNMI
		STA	vLevelCoreRoutineId
		STA	vPPU_CR_2
		RTS
; End of function InitHealthBar


; =============== S U B	R O U T	I N E =======================================


DrawGuardHealthBar:			; ...
		LDA	#>(PPU_PAGE_0_LINE_27+2)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_PAGE_0_LINE_27+2)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		JSR	DrawHealthBar
		LDA	vfMirrorPresent
		BNE	lbExitDrawGuardBar
		LDA	vfGuardPresent
		BEQ	lbExitDrawGuardBar
		LDA	#>(PPU_PAGE_0_LINE_27+$1E)
		STA	vwTmp_17
		LDA	#<(PPU_PAGE_0_LINE_27+$1E)
		STA	vwTmp_17+1
		LDX	#0

lbDrawGuardBarLoop:			; ...
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
		LDY	#$FB ; 'û'
		TXA
		CMP	vCurrentGuardHealth
		BCC	lbDrawGuardBarChar
		LDY	#0

lbDrawGuardBarChar:			; ...
		STY	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		DEC	vwTmp_17+1
		INX
		TXA
		CMP	vCurrentMaximumGuardHealth
		BNE	lbDrawGuardBarLoop

lbExitDrawGuardBar:			; ...
		RTS
; End of function DrawGuardHealthBar


; =============== S U B	R O U T	I N E =======================================


sub_582A3:				; ...
		LDA	#$F0 ; 'ð'
		STA	vwTmp_17+1
		LDX	#8

loc_582A9:				; ...
		JSR	SetupPPUPtr	; $17,$18 - pointer to be setup
		LDA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		LDA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		AND	#$F
		ORA	#$F0 ; 'ð'
		TAY
		JSR	SetupPPUPtr	; $17,$18 - pointer to be setup
		STY	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INC	vwTmp_17+1
		DEX
		BNE	loc_582A9
		RTS
; End of function sub_582A3


; =============== S U B	R O U T	I N E =======================================


DrawHealthBar:				; ...
		LDX	#0

loc_582C5:				; ...
		LDY	#$FD ; 'ý'
		TXA
		CMP	vCurrentHealth
		BCC	loc_582CF
		LDY	#$FE ; 'þ'

loc_582CF:				; ...
		STY	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INX
		CPX	vCurrentMaximumHealth
		BNE	loc_582C5
		RTS
; End of function DrawHealthBar


; =============== S U B	R O U T	I N E =======================================

; $17,$18 - pointer to be setup

SetupPPUPtr:				; ...
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
		RTS
; End of function SetupPPUPtr


; =============== S U B	R O U T	I N E =======================================


ZeroMemoryAndSetupPPUPatternTable:	; ...
		LDA	vfEnableMusic
		PHA
		LDA	#0
		TAY

loc_582EB:				; ...
		STA	vSprite,Y
		STA	vCharsDataId,Y
		STA	vBlockCharsData,Y
		STA	vDrawExitDoorLine,Y
		STA	vObjectsMasks,Y
		DEY
		BNE	loc_582EB
		LDY	#$C

loc_582FF:				; ...
		STA	v0,Y
		INY
		BNE	loc_582FF
		LDY	#$7F ; ''

loc_58307:				; ...
		STA	vptrLeftBorderBlocksPtr,Y
		DEY
		BNE	loc_58307
		STA	vptrLeftBorderBlocksPtr
		PLA
		STA	vfEnableMusic
		LDA	#$90 ; ''
		STA	vPPU_CR_1
		STA	PPU_CR_1	; PPU Control Register #1 (W)
					;
					;    D7: Execute NMI on	VBlank
					;    D6: PPU Master/Slave Selection
					;    D5: Sprite	Size
					;    D4: Background Pattern Table Address
					;    D3: Sprite	Pattern	Table Address
					;    D2: PPU Address Increment
					; D1-D0: Name Table Address
		RTS
; End of function ZeroMemoryAndSetupPPUPatternTable


; =============== S U B	R O U T	I N E =======================================


EraseRoomAttr:				; ...
		LDA	vwTmp_17
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#$C0 ; 'À'
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#0
		LDY	#7

loc_5832A:				; ...
		LDX	#8

loc_5832C:				; ...
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		DEX
		BNE	loc_5832C
		DEY
		BNE	loc_5832A
		RTS
; End of function EraseRoomAttr


; =============== S U B	R O U T	I N E =======================================


ErasePPUCharGen:			; ...
		LDA	#0

lbErasePPUCharGenLoopLine:		; ...
		LDX	#0

lbErasePPUCharGenLoopChar:		; ...
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		DEX
		BNE	lbErasePPUCharGenLoopChar
		DEY
		BNE	lbErasePPUCharGenLoopLine
		RTS
; End of function ErasePPUCharGen


; =============== S U B	R O U T	I N E =======================================


ReadJoypad:				; ...
		LDA	vfFreezePrince
		BNE	lbExitReadJoy
		LDA	vJoypad1
		STA	vResidualJoypad1
		LDX	#0
		STX	vJoypad1
		STX	vTmp_40b
		LDA	vfEnableInput	; Used when game starts
		BEQ	lbExitReadJoy
		LDA	#1
		STA	Joypad_1	; Joypad #1 (RW)
					;
					; READING:
					;    D4: Zapper	Trigger
					;    D3: Zapper	Sprite Detection
					;    D0: Joypad	Data
					; ----------------------------------------------
					; WRITING:
					; Joypad Strobe	(W)
					;
					;    D0: Joypad	Strobe
					; ----------------------------------------------
					; WRITING:
					; Expansion Port Latch (W)
					;    D0: Expansion Port	Method
					;
		TXA
		STA	Joypad_1	; Joypad #1 (RW)
					;
					; READING:
					;    D4: Zapper	Trigger
					;    D3: Zapper	Sprite Detection
					;    D0: Joypad	Data
					; ----------------------------------------------
					; WRITING:
					; Joypad Strobe	(W)
					;
					;    D0: Joypad	Strobe
					; ----------------------------------------------
					; WRITING:
					; Expansion Port Latch (W)
					;    D0: Expansion Port	Method
					;
		LDY	#8

lbReadJoypadLoop:			; ...
		LDA	Joypad_1	; Joypad #1 (RW)
					;
					; READING:
					;    D4: Zapper	Trigger
					;    D3: Zapper	Sprite Detection
					;    D0: Joypad	Data
					; ----------------------------------------------
					; WRITING:
					; Joypad Strobe	(W)
					;
					;    D0: Joypad	Strobe
					; ----------------------------------------------
					; WRITING:
					; Expansion Port Latch (W)
					;    D0: Expansion Port	Method
					;
		LSR	A
		ROL	vJoypad1
		LDA	Joypad_2	; Joypad #2/SOFTCLK (RW)
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
		LSR	A
		ROL	vTmp_40b
		DEY
		BNE	lbReadJoypadLoop
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BEQ	lbExitReadJoy
		LDA	vRoomId
		CMP	#2
		BNE	lbExitReadJoy
		LDA	vJoypad1
		AND	#Btn_Right|Btn_Left
		STA	vJoypad1

lbExitReadJoy:				; ...
		RTS
; End of function ReadJoypad


; =============== S U B	R O U T	I N E =======================================


CheckAndFlashScreenGrabSwordMode:	; ...
		LDA	vEnemy.nUnknown1
		CMP	#$B
		BEQ	locret_5839E
		LDA	vEnemy.nAction
		CMP	#oaGrabTheSword
		BNE	locret_5839E
		LDA	#2
		STA	vChangedBgTimer

locret_5839E:				; ...
		RTS
; End of function CheckAndFlashScreenGrabSwordMode

; ---------------------------------------------------------------------------

loc_5839F:				; ...
		LDA	vEnemy.nUnknown1
		BNE	loc_583A7
		STA	vEnemy.nAction

loc_583A7:				; ...
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BEQ	loc_583D4
		LDA	vRoomId
		CMP	#2
		BNE	locret_583C0
		LDA	vEnemy.nDirection
		BEQ	loc_583C1
		LDA	vJoypad1
		AND	#Btn_Left
		BEQ	loc_583C8
		STA	vfJoypadRight

locret_583C0:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_583C1:				; ...
		LDA	#0
		STA	vfJoypadRight
		JMP	loc_583CF
; ---------------------------------------------------------------------------

loc_583C8:				; ...
		LDA	vJoypad1
		AND	#Btn_Right|Btn_Left
		BEQ	locret_583C0

loc_583CF:				; ...
		LDA	#Btn_Left
		STA	vfJoypadLeft
		RTS
; ---------------------------------------------------------------------------

loc_583D4:				; ...
		LDA	vEnemy.nDirection
		CMP	#$FF
		BNE	loc_583EC
		LDA	vJoypad1
		AND	#Btn_Right
		STA	vfJoypadLeft
		LDA	vJoypad1
		AND	#Btn_Left
		STA	vfJoypadRight
		JMP	loc_583FA
; ---------------------------------------------------------------------------

loc_583EC:				; ...
		LDA	vJoypad1
		AND	#Btn_Right
		STA	vfJoypadRight
		LDA	vJoypad1
		AND	#Btn_Left
		STA	vfJoypadLeft

loc_583FA:				; ...
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BNE	loc_58419
		LDA	vJoypad1
		AND	#Btn_Up
		STA	vfJoypadUp
		LDA	vJoypad1
		AND	#Btn_Down
		STA	vfJoypadDown
		LDA	vfJoypadDown
		ORA	vfJoypadUp
		STA	vJoypadUpDown
		LDA	vfJoypadLeft
		ORA	vfJoypadRight
		STA	vfJoypadLeftRight

loc_58419:				; ...
		LDA	vJoypad1
		AND	#Btn_A
		BEQ	loc_58424
		LDA	vfJoypadLeft
		BNE	locret_5842A

loc_58424:				; ...
		STA	vfJumpingLeft
		STA	vfMenuButtonPressed ; Prevents to blinking option while	joy button pressed

locret_5842A:				; ...
		RTS
; ---------------------------------------------------------------------------
pActionProcLibrary:.WORD 0		; ...
		.WORD sbr_Action_SetNewAction ;	2 bytes
		.WORD sbr_Action_TurnObject
		.WORD sbr_Action_03
		.WORD sbr_Action_04
		.WORD sbr_Action_05_MoveHorz
		.WORD sbr_Action_Move_Y	; 1 byte
		.WORD sbr_Action_07_SetupUnknown1 ; 1 byte
		.WORD sbr_Action_08_SetFallingHorzSpeed	; 2 bytes?
		.WORD sbr_Action_09_RollbackAction
		.WORD sbr_Action_0A_RestartLevel
		.WORD sbr_Action_0B_ResetFallingCounters
		.WORD sbr_Action_0C_BrokenPlateHandle
		.WORD sbr_Action_0D_PlayMusic
		.WORD sbr_Action_0E_PlayActionSound
		.WORD sbr_Action_0F_LevelFinished

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_IncrementActionPtr:			; ...
		JMP	IncrementActionPtr
; End of function j_IncrementActionPtr

; ---------------------------------------------------------------------------

sbr_Action_SetNewAction:		; ...
		LDA	(v21),Y		; 2 bytes
		TAX
		JSR	j_IncrementActionPtr
		LDA	(v21),Y
		STA	v22
		STX	v21
		JMP	lbDecrementObjectActionPtr
; ---------------------------------------------------------------------------

sbr_Action_TurnObject:			; ...
		LDX	vCurrentObjectOffset
		LDA	vEnemy.nDirection,X
		EOR	#$FF
		STA	vEnemy.nDirection,X

lbDecrementObjectActionPtr:		; ...
		DEC	v21
		LDA	v21
		CMP	#$FF
		BNE	lbsbr_Action_02_Exit
		DEC	v22

lbsbr_Action_02_Exit:			; ...
		RTS
; ---------------------------------------------------------------------------

sbr_Action_04:				; ...
		LDA	#0
		STA	byte_4CB
		STA	v405
		LDA	vEnemy.YPos
		CMP	#$98 ; '˜'
		BCC	loc_58484
		STA	byte_4CB

loc_58484:				; ...
		JMP	lbDecrementObjectActionPtr
; ---------------------------------------------------------------------------

sbr_Action_05_MoveHorz:			; ...
		LDA	(v21),Y
		ASL	A
		STA	vwTmp_17
		LDX	vCurrentObjectOffset
		LDA	vEnemy.nAction,X
		CMP	#oaShortJumpUp1
		BEQ	loc_58499
		CMP	#oaTurnBack1
		BNE	loc_5849D

loc_58499:				; ...
		LDA	(v21),Y
		STA	vwTmp_17

loc_5849D:				; ...
		LDA	vEnemy.nUnknown1,X
		CMP	#2
		BNE	loc_584A6
		ASL	vwTmp_17

loc_584A6:				; ...
		LDA	vEnemy.nDirection,X
		BEQ	loc_5850B
		LDA	vwTmp_17
		CMP	#$7F ; ''
		BCC	loc_584FB
		LDA	vwTmp_17
		EOR	#$FF
		STA	vwTmp_17
		JSR	MoveObjectLeft
		JMP	locret_5850A

; =============== S U B	R O U T	I N E =======================================


MoveObjectLeft:				; ...
		STY	vSaveY
		CPX	#0
		BNE	lbMoveObjectLeftSkipValidation
		JSR	ValidateObjectLeftX
		BNE	lbMoveObjectLeftExit

lbMoveObjectLeftSkipValidation:		; ...
		LDA	vEnemy.XPos,X
		SEC
		SBC	vwTmp_17
		STA	vEnemy.XPos,X
		LDA	vEnemy.XPos+1,X
		SBC	#0
		STA	vEnemy.XPos+1,X

lbMoveObjectLeftExit:			; ...
		LDY	vSaveY
		RTS
; End of function MoveObjectLeft


; =============== S U B	R O U T	I N E =======================================


MoveObjectRight:			; ...
		STY	vSaveY
		CPX	#0
		BNE	lbMoveObjectX_SkipValidation
		JSR	ValidateObjectRightX
		BNE	lbMoveObjectXExit

lbMoveObjectX_SkipValidation:		; ...
		LDA	vEnemy.XPos,X
		CLC
		ADC	vwTmp_17
		STA	vEnemy.XPos,X
		LDA	vEnemy.XPos+1,X
		ADC	#0
		STA	vEnemy.XPos+1,X

lbMoveObjectXExit:			; ...
		LDY	vSaveY
		RTS
; End of function MoveObjectRight

; ---------------------------------------------------------------------------

loc_584FB:				; ...
		JSR	MoveObjectRight
		CPX	#0
		BNE	locret_5850A
		LDA	vEnemy.XPos,X
		AND	#$3F ; '?'
		STA	byte_6F5

locret_5850A:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_5850B:				; ...
		LDA	vwTmp_17
		CMP	#$7F ; ''
		BCS	lbMoveObjectLeft
		JSR	MoveObjectLeft
		CPX	#0
		BNE	locret_58552
		LDA	vEnemy.XPos,X
		AND	#$3F ; '?'
		STA	byte_6F5
		JMP	locret_58552
; ---------------------------------------------------------------------------

lbMoveObjectLeft:			; ...
		LDA	vwTmp_17
		EOR	#$FF
		STA	vwTmp_17
		JMP	MoveObjectRight
; ---------------------------------------------------------------------------

sbr_Action_Move_Y:			; ...
		LDA	(v21),Y		; 1 byte
		STA	vwTmp_17
		LDX	vCurrentObjectOffset
		CMP	#$7F ; ''
		BCC	loc_58549
		LDA	vwTmp_17
		EOR	#$FF
		CLC
		ADC	#1
		STA	vwTmp_17
		LDA	vEnemy.YPos,X
		SEC
		SBC	vwTmp_17
		STA	vEnemy.YPos,X
		RTS
; ---------------------------------------------------------------------------

loc_58549:				; ...
		LDA	vEnemy.YPos,X
		CLC
		ADC	vwTmp_17
		STA	vEnemy.YPos,X

locret_58552:				; ...
		RTS
; ---------------------------------------------------------------------------

sbr_Action_07_SetupUnknown1:		; ...
		LDX	vCurrentObjectOffset ; 1 byte
		LDA	(v21),Y
		STA	vEnemy.nUnknown1,X
		RTS
; ---------------------------------------------------------------------------

sbr_Action_08_SetFallingHorzSpeed:	; ...
		LDA	(v21),Y		; 2 bytes?
		ASL	A
		STA	vFallingHorzSpeed
		JSR	j_IncrementActionPtr
		LDA	#$68 ; 'h'
		STA	vFallingDelta
		LDA	#$C8 ; 'È'
		STA	vFallingIncrement
		LDA	#8
		STA	vFallingVertSpeed
		RTS

; =============== S U B	R O U T	I N E =======================================


InjureBgColSetup:			; ...
		LDA	#8
		STA	vChangedBgTimer
		LDA	vCurrentHealth
		SEC
		SBC	#1
		BCC	lbInjureBgColSetupExit
		STA	vCurrentHealth
		LDA	#1
		STA	vUpdateHealthBar

lbInjureBgColSetupExit:			; ...
		RTS
; End of function InjureBgColSetup

; ---------------------------------------------------------------------------

sbr_Action_0C_BrokenPlateHandle:	; ...
		LDA	vfDemoPlay
		BNE	loc_58594
		LDA	#0
		STA	vfMenuButtonPressed ; Prevents to blinking option while	joy button pressed

loc_58594:				; ...
		LDA	vBrokenPlateWaveTimer
		CMP	#1
		BEQ	loc_585AC
		INC	vBrokenPlateWaveTimer
		CMP	#0
		BEQ	loc_585AC
		LDA	#0
		STA	vBrokenPlateWave
		LDA	#$FF
		STA	byte_6D9

loc_585AC:				; ...
		LDA	vFallingHeight
		CMP	#$FA ; 'ú'
		BCS	loc_585BA
		CMP	#3
		BCC	loc_585BA
		JSR	InjureBgColSetup

loc_585BA:				; ...
		JSR	j_lbDecrementObjectActionPtr

sbr_Action_0B_ResetFallingCounters:	; ...
		LDA	#0
		STA	vFallingHeight
		STA	byte_4CB
		STA	v405
		RTS
; ---------------------------------------------------------------------------

sbr_Action_0A_RestartLevel:		; ...
		LDA	vActiveObjectCounter
		BNE	loc_585ED
		LDA	#1
		STA	vfWaitRestartLevel
		LDA	#0
		STA	vfTypeOfBgColor
		LDA	vLevelNumber
		BNE	loc_585E0
		LDA	#0
		STA	vfSword

loc_585E0:				; ...
		LDA	vfSword
		CMP	#2
		BNE	loc_585F2
		DEC	vfSword
		JMP	loc_585F2
; ---------------------------------------------------------------------------

loc_585ED:				; ...
		LDA	#1
		STA	vfDisableGuardAnimation

loc_585F2:				; ...
		JMP	j_lbDecrementObjectActionPtr
; ---------------------------------------------------------------------------

sbr_Action_09_RollbackAction:		; ...
		JMP	j_lbDecrementObjectActionPtr
; ---------------------------------------------------------------------------

sbr_Action_03:				; ...
		LDA	#0
		STA	v405
		STA	byte_4CB
		LDA	vEnemy.nPose
		CMP	#pPrincePose93_offset -	pPrincePosesLo
		BCC	loc_5860F
		LDA	#0
		STA	byte_6C5
		JMP	j_lbDecrementObjectActionPtr
; ---------------------------------------------------------------------------

loc_5860F:				; ...
		LDA	vEnemy.YPos
		CMP	#$41 ; 'A'
		BCS	j_lbDecrementObjectActionPtr
		LDA	#1
		STA	v405

j_lbDecrementObjectActionPtr:		; ...
		JMP	lbDecrementObjectActionPtr

; =============== S U B	R O U T	I N E =======================================


CheckRoomGoingOut:			; ...

; FUNCTION CHUNK AT CB1D SIZE 00000025 BYTES
; FUNCTION CHUNK AT CBB3 SIZE 00000094 BYTES
; FUNCTION CHUNK AT D015 SIZE 0000004C BYTES
; FUNCTION CHUNK AT D0B5 SIZE 0000005D BYTES

		LDA	vfWaitRestartLevel
		BEQ	lbCheckRoomGoingOut
		RTS
; ---------------------------------------------------------------------------

lbCheckRoomGoingOut:			; ...
		LDA	vEnemy.nAction
		CMP	#oaSittingDown
		BEQ	loc_58630
		LDA	vEnemy.nDirection
		BNE	loc_58662

loc_58630:				; ...
		LDA	vEnemy.nAction
		CMP	#oaSlipDown
		BEQ	loc_5868B
		LDY	#$50 ; 'P'
		LDX	#roomLeft
		LDA	vEnemy.XPos
		CLC
		ADC	vPrinceXOffset
		LDA	vEnemy.XPos+1
		ADC	#0
		BEQ	loc_58654
		CMP	#1
		BEQ	loc_58662
		CMP	#$F0 ; 'ð'
		BCS	loc_5865F
		JMP	loc_58662
; ---------------------------------------------------------------------------

loc_58654:				; ...
		LDA	vEnemy.XPos
		CLC
		ADC	vPrinceXOffset
		CMP	#$1A
		BCS	loc_58662

loc_5865F:				; ...
		JMP	lbCheckForLevel12LeftExit
; ---------------------------------------------------------------------------

loc_58662:				; ...
		LDA	vEnemy.nDirection
		BEQ	loc_5868B
		LDA	vEnemy.XPos
		SEC
		SBC	vPrinceXOffset
		LDA	vEnemy.XPos+1
		SBC	#0
		BEQ	loc_5868B
		CMP	#$F0 ; 'ð'
		BCS	loc_5868B
		LDY	#8
		LDX	#roomRight
		LDA	vEnemy.XPos
		SEC
		SBC	vPrinceXOffset
		CMP	#$40 ; '@'
		BCC	loc_5868B
		JMP	lbGoingRight
; ---------------------------------------------------------------------------

loc_5868B:				; ...
		LDY	vRoomHorzScroll
		LDX	#$30 ; '0'
		LDA	vEnemy.nPose
		CMP	#pPrincePose6A_offset -	pPrincePosesLo
		BEQ	loc_586A7
		LDA	vEnemy.nAction
		CMP	#oaStartFalling1
		BEQ	loc_586A7
		CMP	#oaStartFalling3
		BEQ	loc_586A7
		CMP	#oaBeginFalling
		BEQ	loc_586A7
		LDX	#$18

loc_586A7:				; ...
		STX	vwTmp_17
		LDX	#roomBottom
		LDA	vEnemy.YPos
		CLC
		ADC	vwTmp_17
		LDA	vEnemy.YPos+1
		ADC	#0
		BEQ	loc_586BB
		JMP	lbCheckForLevel6BottomExit
; ---------------------------------------------------------------------------

loc_586BB:				; ...
		LDY	vRoomHorzScroll
		LDX	#roomTop
		LDA	vEnemy.YPos+1
		BEQ	loc_586C8
		CMP	#$7F ; ''
		BCS	loc_586CF

loc_586C8:				; ...
		LDA	vEnemy.YPos
		CMP	#$1E
		BCS	lbIncrementBlocksCharsPtr

loc_586CF:				; ...
		JMP	lbSetupNeighborRoomAndSwitch ; Input X:
					;      * 0 - Left room
					;      * 1 - Right room
					;      * 2 - Top room
					;      * 3 - Bottom room
; ---------------------------------------------------------------------------

lbIncrementBlocksCharsPtr:		; ...
		LDA	vfLevelFinished
		BEQ	lblbIncrementBlocksCharsPtrExit
		LDA	vLevelBlocksCharsPtr
		CLC
		ADC	#2
		STA	vLevelBlocksCharsPtr
		LDA	vLevelBlocksCharsPtr+1
		ADC	#0
		STA	vLevelBlocksCharsPtr+1
		CMP	#2
		BCS	lbIncrementAndStartLevel
		LDA	vJoypad1
		BNE	lbIncrementAndStartLevel

lblbIncrementBlocksCharsPtrExit:	; ...
		RTS
; ---------------------------------------------------------------------------
		LDA	#1
		STA	vfSword

lbIncrementAndStartLevel:		; ...
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BNE	lbSetupNewLevel
		LDA	vLevelNumber
		CLC
		ADC	#1
		CMP	#14
		BCC	lbSetNewLevelValue
		LDA	#0

lbSetNewLevelValue:			; ...
		STA	vLevelNumber

lbSetupNewLevel:			; ...
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
		STA	vPPU_CR_2
		JMP	lbInitAndStartLevel
; End of function CheckRoomGoingOut

; ---------------------------------------------------------------------------
		RTS

; =============== S U B	R O U T	I N E =======================================

; Y=False - Prince
; Y=True - Guard

InjureObject:				; ...
		LDA	#$A
		STA	vChangedBgTimer
		LDX	#1
		CPY	#0
		BNE	lbInjureObject
		LDX	#0

lbInjureObject:				; ...
		LDA	vCurrentHealth,X
		SEC
		SBC	#1
		BCC	lbInjureObjectExit
		STA	vCurrentHealth,X
		CMP	#1
		LDA	#1
		STA	vUpdateHealthBar

lbInjureObjectExit:			; ...
		RTS
; End of function InjureObject


; =============== S U B	R O U T	I N E =======================================

; A - action id
; Y - slot offset

_SetupEnemyAction:			; ...
		CMP	vEnemy.nAction,Y
		BEQ	lbSetupEnemyActionExit
		STA	vEnemy.nAction,Y
		ASL	A
		TAX
		LDA	pActionsLibrary,X
		STA	vEnemy.ptrAction,Y
		LDA	pActionsLibrary+1,X
		STA	vEnemy.ptrAction+1,Y
		LDA	#$FF
		STA	vEnemy.nUnknown1,Y

lbSetupEnemyActionExit:			; ...
		RTS
; End of function _SetupEnemyAction


; =============== S U B	R O U T	I N E =======================================


InitLevelVars:				; ...
		LDA	#0
		STA	byte_360
		STA	vfLockJoypad
		STA	vfExitDoorAnimation
		STA	vfPrinceWithinRoomHeight
		STA	vCurrentFallingPlateHandlingOffset
		STA	vDoorPlacedCounter
		STA	byte_4F8
		STA	byte_4C9
		STA	byte_4CA
		STA	byte_4F9
		STA	vfLoadedPalaceTiles
		STA	vfTypeOfBgColor
		STA	vMirrorImageActionOffset
		STA	vfGuardPresent
		STA	vMirrorImageActionTimer
		STA	vfExitDoorCharLoad
		STA	vDrawExitDoorLine
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDY	#8
		STY	vfPaused
		JSR	ErasePPUCharGen
		LDA	#>(PPU_CG_PAGE_1_TILE_00)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_CG_PAGE_1_TILE_00)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDY	#1
		JSR	ErasePPUCharGen
		STA	vfDisableGuardAnimation
		STA	vfPrinceDeath
		STA	vPaletteOffset
		STA	vfWaitRestartLevel
		LDA	#>(PPU_PAGE_0_LINE_0)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_PAGE_0_LINE_0)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDY	#72

lbLoopPPULine:				; ...
		LDX	#32

lbLoopPPUTile:				; ...
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		DEX
		BNE	lbLoopPPUTile
		DEY
		BNE	lbLoopPPULine
		LDA	#$FF
		STA	vBrokenPlateWaveTimer
		STA	byte_6D9
		LDX	#0
		STX	vBrokenPlateWave
		STX	byte_4C4
		STX	vPressedButtonAction
		STX	vfAllowRenderPushButtonAnim
		STX	vNMIAnimBufferCounter
		LDY	#30

lbLoopEraseRAM_100_736_363:		; ...
		STA	vAnimBlockPlaces,X
		STA	vAnimBlock,X
		STA	vNMIAnimBlocksOutputBuffer,X
		INX
		DEY
		BNE	lbLoopEraseRAM_100_736_363
		RTS
; End of function InitLevelVars


; =============== S U B	R O U T	I N E =======================================


sub_587E9:				; ...
		LDA	vRoomHorzScroll
		AND	#$FC ; 'ü'
		CMP	byte_6F5
		BEQ	locret_5884E
		LDA	vEnemy.nAction
		CMP	#oaMoveUp
		BEQ	locret_5884E
		CMP	#oaSlipDown
		BEQ	locret_5884E
		CMP	#oaTurnBack1
		BEQ	locret_5884E
		CMP	#oaShortJumpUp1
		BEQ	locret_5884E
		LDA	vEnemy.nUnknown1
		BEQ	locret_5884E
		LDA	vRoomHorzScroll
		STA	vRoomGuardPlace
		LDX	#8
		LDA	vEnemy.XPos+1
		CMP	#$F0 ; 'ð'
		BCS	locret_5884E
		CMP	#0
		BNE	loc_5882E
		LDA	vEnemy.XPos
		AND	#$FC ; 'ü'
		SEC
		SBC	#$80 ; '€'
		BCC	loc_58830
		CLC
		ADC	#8
		TAX
		CMP	#$50 ; 'P'
		BCC	loc_58830

loc_5882E:				; ...
		LDX	#$50 ; 'P'

loc_58830:				; ...
		STX	vRoomHorzScroll
		LDA	vRoomGuardPlace
		CMP	vRoomHorzScroll
		BEQ	locret_5884E
		BCS	loc_58845
		CLC
		ADC	#4
		CMP	#$50 ; 'P'
		BCS	locret_5884E
		JMP	loc_5884C
; ---------------------------------------------------------------------------

loc_58845:				; ...
		SEC
		SBC	#4
		CMP	#8
		BCC	locret_5884E

loc_5884C:				; ...
		STA	vRoomHorzScroll

locret_5884E:				; ...
		RTS
; End of function sub_587E9


; =============== S U B	R O U T	I N E =======================================


SetupSprite0AndDMA:			; ...
		LDA	#206
		STA	vSprite.sprY
		LDA	#$FF
		STA	vSprite.sprTile
		LDA	#fBehind
		STA	vSprite.sprAttr
		LDA	#246
		STA	vSprite.sprX
		LDA	PPU_SR		; PPU Status Register (R)
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
		LDA	#0
		STA	SPR_RAM_AR	; SPR-RAM Address Register (W)
					;
					; D7-D0: 8-bit address in SPR-RAM to access via	$2004.
		LDA	#2
		STA	SPRITE_DMAR	; Sprite DMA Register (W)
					;
					; Transfers 256	bytes of memory	into SPR-RAM. The address
					; read from is $100*N, where N is the value written.
		RTS
; End of function SetupSprite0AndDMA


; =============== S U B	R O U T	I N E =======================================


CheckJoyAndJumpForward:			; ...
		LDA	#0
		STA	byte_4F6
		LDA	vJoypad1
		AND	#Btn_A
		BEQ	lbCheckJoyAndJumpForwardExit
		LDA	vfMenuButtonPressed ; Prevents to blinking option while	joy button pressed
		BNE	lbCheckJoyAndJumpForwardExit
		LDA	vEnemy.nUnknown1
		BNE	lbCheckJoyAndJumpForwardExit
		LDA	vEnemy.nPose
		CMP	#pPrincePose01_offset -	pPrincePosesLo
		BNE	lbCheckJoyAndJumpForwardExit
		LDA	vEnemy.nAction
		CMP	#oaBreakWall
		BEQ	lbCheckJoyAndJumpForwardExit
		LDA	#oaJumping1
		STA	vfMenuButtonPressed ; Prevents to blinking option while	joy button pressed
		JMP	SetupPrinceAction
; ---------------------------------------------------------------------------

TurnBack:				; ...
		LDA	vEnemy.nUnknown1
		BNE	lbCheckJoyAndJumpForwardExit
		LDA	vfJoypadRight
		BEQ	lbCheckJoyAndJumpForwardExit
		LDA	#oaTurnBack1
		JMP	SetupPrinceAction
; ---------------------------------------------------------------------------

lbCheckJoyAndJumpForwardExit:		; ...
		RTS
; End of function CheckJoyAndJumpForward


; =============== S U B	R O U T	I N E =======================================


sub_588AC:				; ...
		LDX	#$26 ; '&'
		LDA	vEnemy.nDirection
		BNE	loc_588B5
		LDX	#$20 ; ' '

loc_588B5:				; ...
		STX	word_47
		LDA	vfSword
		CMP	#2
		BEQ	loc_588C9
		LDA	vEnemy.nAction
		CMP	#oaRunningJump
		BNE	loc_588C9
		LDA	#$30 ; '0'
		STA	word_47

loc_588C9:				; ...
		LDA	vEnemy.XPos+1
		CMP	vEnemy.XPos+$F
		BNE	loc_588D7
		LDA	vEnemy.XPos
		CMP	vEnemy.XPos+$E

loc_588D7:				; ...
		BCS	loc_588ED
		LDA	vEnemy.XPos+$E
		SEC
		SBC	vEnemy.XPos
		STA	vwTmp_17
		LDA	vEnemy.XPos+$F
		SBC	vEnemy.XPos+1
		STA	vwTmp_17+1
		JMP	loc_588F0
; ---------------------------------------------------------------------------

loc_588ED:				; ...
		JSR	sub_588FB

loc_588F0:				; ...
		LDA	vwTmp_17+1
		BNE	loc_588F9
		LDA	vwTmp_17
		CMP	word_47
		RTS
; ---------------------------------------------------------------------------

loc_588F9:				; ...
		SEC
		RTS
; End of function sub_588AC


; =============== S U B	R O U T	I N E =======================================


sub_588FB:				; ...
		LDA	vEnemy.XPos
		SEC
		SBC	vEnemy.XPos+$E
		STA	vwTmp_17
		LDA	vEnemy.XPos+1
		SBC	vEnemy.XPos+$F
		STA	vwTmp_17+1
		RTS
; End of function sub_588FB


; =============== S U B	R O U T	I N E =======================================


CheckObjectsDistance:			; ...
		LDA	#$68 ; 'h'
		STA	word_47
		LDA	vEnemy.XPos+1
		CMP	vEnemy.XPos+$F
		BNE	loc_5891F
		LDA	vEnemy.XPos
		CMP	vEnemy.XPos+$E

loc_5891F:				; ...
		BCS	loc_58935
		LDA	vEnemy.XPos+$E
		SEC
		SBC	vEnemy.XPos
		STA	vwTmp_17
		LDA	vEnemy.XPos+$F
		SBC	vEnemy.XPos+1
		STA	vwTmp_17+1
		JMP	loc_58938
; ---------------------------------------------------------------------------

loc_58935:				; ...
		JSR	sub_588FB

loc_58938:				; ...
		LDA	vwTmp_17+1
		BNE	loc_58941
		LDA	vwTmp_17
		CMP	word_47
		RTS
; ---------------------------------------------------------------------------

loc_58941:				; ...
		SEC
		RTS
; End of function CheckObjectsDistance


; =============== S U B	R O U T	I N E =======================================


FightModeBackwardMovements:		; ...
		LDA	vEnemy.nAction
		CMP	#oaMovingForwardInFight1
		BEQ	locret_58966
		CMP	#oaAttack1
		BEQ	locret_58966
		JSR	ValidateObjectRightX
		BNE	loc_58967
		LDA	vfJoypadRight
		BEQ	locret_58966
		JSR	CheckObjectFightPose
		LDA	vJoypad1
		AND	#Btn_A
		BNE	locret_58966
		LDA	#oaMovingBackwardInFight
		JSR	SetupPrinceAction

locret_58966:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_58967:				; ...
		LDA	#oaMovingBackwardInFight
		STA	vEnemy.nAction
		JSR	sub_7D487
		JMP	SetupPrinceX
; End of function FightModeBackwardMovements


; =============== S U B	R O U T	I N E =======================================


FightModeForwardMovements:		; ...
		JSR	sub_588AC
		BCC	locret_5898A
		LDA	vfJoypadLeft
		BEQ	locret_5898A
		JSR	CheckObjectFightPose
		LDA	vEnemy.nAction
		CMP	#oaAttack1
		BEQ	locret_5898A
		LDA	#oaMovingForwardInFight1
		JSR	SetupPrinceAction

locret_5898A:				; ...
		RTS
; End of function FightModeForwardMovements


; =============== S U B	R O U T	I N E =======================================


CheckAndGetOutSword:			; ...
		LDA	vfDisableGuardAnimation
		BNE	lbCheckAndGetOutSwordExit
		CMP	#$F
		LDA	vfSword
		CMP	#1
		BNE	lbCheckAndGetOutSwordExit
		INC	vfSword
		LDA	#oaGetOutSword1
		JSR	_SetupEnemyAction ; A -	action id
					; Y - slot offset
		JSR	sub_7D487

lbCheckAndGetOutSwordExit:		; ...
		RTS
; End of function CheckAndGetOutSword


; =============== S U B	R O U T	I N E =======================================


SwitchPrincePPUPtr:			; ...
		LDA	vPrinceHiPPUSwitch
		EOR	#>(PPU_CG_PAGE_0_TILE_21)
		AND	#2
		CLC
		STA	vPrinceHiPPUSwitch
		STA	vPrincePPUHi
		LDA	#<(PPU_CG_PAGE_0_TILE_01)
		STA	vPrincePPULo
		LDX	#0
		LDY	#0
		STY	v52
		RTS
; End of function SwitchPrincePPUPtr

; ---------------------------------------------------------------------------
pBrokenPlateWaveObjects:SLOT_ENEMY $18, 192, 128, pAnimationBrokenPlateWave_Full, 0, oaNone, 0, 0, 0, 0, 0
		SLOT_ENEMY $E,	192, 128, pAnimationBrokenPlateWave_Full, 0, oaNone, 0, 0, 0, 0, 0
		SLOT_ENEMY $49, 118, 136, pAnimationBrokenPlateWave_02, 0, oaNone, 0, 0, 0, 0, 0
		SLOT_ENEMY $1B, 118, 136, pAnimationBrokenPlateWave_03, 0, oaNone, 0, 0, 0, 0, 0
		.WORD $FFFF

; =============== S U B	R O U T	I N E =======================================

; writes tiles that will hides prince. Like columns, bricks, etc...

LoadBgSpriteTiles:			; ...
		JSR	InitializeBgCharsData
		JSR	DecodeTiles
		LDA	#0
		STA	vRoomGuardPlace
		STA	vtmp_4C0

lbLoadBgSpriteTilesLoop:		; ...
		JSR	DecodeCharsPointer ; if	at least one tile was loaded, vGuardRoomPlace will be resetted
		LDA	vRoomGuardPlace
		CMP	#1
		BEQ	lbLoadBgSpriteTilesExit
		INC	vRoomGuardPlace
		INC	vtmp_4C0
		LDA	vtmp_4C0
		CMP	#6
		BNE	lbSkipResetCounter ; on	six tiles list,	switch mode to skip empty tiles
		LDA	#0
		STA	vfDisallowLoadEmptyTile

lbSkipResetCounter:			; ...
		JSR	IncrementCharsLoopOffset
		JMP	lbLoadBgSpriteTilesLoop
; ---------------------------------------------------------------------------

lbLoadBgSpriteTilesExit:		; ...
		RTS
; End of function LoadBgSpriteTiles

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7D17A

loc_58A26:				; ...
		LDA	vEnemy.nAction
		CMP	#oaSlipDown
		BEQ	locret_58A6E
		LDA	vEnemy.nPose
		CMP	#pPrincePose01_offset -	pPrincePosesLo
		BNE	loc_58A37
		JMP	loc_58AB1
; ---------------------------------------------------------------------------

loc_58A37:				; ...
		LDA	vEnemy.nUnknown1
		BEQ	loc_58A6F
		LDA	vEnemy.nAction
		CMP	#oaTurnBack1
		BEQ	locret_58A6E
		CMP	#oaSlipDown
		BEQ	locret_58A6E
		CMP	#oaShortJumpUp2
		BEQ	locret_58A6E
		CMP	#oaJumpUpAndSwing2
		BEQ	locret_58A6E
		CMP	#oaGrabLedge
		BEQ	locret_58A6E
		CMP	#oaShortJumpUp1
		BEQ	locret_58A6E
		CMP	#oaBreakWall
		BEQ	locret_58A6E
		CMP	#oaStartSteal14
		BEQ	locret_58A6E
		CMP	#oaStartSteal2
		BEQ	locret_58A6E
		CMP	#oaStartSteal4
		BEQ	locret_58A6E
		LDA	vEnemy.nPose
		CMP	#pPrincePose07_offset -	pPrincePosesLo
		BCS	loc_58A6F

locret_58A6E:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_58A6F:				; ...
		LDA	vEnemy.nPose
		CMP	#pPrincePose1E_offset -	pPrincePosesLo
		BCC	loc_58A7D
		CMP	#pPrincePose26_offset -	pPrincePosesLo
		BCS	loc_58A7D
		JMP	loc_58A88
; ---------------------------------------------------------------------------

loc_58A7D:				; ...
		LDA	vEnemy.nAction
		CMP	#oaJumping1
		BEQ	locret_58AB6
		CMP	#oaRunningJump
		BEQ	locret_58AB6

loc_58A88:				; ...
		LDY	#0
		JSR	sub_7D487
		LDA	#$64 ; 'd'
		STA	vfWaitRestartLevel
		STA	vFallingHeight
		STY	vFallingHorzSpeed
		JSR	KillAndSwitchToPRG5
		LDY	#$2C ; ','
		LDA	vEnemy.nDirection
		BNE	loc_58AA4
		LDY	#$24 ; '$'

loc_58AA4:				; ...
		JSR	MovePrinceHorz	; Y - offset to	move
		LDA	#0
		STA	vfTypeOfBgColor
		LDA	#oaDeathFromSpike
		JMP	SetupPrinceAction
; ---------------------------------------------------------------------------

loc_58AB1:				; ...
		LDA	#0
		STA	vEnemy.nUnknown1

locret_58AB6:				; ...
		RTS
; END OF FUNCTION CHUNK	FOR sub_7D17A
; ---------------------------------------------------------------------------

UpdatePPUStatus:			; ...
		LDA	vPPU_CR_1
		STA	PPU_CR_1	; PPU Control Register #1 (W)
					;
					;    D7: Execute NMI on	VBlank
					;    D6: PPU Master/Slave Selection
					;    D5: Sprite	Size
					;    D4: Background Pattern Table Address
					;    D3: Sprite	Pattern	Table Address
					;    D2: PPU Address Increment
					; D1-D0: Name Table Address
		LDA	vPPU_CR_2
		STA	PPU_CR_2	; PPU Control Register #2 (W)
					;
					; D7-D5: Full Background Colour	(when D0 == 1)
					; D7-D5: Colour	Intensity (when	D0 == 0)
					;    D4: Sprite	Visibility
					;    D3: Background Visibility
					;    D2: Sprite	Clipping
					;    D1: Background Clipping
					;    D0: Display Type
		LDA	vPPU_ScrollHorz
		STA	VRAM_AR_1	; VRAM Address Register	#1 (W2)
					;
					; Commonly used	used to	"pan/scroll" the screen	(sprites
					; excluded) horizontally and vertically. However, there
					; is no	actual panning hardware	inside the NES.	This
					; register controls VRAM addressing lines.
		LDA	vPPU_ScrollVert
		STA	VRAM_AR_1	; VRAM Address Register	#1 (W2)
					;
					; Commonly used	used to	"pan/scroll" the screen	(sprites
					; excluded) horizontally and vertically. However, there
					; is no	actual panning hardware	inside the NES.	This
					; register controls VRAM addressing lines.
		RTS
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7F49F

loc_58ACC:				; ...
		LDA	vfJoypadDown
		BNE	locret_58AE8
		LDA	vEnemy.nPose
		CMP	#pPrincePose6D_offset -	pPrincePosesLo
		BNE	locret_58AE8
		LDA	vfDemoPlay
		BNE	loc_58AE3
		LDA	vEnemy.nAction
		CMP	#oaInjureSitDown
		BEQ	locret_58AE8

loc_58AE3:				; ...
		LDA	#oaGetUp
		JMP	SetupPrinceAction
; ---------------------------------------------------------------------------

locret_58AE8:				; ...
		RTS
; END OF FUNCTION CHUNK	FOR sub_7F49F

; =============== S U B	R O U T	I N E =======================================


CheckAndSheatheSword:			; ...
		LDA	vEnemy.nPose,Y
		CMP	#pPrincePose9F_offset1 - pPrincePosesLo
		BNE	locret_58AF5
		LDA	vfDisableGuardAnimation
		BNE	loc_58AF6

locret_58AF5:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_58AF6:				; ...
		CPY	#0
		BNE	loc_58AFF
		LDA	#1
		STA	vfSword

loc_58AFF:				; ...
		LDA	#oaSheatheSwordFast
		JMP	_SetupEnemyAction ; A -	action id
; End of function CheckAndSheatheSword	; Y - slot offset


; =============== S U B	R O U T	I N E =======================================


LevelCoreRoutines:			; ...
		LDA	vLevelCoreRoutineId
		ASL	A
		TAX
		LDA	pLevelCoreRoutines,X
		STA	vwTmp_17
		LDA	pLevelCoreRoutines+1,X
		STA	vwTmp_17+1
		JMP	(vwTmp_17)
; End of function LevelCoreRoutines

; ---------------------------------------------------------------------------
pResidualBlock_05:.BYTE	7
pDungeonPressedLoBtnTiles:.BYTE	$FF, $FF, $FF, 0, 0, 0,	0; nTiles ; ...
		.BYTE $FF, 1, 2, 3, 4, 5, 6; nTiles
		.BYTE 7, 8, 8, 9, $A, $B, 0; nTiles
pResidualBlock_06:.BYTE	7
pPalacePressedLoBtnTiles:.BYTE $FF, $FF, $FF, 0, 0, 0, 0; nTiles ; ...
		.BYTE $FF, 2, 3, 4, 5, 6, 7; nTiles
		.BYTE 8, 9, $A,	$B, $C,	$D, 0; nTiles
pDungeonWallWindow:.BYTE 3		; ...
		.BYTE 0, 0, 0, 1, 2, 3,	4; nTiles
		.BYTE 0, 0, 0, 5, 6, 7,	8; nTiles
		.BYTE 0, 0, 0, 9, $A, 7, $B; nTiles
		.BYTE 0, 0, 0, 9, $A, 7, $B; nTiles
		.BYTE 0, 0, 0, 9, $A, 7, $B; nTiles
		.BYTE 0, 0, 0, 9, $A, 7, $B; nTiles
		.BYTE 0, 0, 0, $C, $D, $E, $F; nTiles
pDungeon_DebrisPlate:.BYTE 7		; ...
		.BYTE 0, 0, 0, 0, 0, 1,	2; nTiles
		.BYTE 0, 3, 4, 5, 6, 7,	8; nTiles
		.BYTE 9, $A, $B, $C, $D, $E, 0;	nTiles
pPalace_OverDoor:.BYTE 0		; ...
		.BYTE 0, 0, 0, 0, 0, 0,	1; nTiles
		.BYTE 0, 0, 0, 0, 2, 3,	4; nTiles
		.BYTE 0, 0, 0, 5, 6, 7,	8; nTiles
		.BYTE 0, 0, 0, 5, 9, $A, 8; nTiles
		.BYTE 0, 0, 0, 5, $B, $C, 8; nTiles
		.BYTE 0, 0, 0, 5, $D, $E, 8; nTiles
		.BYTE 0, 0, 0, 5, $F, $10, 8; nTiles
		.BYTE 0, 0, 0, 5, $11, $12, 8; nTiles
		.BYTE 0, 0, 0, 5, $13, $14, $15; nTiles
		.BYTE 0, 0, 0, 5, $16, $17, 0; nTiles
pDungeon_OverDoor:.BYTE	2		; ...
		.BYTE 0, 0, 0, 1, 0, 0,	0; nTiles
		.BYTE 0, 0, 0, 1, 0, 0,	0; nTiles
		.BYTE 0, 0, 0, 1, 0, 0,	0; nTiles
		.BYTE 0, 0, 0, 1, 0, 0,	0; nTiles
		.BYTE 0, 0, 0, 1, 0, 0,	0; nTiles
		.BYTE 0, 0, 0, 1, 0, 0,	0; nTiles
		.BYTE 0, 0, 0, 1, 0, 0,	0; nTiles
		.BYTE 0, 0, 0, 1, 0, 0,	0; nTiles
pPalace_OneColumnPlate:.BYTE 0		; ...
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, $10, $11, 0, 0, 0; nTiles
		.BYTE 0, 0, $14, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, $17, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, $17, 1, 1, 1, 1; nTiles
		.BYTE 0, 0, $17, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, $1C, 0, 0, 0, 0; nTiles
		.BYTE 0, $1F, $20, $21,	5, 6, 7; nTiles
		.BYTE	 8, $24, $25, $26,  $C,	 $D
pDungeon_DblClmns:.BYTE	0		; ...
		.BYTE 0, 0, 0, 0, 0, 0,	6; nTiles
		.BYTE 0, 0, 0, 0, $2C, $2D, 0; nTiles
		.BYTE 0, $2E, $2F, $30,	$31, $2D, 0; nTiles
		.BYTE 0, $13, $32, $33,	$34, $35, 0; nTiles
		.BYTE 0, $18, $36, $37,	$31, $2D, 0; nTiles
		.BYTE 0, $13, $32, $33,	$34, $35, 0; nTiles
		.BYTE 0, $18, $36, $37,	$31, $2D, 0; nTiles
		.BYTE 0, $13, $38, $30,	$31, $2D, 0; nTiles
		.BYTE 0, $13, $32, $39,	$3A, $3B, 6; nTiles
		.BYTE	 7, $3C, $3D, $3E,  $A,	 $B
pPalace_Door:	.BYTE 0			; ...
		.BYTE 0, 0, 0, 0, 0, 0,	1; nTiles
		.BYTE 0, 0, 0, 0, 2, 3,	4; nTiles
		.BYTE 0, 0, 0, 5, 6, 7,	4; nTiles
		.BYTE 0, 0, 0, 5, 6, 7,	4; nTiles
		.BYTE 0, 0, 0, 5, 6, 7,	4; nTiles
		.BYTE 0, 0, 0, 5, 6, 7,	4; nTiles
		.BYTE 0, 0, 0, 5, 6, 7,	4; nTiles
		.BYTE 0, 0, 0, 5, 6, 8,	4; nTiles
		.BYTE 0, 9, $A,	5, $B, $C, $D; nTiles
		.BYTE	$E,  $F, $10, $11, $12,	$13
pDungeon_Door:	.BYTE 0			; ...
		.BYTE 0, 0, 0, 0, 0, 0,	1; nTiles
		.BYTE 0, 0, 0, 0, 2, 3,	4; nTiles
		.BYTE 0, 0, 0, 5, 6, 7,	4; nTiles
		.BYTE 0, 0, 0, 5, 6, 7,	4; nTiles
		.BYTE 0, 0, 0, 5, 6, 7,	4; nTiles
		.BYTE 0, 0, 0, 5, 6, 7,	4; nTiles
		.BYTE 0, 0, 0, 5, 6, 7,	4; nTiles
		.BYTE 0, 0, 0, 5, 6, 8,	4; nTiles
		.BYTE 0, 9, $A,	$B, $C,	$D, $E;	nTiles
		.BYTE $F, $10, $11, $12, $13, $14, 0; nTiles
pDungeon_Plate:	.BYTE 7			; ...
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 1, 2, 3, 4, 5,	6; nTiles
		.BYTE 7, 8, 8, 9, $A, $B, 0; nTiles
pResidualBlock_04:.BYTE	7
pPressedHiBtnTiles:.BYTE $FF, $FF, $FF,	0, 0, 0, 0; nTiles ; ...
		.BYTE $FF, 1, 2, 3, 4, 5, 6; nTiles
		.BYTE 7, 8, 9, $A, $B, $FF, $FF; nTiles
pPalace_Cutters:.BYTE 2			; ...
		.BYTE 1, 2, 3, 0, 0, 0,	0; nTiles
		.BYTE 3, 4, 0, 0, 0, 0,	0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 5, 5, 5, 5, 5, 5,	5; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 6, 7, 8, 0, 0, 0,	0; nTiles
		.BYTE 9, $A, $B, $C, $D, $E, $F; nTiles
		.BYTE $10, $11,	$12, $13, $14, $15, 0; nTiles
pPalace_Spikes:	.BYTE 7			; ...
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 1, 2, 3, 4, 5,	6; nTiles
		.BYTE 7, 8, 9, $A, $B, $C, 0; nTiles
pPalace_Plate:	.BYTE 7			; ...
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 2, 3, 4, 5, 6,	7; nTiles
		.BYTE 8, 9, $A,	$B, $C,	$D, 0; nTiles
pDungeon_PlateTorch:.BYTE 4		; ...
		.BYTE 0, 0, 0, 0, 0, $3F, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, $40, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 1, 2, 3, 4, 5,	6; nTiles
		.BYTE 7, 8, 8, 9, $A, $B, 0; nTiles
pDungeon_SkeletonPlate:.BYTE 7		; ...
		.BYTE 0, 0, 0, 1, 2, 0,	0; nTiles
		.BYTE 0, 3, 4, 5, 6, 7,	8; nTiles
		.BYTE 9, $A, $B, $C, $D, $E, 0;	nTiles
pPalace_DebrisPlate:.BYTE 7		; ...
		.BYTE 0, 0, 0, 0, 0, 2,	3; nTiles
		.BYTE 4, 5, 6, 7, 8, 9,	$A; nTiles
		.BYTE $B, $C, $D, $E, $F, $10, 0; nTiles
pPalace_PrsBtn:	.BYTE 5			; ...
		.BYTE 0, 0, 0, 1, 1, 1,	1; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 2, 2, 2,	2; nTiles
		.BYTE 0, 3, 4, 5, 6, 7,	8; nTiles
		.BYTE 9, $A, $B, $C, $D, $E, 0;	nTiles
pPalace_LoBtn:	.BYTE 5			; ...
		.BYTE 0, 0, 0, 1, 1, 1,	1; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, $29, 3, 4, 5, 6, 7; nTiles
		.BYTE $2A, $2B,	$2C, $2D, $C, $D, 0; nTiles
pDungeon_PrsBtn:.BYTE 7			; ...
		.BYTE 0, 0, 0, 1, 1, 1,	1; nTiles
		.BYTE 0, 2, 3, 4, 5, 6,	7; nTiles
		.BYTE 8, 9, $A,	$B, $C,	$D, 0; nTiles
pPalace_BigColumnsLo:.BYTE 1		; ...
		.BYTE 0, 0, 0, 0, $1D, $1E, 0; nTiles
		.BYTE 0, $1F, $20, $21,	$22, $23, 0; nTiles
		.BYTE 0, $24, $25, $26,	$27, $28, 0; nTiles
		.BYTE 0, $29, $2A, $2B,	3, 4, 0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE	 0,   1,   2,	0,   3,	  4
pDungeon_BigColumnLo:.BYTE 0		; ...
		.BYTE 0, 0, 0, 0, 0, 0,	$12; nTiles
		.BYTE 0, 0, 0, 0, $19, $1A, 0; nTiles
		.BYTE 0, $1B, $1C, $1D,	$1E, $1F, 0; nTiles
		.BYTE 0, $20, $21, $22,	3, 4, 0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
pResidualLine_00:.BYTE	  0,   1,   2,	 0,   3,   4
pPalace_OverDoorPlate:.BYTE 0		; ...
		.BYTE 0, 0, 0, 0, 0, 0,	1; nTiles
		.BYTE 0, 0, 0, 0, 2, 3,	4; nTiles
		.BYTE 0, 0, 0, 5, 6, 7,	8; nTiles
		.BYTE 0, 0, 0, 5, 9, $A, 8; nTiles
		.BYTE 0, 0, 0, 5, $B, $C, 8; nTiles
		.BYTE 0, 0, 0, 5, $B, $C, 8; nTiles
		.BYTE 0, 0, 0, 5, $B, $C, 8; nTiles
		.BYTE 0, 0, 0, 5, $D, $E, 8; nTiles
		.BYTE 0, $14, $15, 5, $F, $10, $11; nTiles
		.BYTE  $16, $17, $18, $19, $12,	$13
pDungeon_OverDoorPlate:.BYTE 0		; ...
		.BYTE 0, 0, 0, 0, 0, 0,	1; nTiles
		.BYTE 0, 0, 0, 0, 2, 3,	4; nTiles
		.BYTE 0, 0, 0, 5, 6, 7,	8; nTiles
		.BYTE 0, 0, 0, 5, 9, $A, 8; nTiles
		.BYTE 0, 0, 0, 5, $B, $C, 8; nTiles
		.BYTE 0, 0, 0, 5, $B, $C, 8; nTiles
		.BYTE 0, 0, 0, 5, $B, $C, 8; nTiles
		.BYTE 0, 0, 0, 5, $D, $E, 8; nTiles
		.BYTE 0, 0, 0, 5, $F, $10, $11;	nTiles
		.BYTE	 0,   0,   0,	5, $12,	$13
pPalace_BigColumnsHi:.BYTE 0		; ...
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 5, 2, 6, 7, 8,	6; nTiles
		.BYTE 0, 1, 2, 9, $A, $B, 0; nTiles
		.BYTE 0, $C, $D, $E, $F, $10, 0; nTiles
		.BYTE 0, $11, $12, $13,	$14, $15, $16; nTiles
		.BYTE  $17, $18, $19, $1A, $1B,	$1C
pDungeon_BigColumnHi:.BYTE 0		; ...
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 1, 2, 0, 3, 4,	0; nTiles
		.BYTE 0, 1, 2, 5, 6, 7,	0; nTiles
		.BYTE 0, 8, 9, $A, $B, $C, 0; nTiles
		.BYTE 0, $D, $E, $F, $10, $11, $12; nTiles
		.BYTE $13, $14,	$15, $16, $17, $18, 0; nTiles
pDungeon_LoBtn:	.BYTE 8			; ...
		.BYTE 0, 1, 2, 1, 1, 3,	4; nTiles
		.BYTE	 5,   5,   5,	6,   7,	  8
pDungeon_Wall:	.BYTE 0			; ...
		.BYTE 0, 0, 0, 0, 0, 0,	$C; nTiles
		.BYTE 0, 0, 0, 0, $D, $E, $F; nTiles
		.BYTE $10, $11,	$10, $10, $F, $12, $F; nTiles
		.BYTE $13, $14,	$15, $13, $F, $16, $17;	nTiles
		.BYTE $18, $19,	$18, $1A, $17, $1B, $12; nTiles
		.BYTE $1C, $1C,	$1C, $1D, $1E, $F, $16;	nTiles
		.BYTE $1C, $1C,	$1C, $1D, $1F, $17, $1B; nTiles
		.BYTE $20, $21,	$21, $22, $23, $24, $F;	nTiles
		.BYTE $14, $13,	$13, $13, $F, $25, $26;	nTiles
		.BYTE $27, $28,	$28, $28, $29, $2A, 0; nTiles
pPalace_TorchPlate:.BYTE 4		; ...
		.BYTE 0, 0, 0, 0, 0, $27, 0; nTiles
		.BYTE 0, 0, 0, 1, 1, $28, 1; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, $29, 3, 4, 5, 6, 7; nTiles
		.BYTE	 8,   9,  $A,  $B,  $C,	 $D
pPalace_DblClmns:.BYTE 0		; ...
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, $E, $F, 0; nTiles
		.BYTE 0, 0, $10, $11, $12, $13,	0; nTiles
		.BYTE 0, 0, $14, 0, $15, $16, 0; nTiles
		.BYTE 0, 0, $17, 0, $15, $16, 0; nTiles
		.BYTE 0, 0, $17, 1, $18, $19, 1; nTiles
		.BYTE 0, 0, $17, 0, $1A, $1B, 0; nTiles
		.BYTE 0, 0, $1C, 0, $1D, $1E, 0; nTiles
		.BYTE 0, $1F, $20, $21,	$22, $23, 7; nTiles
		.BYTE 8, $24, $25, $26,	$C, $D,	0; nTiles
pPalace_SkeletonPlate:.BYTE 5		; ...
		.BYTE 0, 0, 0, 1, 1, 1,	1; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 2, 3, 0,	0; nTiles
		.BYTE 0, 4, 5, 6, 7, 8,	9; nTiles
		.BYTE $A, $B, $C, $D, $E, $F, 0; nTiles
pPalace_Wall:	.BYTE 1			; ...
		.BYTE 0, 0, 0, 0, 0, 0,	1; nTiles
		.BYTE 1, 1, 2, 1, 3, 2,	1; nTiles
		.BYTE 1, 1, 2, 1, 3, 4,	5; nTiles
		.BYTE 6, 7, 7, 6, 8, 1,	3; nTiles
		.BYTE 9, $A, $B, $C, 1,	1, 3; nTiles
		.BYTE 9, $A, $B, $C, 1,	$D, $E;	nTiles
		.BYTE $F, $10, $10, $11, $12, 3, 3; nTiles
		.BYTE $13, $13,	$13, $C, 3, 3, $14; nTiles
		.BYTE $13, $13,	$13, $C, $14, $15, 0; nTiles
pResidualBlock_02:.BYTE	1
		.BYTE 0, 0, 0, 0, 0, 0,	1; nTiles
		.BYTE 1, 1, 1, 1, 3, 2,	1; nTiles
		.BYTE 1, 1, 1, 1, 3, 4,	5; nTiles
		.BYTE 6, 6, 6, 6, 8, 1,	3; nTiles
		.BYTE $C, 9, $C, $C, 1,	1, 3; nTiles
		.BYTE $C, 9, $C, $C, 1,	$D, $E;	nTiles
		.BYTE $11, $11,	$11, $F, $12, 3, 3; nTiles
		.BYTE $C, $C, 9, $13, 3, 3, $14; nTiles
		.BYTE $C, $C, 9, $13, $14, $15,	0; nTiles
pPalaceLeftArchWithOverDoorPart:.BYTE 2	; ...
		.BYTE 1, 1, 1, 1, 0, 0,	0; nTiles
		.BYTE 2, 2, 2, 2, 0, 0,	0; nTiles
		.BYTE 3, 3, 3, 3, 0, 0,	0; nTiles
		.BYTE $27, 6, 6, $28, 0, 0, 0; nTiles
		.BYTE $29, $2A,	$2B, $25, 0, 0,	0; nTiles
		.BYTE $2C, $2D,	$2B, $C, 0, 0, 0; nTiles
		.BYTE $2E, $2F,	$2B, 0,	0, 0, 0; nTiles
		.BYTE $31, $32,	0, 0, 0, 0, 0; nTiles
pPalaceRightArchWithOverDoorPart:.BYTE 2 ; ...
		.BYTE 1, 1, 1, $26, 0, 0, 0; nTiles
		.BYTE 2, 2, 2, $26, 0, 0, 0; nTiles
		.BYTE 3, 3, 3, $26, 0, 0, 0; nTiles
		.BYTE $22, 6, 6, $26, 0, 0, 0; nTiles
		.BYTE $24, $A, $A, $26,	0, 0, 0; nTiles
		.BYTE $C, $C, $C, $26, 0, 0, 0;	nTiles
		.BYTE 0, 0, 0, $26, 0, 0, 0; nTiles
		.BYTE	 0,   0,   0, $26
pDungeonSpecialWall:.BYTE 0		; ...
		.BYTE 0, 0, 0, 0, 0, 0,	$D; nTiles
		.BYTE 0, 0, 0, 0, $D, $E, $F; nTiles
		.BYTE $10, $11,	$10, $10, $F, $12, $F; nTiles
		.BYTE $13, $14,	$15, $13, $F, $16, $17;	nTiles
		.BYTE $18, $19,	$18, $1A, $17, $1B, $12; nTiles
		.BYTE $2B, $13,	$13, $14, $1E, $F, $16;	nTiles
		.BYTE $13, $13,	$13, $14, $1F, $17, $1B; nTiles
		.BYTE $20, $21,	$21, $22, $23, $12, $F;	nTiles
		.BYTE $14, $13,	$13, $13, $F, $12, $26;	nTiles
		.BYTE  $27, $28, $28, $28, $29,	$2A
pDungeon_ExitDoorLeft:.BYTE 0		; ...
		.BYTE 0, 0, 0, 0, 1, 2,	2; nTiles
		.BYTE 0, 0, 0, 0, 3, 4,	4; nTiles
		.BYTE 0, 0, 0, 0, 5, 0,	0; nTiles
		.BYTE 0, 0, 0, 0, 5, 0,	0; nTiles
		.BYTE 0, 0, 0, 0, 5, 0,	0; nTiles
		.BYTE 0, 0, 0, 0, 5, 0,	0; nTiles
		.BYTE 0, 0, 0, 0, 5, 0,	6; nTiles
		.BYTE 0, 0, 0, 0, 5, 7,	8; nTiles
		.BYTE 0, 9, $A,	9, $A, 9, $A; nTiles
		.BYTE $B, $B, $B, $C, $B, $B, $B; nTiles
pDungeon_ExitDoorRight:.BYTE 0		; ...
		.BYTE 1, 2, 2, 2, 2, 2,	$D; nTiles
		.BYTE 3, 4, 4, 4, 4, 4,	$E; nTiles
		.BYTE 5, 0, 0, 0, 0, 0,	5; nTiles
		.BYTE 5, 0, 0, 0, $F, $10, 5; nTiles
		.BYTE 5, 0, 0, 0, $11, $12, 5; nTiles
		.BYTE 5, 0, 0, $13, $14, $14, 5; nTiles
		.BYTE 5, 0, 6, $15, $16, $16, 5; nTiles
		.BYTE 5, 7, 8, 8, 8, 8,	5; nTiles
		.BYTE 9, $A, 9,	$A, 9, $17, $18; nTiles
		.BYTE $B, $B, $B, $C, $19, $1A,	0; nTiles
pPalaceMirrorPlate:.BYTE 2		; ...
		.BYTE 1, 2, 3, 4, 0, 0,	0; nTiles
		.BYTE 5, 6, 0, 7, 0, 0,	0; nTiles
		.BYTE 8, 0, 0, 7, 0, 0,	0; nTiles
		.BYTE 8, 0, 0, 7, 0, 0,	0; nTiles
		.BYTE 8, 0, 0, 9, 0, 0,	0; nTiles
		.BYTE $A, $B, $C, $D, 0, 0, 0; nTiles
		.BYTE $E, $F, $10, $11,	$12, $13, $12; nTiles
		.BYTE  $14, $15, $16, $17, $18,	$19
pPalace_ExitDoorLeft:.BYTE 0		; ...
		.BYTE 0, 0, 0, 0, 1, 2,	2; nTiles
		.BYTE 0, 0, 0, 0, 3, 0,	0; nTiles
		.BYTE 0, 0, 0, 0, 3, 0,	0; nTiles
		.BYTE 0, 0, 0, 0, 3, 0,	0; nTiles
		.BYTE 0, 0, 0, 0, 3, 0,	0; nTiles
		.BYTE 0, 0, 0, 4, 3, 0,	0; nTiles
		.BYTE 0, 0, 0, 0, 3, 0,	5; nTiles
		.BYTE 0, 0, 0, 0, 3, 6,	7; nTiles
		.BYTE 0, 8, 9, $A, $B, $A, $B; nTiles
		.BYTE $C, $D, $E, $F, $E, $D, $E; nTiles
pPalace_ExitDoorRight:.BYTE 0		; ...
		.BYTE 1, 2, 2, 2, 2, 2,	$10; nTiles
		.BYTE 3, 0, 0, 0, 0, 0,	3; nTiles
		.BYTE 3, 0, 0, 0, 0, 0,	3; nTiles
		.BYTE 3, 0, 0, 0, $11, $12, 3; nTiles
		.BYTE 3, 0, 0, 0, $13, $13, 3; nTiles
		.BYTE 3, 0, 0, $14, $15, $15, 3; nTiles
		.BYTE 3, 0, 5, $16, $16, $16, 3; nTiles
		.BYTE 3, 6, 7, 7, 7, 7,	3; nTiles
		.BYTE $B, $A, $B, $A, $B, $17, $18; nTiles
		.BYTE $E, $D, $E, $F, $19, $1A,	0; nTiles
pDungeon_Cutters:.BYTE 2		; ...
		.BYTE 1, 2, 3, 0, 0, 0,	0; nTiles
		.BYTE 3, 4, 0, 0, 0, 0,	0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 5, 6, 7, 0, 0, 0,	0; nTiles
		.BYTE 8, 9, $A,	$B, $C,	$D, $E;	nTiles
		.BYTE $F, $10, $10, $11, $12, $13, 0; nTiles
pPalace_BigArchRight:.BYTE 2		; ...
		.BYTE 1, 1, 1, 1, 0, 0,	0; nTiles
		.BYTE 2, 2, 2, 2, 0, 0,	0; nTiles
		.BYTE 6, $D, $E, 3, 0, 0, 0; nTiles
		.BYTE $A, $F, $10, $11,	0, 0, 0; nTiles
		.BYTE $A, $A, $A, $12, 0, 0, 0;	nTiles
		.BYTE $C, $C, $C, $C, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
pPalace_SmallArch:.BYTE	2		; ...
		.BYTE 1, 1, 1, 1, 0, 0,	0; nTiles
		.BYTE 2, 2, 2, 2, 0, 0,	0; nTiles
		.BYTE 3, 3, 3, 3, 0, 0,	0; nTiles
		.BYTE $22, 6, 6, $23, 0, 0, 0; nTiles
		.BYTE $24, $A, $A, $25,	0, 0, 0; nTiles
		.BYTE $C, $C, $C, $C, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
pPalace_BigArchLeft:.BYTE 2		; ...
		.BYTE 1, 1, 1, 1, 0, 0,	0; nTiles
		.BYTE 2, 2, 2, 2, 0, 0,	0; nTiles
		.BYTE 3, 4, 5, 6, 0, 0,	0; nTiles
		.BYTE 7, 8, 9, $A, 0, 0, 0; nTiles
		.BYTE $B, $A, $A, $A, 0, 0, 0; nTiles
		.BYTE $C, $C, $C, $C, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
pPalace_ArchColumnPart:.BYTE 2		; ...
		.BYTE 1, 1, 1, 1, 0, 0,	0; nTiles
		.BYTE 2, $13, $14, 2, 0, 0, 0; nTiles
		.BYTE 3, $15, $16, 3, 0, 0, 0; nTiles
		.BYTE 3, $15, $16, 3, 0, 0, 0; nTiles
		.BYTE $17, $15,	$16, $18, 0, 0,	0; nTiles
		.BYTE $19, $15,	$16, $1A, 0, 0,	0; nTiles
		.BYTE $1B, $1C,	$1D, $1E, 0, 0,	0; nTiles
		.BYTE	 0, $1F, $20, $21
pPalace_WindowLeft:.BYTE 0		; ...
		.BYTE 0, 0, 0, 0, 1, 2,	3; nTiles
		.BYTE 0, 0, 0, 0, 4, 5,	6; nTiles
		.BYTE 0, 0, 0, 0, 4, 7,	8; nTiles
		.BYTE 0, 0, 0, 0, 9, $A, 0; nTiles
		.BYTE 0, 0, 0, 0, $B, $C, $D; nTiles
		.BYTE 0, 0, 0, $E, $F, $10, $11; nTiles
		.BYTE 0, 0, 0, 0, $12, $13, $14; nTiles
		.BYTE 0, 0, 0, 0, $15, $16, $17; nTiles
		.BYTE $18, $19,	$18, $19, $18, $19, $18; nTiles
		.BYTE $1A, $1B,	$1A, $1C, $1A, $1B, $1A; nTiles
pPalace_Window:	.BYTE 0			; ...
		.BYTE 1, 2, 3, $1D, $1E, $1F, 1; nTiles
		.BYTE 4, 5, 6, 0, $20, $21, 4; nTiles
		.BYTE 4, 7, 8, 0, 0, $22, 4; nTiles
		.BYTE 9, $A, 0,	0, $23,	$24, $25; nTiles
		.BYTE $B, $C, $D, $26, 0, $27, $B; nTiles
		.BYTE $F, $10, $11, $28, $11, $29, $F; nTiles
		.BYTE $12, $13,	$14, $14, $14, $2A, $12; nTiles
		.BYTE $15, $16,	$17, $17, $17, $2B, $15; nTiles
		.BYTE $18, $19,	$18, $19, $18, $2C, $2D; nTiles
		.BYTE $1A, $1B,	$1A, $1C, $2E, $2F, 0; nTiles
pDungeonBgWall:	.BYTE 3			; ...
		.BYTE 0, 0, 0, 0, $41, $42, $43; nTiles
		.BYTE 0, 0, 0, $41, $42, $44, $45; nTiles
		.BYTE 0, 0, 0, $46, $44, $47, 0; nTiles
		.BYTE 0, 0, 0, 0, $48, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
pPalace_SpaceBgLineResidual:.BYTE 5	; ...
		.BYTE 0, 0, 0, 1, $2E, $2F, 1; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
pPalace_SpaceBgLine:.BYTE 5		; ...
		.BYTE 0, 0, 0, 1, 1, 1,	1; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
pPalaceWallWindow:.BYTE	3		; ...
		.BYTE 0, 0, 0, 1, 2, 3,	4; nTiles
		.BYTE 0, 0, 0, 5, 6, 7,	8; nTiles
		.BYTE 0, 0, 0, 9, $A, $B, $C; nTiles
		.BYTE 0, 0, 0, $D, $A, $E, $F; nTiles
		.BYTE 0, 0, 0, $10, $A,	$B, $11; nTiles
		.BYTE 0, 0, 0, $10, $A,	$B, $11; nTiles
		.BYTE 0, 0, 0, $12, $13, $14, $15; nTiles
pDungeon_Spikes:.BYTE 8			; ...
		.BYTE 0, 1, 2, 3, 4, 5,	6; nTiles
		.BYTE 7, 8, 9, $A, $B, $C, 0; nTiles
pDungeon_Space:	.BYTE 8			; ...
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
		.BYTE 0, 0, 0, 0, 0, 0, 0; nTiles
pActionsLibrary:.WORD 0			; ...
		.WORD pActionRunning1
		.WORD pActionStaying
		.WORD pActionJumping
		.WORD pActionRunningJump
		.WORD pActionTurnBack
		.WORD pActionRunningTurnBack
		.WORD pActionStartFalling1
		.WORD pActionJumpUpAndSwing1
		.WORD pActionSwingAndFall
		.WORD pActionMoveUp
		.WORD pActionShortJumpUp1
		.WORD pActionFalling
		.WORD pActionStopping
		.WORD pActionJumpUpAndBump
		.WORD pActionSwingingAndFall
		.WORD pActionSwingAndFall
		.WORD pActionSittingDown
		.WORD pActionStartFalling2
		.WORD pActionStartFalling2
		.WORD pActionInjureSitDown
		.WORD pActionStartFalling3
		.WORD pActionDeadMan
		.WORD pActionStartFalling4
		.WORD pActionJumpUpAndSwing2
		.WORD pActionJumpUpAndGrabLedge
		.WORD pActionSitDown4
		.WORD pActionSitDown4
		.WORD pActionShortJumpUp2
		.WORD pActionStartSteal1
		.WORD pActionStartSteal2
		.WORD pActionStartSteal3
		.WORD pActionStartSteal4
		.WORD pActionStartSteal5
		.WORD pActionStartSteal6
		.WORD pActionStartSteal7
		.WORD pActionStartSteal8
		.WORD pActionStartSteal9
		.WORD pActionStartSteal10
		.WORD pActionStartSteal11
		.WORD pActionStartSteal12
		.WORD pActionStartSteal13
		.WORD pActionStartSteal14
		.WORD pActionRunning2
		.WORD pActionStartSteal14
		.WORD pActionStartFallingAndInjure
		.WORD pActionStartSteal14
		.WORD pActionInjure
		.WORD pActionSwingingAndFall
		.WORD pActionGetUp
		.WORD pActionSitDown3
		.WORD pActionDeathFromSpike
		.WORD pActionDeadMan3
		.WORD pActionDeadMan3
		.WORD pActionDeathFromCutters
		.WORD pActionGetOutSword5
		.WORD pActionMovingForwardInFight1
		.WORD pActionMovingBackwardInFight
		.WORD pActionAttack1
		.WORD pActionMovingInFight1
		.WORD pActionJumping
		.WORD pActionReflectAttack1
		.WORD pActionReflectAttack2
		.WORD pActionJumping5
		.WORD pActionJumping5
		.WORD pActionJumping5
		.WORD pActionReflectAttack3
		.WORD pActionMoveSword1
		.WORD pActionSlipDown
		.WORD pActionMoveSword2
		.WORD pActionRunningOffLevel
		.WORD pActionHealthOffDeath1
		.WORD pActionStartSteal14
		.WORD pActionClimbUpFailed
		.WORD pActionMovingInFight2
		.WORD pActionAttack2
		.WORD pActionMoveSword3
		.WORD pActionGetOutSword5
		.WORD pActionDrinkPotion
		.WORD pActionSitDown4
		.WORD pActionJumping
		.WORD pActionStartFalling1
		.WORD pActionStartFalling1
		.WORD pActionStartFalling1
		.WORD pActionRunning1
		.WORD pActionHealthOffDeath2
		.WORD pActionMovingForwardInFight2
		.WORD pActionGetOutSword5
		.WORD pActionGetOutSword5
		.WORD pActionTurnBack
		.WORD pActionGetOutSword5
		.WORD pActionGrabTheSword
		.WORD pActionSheatheSword
		.WORD pActionSheatheSwordFast
pActionRunning1:.BYTE apSetupUnknown1	; ...
		.BYTE 1
pActionRunningLoop1:.BYTE 1		; ...
		.BYTE	2
		.BYTE	3
		.BYTE	4
		.BYTE apMoveHorz
		.BYTE 8
		.BYTE	5
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE	6
		.BYTE apMoveHorz
		.BYTE 3
pActionRunningLoop2:.BYTE 7		; ...
		.BYTE apMoveHorz
		.BYTE 5
		.BYTE	8
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE apPlaySound
		.BYTE seStep
		.BYTE	9
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE  $A
		.BYTE apMoveHorz
		.BYTE 4
		.BYTE  $B
		.BYTE apMoveHorz
		.BYTE 5
		.BYTE  $C
		.BYTE apMoveHorz
		.BYTE 2
pActionRunningLoop3:.BYTE apPlaySound	; ...
		.BYTE seStep
		.BYTE  $D
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE  $E
		.BYTE apMoveHorz
		.BYTE 4
		.BYTE apSetNewActionPtr
		.WORD pActionRunningLoop2
pActionStaying:	.BYTE apSetupUnknown1	; ...
		.BYTE 0
		.BYTE  $F
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionGetOutSword5:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $CF ; Ï
		.BYTE $D0 ; Ð
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $D1 ; Ñ
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $D2 ; Ò
		.BYTE apMoveHorz
		.BYTE 3
pGuardStaying:	.BYTE apSetupUnknown1	; ...
		.BYTE 1
		.BYTE apPlaySound
		.BYTE seStep
		.BYTE $9E ; ž
		.BYTE $AA ; ª
pGuardStayingLoop:.BYTE	$AB		; ...
		.BYTE apSetNewActionPtr
		.WORD pGuardStayingLoop
pActionMovingInFight2:.BYTE apSetupUnknown1 ; ...
		.BYTE 5
		.BYTE $AC ; ¬
		.BYTE apMoveHorz
		.BYTE $FF
		.BYTE apMoveVert
		.BYTE 1
		.BYTE $AD ; ­
		.BYTE apMoveHorz
		.BYTE $FF
		.BYTE $AE ; ®
		.BYTE apMoveHorz
		.BYTE $FF
		.BYTE apMoveVert
		.BYTE 2
		.BYTE apMoveHorz
		.BYTE $FE
		.BYTE apMoveVert
		.BYTE 1
		.BYTE apMoveHorz
		.BYTE $FB
		.BYTE apMoveVert
		.BYTE $FC
		.BYTE apSetNewActionPtr
		.WORD pActionAttackLoop
pActionMoveSword1:.BYTE	apSetupUnknown1	; ...
		.BYTE 1
		.BYTE $9B ; ›
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $A5 ; ¥
		.BYTE apMoveHorz
		.BYTE $FE
		.BYTE apSetNewActionPtr
		.WORD pGuardStaying
pActionMoveSword3:.BYTE	apSetupUnknown1	; ...
		.BYTE 1
		.BYTE $9B ; ›
		.BYTE $9C ; œ
		.BYTE $9D ; 
		.BYTE $9E ; ž
		.BYTE apSetNewActionPtr
		.WORD pActionMovingBackwardInFight
pActionMovingBackwardInFight:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE apMoveHorz
		.BYTE $FD
		.BYTE $A0 ;  
		.BYTE apMoveHorz
		.BYTE $FE
		.BYTE $9D ; 
		.BYTE apSetNewActionPtr
		.WORD pGuardStaying
pActionMovingInFight1:.BYTE apSetNewActionPtr ;	...
		.WORD pGuardStaying
pActionAttack1:	.BYTE apSetupUnknown1	; ...
		.BYTE 1
		.BYTE apSetFallingHorzSpeed
		.WORD $FF
pActionAttack2:	.BYTE apSetupUnknown1	; ...
		.BYTE 1
		.BYTE $97 ; —
		.BYTE apSetupUnknown1
		.BYTE 1
		.BYTE $98 ; ˜
		.BYTE $99 ; ™
		.BYTE $9A ; š
pActionAttack2Loop:.BYTE apSetupUnknown1 ; ...
		.BYTE 5
		.BYTE $9B ; ›
pActionAttackLoop:.BYTE	apSetupUnknown1	; ...
		.BYTE 1
		.BYTE $9C ; œ
		.BYTE $9D ; 
		.BYTE apSetNewActionPtr
		.WORD pGuardStaying
pActionMoveSword2:.BYTE	apSetupUnknown1	; ...
		.BYTE 1
		.BYTE $A7 ; §
		.BYTE apSetNewActionPtr
		.WORD pActionAttack2Loop
pActionReflectAttack3:.BYTE $A9		; ...
		.BYTE $A9 ; ©
		.BYTE $A2 ; ¢
		.BYTE apSetNewActionPtr
		.WORD pGuardStaying
pActionReflectAttack2:.BYTE $D8		; ...
pActionReflectAttach2Loop:.BYTE	$96	; ...
		.BYTE apSetNewActionPtr
		.WORD pGuardStaying
pActionReflectAttack1:.BYTE $9F		; ...
		.BYTE $A0 ;  
		.BYTE apSetNewActionPtr
		.WORD pActionReflectAttach2Loop
pActionJumping5:.BYTE apSetupUnknown1	; ...
		.BYTE 5
pActionJumping:	.BYTE apSetupUnknown1	; ...
		.BYTE 1
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $10
		.BYTE $11
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $12
		.BYTE apMoveHorz
		.BYTE 4
		.BYTE $14
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $15
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $16
		.BYTE apMoveHorz
		.BYTE 7
		.BYTE $17
		.BYTE apMoveHorz
		.BYTE 9
		.BYTE $18
		.BYTE apMoveHorz
		.BYTE 5
		.BYTE apMoveVert
		.BYTE $FA
		.BYTE $19
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE apMoveVert
		.BYTE 6
		.BYTE $1A
		.BYTE apMoveHorz
		.BYTE 4
		.BYTE apActionBrokenPlateHandle
		.BYTE apPlaySound
		.BYTE seStep
		.BYTE $1B
		.BYTE apMoveHorz
		.BYTE $FD
		.BYTE $1C
		.BYTE apMoveHorz
		.BYTE 5
		.BYTE $1D
		.BYTE apPlaySound
		.BYTE seStep
		.BYTE $1E
		.BYTE $1F
		.BYTE $20
		.BYTE $21 ; !
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionRunningJump:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE apPlaySound
		.BYTE seStep
		.BYTE $22 ; "
		.BYTE apMoveHorz
		.BYTE 5
		.BYTE $23 ; #
		.BYTE apMoveHorz
		.BYTE 6
		.BYTE $25 ; %
		.BYTE apMoveHorz
		.BYTE 5
		.BYTE apPlaySound
		.BYTE seStep
		.BYTE $26 ; &
		.BYTE apMoveHorz
		.BYTE 7
		.BYTE $27 ; '
		.BYTE apMoveHorz
		.BYTE $C
		.BYTE apMoveVert
		.BYTE $FD
		.BYTE $28 ; (
		.BYTE apMoveHorz
		.BYTE 8
		.BYTE apMoveVert
		.BYTE $F7
		.BYTE $29 ; )
		.BYTE apMoveHorz
		.BYTE 8
		.BYTE apMoveVert
		.BYTE $FE
		.BYTE $2A ; *
		.BYTE apMoveHorz
		.BYTE 4
		.BYTE apMoveVert
		.BYTE $B
		.BYTE $2B ; +
		.BYTE apMoveHorz
		.BYTE 4
		.BYTE apMoveVert
		.BYTE 3
		.BYTE $2C ; ,
		.BYTE apActionBrokenPlateHandle
		.BYTE apSetNewActionPtr
		.WORD pActionRunningLoop2
pActionSitDown4:.BYTE $6D		; ...
		.BYTE apSetNewActionPtr
		.WORD pActionSitDown4
pActionTurnBack:.BYTE apSetupUnknown1	; ...
		.BYTE 7
		.BYTE apTurnBack
		.BYTE apMoveHorz
		.BYTE 6
		.BYTE $2D ; -
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $2E ; .
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $2F ; /
		.BYTE apMoveHorz
		.BYTE $FF
		.BYTE $30 ; 0
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $31 ; 1
		.BYTE apMoveHorz
		.BYTE $FE
		.BYTE $32 ; 2
		.BYTE $33 ; 3
		.BYTE $34 ; 4
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionRunning2:.BYTE apSetupUnknown1	; ...
		.BYTE 1
		.BYTE apMoveHorz
		.BYTE $FF
		.BYTE apSetNewActionPtr
		.WORD pActionRunningLoop1
pActionRunningTurnBack:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $35 ; 5
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE apPlaySound
		.BYTE seStep
		.BYTE $36 ; 6
		.BYTE apMoveHorz
		.BYTE 8
		.BYTE $37 ; 7
		.BYTE apPlaySound
		.BYTE seStep
		.BYTE $38 ; 8
		.BYTE apMoveHorz
		.BYTE 7
		.BYTE $39 ; 9
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE $3A ; :
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $3B ; ;
		.BYTE $3C ; 
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $3D ; =
		.BYTE apMoveHorz
		.BYTE $FF
		.BYTE $3E ; 
		.BYTE $3F ; ?
		.BYTE $40 ; @
		.BYTE apMoveHorz
		.BYTE $FF
		.BYTE $41 ; A
		.BYTE apMoveHorz
		.BYTE $F2
		.BYTE apTurnBack
		.BYTE apSetNewActionPtr
		.WORD pActionRunningLoop3
pActionStartFalling1:.BYTE apSetupUnknown1 ; ...
		.BYTE 3
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE apMoveVert
		.BYTE 3
		.BYTE $66 ; f
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE apMoveVert
		.BYTE 6
		.BYTE $67 ; g
		.BYTE apMoveHorz
		.BYTE $FF
		.BYTE apMoveVert
		.BYTE 9
		.BYTE $68 ; h
		.BYTE apMoveVert
		.BYTE $C
		.BYTE $68 ; h
		.BYTE apMoveHorz
		.BYTE $FE
		.BYTE apSetFallingHorzSpeed
		.BYTE 1
		.BYTE  $F
		.BYTE apMoveVert
		.BYTE $10
		.BYTE apSetNewActionPtr
		.WORD pActionFalling
pActionStartFalling2:.BYTE apSetupUnknown1 ; ...
		.BYTE 3
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE apMoveVert
		.BYTE 3
		.BYTE $66 ; f
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE apMoveVert
		.BYTE 6
		.BYTE $67 ; g
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE apMoveVert
		.BYTE 9
		.BYTE $68 ; h
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE apMoveVert
		.BYTE $C
		.BYTE apSetFallingHorzSpeed
		.BYTE 2
		.BYTE  $F
		.BYTE $69 ; i
		.BYTE apSetNewActionPtr
		.WORD pActionFalling
pActionStartFalling3:.BYTE apSetupUnknown1 ; ...
		.BYTE 3
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE apMoveVert
		.BYTE 3
		.BYTE $66 ; f
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE apMoveVert
		.BYTE 6
		.BYTE $67 ; g
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE apMoveVert
		.BYTE 9
		.BYTE $68 ; h
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE apMoveVert
		.BYTE $C
		.BYTE $69 ; i
		.BYTE apSetFallingHorzSpeed
		.BYTE 3
		.BYTE  $F
		.BYTE apSetNewActionPtr
		.WORD pActionFalling
pActionJumpUpAndSwing1:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE apAction03
		.BYTE $43 ; C
		.BYTE $44 ; D
		.BYTE $45 ; E
		.BYTE $46 ; F
		.BYTE $47 ; G
		.BYTE $48 ; H
		.BYTE $49 ; I
		.BYTE $4A ; J
		.BYTE $4B ; K
		.BYTE $4C ; L
		.BYTE $4D ; M
		.BYTE apSetupUnknown1
		.BYTE 2
		.BYTE $4E ; N
		.BYTE $4F ; O
		.BYTE $50 ; P
		.BYTE apSetNewActionPtr
		.WORD pActionSwingAndFall
pActionJumpUpAndSwing2:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE apAction03
		.BYTE $43 ; C
		.BYTE $44 ; D
		.BYTE $45 ; E
		.BYTE $46 ; F
		.BYTE $47 ; G
		.BYTE $48 ; H
		.BYTE $49 ; I
		.BYTE $4A ; J
		.BYTE $4B ; K
		.BYTE $4C ; L
		.BYTE $4D ; M
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $4E ; N
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $4F ; O
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $50 ; P
		.BYTE apSetupUnknown1
		.BYTE 2
		.BYTE apSetNewActionPtr
		.WORD pActionSwingAndFall
pActionSwingAndFall:.BYTE apSetupUnknown1 ; ...
		.BYTE 2
		.BYTE $5B ; [
pActionSwingAndFallLoop:.BYTE apSetFallingHorzSpeed ; ...
		.BYTE 0
		.BYTE	0
		.BYTE $5A ; Z
		.BYTE $59 ; Y
		.BYTE $58 ; X
		.BYTE $57 ; W
		.BYTE $57 ; W
		.BYTE $57 ; W
		.BYTE $58 ; X
		.BYTE $59 ; Y
		.BYTE $5A ; Z
		.BYTE $5B ; [
		.BYTE $5C ; \
		.BYTE $5D ; ]
		.BYTE $5E ; ^
		.BYTE $5F ; _
		.BYTE $60 ; `
		.BYTE $61 ; a
		.BYTE $62 ; b
		.BYTE $63 ; c
		.BYTE $61 ; a
		.BYTE $60 ; `
		.BYTE $5F ; _
		.BYTE $5E ; ^
		.BYTE $5D ; ]
		.BYTE $5C ; \
		.BYTE $5B ; [
		.BYTE $5A ; Z
		.BYTE $59 ; Y
		.BYTE $58 ; X
		.BYTE $57 ; W
		.BYTE $58 ; X
		.BYTE $59 ; Y
		.BYTE $5A ; Z
		.BYTE $5B ; [
		.BYTE $5C ; \
		.BYTE $5D ; ]
		.BYTE $5E ; ^
		.BYTE $5F ; _
		.BYTE $60 ; `
		.BYTE $5F ; _
		.BYTE $5E ; ^
		.BYTE $5D ; ]
		.BYTE $5C ; \
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE apSetNewActionPtr
		.WORD pActionShortJumpUp1
pActionJumpUpAndGrabLedge:.BYTE	apSetupUnknown1	; ...
		.BYTE 6
		.BYTE apActionBrokenPlateHandle
		.BYTE apAction03
		.BYTE apPlaySound
		.BYTE seWallBreak
		.BYTE $5D ; ]
		.BYTE $5D ; ]
pActionJumpUpAndGrabLedgeLoop:.BYTE $5B	; ...
		.BYTE apSetNewActionPtr
		.WORD pActionJumpUpAndGrabLedgeLoop
pActionClimbUpFailed:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE $87 ; ‡
		.BYTE $88 ; ˆ
		.BYTE $89 ; ‰
		.BYTE $89 ; ‰
		.BYTE $8A ; Š
		.BYTE $8A ; Š
		.BYTE $8A ; Š
		.BYTE $8A ; Š
		.BYTE $89 ; ‰
		.BYTE $88 ; ˆ
		.BYTE $87 ; ‡
		.BYTE apMoveHorz
		.BYTE $F9
		.BYTE apSetNewActionPtr
		.WORD pActionShortJumpUp1
pActionSlipDown:.BYTE apSetupUnknown1	; ...
		.BYTE 1
		.BYTE  $F
		.BYTE $94 ; ”
		.BYTE $91 ; ‘
		.BYTE $90 ; 
		.BYTE $8F ; 
		.BYTE apAction04
		.BYTE $8E ; Ž
		.BYTE $8D ; 
		.BYTE apMoveHorz
		.BYTE $FB
		.BYTE apMoveVert
		.BYTE $3F
		.BYTE $8C ; Œ
		.BYTE $8A ; Š
		.BYTE $88 ; ˆ
		.BYTE $5B ; [
		.BYTE apSetupUnknown1
		.BYTE 2
		.BYTE apSetNewActionPtr
		.WORD pActionSwingAndFallLoop
pActionMoveUp:	.BYTE apSetupUnknown1	; ...
		.BYTE 1
		.BYTE apAction03
		.BYTE $87 ; ‡
		.BYTE $88 ; ˆ
		.BYTE $89 ; ‰
		.BYTE $8A ; Š
		.BYTE $8B ; ‹
		.BYTE $8C ; Œ
		.BYTE apMoveHorz
		.BYTE 5
		.BYTE apMoveVert
		.BYTE $C1
		.BYTE $8D ; 
		.BYTE $8E ; Ž
		.BYTE $8F ; 
		.BYTE $90 ; 
		.BYTE $91 ; ‘
		.BYTE $92 ; ’
		.BYTE $93 ; “
		.BYTE apResetFallingCounters
		.BYTE $94
		.BYTE $95 ; •
		.BYTE apSetupUnknown1
		.BYTE 1
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionShortJumpUp1:.BYTE apSetupUnknown1 ; ...
		.BYTE 5
		.BYTE $53 ; S
		.BYTE apAction04
		.BYTE apSetupUnknown1
		.BYTE 5
		.BYTE $54 ; T
		.BYTE $55 ; U
		.BYTE apActionBrokenPlateHandle
		.BYTE apMoveHorz
		.BYTE 4
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionStartFalling4:.BYTE apSetupUnknown1 ; ...
		.BYTE 3
		.BYTE $6A ; j
		.BYTE apMoveVert
		.BYTE 6
		.BYTE $6A ; j
		.BYTE apMoveVert
		.BYTE 9
		.BYTE $6A ; j
		.BYTE apMoveVert
		.BYTE $C
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE apSetFallingHorzSpeed
		.WORD $C00
		.BYTE apSetNewActionPtr
		.WORD pActionFalling
pActionFalling:	.BYTE apSetupUnknown1	; ...
		.BYTE 4
pActionFallingLoop:.BYTE $6A		; ...
		.BYTE apSetNewActionPtr
		.WORD pActionFallingLoop
pActionStopping:.BYTE apSetupUnknown1	; ...
		.BYTE 1
		.BYTE $35 ; 5
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE apPlaySound
		.BYTE seStep
		.BYTE $36 ; 6
		.BYTE apMoveHorz
		.BYTE 7
		.BYTE $37 ; 7
		.BYTE apPlaySound
		.BYTE seStep
		.BYTE $38 ; 8
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $31 ; 1
		.BYTE apMoveHorz
		.BYTE $FE
		.BYTE $32 ; 2
		.BYTE $33 ; 3
		.BYTE $34 ; 4
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionJumpUpAndBump:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE $43 ; C
		.BYTE $44 ; D
		.BYTE $45 ; E
		.BYTE $46 ; F
		.BYTE $47 ; G
		.BYTE $48 ; H
		.BYTE $49 ; I
		.BYTE $4A ; J
		.BYTE $4B ; K
		.BYTE apResetFallingCounters
		.BYTE $4C
		.BYTE $4D ; M
		.BYTE $4E ; N
		.BYTE apActionBrokenPlateHandle
		.BYTE $4F ; O
		.BYTE apPlaySound
		.BYTE seWallBreak
		.BYTE apSetupUnknown1
		.BYTE 0
		.BYTE apSetNewActionPtr
		.WORD pActionShortJumpUp1
pActionShortJumpUp2:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE $43 ; C
		.BYTE $44 ; D
		.BYTE $45 ; E
		.BYTE $46 ; F
		.BYTE $47 ; G
		.BYTE $48 ; H
		.BYTE $49 ; I
		.BYTE $4A ; J
		.BYTE $4B ; K
		.BYTE $4C ; L
		.BYTE $4D ; M
		.BYTE $4E ; N
		.BYTE $4F ; O
		.BYTE apMoveVert
		.BYTE $FE
		.BYTE $4F ; O
		.BYTE apMoveVert
		.BYTE $FF
		.BYTE $4F ; O
		.BYTE $4F ; O
		.BYTE apMoveVert
		.BYTE 1
		.BYTE $4F ; O
		.BYTE apMoveVert
		.BYTE 2
		.BYTE apSetNewActionPtr
		.WORD pActionShortJumpUp1
pActionSwingingAndFall:.BYTE apSetupUnknown1 ; ...
		.BYTE 3
		.BYTE $50 ; P
		.BYTE apPlaySound
		.BYTE seStep
		.BYTE apSetNewActionPtr
		.WORD pActionSwingAndFall
pActionInjure:	.BYTE apSetupUnknown1	; ...
		.BYTE 3
		.BYTE apMoveHorz
		.BYTE $FA
		.BYTE $32 ; 2
		.BYTE apPlaySound
		.BYTE seWallBreak
		.BYTE $33 ; 3
		.BYTE $34 ; 4
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionStartFallingAndInjure:.BYTE apMoveHorz ;	...
		.BYTE 1
		.BYTE apMoveVert
		.BYTE 3
		.BYTE apPlaySound
		.BYTE seWallBreak
		.BYTE $66 ; f
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE apMoveVert
		.BYTE 6
		.BYTE $67 ; g
		.BYTE apMoveHorz
		.BYTE $FF
		.BYTE apMoveVert
		.BYTE 9
		.BYTE $68 ; h
		.BYTE apMoveVert
		.BYTE $C
		.BYTE $69 ; i
		.BYTE apMoveHorz
		.BYTE $FE
		.BYTE apSetFallingHorzSpeed
		.WORD $F00
		.BYTE apSetNewActionPtr
		.WORD pActionFalling
pActionStartSteal14:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE $79 ; y
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7A ; z
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7B ; {
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE $7C ; |
		.BYTE apMoveHorz
		.BYTE 4
		.BYTE $7D ; }
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE $7E ; ~
		.BYTE apMoveHorz
		.BYTE $FF
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE $7F ; 
		.BYTE $80 ; €
		.BYTE $81 ; 
		.BYTE $82 ; ‚
		.BYTE $83 ; ƒ
		.BYTE $84 ; „
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionStartSteal13:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE $79 ; y
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7A ; z
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7B ; {
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE $7C ; |
		.BYTE apMoveHorz
		.BYTE 4
		.BYTE $7D ; }
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE $7E ; ~
		.BYTE apMoveHorz
		.BYTE $FF
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $7F ; 
		.BYTE $80 ; €
		.BYTE $81 ; 
		.BYTE $82 ; ‚
		.BYTE $83 ; ƒ
		.BYTE $84 ; „
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionStartSteal12:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE $79 ; y
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7A ; z
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7B ; {
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE $7C ; |
		.BYTE apMoveHorz
		.BYTE 4
		.BYTE $7D ; }
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE $7E ; ~
		.BYTE apMoveHorz
		.BYTE $FF
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7F ; 
		.BYTE $80 ; €
		.BYTE $81 ; 
		.BYTE $82 ; ‚
		.BYTE $83 ; ƒ
		.BYTE $84 ; „
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionStartSteal11:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE $79 ; y
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7A ; z
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7B ; {
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE $7C ; |
		.BYTE apMoveHorz
		.BYTE 4
		.BYTE $7D ; }
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE $7E ; ~
		.BYTE apMoveHorz
		.BYTE $FF
		.BYTE $7F ; 
		.BYTE $80 ; €
		.BYTE $81 ; 
		.BYTE $82 ; ‚
		.BYTE $83 ; ƒ
		.BYTE $84 ; „
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionStartSteal10:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE $79 ; y
		.BYTE apMoveHorz
		.BYTE 1
pActionStartStealLoop:.BYTE $7A		; ...
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7B ; {
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE $7C ; |
		.BYTE apMoveHorz
		.BYTE 4
		.BYTE $7D ; }
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE $7E ; ~
		.BYTE apMoveHorz
		.BYTE $FE
		.BYTE $80 ; €
		.BYTE $81 ; 
		.BYTE $82 ; ‚
		.BYTE $83 ; ƒ
		.BYTE $84 ; „
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionStartSteal9:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE $79 ; y
		.BYTE apSetNewActionPtr
		.WORD pActionStartStealLoop
pActionStartSteal8:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE $79 ; y
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7A ; z
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7B ; {
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE $7C ; |
		.BYTE apMoveHorz
		.BYTE 4
		.BYTE $7D ; }
		.BYTE apMoveHorz
		.BYTE $FF
		.BYTE $7F ; 
		.BYTE $80 ; €
		.BYTE $81 ; 
		.BYTE $82 ; ‚
		.BYTE $83 ; ƒ
		.BYTE $84 ; „
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionStartSteal7:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE $79 ; y
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7A ; z
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7B ; {
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE $7C ; |
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $81 ; 
		.BYTE $82 ; ‚
		.BYTE $83 ; ƒ
		.BYTE $84 ; „
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionStartSteal6:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE $79 ; y
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7A ; z
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7B ; {
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $7C ; |
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $81 ; 
		.BYTE $82 ; ‚
		.BYTE $83 ; ƒ
		.BYTE $84 ; „
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionStartSteal5:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE $79 ; y
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7A ; z
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7B ; {
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $7C ; |
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $81 ; 
		.BYTE $82 ; ‚
		.BYTE $83 ; ƒ
		.BYTE $84 ; „
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionStartSteal4:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE $79 ; y
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7A ; z
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7B ; {
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $83 ; ƒ
		.BYTE $84 ; „
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionStartSteal3:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE $79 ; y
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7A ; z
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7B ; {
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $83 ; ƒ
		.BYTE $84 ; „
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionStartSteal2:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE $79 ; y
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $7A ; z
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $84 ; „
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionStartSteal1:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE $79 ; y
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $84 ; „
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionSitDown3:.BYTE apSetupUnknown1	; ...
		.BYTE 0
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $6B ; k
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $6C ; l
pActionSitdownLoop:.BYTE $6D		; ...
		.BYTE apSetNewActionPtr
		.WORD pActionSitdownLoop
pActionGetUp:	.BYTE apMoveHorz	; ...
		.BYTE 1
		.BYTE $6E ; n
		.BYTE $6F ; o
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $70 ; p
		.BYTE $71 ; q
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $72 ; r
		.BYTE $73 ; s
		.BYTE $74 ; t
		.BYTE apMoveHorz
		.BYTE $FE
		.BYTE $75 ; u
		.BYTE $76 ; v
		.BYTE $77 ; w
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionGrabTheSword:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE apPlayMusic
		.BYTE mVictory
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E5 ; å
		.BYTE $E6 ; æ
		.BYTE $E7 ; ç
		.BYTE $E8 ; è
		.BYTE apSetupUnknown1
		.BYTE $B
		.BYTE apSetNewActionPtr
		.WORD pActionSheatheSword
pActionSheatheSword:.BYTE apMoveHorz	; ...
		.BYTE $FB
		.BYTE $E9 ; é
		.BYTE $EA ; ê
		.BYTE $EB ; ë
		.BYTE $EC ; ì
		.BYTE $ED ; í
		.BYTE $EE ; î
		.BYTE $EE ; î
		.BYTE $EE ; î
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE  $F
		.BYTE apPlayMusic
		.BYTE mLevel
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionSheatheSwordFast:.BYTE apSetupUnknown1 ;	...
		.BYTE 1
		.BYTE apMoveHorz
		.BYTE $FB
		.BYTE $EA ; ê
		.BYTE $EC ; ì
		.BYTE $EE ; î
		.BYTE apMoveHorz
		.BYTE $FF
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionDrinkPotion:.BYTE apSetupUnknown1 ; ...
		.BYTE $28
		.BYTE apMoveHorz
		.BYTE 4
		.BYTE $C1 ; Á
		.BYTE $C2 ; Â
		.BYTE $C3 ; Ã
		.BYTE $C4 ; Ä
		.BYTE apPlaySound
		.BYTE seDrinkingPotion
		.BYTE $C7 ; Ç
		.BYTE $C8 ; È
		.BYTE $C9 ; É
		.BYTE $CA ; Ê
		.BYTE $CB ; Ë
		.BYTE $CC ; Ì
		.BYTE $CD ; Í
		.BYTE $CD ; Í
		.BYTE $CD ; Í
		.BYTE $C9 ; É
		.BYTE $C6 ; Æ
		.BYTE apMoveHorz
		.BYTE $FC
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionSittingDown:.BYTE apSetupUnknown1 ; ...
		.BYTE 5
		.BYTE apActionBrokenPlateHandle
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE apPlaySound
		.BYTE seStep
		.BYTE $6B ; k
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $6C ; l
		.BYTE apPlaySound
		.BYTE seStep
		.BYTE apSetupUnknown1
		.BYTE 1
pActionSittingDownLoop:.BYTE $6D	; ...
		.BYTE apSetNewActionPtr
		.WORD pActionSittingDownLoop
pActionInjureSitDown:.BYTE apSetupUnknown1 ; ...
		.BYTE 5
		.BYTE apActionBrokenPlateHandle
		.BYTE apPlaySound
		.BYTE seBreakSound
		.BYTE apMoveVert
		.BYTE $FE
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $6B ; k
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $6C ; l
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE $6D ; m
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $6E ; n
		.BYTE $6E ; n
		.BYTE $6E ; n
		.BYTE $6F ; o
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $70 ; p
		.BYTE $71 ; q
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE apMoveVert
		.BYTE 1
		.BYTE $72 ; r
		.BYTE apMoveVert
		.BYTE 1
		.BYTE $73 ; s
		.BYTE $74 ; t
		.BYTE apMoveHorz
		.BYTE $FC
		.BYTE $75 ; u
		.BYTE $76 ; v
		.BYTE $77 ; w
		.BYTE apSetNewActionPtr
		.WORD pActionStaying
pActionDeadMan:	.BYTE apSetupUnknown1	; ...
		.BYTE 5
		.BYTE apActionBrokenPlateHandle
		.BYTE apMoveVert
		.BYTE $FE
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE $B9 ; ¹
		.BYTE apRestartLevel
		.BYTE apPlaySound
		.BYTE seBreakSound
pActionDeadManLoop:.BYTE $B9		; ...
		.BYTE apSetNewActionPtr
		.WORD pActionDeadManLoop
pActionHealthOffDeath2:.BYTE apSetupUnknown1 ; ...
		.BYTE 5
		.BYTE apSetNewActionPtr
		.WORD pActionHealthOffDeath1
pActionHealthOffDeath1:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE apPlayMusic
		.BYTE mDeath
		.BYTE apPlaySound
		.BYTE seBreakSound
		.BYTE apRestartLevel
		.BYTE $B3 ; ³
		.BYTE $B4 ; ´
		.BYTE $B5 ; µ
		.BYTE $B6 ; ¶
		.BYTE $B7 ; ·
pActionHealthOffDeathLoop:.BYTE	$B9	; ...
		.BYTE apSetNewActionPtr
		.WORD pActionHealthOffDeathLoop
pActionDeathFromSpike:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE apActionBrokenPlateHandle
		.BYTE apMoveHorz
		.BYTE 4
		.BYTE $B2 ; ²
		.BYTE apPlayMusic
		.BYTE mDeath
		.BYTE apRestartLevel
pActionDeathFromSpikeLoop:.BYTE	$B2	; ...
		.BYTE apSetNewActionPtr
		.WORD pActionDeathFromSpikeLoop
pActionDeathFromCutters:.BYTE apSetupUnknown1 ;	...
		.BYTE 1
		.BYTE $B1 ; ±
		.BYTE apPlayMusic
		.BYTE mDeath
		.BYTE apRestartLevel
pActionDeathFromCuttersLoop:.BYTE $B1	; ...
		.BYTE apSetNewActionPtr
		.WORD pActionDeathFromCuttersLoop
pActionDeadMan3:.BYTE apSetFallingHorzSpeed ; ...
		.WORD 0
		.BYTE apRestartLevel
		.BYTE apSetupUnknown1
		.BYTE 0
pActionDeadMan3Loop:.BYTE $B9		; ...
		.BYTE apSetNewActionPtr
		.WORD pActionDeadMan3Loop
pActionRunningOffLevel:.BYTE apSetupUnknown1 ; ...
		.BYTE $F
		.BYTE apTurnBack
		.BYTE apMoveHorz
		.BYTE $FB
		.BYTE apMoveVert
		.BYTE $FF
		.BYTE apPlaySound
		.BYTE seStep
		.BYTE $D9 ; Ù
		.BYTE apMoveHorz
		.BYTE 1
		.BYTE $DC ; Ü
		.BYTE apMoveHorz
		.BYTE $FC
		.BYTE apMoveVert
		.BYTE $FD
		.BYTE apPlaySound
		.BYTE seStep
		.BYTE $DD ; Ý
		.BYTE apMoveHorz
		.BYTE $FC
		.BYTE apMoveVert
		.BYTE $FE
		.BYTE $DE ; Þ
		.BYTE apMoveHorz
		.BYTE $FE
		.BYTE apMoveVert
		.BYTE $FD
		.BYTE $DF ; ß
		.BYTE apMoveHorz
		.BYTE $FD
		.BYTE apMoveVert
		.BYTE $F8
		.BYTE apPlaySound
		.BYTE seStep
		.BYTE apPlaySound
		.BYTE seStep
		.BYTE $E0 ; à
		.BYTE apMoveHorz
		.BYTE $FF
		.BYTE apMoveVert
		.BYTE $FF
		.BYTE $E1 ; á
		.BYTE apMoveHorz
		.BYTE $FD
		.BYTE apMoveVert
		.BYTE $FC
		.BYTE $E2 ; â
		.BYTE apMoveHorz
		.BYTE $FF
		.BYTE apMoveVert
		.BYTE $FB
		.BYTE apPlaySound
		.BYTE seStep
		.BYTE $E3 ; ã
		.BYTE apMoveHorz
		.BYTE $FE
		.BYTE apMoveVert
		.BYTE $FF
		.BYTE $E4 ; ä
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE apFinishLevel
pActionRunningOffLevelLoop:.BYTE 0	; ...
		.BYTE apSetNewActionPtr
		.WORD pActionRunningOffLevelLoop
pAnimationBrokenPlateWave_02:.BYTE $A8	; ...
		.BYTE apSetNewActionPtr
		.WORD pAnimationBrokenPlateWave_02
pShadowColumn1:	.BYTE $B8		; ...
		.BYTE apSetNewActionPtr
		.WORD pShadowColumn1
pShadowColumn2:	.BYTE $B9		; ...
		.BYTE apSetNewActionPtr
		.WORD pShadowColumn2
pShadowColumn3:	.BYTE $AB		; ...
		.BYTE apSetNewActionPtr
		.WORD pShadowColumn3
pShadowColumn4:	.BYTE $AC		; ...
		.BYTE apSetNewActionPtr
		.WORD pShadowColumn4
pAnimationBrokenPlateWave_03:.BYTE $AF	; ...
		.BYTE apSetNewActionPtr
		.WORD pAnimationBrokenPlateWave_03
pBrokenPlateWave_04:.BYTE $B0		; ...
		.BYTE apSetNewActionPtr
		.WORD pBrokenPlateWave_04
pBrokenPlateWave_05:.BYTE $B1		; ...
		.BYTE apSetNewActionPtr
		.WORD pBrokenPlateWave_05
pAnimationBrokenPlateWave_Full:.BYTE $B2 ; ...
		.BYTE $B3 ; ³
		.BYTE $B2 ; ²
		.BYTE $B3 ; ³
pAnimationBrokenPlateWave_FullLoop:.BYTE 0 ; ...
		.BYTE apSetNewActionPtr
		.WORD pAnimationBrokenPlateWave_FullLoop
pAnimationBrokenPlateWave_Half:.BYTE $B4 ; ...
		.BYTE $B5 ; µ
		.BYTE $B4 ; ´
		.BYTE $B5 ; µ
pAnimationBrokenPlateWave_HalfLoop:.BYTE 0 ; ...
		.BYTE apSetNewActionPtr
		.WORD pAnimationBrokenPlateWave_HalfLoop
pAnimationBrokenPlateWave_1_of_4:.BYTE $B6 ; ...
		.BYTE $B7 ; ·
		.BYTE $B6 ; ¶
		.BYTE $B7 ; ·
pAnimationBrokenPlateWave_1_of_4Loop:.BYTE 0 ; ...
		.BYTE apSetNewActionPtr
		.WORD pAnimationBrokenPlateWave_1_of_4Loop
pSwordAction:	.BYTE $A1		; ...
		.BYTE $A1 ; ¡
		.BYTE $A1 ; ¡
		.BYTE $A1 ; ¡
		.BYTE $A1 ; ¡
		.BYTE $A1 ; ¡
		.BYTE $A1 ; ¡
		.BYTE $A1 ; ¡
		.BYTE $A1 ; ¡
		.BYTE $A1 ; ¡
		.BYTE $A2 ; ¢
		.BYTE $A1 ; ¡
		.BYTE $A1 ; ¡
		.BYTE $A1 ; ¡
		.BYTE $A1 ; ¡
		.BYTE $A1 ; ¡
		.BYTE $A1 ; ¡
		.BYTE $A1 ; ¡
		.BYTE $A1 ; ¡
		.BYTE $A1 ; ¡
		.BYTE $A1 ; ¡
		.BYTE $A1 ; ¡
		.BYTE apSetNewActionPtr
		.WORD pSwordAction
pResidualAction_00:.BYTE $A8		; ...
		.BYTE apSetNewActionPtr
		.WORD pResidualAction_00
pActionSmallPotionJar:.BYTE $96		; ...
		.BYTE apSetNewActionPtr
		.WORD pActionSmallPotionJar
pActionBigPotionJar:.BYTE $A3		; ...
		.BYTE apSetNewActionPtr
		.WORD pActionBigPotionJar
pActionSpikesMove1:.BYTE $9D		; ...
		.BYTE $9E ; ž
		.BYTE $9F ; Ÿ
		.BYTE $A0 ;  
		.BYTE $9E ; ž
		.BYTE $A0 ;  
		.BYTE $9F ; Ÿ
		.BYTE $9F ; Ÿ
		.BYTE $9F ; Ÿ
		.BYTE $9E ; ž
		.BYTE apRepeat
pActionSpikes:	.BYTE 0			; ...
		.BYTE apSetNewActionPtr
		.WORD pActionSpikes
pActionSpikesMove2:.BYTE $A4		; ...
		.BYTE $A5 ; ¥
		.BYTE $A6 ; ¦
		.BYTE $A7 ; §
		.BYTE $A5 ; ¥
		.BYTE $A7 ; §
		.BYTE $A6 ; ¦
		.BYTE $A6 ; ¦
		.BYTE $A6 ; ¦
		.BYTE $A6 ; ¦
		.BYTE $A5 ; ¥
		.BYTE apSetNewActionPtr
		.WORD pActionSpikes
pActionPotionSmoke:.BYTE $97		; ...
		.BYTE $98 ; ˜
		.BYTE $99 ; ™
		.BYTE $9A ; š
		.BYTE $9B ; ›
		.BYTE $9C ; œ
		.BYTE apSetNewActionPtr
		.WORD pActionPotionSmoke
pActionFallingPlate1:.BYTE $B2		; ...
		.BYTE $B2 ; ²
		.BYTE $B3 ; ³
		.BYTE $B3 ; ³
		.BYTE $B2 ; ²
		.BYTE $B2 ; ²
		.BYTE $B3 ; ³
		.BYTE $B3 ; ³
		.BYTE apPlaySound
		.BYTE seBreakSound
pActionBrokenPlate:.BYTE $A9		; ...
		.BYTE apSetNewActionPtr
		.WORD pActionBrokenPlate
pActionBrokenPlateWithPillar:.BYTE $B4	; ...
		.BYTE $B4 ; ´
		.BYTE $B5 ; µ
		.BYTE $B5 ; µ
		.BYTE $B4 ; ´
		.BYTE $B4 ; ´
		.BYTE $B5 ; µ
		.BYTE $B5 ; µ
		.BYTE apPlaySound
		.BYTE seBreakSound
pActionBrokenPlateWithPillarLoop:.BYTE $A9 ; ...
		.BYTE apSetNewActionPtr
		.WORD pActionBrokenPlateWithPillarLoop
pActionFallingPlate2:.BYTE apPlaySound	; ...
		.BYTE seBreakSound
pActionFallingPlate2Loop:.BYTE $AD	; ...
		.BYTE apSetNewActionPtr
		.WORD pActionFallingPlate2Loop
pPrincessAction:.BYTE apPlayMusic	; ...
		.BYTE mGameEnd
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	1
		.BYTE	2
		.BYTE	2
		.BYTE	2
		.BYTE	2
		.BYTE	2
		.BYTE	2
		.BYTE	2
		.BYTE	2
		.BYTE	2
		.BYTE	2
		.BYTE	2
		.BYTE	2
		.BYTE	1
pPrincessActionLoop:.BYTE 1		; ...
		.BYTE apSetNewActionPtr
		.WORD pPrincessActionLoop
pMouseAction:	.BYTE 3			; ...
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE	4
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE	3
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE	4
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE	3
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE	4
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE	3
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE	4
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE	3
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE	4
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE	3
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE	4
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE	3
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE	4
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE	3
		.BYTE apMoveHorz
		.BYTE 3
		.BYTE	5
		.BYTE	5
		.BYTE	5
		.BYTE	5
		.BYTE	5
		.BYTE	5
		.BYTE	5
		.BYTE apTurnBack
		.BYTE apSetNewActionPtr
		.WORD pMouseAction
pActionMovingForwardInFight1:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE apMoveHorz
		.BYTE 4
		.BYTE apMoveHorz
		.BYTE 2
		.BYTE $A4 ; ¤
		.BYTE $A5 ; ¥
		.BYTE apSetNewActionPtr
		.WORD pGuardStaying
pActionMovingForwardInFight2:.BYTE apSetupUnknown1 ; ...
		.BYTE 1
		.BYTE apMoveHorz
		.BYTE 6
		.BYTE $A4 ; ¤
		.BYTE $A5 ; ¥
		.BYTE apSetNewActionPtr
		.WORD pGuardStaying
pBgEncPtrCharsLibrary:.WORD pBgChars_00	; ...
		.WORD pBgChars_01
		.WORD pBgChars_02
		.WORD pBgChars_03
		.WORD pBgChars_04
		.WORD pBgChars_05
		.WORD pBgChars_06
		.WORD pBgChars_07
		.WORD pBgChars_07
		.WORD pBgChars_09
		.WORD pBgChars_0A
		.WORD pBgChars_0A
		.WORD pBgChars_0C
		.WORD pBgChars_0D
		.WORD pBgChars_0E
		.WORD pBgChars_0E
		.WORD pBgChars_10
		.WORD pBgChars_11
		.WORD pBgChars_12
		.WORD pBgChars_13
		.WORD pBgChars_14
		.WORD pBgChars_14
		.WORD pBgChars_16
		.WORD pBgChars_17
		.WORD pBgChars_17
		.WORD pBgChars_17
		.WORD pBgChars_17
		.WORD pBgChars_1B
		.WORD pBgChars_1B
		.WORD pBgChars_1D
		.WORD pBgChars_1E
		.WORD pBgChars_1F
		.WORD pBgChars_20
		.WORD pBgChars_21
		.WORD pBgChars_22
		.WORD pBgChars_23
		.WORD pBgChars_24
		.WORD pBgChars_25
		.WORD pBgChars_26
		.WORD pBgChars_27
		.WORD pBgChars_28
		.WORD pBgChars_29
		.WORD pBgChars_2A
		.WORD pBgChars_2B
		.WORD pBgChars_2C
		.WORD pBgChars_2D
		.WORD pBgChars_2E
		.WORD pBgChars_2F
		.WORD pBgChars_30
		.WORD pBgChars_31
		.WORD pBgChars_32
		.WORD pBgChars_32
		.WORD pBgChars_32
		.WORD pBgChars_35
		.WORD pBgChars_2D
		.WORD pBgChars_2D
		.WORD pBgChars_38
pBgChars_01:	.WORD PTR_A940|BANK_1	; ...
		.WORD PTR_A950|BANK_1
		.WORD PTR_A960|BANK_1
		.WORD PTR_A970|BANK_1
		.WORD PTR_A980|BANK_1
		.WORD PTR_A990|BANK_1
		.WORD PTR_A9A0|BANK_1
		.WORD PTR_A9B0|BANK_1
		.WORD PTR_A9C0|BANK_1
		.WORD PTR_A9D0|BANK_1
		.WORD PTR_A9E0|BANK_1
		.WORD PTR_A9F0|BANK_1
		.WORD PTR_AA00|BANK_1
		.WORD PTR_AA10|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_02:	.WORD PTR_A940|BANK_1	; ...
		.WORD PTR_A950|BANK_1
		.WORD PTR_B110|BANK_1
		.WORD PTR_B120|BANK_1
		.WORD PTR_B130|BANK_1
		.WORD PTR_B140|BANK_1
		.WORD PTR_B150|BANK_1
		.WORD PTR_B160|BANK_1
		.WORD PTR_B170|BANK_1
		.WORD PTR_B180|BANK_1
		.WORD PTR_9E40|BANK_1
		.WORD PTR_B190|BANK_1
		.WORD PTR_B1A0|BANK_1
		.WORD PTR_B1B0|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_03:	.WORD PTR_AA20|BANK_1	; ...
		.WORD PTR_AA30|BANK_1
		.WORD PTR_B210|BANK_1
		.WORD PTR_B220|BANK_1
		.WORD PTR_B230|BANK_1
		.WORD PTR_B240|BANK_1
		.WORD PTR_B250|BANK_1
		.WORD PTR_B260|BANK_1
		.WORD PTR_AD40|BANK_1
		.WORD PTR_B270|BANK_1
		.WORD PTR_B280|BANK_1
		.WORD PTR_B290|BANK_1
		.WORD PTR_B2A0|BANK_1
		.WORD PTR_B2B0|BANK_1
		.WORD PTR_B2C0|BANK_1
		.WORD PTR_B2D0|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_04:	.WORD PTR_A940|BANK_1	; ...
		.WORD PTR_A950|BANK_1
		.WORD PTR_B2E0|BANK_1
		.WORD PTR_B2F0|BANK_1
		.WORD PTR_B110|BANK_0
		.WORD PTR_B300|BANK_1
		.WORD PTR_B310|BANK_1
		.WORD PTR_B320|BANK_1
		.WORD PTR_B330|BANK_1
		.WORD PTR_B340|BANK_1
		.WORD PTR_B350|BANK_1
		.WORD PTR_B360|BANK_1
		.WORD PTR_B370|BANK_1
		.WORD PTR_B380|BANK_1
		.WORD PTR_B390|BANK_1
		.WORD PTR_B3A0|BANK_1
		.WORD PTR_B3B0|BANK_1
		.WORD PTR_B3C0|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_05:	.WORD PTR_B3D0|BANK_1	; ...
		.WORD PTR_B3E0|BANK_1
		.WORD PTR_B3F0|BANK_1
		.WORD PTR_B400|BANK_1
		.WORD PTR_B410|BANK_1
		.WORD PTR_B420|BANK_1
		.WORD PTR_B430|BANK_1
		.WORD PTR_B440|BANK_1
		.WORD PTR_B450|BANK_1
		.WORD PTR_B340|BANK_1
		.WORD PTR_B460|BANK_1
		.WORD PTR_B470|BANK_1
		.WORD PTR_B480|BANK_1
		.WORD PTR_B490|BANK_1
		.WORD PTR_B380|BANK_1
		.WORD PTR_B4A0|BANK_1
		.WORD PTR_B4B0|BANK_1
		.WORD PTR_B4C0|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_06:	.WORD PTR_B4D0|BANK_1	; ...
		.WORD PTR_B4E0|BANK_1
		.WORD PTR_B4F0|BANK_1
		.WORD PTR_B500|BANK_1
		.WORD PTR_B510|BANK_1
		.WORD PTR_B520|BANK_1
		.WORD PTR_B530|BANK_1
		.WORD PTR_B540|BANK_1
		.WORD PTR_B550|BANK_1
		.WORD PTR_B560|BANK_1
		.WORD PTR_B570|BANK_1
		.WORD PTR_B580|BANK_1
		.WORD PTR_B590|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_07:	.WORD PTR_AA20|BANK_1	; ...
		.WORD PTR_AA30|BANK_1
		.WORD PTR_ACD0|BANK_1
		.WORD PTR_ACE0|BANK_1
		.WORD PTR_AF20|BANK_0
		.WORD PTR_ACF0|BANK_1
		.WORD PTR_AD00|BANK_1
		.WORD PTR_AD10|BANK_1
		.WORD PTR_AD20|BANK_1
		.WORD PTR_AD30|BANK_1
		.WORD PTR_AD40|BANK_1
		.WORD PTR_B5A0|BANK_1
		.WORD PTR_AD50|BANK_1
		.WORD PTR_AD60|BANK_1
		.WORD PTR_AD70|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_09:	.WORD PTR_B5B0|BANK_1	; ...
		.WORD PTR_B5C0|BANK_1
		.WORD PTR_B5D0|BANK_1
		.WORD PTR_B5E0|BANK_1
		.WORD PTR_B5F0|BANK_1
		.WORD PTR_B600|BANK_1
		.WORD PTR_B610|BANK_1
		.WORD PTR_B620|BANK_1
		.WORD PTR_B630|BANK_1
		.WORD PTR_B640|BANK_1
		.WORD PTR_B650|BANK_1
		.WORD PTR_ACA0|BANK_1
		.WORD PTR_B660|BANK_1
		.WORD PTR_B670|BANK_1
		.WORD PTR_B680|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_0A:	.WORD PTR_B690|BANK_1	; ...
		.WORD PTR_B6A0|BANK_1
		.WORD PTR_B6B0|BANK_1
		.WORD PTR_B6C0|BANK_1
		.WORD PTR_B6D0|BANK_1
		.WORD PTR_B6E0|BANK_1
		.WORD PTR_B6F0|BANK_1
		.WORD PTR_B700|BANK_1
		.WORD PTR_B710|BANK_1
		.WORD PTR_B720|BANK_1
		.WORD PTR_B730|BANK_1
		.WORD PTR_B740|BANK_1
		.WORD PTR_B750|BANK_1
		.WORD PTR_B760|BANK_1
		.WORD PTR_B770|BANK_1
		.WORD PTR_B780|BANK_1
		.WORD PTR_B790|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_0C:	.WORD PTR_B7A0|BANK_1	; ...
		.WORD PTR_B7B0|BANK_1
		.WORD PTR_B7C0|BANK_1
		.WORD PTR_B7D0|BANK_1
		.WORD PTR_B7E0|BANK_1
		.WORD PTR_B7F0|BANK_1
		.WORD PTR_B800|BANK_1
		.WORD PTR_AD40|BANK_1
		.WORD PTR_B810|BANK_1
		.WORD PTR_B820|BANK_1
		.WORD PTR_B830|BANK_1
		.WORD PTR_8900|BANK_0
		.WORD PTR_ACA0|BANK_1
		.WORD PTR_B840|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_0D:	.WORD PTR_B850|BANK_1	; ...
		.WORD PTR_AF90|BANK_1
		.WORD PTR_AFA0|BANK_1
		.WORD PTR_B860|BANK_1
		.WORD PTR_B870|BANK_1
		.WORD PTR_AB50|BANK_1
		.WORD PTR_B880|BANK_1
		.WORD PTR_B890|BANK_1
		.WORD PTR_B8A0|BANK_1
		.WORD PTR_B8B0|BANK_1
		.WORD PTR_B8C0|BANK_1
		.WORD PTR_AD40|BANK_1
		.WORD PTR_B8D0|BANK_1
		.WORD PTR_B8E0|BANK_1
		.WORD PTR_B8F0|BANK_1
		.WORD PTR_B900|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_0E:	.WORD PTR_AA20|BANK_1	; ...
		.WORD PTR_AA30|BANK_1
		.WORD PTR_ACD0|BANK_1
		.WORD PTR_B910|BANK_1
		.WORD PTR_B920|BANK_1
		.WORD PTR_B930|BANK_1
		.WORD PTR_B940|BANK_1
		.WORD PTR_B340|BANK_1
		.WORD PTR_B950|BANK_1
		.WORD PTR_B960|BANK_1
		.WORD PTR_B370|BANK_1
		.WORD PTR_B380|BANK_1
		.WORD PTR_B970|BANK_1
		.WORD PTR_B3C0|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_10:	.WORD PTR_AA20|BANK_1	; ...
		.WORD PTR_AA30|BANK_1
		.WORD PTR_AA40|BANK_1
		.WORD PTR_AA50|BANK_1
		.WORD PTR_AA60|BANK_1
		.WORD PTR_AA70|BANK_1
		.WORD PTR_AA80|BANK_1
		.WORD PTR_AA90|BANK_1
		.WORD PTR_AAA0|BANK_1
		.WORD PTR_AAB0|BANK_1
		.WORD PTR_AAC0|BANK_1
		.WORD PTR_AAD0|BANK_1
		.WORD PTR_AAE0|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_11:	.WORD PTR_AAF0|BANK_1	; ...
		.WORD PTR_AB00|BANK_1
		.WORD PTR_AB10|BANK_1
		.WORD PTR_AB20|BANK_1
		.WORD PTR_AB30|BANK_1
		.WORD PTR_AB40|BANK_1
		.WORD PTR_AB50|BANK_1
		.WORD PTR_AB60|BANK_1
		.WORD PTR_AB70|BANK_1
		.WORD PTR_AB80|BANK_1
		.WORD PTR_AB90|BANK_1
		.WORD PTR_ABA0|BANK_1
		.WORD PTR_ABB0|BANK_1
		.WORD PTR_ABC0|BANK_1
		.WORD PTR_ABD0|BANK_1
		.WORD PTR_ABE0|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_12:	.WORD PTR_ABF0|BANK_1	; ...
		.WORD PTR_AC00|BANK_1
		.WORD PTR_AC10|BANK_1
		.WORD PTR_AC20|BANK_1
		.WORD PTR_AC30|BANK_1
		.WORD PTR_AC40|BANK_1
		.WORD PTR_AC50|BANK_1
		.WORD PTR_AC60|BANK_1
		.WORD PTR_AB70|BANK_1
		.WORD PTR_AC70|BANK_1
		.WORD PTR_AC80|BANK_1
		.WORD PTR_AC90|BANK_1
		.WORD PTR_ACA0|BANK_1
		.WORD PTR_ACB0|BANK_1
		.WORD PTR_ACC0|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_13:	.WORD PTR_AA20|BANK_1	; ...
		.WORD PTR_AA30|BANK_1
		.WORD PTR_ACD0|BANK_1
		.WORD PTR_ACE0|BANK_1
		.WORD PTR_AF20|BANK_0
		.WORD PTR_ACF0|BANK_1
		.WORD PTR_AD00|BANK_1
		.WORD PTR_AD10|BANK_1
		.WORD PTR_AD20|BANK_1
		.WORD PTR_AD30|BANK_1
		.WORD PTR_AD40|BANK_1
		.WORD PTR_AD50|BANK_1
		.WORD PTR_AD60|BANK_1
		.WORD PTR_AD70|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_14:	.WORD PTR_AD80|BANK_1	; ...
		.WORD PTR_AD90|BANK_1
		.WORD PTR_ADA0|BANK_1
		.WORD PTR_ADB0|BANK_1
		.WORD PTR_ADC0|BANK_1
		.WORD PTR_ADD0|BANK_1
		.WORD PTR_ADE0|BANK_1
		.WORD PTR_AD40|BANK_1
		.WORD PTR_ADF0|BANK_1
		.WORD PTR_AE00|BANK_1
		.WORD PTR_AE10|BANK_1
		.WORD PTR_AE20|BANK_1
		.WORD PTR_AE30|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_16:	.WORD PTR_AE40|BANK_1	; ...
		.WORD PTR_AE50|BANK_1
		.WORD PTR_AE60|BANK_1
		.WORD PTR_AE70|BANK_1
		.WORD PTR_AE80|BANK_1
		.WORD PTR_AE90|BANK_1
		.WORD PTR_AEA0|BANK_1
		.WORD PTR_AEB0|BANK_1
		.WORD PTR_AEC0|BANK_1
		.WORD PTR_AED0|BANK_1
		.WORD PTR_AEE0|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_17:	.WORD PTR_AEF0|BANK_1	; ...
		.WORD PTR_AF00|BANK_1
		.WORD PTR_AF10|BANK_1
		.WORD PTR_AF20|BANK_1
		.WORD PTR_AF30|BANK_1
		.WORD PTR_AF40|BANK_1
		.WORD PTR_AF50|BANK_1
		.WORD PTR_AF60|BANK_1
		.WORD PTR_AF70|BANK_1
		.WORD PTR_AF80|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_1B:	.WORD PTR_AF90|BANK_1	; ...
		.WORD PTR_AFA0|BANK_1
		.WORD PTR_AFB0|BANK_1
		.WORD PTR_AFC0|BANK_1
		.WORD PTR_AFD0|BANK_1
		.WORD PTR_AFE0|BANK_1
		.WORD PTR_AFF0|BANK_1
		.WORD PTR_B000|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_1D:	.WORD PTR_B010|BANK_1	; ...
		.WORD PTR_B020|BANK_1
		.WORD PTR_B030|BANK_1
		.WORD PTR_B040|BANK_1
		.WORD PTR_B050|BANK_1
		.WORD PTR_B060|BANK_1
		.WORD PTR_B070|BANK_1
		.WORD PTR_B080|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_1E:	.WORD PTR_B090|BANK_1	; ...
		.WORD PTR_B0A0|BANK_1
		.WORD PTR_B0B0|BANK_1
		.WORD PTR_B0C0|BANK_1
		.WORD PTR_B0D0|BANK_1
		.WORD PTR_B0E0|BANK_1
		.WORD PTR_B0F0|BANK_1
		.WORD PTR_B100|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_1F:	.WORD PTR_B1C0|BANK_1	; ...
		.WORD PTR_B1D0|BANK_1
		.WORD PTR_B1E0|BANK_1
		.WORD PTR_B1F0|BANK_1
		.WORD PTR_B200|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_20:	.WORD PTR_B980|BANK_1	; ...
		.WORD PTR_B990|BANK_1
		.WORD PTR_B9A0|BANK_1
		.WORD PTR_B9B0|BANK_1
		.WORD PTR_B9C0|BANK_1
		.WORD PTR_B9D0|BANK_1
		.WORD PTR_B9E0|BANK_1
		.WORD PTR_B9F0|BANK_1
		.WORD PTR_BA00|BANK_1
		.WORD PTR_BA10|BANK_1
		.WORD PTR_BA20|BANK_1
		.WORD PTR_BA30|BANK_1
		.WORD PTR_BA40|BANK_1
		.WORD PTR_BA50|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_21:	.WORD PTR_BF40|BANK_1	; ...
		.WORD PTR_BF50|BANK_1
		.WORD PTR_BF60|BANK_1
		.WORD PTR_BF70|BANK_1
		.WORD PTR_BF80|BANK_1
		.WORD PTR_BF90|BANK_1
		.WORD PTR_BFA0|BANK_1
		.WORD PTR_A8E0|BANK_1
		.WORD PTR_BFB0|BANK_1
		.WORD PTR_BFC0|BANK_1
		.WORD PTR_A920|BANK_1
		.WORD PTR_BA40|BANK_1
		.WORD PTR_BA50|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_22:	.WORD PTR_A4F0|BANK_1	; ...
		.WORD PTR_A500|BANK_1
		.WORD PTR_BFD0|BANK_1
		.WORD PTR_BFE0|BANK_1
		.WORD PTR_BFF0|BANK_1
		.WORD PTR_8000|BANK_2
		.WORD PTR_8010|BANK_2
		.WORD PTR_8020|BANK_2
		.WORD PTR_8030|BANK_2
		.WORD PTR_8040|BANK_2
		.WORD PTR_8050|BANK_2
		.WORD PTR_8060|BANK_2
		.WORD PTR_8070|BANK_2
		.WORD PTR_8080|BANK_2
		.WORD PTR_8090|BANK_2
		.BYTE $FF
		.BYTE $FF
pBgChars_23:	.WORD PTR_80A0|BANK_2	; ...
		.WORD PTR_80B0|BANK_2
		.WORD PTR_80C0|BANK_2
		.WORD PTR_80D0|BANK_2
		.WORD PTR_80E0|BANK_2
		.WORD PTR_80F0|BANK_2
		.WORD PTR_8100|BANK_2
		.WORD PTR_8110|BANK_2
		.WORD PTR_BAB0|BANK_1
		.WORD PTR_8120|BANK_2
		.WORD PTR_8130|BANK_2
		.WORD PTR_8140|BANK_2
		.WORD PTR_8150|BANK_2
		.WORD PTR_BAE0|BANK_1
		.WORD PTR_8090|BANK_2
		.BYTE $FF
		.BYTE $FF
pBgChars_24:	.WORD PTR_8160|BANK_2	; ...
		.WORD PTR_8170|BANK_2
		.WORD PTR_8180|BANK_2
		.WORD PTR_BB10|BANK_1
		.WORD PTR_8190|BANK_2
		.WORD PTR_81A0|BANK_2
		.WORD PTR_81B0|BANK_2
		.WORD PTR_81C0|BANK_2
		.WORD PTR_81D0|BANK_2
		.WORD PTR_81E0|BANK_2
		.WORD PTR_81F0|BANK_2
		.WORD PTR_8200|BANK_2
		.WORD PTR_8210|BANK_2
		.BYTE $FF
		.BYTE $FF
pBgChars_25:	.WORD PTR_8220|BANK_2	; ...
		.WORD PTR_8230|BANK_2
		.WORD PTR_8240|BANK_2
		.WORD PTR_8250|BANK_2
		.WORD PTR_8260|BANK_2
		.WORD PTR_8270|BANK_2
		.WORD PTR_8280|BANK_2
		.WORD PTR_8290|BANK_2
		.WORD PTR_8150|BANK_2
		.WORD PTR_82A0|BANK_2
		.WORD PTR_82B0|BANK_2
		.WORD PTR_82C0|BANK_2
		.BYTE $FF
		.BYTE $FF
pBgChars_26:	.WORD PTR_85C0|BANK_2	; ...
		.WORD PTR_85D0|BANK_2
		.WORD PTR_90C0|BANK_2
		.WORD PTR_90D0|BANK_2
		.WORD PTR_90E0|BANK_2
		.WORD PTR_90F0|BANK_2
		.WORD PTR_9100|BANK_2
		.WORD PTR_9110|BANK_2
		.WORD PTR_9120|BANK_2
		.WORD PTR_9130|BANK_2
		.BYTE $FF
		.BYTE $FF
pBgChars_27:	.WORD PTR_A4F0|BANK_1	; ...
		.WORD PTR_A500|BANK_1
		.WORD PTR_A510|BANK_1
		.WORD PTR_A520|BANK_1
		.WORD PTR_A530|BANK_1
		.WORD PTR_A540|BANK_1
		.WORD PTR_A550|BANK_1
		.WORD PTR_A560|BANK_1
		.WORD PTR_A570|BANK_1
		.WORD PTR_A580|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_28:	.WORD PTR_A590|BANK_1	; ...
		.WORD PTR_A5A0|BANK_1
		.WORD PTR_A5B0|BANK_1
		.WORD PTR_A5C0|BANK_1
		.WORD PTR_A5D0|BANK_1
		.WORD PTR_A5E0|BANK_1
		.WORD PTR_A5F0|BANK_1
		.WORD PTR_A600|BANK_1
		.WORD PTR_A610|BANK_1
		.WORD PTR_A620|BANK_1
		.WORD PTR_A630|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_29:	.WORD PTR_85C0|BANK_2	; ...
		.WORD PTR_8710|BANK_2
		.WORD PTR_8720|BANK_2
		.WORD PTR_8730|BANK_2
		.WORD PTR_8740|BANK_2
		.WORD PTR_8750|BANK_2
		.WORD PTR_8760|BANK_2
		.WORD PTR_8770|BANK_2
		.WORD PTR_8780|BANK_2
		.WORD PTR_8790|BANK_2
		.WORD PTR_87A0|BANK_2
		.WORD PTR_87B0|BANK_2
		.BYTE $FF
		.BYTE $FF
pBgChars_2A:	.WORD PTR_A640|BANK_1	; ...
		.WORD PTR_A650|BANK_1
		.WORD PTR_A660|BANK_1
		.WORD PTR_A670|BANK_1
		.WORD PTR_A680|BANK_1
		.WORD PTR_A690|BANK_1
		.WORD PTR_A6A0|BANK_1
		.WORD PTR_A6B0|BANK_1
		.WORD PTR_A6C0|BANK_1
		.WORD PTR_A6D0|BANK_1
		.WORD PTR_A6E0|BANK_1
		.WORD PTR_A6F0|BANK_1
		.WORD PTR_A700|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_2B:	.WORD PTR_A710|BANK_1	; ...
		.WORD PTR_A720|BANK_1
		.WORD PTR_A730|BANK_1
		.WORD PTR_A740|BANK_1
		.WORD PTR_A750|BANK_1
		.WORD PTR_A760|BANK_1
		.WORD PTR_A770|BANK_1
		.WORD PTR_A780|BANK_1
		.WORD PTR_A790|BANK_1
		.WORD PTR_A7A0|BANK_1
		.WORD PTR_A7B0|BANK_1
		.WORD PTR_A7C0|BANK_1
		.WORD PTR_A7D0|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_2C:	.WORD PTR_A4F0|BANK_1	; ...
		.WORD PTR_A7E0|BANK_1
		.WORD PTR_A7F0|BANK_1
		.WORD PTR_A800|BANK_1
		.WORD PTR_A810|BANK_1
		.WORD PTR_A820|BANK_1
		.WORD PTR_A830|BANK_1
		.WORD PTR_A840|BANK_1
		.WORD PTR_A850|BANK_1
		.WORD PTR_A860|BANK_1
		.WORD PTR_A870|BANK_1
		.WORD PTR_A880|BANK_1
		.WORD PTR_A890|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_2E:	.WORD PTR_A4F0|BANK_1	; ...
		.WORD PTR_A7E0|BANK_1
		.WORD PTR_A8A0|BANK_1
		.WORD PTR_A8B0|BANK_1
		.WORD PTR_A8C0|BANK_1
		.WORD PTR_A8D0|BANK_1
		.WORD PTR_A8E0|BANK_1
		.WORD PTR_A8F0|BANK_1
		.WORD PTR_A900|BANK_1
		.WORD PTR_A910|BANK_1
		.WORD PTR_A920|BANK_1
		.WORD PTR_A930|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_2F:	.WORD PTR_BA60|BANK_1	; ...
		.WORD PTR_BA70|BANK_1
		.WORD PTR_BA80|BANK_1
		.WORD PTR_BA90|BANK_1
		.WORD PTR_BAA0|BANK_1
		.WORD PTR_BAB0|BANK_1
		.WORD PTR_BAC0|BANK_1
		.WORD PTR_BAD0|BANK_1
		.WORD PTR_BAE0|BANK_1
		.WORD PTR_BAF0|BANK_1
		.WORD PTR_BB00|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_30:	.WORD PTR_BB10|BANK_1	; ...
		.WORD PTR_BB20|BANK_1
		.WORD PTR_BB30|BANK_1
		.WORD PTR_BB40|BANK_1
		.WORD PTR_BB50|BANK_1
		.WORD PTR_BB60|BANK_1
		.WORD PTR_BB70|BANK_1
		.WORD PTR_BB80|BANK_1
		.WORD PTR_BB90|BANK_1
		.WORD PTR_BBA0|BANK_1
		.WORD PTR_BBB0|BANK_1
		.WORD PTR_BBC0|BANK_1
		.WORD PTR_BBD0|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_31:	.WORD PTR_BBE0|BANK_1	; ...
		.WORD PTR_BBF0|BANK_1
		.WORD PTR_BC00|BANK_1
		.WORD PTR_BC10|BANK_1
		.WORD PTR_BC20|BANK_1
		.WORD PTR_BC30|BANK_1
		.WORD PTR_BC40|BANK_1
		.WORD PTR_BC50|BANK_1
		.WORD PTR_BC60|BANK_1
		.WORD PTR_BC70|BANK_1
		.WORD PTR_BC80|BANK_1
		.WORD PTR_BC90|BANK_1
		.WORD PTR_BCA0|BANK_1
		.WORD PTR_BCB0|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_32:	.WORD PTR_BCC0|BANK_1	; ...
		.WORD PTR_BCD0|BANK_1
		.WORD PTR_BCE0|BANK_1
		.WORD PTR_BCF0|BANK_1
		.WORD PTR_BD00|BANK_1
		.WORD PTR_BD10|BANK_1
		.WORD PTR_BD20|BANK_1
		.WORD PTR_BD30|BANK_1
		.WORD PTR_BD40|BANK_1
		.WORD PTR_BD50|BANK_1
		.WORD PTR_BD60|BANK_1
		.WORD PTR_BD70|BANK_1
		.WORD PTR_BD80|BANK_1
		.WORD PTR_BD90|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_35:	.WORD PTR_BCC0|BANK_1	; ...
		.WORD PTR_BCD0|BANK_1
		.WORD PTR_BDA0|BANK_1
		.WORD PTR_BDB0|BANK_1
		.WORD PTR_BDC0|BANK_1
		.WORD PTR_BDD0|BANK_1
		.WORD PTR_BDE0|BANK_1
		.WORD PTR_BDF0|BANK_1
		.WORD PTR_BE00|BANK_1
		.WORD PTR_BE10|BANK_1
		.WORD PTR_BE20|BANK_1
		.WORD PTR_BE30|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_2D:	.WORD PTR_BE40|BANK_1	; ...
		.WORD PTR_BE50|BANK_1
		.WORD PTR_BE60|BANK_1
		.WORD PTR_BE70|BANK_1
		.WORD PTR_BE80|BANK_1
		.WORD PTR_BE90|BANK_1
		.WORD PTR_BEA0|BANK_1
		.WORD PTR_BEB0|BANK_1
		.WORD PTR_BEC0|BANK_1
		.WORD PTR_BED0|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_38:	.WORD PTR_BE50|BANK_1	; ...
		.WORD PTR_BEE0|BANK_1
		.WORD PTR_BEF0|BANK_1
		.WORD PTR_BF00|BANK_1
		.WORD PTR_BF10|BANK_1
		.WORD PTR_BF20|BANK_1
		.WORD PTR_BF30|BANK_1
		.BYTE $FF
		.BYTE $FF
pBgChars_00:	.WORD PTR_8000|BANK_0	; ...
		.WORD PTR_9220|BANK_0
		.WORD PTR_9230|BANK_0
		.WORD PTR_9240|BANK_0
		.WORD PTR_9250|BANK_0
		.WORD PTR_9260|BANK_0
		.WORD PTR_9270|BANK_0
		.WORD PTR_9280|BANK_0
		.WORD PTR_9290|BANK_0
		.WORD PTR_92A0|BANK_0
		.WORD PTR_92B0|BANK_0
		.WORD PTR_92C0|BANK_0
		.WORD PTR_92D0|BANK_0
		.WORD PTR_92E0|BANK_0
		.WORD PTR_92F0|BANK_0
		.WORD PTR_9300|BANK_0
		.WORD PTR_9310|BANK_0
		.WORD PTR_9320|BANK_0
		.WORD PTR_9330|BANK_0
		.WORD PTR_9340|BANK_0
		.WORD PTR_9350|BANK_0
		.WORD PTR_9360|BANK_0
		.WORD PTR_9370|BANK_0
		.WORD PTR_9380|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_01:	.WORD PTR_8000|BANK_0
		.WORD PTR_AAA0|BANK_0
		.WORD PTR_AAB0|BANK_0
		.WORD PTR_AAC0|BANK_0
		.WORD PTR_AAD0|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_02:	.WORD PTR_8000|BANK_0
		.WORD PTR_AE80|BANK_0
		.WORD PTR_AE90|BANK_0
		.WORD PTR_AEA0|BANK_0
		.WORD PTR_AEB0|BANK_0
		.WORD PTR_AEC0|BANK_0
		.WORD PTR_AED0|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_03:	.WORD PTR_8000|BANK_0
		.WORD PTR_AEE0|BANK_0
		.WORD PTR_AEF0|BANK_0
		.WORD PTR_AF00|BANK_0
		.WORD PTR_AF10|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_04:	.WORD PTR_8000|BANK_0
		.WORD PTR_A8C0|BANK_0
		.WORD PTR_A8D0|BANK_0
		.WORD PTR_A8E0|BANK_0
		.WORD PTR_A8F0|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_05:	.WORD PTR_8000|BANK_0
		.WORD PTR_8DE0|BANK_0
		.WORD PTR_AA20|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_06:	.WORD PTR_8000|BANK_0
		.WORD PTR_8B10|BANK_0
		.WORD PTR_8B20|BANK_0
		.WORD PTR_8440|BANK_0
		.WORD PTR_8320|BANK_0
		.WORD PTR_8800|BANK_0
		.WORD PTR_8810|BANK_0
		.WORD PTR_8A10|BANK_0
		.WORD PTR_8450|BANK_0
		.WORD PTR_8750|BANK_0
		.WORD PTR_8820|BANK_0
		.WORD PTR_8830|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_07:	.WORD PTR_8000|BANK_0
		.WORD PTR_8900|BANK_0
		.WORD PTR_8910|BANK_0
		.WORD PTR_8970|BANK_0
		.WORD PTR_8980|BANK_0
		.WORD PTR_AC50|BANK_0
		.WORD PTR_89C0|BANK_0
		.WORD PTR_89D0|BANK_0
		.WORD PTR_AC60|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_08:	.WORD PTR_B700|BANK_0
		.WORD PTR_B710|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_09:	.WORD PTR_B720|BANK_0
		.WORD PTR_B730|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_0A:	.WORD PTR_B870|BANK_0
		.WORD PTR_B880|BANK_0
		.WORD PTR_B890|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_0B:	.WORD PTR_B540|BANK_0
		.WORD PTR_B550|BANK_0
		.WORD PTR_B560|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_0C:	.WORD PTR_B600|BANK_0
		.WORD PTR_B610|BANK_0
		.WORD PTR_B620|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_0D:	.WORD PTR_B630|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_0E:	.WORD PTR_B640|BANK_0
		.WORD PTR_B650|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_0F:	.WORD PTR_B660|BANK_0
		.WORD PTR_B670|BANK_0
		.WORD PTR_B680|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_10:	.WORD PTR_B690|BANK_0
		.WORD PTR_B6A0|BANK_0
		.WORD PTR_B6B0|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_11:	.WORD PTR_B6C0|BANK_0
		.WORD PTR_B6D0|BANK_0
		.WORD PTR_B6E0|BANK_0
		.WORD PTR_B6F0|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_12:	.WORD PTR_B740|BANK_0
		.WORD PTR_B750|BANK_0
		.WORD PTR_B760|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_13:	.WORD PTR_B770|BANK_0
		.WORD PTR_B780|BANK_0
		.WORD PTR_B790|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_14:	.WORD PTR_B7A0|BANK_0
		.WORD PTR_B7B0|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_15:	.WORD PTR_B7A0|BANK_0
		.WORD PTR_B7B0|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_16:	.WORD PTR_B7C0|BANK_0
		.WORD PTR_B7D0|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_17:	.WORD PTR_B7E0|BANK_0
		.WORD PTR_B7F0|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_18:	.WORD PTR_B800|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_19:	.WORD PTR_B810|BANK_0
		.WORD PTR_B820|BANK_0
		.WORD PTR_B830|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_1A:	.WORD PTR_B840|BANK_0
		.WORD PTR_B850|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_1B:	.WORD PTR_B7A0|BANK_0
		.WORD PTR_B860|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_1C:	.WORD PTR_B8A0|BANK_0
		.WORD PTR_B8B0|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_1D:	.WORD PTR_B8C0|BANK_0
		.WORD PTR_B8D0|BANK_0
		.WORD PTR_B8E0|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_1E:	.WORD PTR_B8F0|BANK_0
		.WORD PTR_B900|BANK_0
		.WORD PTR_B910|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_1F:	.WORD PTR_B920|BANK_0
		.WORD PTR_B930|BANK_0
		.WORD PTR_B940|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_20:	.WORD PTR_B950|BANK_0
		.WORD PTR_B960|BANK_0
		.WORD PTR_B970|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_21:	.WORD PTR_B980|BANK_0
		.WORD PTR_B990|BANK_0
		.WORD PTR_B9A0|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_22:	.WORD PTR_B9B0|BANK_0
		.WORD PTR_B9C0|BANK_0
		.WORD PTR_B9D0|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_23:	.WORD PTR_B9E0|BANK_0
		.WORD PTR_B9F0|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_24:	.WORD PTR_BA00|BANK_0
		.WORD PTR_BA10|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_25:	.WORD PTR_BA20|BANK_0
		.WORD PTR_BA30|BANK_0
		.BYTE $FF
		.BYTE $FF
pBgChars_00_EOF:.WORD $FFFF
pPrinceEncPtrCharsLibrary:.WORD	pPrinceChars_00	; ...
		.WORD pPrinceChars_00
		.WORD pPrinceChars_02
		.WORD pPrinceChars_03
		.WORD pPrinceChars_04
		.WORD pPrinceChars_05
		.WORD pPrinceChars_06
		.WORD pPrinceChars_07
		.WORD pPrinceChars_08
		.WORD pPrinceChars_09
		.WORD pPrinceChars_0A
		.WORD pPrinceChars_0B
		.WORD pPrinceChars_0C
		.WORD pPrinceChars_0D
		.WORD pPrinceChars_0E
		.WORD pPrinceChars_0F
		.WORD pPrinceChars_0F
		.WORD pPrinceChars_11
		.WORD pPrinceChars_12
		.WORD pPrinceChars_12
		.WORD pPrinceChars_14
		.WORD pPrinceChars_15
		.WORD pPrinceChars_16
		.WORD pPrinceChars_17
		.WORD pPrinceChars_18
		.WORD pPrinceChars_19
		.WORD pPrinceChars_1A
		.WORD pPrinceChars_1B
		.WORD pPrinceChars_1C
		.WORD pPrinceChars_1D
		.WORD pPrinceChars_1E
		.WORD pPrinceChars_1E
		.WORD pPrinceChars_20
		.WORD pPrinceChars_21
		.WORD pPrinceChars_22
		.WORD pPrinceChars_23
		.WORD pPrinceChars_23
		.WORD pPrinceChars_25
		.WORD pPrinceChars_26
		.WORD pPrinceChars_27
		.WORD pPrinceChars_28
		.WORD pPrinceChars_29
		.WORD pPrinceChars_2A
		.WORD pPrinceChars_2B
		.WORD pPrinceChars_2C
		.WORD pPrinceChars_2D
		.WORD pPrinceChars_2D
		.WORD pPrinceChars_2F
		.WORD pPrinceChars_30
		.WORD pPrinceChars_32
		.WORD pPrinceChars_32
		.WORD pPrinceChars_32
		.WORD pPrinceChars_35
		.WORD pPrinceChars_36
		.WORD pPrinceChars_36
		.WORD pPrinceChars_36
		.WORD pPrinceChars_39
		.WORD pPrinceChars_3A
		.WORD pPrinceChars_3B
		.WORD pPrinceChars_3C
		.WORD pPrinceChars_3D
		.WORD pPrinceChars_3E
		.WORD pPrinceChars_3F
		.WORD pPrinceChars_40
		.WORD pPrinceChars_41
		.WORD pPrinceChars_42
		.WORD pPrinceChars_43
		.WORD pPrinceChars_44
		.WORD pPrinceChars_45
		.WORD pPrinceChars_46
		.WORD pPrinceChars_46
		.WORD pPrinceChars_48
		.WORD pPrinceChars_49
		.WORD pPrinceChars_49
		.WORD pPrinceChars_4B
		.WORD pPrinceChars_4C
		.WORD pPrinceChars_4D
		.WORD pPrinceChars_4E
		.WORD pPrinceChars_4F
		.WORD pPrinceChars_50
		.WORD pPrinceChars_51
		.WORD pPrinceChars_52
		.WORD pPrinceChars_52
		.WORD pPrinceChars_54
		.WORD pPrinceChars_54
		.WORD pPrinceChars_56
		.WORD pPrinceChars_56
		.WORD pPrinceChars_58
		.WORD pPrinceChars_59
		.WORD pPrinceChars_5A
		.WORD pPrinceChars_5B
		.WORD pPrinceChars_5C
		.WORD pPrinceChars_5D
		.WORD pPrinceChars_5E
		.WORD pPrinceChars_5E
		.WORD pPrinceChars_60
		.WORD pPrinceChars_61
		.WORD pPrinceChars_62
		.WORD pPrinceChars_62
		.WORD pPrinceChars_64
		.WORD pPrinceChars_65
		.WORD pPrinceChars_65
		.WORD pPrinceChars_67
		.WORD pPrinceChars_67
		.WORD pPrinceChars_69
		.WORD pPrinceChars_69
		.WORD pPrinceChars_6B
		.WORD pPrinceChars_6B
		.WORD pPrinceChars_6D
		.WORD pPrinceChars_6D
		.WORD pPrinceChars_6F
		.WORD pPrinceChars_6F
		.WORD pPrinceChars_71
		.WORD pPrinceChars_72
		.WORD pPrinceChars_73
		.WORD pPrinceChars_74
		.WORD pPrinceChars_75
		.WORD pPrinceChars_76
		.WORD pPrinceChars_77
		.WORD pPrinceChars_78
		.WORD pPrinceChars_79
		.WORD pPrinceChars_79
		.WORD pPrinceChars_7B
		.WORD pPrinceChars_7C
		.WORD pPrinceChars_7D
		.WORD pPrinceChars_7E
		.WORD pPrinceChars_7F
		.WORD pPrinceChars_80
		.WORD pPrinceChars_81
		.WORD pPrinceChars_82
		.WORD pPrinceChars_82
		.WORD pPrinceChars_82
		.WORD pPrinceChars_82
		.WORD pPrinceChars_86
		.WORD pPrinceChars_87
		.WORD pPrinceChars_88
		.WORD pPrinceChars_89
		.WORD pPrinceChars_8B
		.WORD pPrinceChars_8C
		.WORD pPrinceChars_8C
		.WORD pPrinceChars_8E
		.WORD pPrinceChars_8F
		.WORD pPrinceChars_90
		.WORD pPrinceChars_91
		.WORD pPrinceChars_92
		.WORD pPrinceChars_92
		.WORD pPrinceChars_94
		.WORD pPrinceChars_95
		.WORD pPrinceChars_96
		.WORD pPrinceChars_97
		.WORD pPrinceChars_98
		.WORD pPrinceChars_98
		.WORD pPrinceChars_9A
		.WORD pPrinceChars_9B
		.WORD pPrinceChars_9C
		.WORD pPrinceChars_9D
		.WORD pPrinceChars_9E
		.WORD pPrinceChars_9F
		.WORD pPrinceChars_100
		.WORD pPrinceChars_101
		.WORD pPrinceChars_102
		.WORD pPrinceChars_103
		.WORD pPrinceChars_104
		.WORD pPrinceChars_105
		.WORD pPrinceChars_106
		.WORD pPrinceChars_107
		.WORD pPrinceChars_108
		.WORD pPrinceChars_109
		.WORD pPrinceChars_10A
		.WORD pPrinceChars_10B
		.WORD pPrinceChars_10C
		.WORD pPrinceChars_10D
		.WORD pPrinceChars_10E
		.WORD pPrinceChars_10E
		.WORD pPrinceChars_10E
		.WORD pPrinceChars_111
		.WORD pPrinceChars_112
		.WORD pPrinceChars_113
		.WORD pPrinceChars_114
		.WORD pPrinceChars_115
		.WORD pPrinceChars_116
		.WORD pPrinceChars_117
		.WORD pPrinceChars_118
		.WORD pPrinceChars_118
		.WORD pPrinceChars_11A
		.WORD pPrinceChars_11B
		.WORD pPrinceChars_11B
		.WORD pPrinceChars_11D
		.WORD pPrinceChars_11E
		.WORD pPrinceChars_11F
		.WORD pPrinceChars_120
		.WORD pPrinceChars_121
		.WORD pPrinceChars_122
		.WORD pPrinceChars_123
		.WORD pPrinceChars_123
		.WORD pPrinceChars_125
		.WORD pPrinceChars_125
		.WORD pPrinceChars_127
		.WORD pPrinceChars_128
		.WORD pPrinceChars_128
		.WORD pPrinceChars_12A
		.WORD pPrinceChars_12A
		.WORD pPrinceChars_12C
		.WORD pPrinceChars_12D
		.WORD pPrinceChars_12E
		.WORD pPrinceChars_12F
		.WORD pPrinceChars_130
		.WORD pPrinceChars_131
		.WORD pPrinceChars_132
		.WORD pPrinceChars_133
		.WORD pPrinceChars_134
		.WORD pPrinceChars_135
		.WORD pPrinceChars_136
		.WORD pPrinceChars_137
		.WORD pPrinceChars_138
		.WORD pPrinceChars_139
pPrinceChars_00:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_8020|BANK_0
		.WORD PTR_8030|BANK_0
		.WORD PTR_8040|BANK_0
		.WORD PTR_8050|BANK_0
		.WORD PTR_8060|BANK_0
		.WORD PTR_8070|BANK_0
		.WORD PTR_8080|BANK_0
		.WORD PTR_8090|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_02:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_80A0|BANK_0
		.WORD PTR_80B0|BANK_0
		.WORD PTR_80C0|BANK_0
		.WORD PTR_80D0|BANK_0
		.WORD PTR_80E0|BANK_0
		.WORD PTR_80F0|BANK_0
		.WORD PTR_8100|BANK_0
		.WORD PTR_8110|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_03:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_8120|BANK_0
		.WORD PTR_8130|BANK_0
		.WORD PTR_8140|BANK_0
		.WORD PTR_8150|BANK_0
		.WORD PTR_8160|BANK_0
		.WORD PTR_8170|BANK_0
		.WORD PTR_8180|BANK_0
		.WORD PTR_8190|BANK_0
		.WORD PTR_81A0|BANK_0
		.WORD PTR_81B0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_04:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_81C0|BANK_0
		.WORD PTR_81D0|BANK_0
		.WORD PTR_81E0|BANK_0
		.WORD PTR_81F0|BANK_0
		.WORD PTR_8200|BANK_0
		.WORD PTR_8210|BANK_0
		.WORD PTR_8220|BANK_0
		.WORD PTR_8230|BANK_0
		.WORD PTR_8240|BANK_0
		.WORD PTR_8250|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_05:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_8260|BANK_0
		.WORD PTR_8270|BANK_0
		.WORD PTR_8280|BANK_0
		.WORD PTR_8290|BANK_0
		.WORD PTR_82A0|BANK_0
		.WORD PTR_82B0|BANK_0
		.WORD PTR_82C0|BANK_0
		.WORD PTR_82D0|BANK_0
		.WORD PTR_82E0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_06:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_82F0|BANK_0
		.WORD PTR_8300|BANK_0
		.WORD PTR_8310|BANK_0
		.WORD PTR_8320|BANK_0
		.WORD PTR_8330|BANK_0
		.WORD PTR_8340|BANK_0
		.WORD PTR_8350|BANK_0
		.WORD PTR_8360|BANK_0
		.WORD PTR_8370|BANK_0
		.WORD PTR_8380|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_07:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_8390|BANK_0
		.WORD PTR_83A0|BANK_0
		.WORD PTR_83B0|BANK_0
		.WORD PTR_83C0|BANK_0
		.WORD PTR_83D0|BANK_0
		.WORD PTR_8180|BANK_0
		.WORD PTR_83E0|BANK_0
		.WORD PTR_83F0|BANK_0
		.WORD PTR_8400|BANK_0
		.WORD PTR_8410|BANK_0
		.WORD PTR_8420|BANK_0
		.WORD PTR_8430|BANK_0
		.WORD PTR_8440|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_08:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_8450|BANK_0
		.WORD PTR_8460|BANK_0
		.WORD PTR_8470|BANK_0
		.WORD PTR_8480|BANK_0
		.WORD PTR_8490|BANK_0
		.WORD PTR_84A0|BANK_0
		.WORD PTR_84B0|BANK_0
		.WORD PTR_84C0|BANK_0
		.WORD PTR_84D0|BANK_0
		.WORD PTR_84E0|BANK_0
		.WORD PTR_84F0|BANK_0
		.WORD PTR_8500|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_09:.WORD PTR_8510|BANK_0	; ...
		.WORD PTR_8520|BANK_0
		.WORD PTR_8530|BANK_0
		.WORD PTR_8540|BANK_0
		.WORD PTR_8550|BANK_0
		.WORD PTR_8560|BANK_0
		.WORD PTR_8570|BANK_0
		.WORD PTR_84D0|BANK_0
		.WORD PTR_8580|BANK_0
		.WORD PTR_8500|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_0A:.WORD PTR_8510|BANK_0	; ...
		.WORD PTR_8590|BANK_0
		.WORD PTR_85A0|BANK_0
		.WORD PTR_85B0|BANK_0
		.WORD PTR_85C0|BANK_0
		.WORD PTR_85D0|BANK_0
		.WORD PTR_85E0|BANK_0
		.WORD PTR_85F0|BANK_0
		.WORD PTR_8600|BANK_0
		.WORD PTR_8610|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_0B:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_8620|BANK_0
		.WORD PTR_8630|BANK_0
		.WORD PTR_8640|BANK_0
		.WORD PTR_8650|BANK_0
		.WORD PTR_8660|BANK_0
		.WORD PTR_8670|BANK_0
		.WORD PTR_8680|BANK_0
		.WORD PTR_8690|BANK_0
		.WORD PTR_86A0|BANK_0
		.WORD PTR_86B0|BANK_0
		.WORD PTR_86C0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_0C:.WORD PTR_86D0|BANK_0	; ...
		.WORD PTR_86E0|BANK_0
		.WORD PTR_86F0|BANK_0
		.WORD PTR_8700|BANK_0
		.WORD PTR_8710|BANK_0
		.WORD PTR_8720|BANK_0
		.WORD PTR_8730|BANK_0
		.WORD PTR_84A0|BANK_0
		.WORD PTR_8740|BANK_0
		.WORD PTR_84C0|BANK_0
		.WORD PTR_84D0|BANK_0
		.WORD PTR_84E0|BANK_0
		.WORD PTR_84F0|BANK_0
		.WORD PTR_8500|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_0D:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_8750|BANK_0
		.WORD PTR_8760|BANK_0
		.WORD PTR_8770|BANK_0
		.WORD PTR_8780|BANK_0
		.WORD PTR_8790|BANK_0
		.WORD PTR_87A0|BANK_0
		.WORD PTR_87B0|BANK_0
		.WORD PTR_87C0|BANK_0
		.WORD PTR_87D0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_0E:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_87E0|BANK_0
		.WORD PTR_87F0|BANK_0
		.WORD PTR_8800|BANK_0
		.WORD PTR_8810|BANK_0
		.WORD PTR_8820|BANK_0
		.WORD PTR_8830|BANK_0
		.WORD PTR_8840|BANK_0
		.WORD PTR_8850|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_0F:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_8860|BANK_0
		.WORD PTR_8870|BANK_0
		.WORD PTR_8880|BANK_0
		.WORD PTR_8890|BANK_0
		.WORD PTR_88A0|BANK_0
		.WORD PTR_88B0|BANK_0
		.WORD PTR_88C0|BANK_0
		.WORD PTR_88D0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_11:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_88E0|BANK_0
		.WORD PTR_88F0|BANK_0
		.WORD PTR_8900|BANK_0
		.WORD PTR_8910|BANK_0
		.WORD PTR_8920|BANK_0
		.WORD PTR_8930|BANK_0
		.WORD PTR_8940|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_12:.WORD PTR_8950|BANK_0	; ...
		.WORD PTR_8960|BANK_0
		.WORD PTR_8970|BANK_0
		.WORD PTR_8980|BANK_0
		.WORD PTR_8990|BANK_0
		.WORD PTR_89A0|BANK_0
		.WORD PTR_89B0|BANK_0
		.WORD PTR_8930|BANK_0
		.WORD PTR_8940|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_14:.WORD PTR_8950|BANK_0	; ...
		.WORD PTR_89C0|BANK_0
		.WORD PTR_89D0|BANK_0
		.WORD PTR_89E0|BANK_0
		.WORD PTR_89F0|BANK_0
		.WORD PTR_8A00|BANK_0
		.WORD PTR_8A10|BANK_0
		.WORD PTR_8A20|BANK_0
		.WORD PTR_8A30|BANK_0
		.WORD PTR_8A40|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_15:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_8A50|BANK_0
		.WORD PTR_8A60|BANK_0
		.WORD PTR_8A70|BANK_0
		.WORD PTR_8A80|BANK_0
		.WORD PTR_8A90|BANK_0
		.WORD PTR_8AA0|BANK_0
		.WORD PTR_8AB0|BANK_0
		.WORD PTR_8AC0|BANK_0
		.WORD PTR_8AD0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_16:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_8AE0|BANK_0
		.WORD PTR_8AF0|BANK_0
		.WORD PTR_8B00|BANK_0
		.WORD PTR_8180|BANK_0
		.WORD PTR_8B10|BANK_0
		.WORD PTR_8B20|BANK_0
		.WORD PTR_8B30|BANK_0
		.WORD PTR_8B40|BANK_0
		.WORD PTR_8B50|BANK_0
		.WORD PTR_8B60|BANK_0
		.WORD PTR_8B70|BANK_0
		.WORD PTR_8B80|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_17:.WORD PTR_8B90|BANK_0	; ...
		.WORD PTR_8BA0|BANK_0
		.WORD PTR_8BB0|BANK_0
		.WORD PTR_8BC0|BANK_0
		.WORD PTR_8BD0|BANK_0
		.WORD PTR_8BE0|BANK_0
		.WORD PTR_8BF0|BANK_0
		.WORD PTR_8C00|BANK_0
		.WORD PTR_8C10|BANK_0
		.WORD PTR_8C20|BANK_0
		.WORD PTR_8C30|BANK_0
		.WORD PTR_8C40|BANK_0
		.WORD PTR_8C50|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_18:.WORD PTR_8C60|BANK_0	; ...
		.WORD PTR_8C70|BANK_0
		.WORD PTR_8C80|BANK_0
		.WORD PTR_8C90|BANK_0
		.WORD PTR_8CA0|BANK_0
		.WORD PTR_8BD0|BANK_0
		.WORD PTR_8CB0|BANK_0
		.WORD PTR_8CC0|BANK_0
		.WORD PTR_8CD0|BANK_0
		.WORD PTR_8CE0|BANK_0
		.WORD PTR_8CF0|BANK_0
		.WORD PTR_8D00|BANK_0
		.WORD PTR_8D10|BANK_0
		.WORD PTR_8D20|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_19:.WORD PTR_8D30|BANK_0	; ...
		.WORD PTR_8D40|BANK_0
		.WORD PTR_8D50|BANK_0
		.WORD PTR_8D60|BANK_0
		.WORD PTR_8D70|BANK_0
		.WORD PTR_8D80|BANK_0
		.WORD PTR_8D90|BANK_0
		.WORD PTR_8DA0|BANK_0
		.WORD PTR_8DB0|BANK_0
		.WORD PTR_8DC0|BANK_0
		.WORD PTR_8DD0|BANK_0
		.WORD PTR_8DE0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_1A:.WORD PTR_8D30|BANK_0	; ...
		.WORD PTR_8DF0|BANK_0
		.WORD PTR_8E00|BANK_0
		.WORD PTR_8E10|BANK_0
		.WORD PTR_8E20|BANK_0
		.WORD PTR_8E30|BANK_0
		.WORD PTR_8E40|BANK_0
		.WORD PTR_8E50|BANK_0
		.WORD PTR_8E60|BANK_0
		.WORD PTR_8E70|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_1B:.WORD PTR_8950|BANK_0	; ...
		.WORD PTR_8E80|BANK_0
		.WORD PTR_8E90|BANK_0
		.WORD PTR_8EA0|BANK_0
		.WORD PTR_8EB0|BANK_0
		.WORD PTR_8EC0|BANK_0
		.WORD PTR_8ED0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_1C:.WORD PTR_8EE0|BANK_0	; ...
		.WORD PTR_8EF0|BANK_0
		.WORD PTR_8F00|BANK_0
		.WORD PTR_8F10|BANK_0
		.WORD PTR_8F20|BANK_0
		.WORD PTR_8F30|BANK_0
		.WORD PTR_8F40|BANK_0
		.WORD PTR_8F50|BANK_0
		.WORD PTR_8F60|BANK_0
		.WORD PTR_8F70|BANK_0
		.WORD PTR_8F80|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_1D:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_8F90|BANK_0
		.WORD PTR_8FA0|BANK_0
		.WORD PTR_8FB0|BANK_0
		.WORD PTR_8FC0|BANK_0
		.WORD PTR_8FD0|BANK_0
		.WORD PTR_8FE0|BANK_0
		.WORD PTR_8FF0|BANK_0
		.WORD PTR_9000|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_1E:.WORD PTR_9010|BANK_0	; ...
		.WORD PTR_9020|BANK_0
		.WORD PTR_9030|BANK_0
		.WORD PTR_9040|BANK_0
		.WORD PTR_9050|BANK_0
		.WORD PTR_9060|BANK_0
		.WORD PTR_9070|BANK_0
		.WORD PTR_9080|BANK_0
		.WORD PTR_9090|BANK_0
		.WORD PTR_90A0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_20:.WORD PTR_9010|BANK_0	; ...
		.WORD PTR_9020|BANK_0
		.WORD PTR_90B0|BANK_0
		.WORD PTR_90C0|BANK_0
		.WORD PTR_90D0|BANK_0
		.WORD PTR_90E0|BANK_0
		.WORD PTR_90F0|BANK_0
		.WORD PTR_9100|BANK_0
		.WORD PTR_8940|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_21:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_9110|BANK_0
		.WORD PTR_9120|BANK_0
		.WORD PTR_9130|BANK_0
		.WORD PTR_9140|BANK_0
		.WORD PTR_9150|BANK_0
		.WORD PTR_9160|BANK_0
		.WORD PTR_9170|BANK_0
		.WORD PTR_9180|BANK_0
		.WORD PTR_9190|BANK_0
		.WORD PTR_91A0|BANK_0
		.WORD PTR_91B0|BANK_0
		.WORD PTR_91C0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_22:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_91D0|BANK_0
		.WORD PTR_91E0|BANK_0
		.WORD PTR_91F0|BANK_0
		.WORD PTR_9200|BANK_0
		.WORD PTR_9210|BANK_0
		.WORD PTR_9220|BANK_0
		.WORD PTR_9230|BANK_0
		.WORD PTR_9240|BANK_0
		.WORD PTR_9250|BANK_0
		.WORD PTR_9260|BANK_0
		.WORD PTR_9270|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_23:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_9280|BANK_0
		.WORD PTR_9290|BANK_0
		.WORD PTR_92A0|BANK_0
		.WORD PTR_92B0|BANK_0
		.WORD PTR_92C0|BANK_0
		.WORD PTR_92D0|BANK_0
		.WORD PTR_92E0|BANK_0
		.WORD PTR_92F0|BANK_0
		.WORD PTR_9300|BANK_0
		.WORD PTR_9310|BANK_0
		.WORD PTR_9320|BANK_0
		.WORD PTR_9330|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_25:.WORD PTR_8EE0|BANK_0	; ...
		.WORD PTR_9340|BANK_0
		.WORD PTR_9350|BANK_0
		.WORD PTR_9360|BANK_0
		.WORD PTR_9370|BANK_0
		.WORD PTR_9380|BANK_0
		.WORD PTR_9390|BANK_0
		.WORD PTR_93A0|BANK_0
		.WORD PTR_93B0|BANK_0
		.WORD PTR_93C0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_26:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_8AE0|BANK_0
		.WORD PTR_93D0|BANK_0
		.WORD PTR_93E0|BANK_0
		.WORD PTR_93F0|BANK_0
		.WORD PTR_9400|BANK_0
		.WORD PTR_9410|BANK_0
		.WORD PTR_9420|BANK_0
		.WORD PTR_9430|BANK_0
		.WORD PTR_9440|BANK_0
		.WORD PTR_9450|BANK_0
		.WORD PTR_9460|BANK_0
		.WORD PTR_9470|BANK_0
		.WORD PTR_9480|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_27:.WORD PTR_9490|BANK_0	; ...
		.WORD PTR_94A0|BANK_0
		.WORD PTR_94B0|BANK_0
		.WORD PTR_94C0|BANK_0
		.WORD PTR_94D0|BANK_0
		.WORD PTR_94E0|BANK_0
		.WORD PTR_94F0|BANK_0
		.WORD PTR_9500|BANK_0
		.WORD PTR_9510|BANK_0
		.WORD PTR_9520|BANK_0
		.WORD PTR_9530|BANK_0
		.WORD PTR_9540|BANK_0
		.WORD PTR_9550|BANK_0
		.WORD PTR_9560|BANK_0
		.WORD PTR_9570|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_28:.WORD PTR_9580|BANK_0	; ...
		.WORD PTR_9590|BANK_0
		.WORD PTR_95A0|BANK_0
		.WORD PTR_95B0|BANK_0
		.WORD PTR_95C0|BANK_0
		.WORD PTR_95D0|BANK_0
		.WORD PTR_94E0|BANK_0
		.WORD PTR_95E0|BANK_0
		.WORD PTR_95F0|BANK_0
		.WORD PTR_9600|BANK_0
		.WORD PTR_9610|BANK_0
		.WORD PTR_9620|BANK_0
		.WORD PTR_9630|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_29:.WORD PTR_9640|BANK_0	; ...
		.WORD PTR_9650|BANK_0
		.WORD PTR_9660|BANK_0
		.WORD PTR_9670|BANK_0
		.WORD PTR_9680|BANK_0
		.WORD PTR_9690|BANK_0
		.WORD PTR_96A0|BANK_0
		.WORD PTR_96B0|BANK_0
		.WORD PTR_96C0|BANK_0
		.WORD PTR_96D0|BANK_0
		.WORD PTR_96E0|BANK_0
		.WORD PTR_96F0|BANK_0
		.WORD PTR_9700|BANK_0
		.WORD PTR_9710|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_2A:.WORD PTR_9640|BANK_0	; ...
		.WORD PTR_9650|BANK_0
		.WORD PTR_9720|BANK_0
		.WORD PTR_9730|BANK_0
		.WORD PTR_9740|BANK_0
		.WORD PTR_9750|BANK_0
		.WORD PTR_9760|BANK_0
		.WORD PTR_9770|BANK_0
		.WORD PTR_9780|BANK_0
		.WORD PTR_9790|BANK_0
		.WORD PTR_97A0|BANK_0
		.WORD PTR_97B0|BANK_0
		.WORD PTR_97C0|BANK_0
		.WORD PTR_97D0|BANK_0
		.WORD PTR_97E0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_2B:.WORD PTR_9640|BANK_0	; ...
		.WORD PTR_9650|BANK_0
		.WORD PTR_97F0|BANK_0
		.WORD PTR_9800|BANK_0
		.WORD PTR_9810|BANK_0
		.WORD PTR_9820|BANK_0
		.WORD PTR_9830|BANK_0
		.WORD PTR_9840|BANK_0
		.WORD PTR_9850|BANK_0
		.WORD PTR_9860|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_2C:.WORD PTR_9870|BANK_0	; ...
		.WORD PTR_9880|BANK_0
		.WORD PTR_9890|BANK_0
		.WORD PTR_98A0|BANK_0
		.WORD PTR_98B0|BANK_0
		.WORD PTR_98C0|BANK_0
		.WORD PTR_98D0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_2D:.WORD PTR_98E0|BANK_0	; ...
		.WORD PTR_98F0|BANK_0
		.WORD PTR_9900|BANK_0
		.WORD PTR_9910|BANK_0
		.WORD PTR_9920|BANK_0
		.WORD PTR_9930|BANK_0
		.WORD PTR_9940|BANK_0
		.WORD PTR_9950|BANK_0
		.WORD PTR_9960|BANK_0
		.WORD PTR_9970|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_2F:.WORD PTR_9010|BANK_0	; ...
		.WORD PTR_9020|BANK_0
		.WORD PTR_9980|BANK_0
		.WORD PTR_9990|BANK_0
		.WORD PTR_99A0|BANK_0
		.WORD PTR_99B0|BANK_0
		.WORD PTR_99C0|BANK_0
		.WORD PTR_9970|BANK_0
		.WORD PTR_99D0|BANK_0
		.WORD PTR_99E0|BANK_0
		.WORD PTR_99F0|BANK_0
		.WORD PTR_9A00|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_30:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_9A10|BANK_0
		.WORD PTR_9A20|BANK_0
		.WORD PTR_9A30|BANK_0
		.WORD PTR_9A40|BANK_0
		.WORD PTR_9A50|BANK_0
		.WORD PTR_9A60|BANK_0
		.WORD PTR_9A70|BANK_0
		.WORD PTR_9A80|BANK_0
		.WORD PTR_9A90|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_32:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_9AA0|BANK_0
		.WORD PTR_9AB0|BANK_0
		.WORD PTR_9AC0|BANK_0
		.WORD PTR_9AD0|BANK_0
		.WORD PTR_9AE0|BANK_0
		.WORD PTR_9AF0|BANK_0
		.WORD PTR_9B00|BANK_0
		.WORD PTR_9B10|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_35:.WORD PTR_9B20|BANK_0	; ...
		.WORD PTR_9B30|BANK_0
		.WORD PTR_9B40|BANK_0
		.WORD PTR_9B50|BANK_0
		.WORD PTR_9B60|BANK_0
		.WORD PTR_9B70|BANK_0
		.WORD PTR_9B80|BANK_0
		.WORD PTR_9B90|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_36:.WORD PTR_9BA0|BANK_0	; ...
		.WORD PTR_9BB0|BANK_0
		.WORD PTR_9BC0|BANK_0
		.WORD PTR_9BD0|BANK_0
		.WORD PTR_9BE0|BANK_0
		.WORD PTR_9BF0|BANK_0
		.WORD PTR_9C00|BANK_0
		.WORD PTR_9C10|BANK_0
		.WORD PTR_9C20|BANK_0
		.WORD PTR_9C30|BANK_0
		.WORD PTR_9C40|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_39:.WORD PTR_9C50|BANK_0	; ...
		.WORD PTR_9C60|BANK_0
		.WORD PTR_9C70|BANK_0
		.WORD PTR_9C80|BANK_0
		.WORD PTR_9C90|BANK_0
		.WORD PTR_9CA0|BANK_0
		.WORD PTR_9CB0|BANK_0
		.WORD PTR_9CC0|BANK_0
		.WORD PTR_9CD0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_3A:.WORD PTR_9CE0|BANK_0	; ...
		.WORD PTR_9CF0|BANK_0
		.WORD PTR_9D00|BANK_0
		.WORD PTR_9D10|BANK_0
		.WORD PTR_9D20|BANK_0
		.WORD PTR_9D30|BANK_0
		.WORD PTR_9D40|BANK_0
		.WORD PTR_9D50|BANK_0
		.WORD PTR_9D60|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_3B:.WORD PTR_9D70|BANK_0	; ...
		.WORD PTR_9D80|BANK_0
		.WORD PTR_9D90|BANK_0
		.WORD PTR_9DA0|BANK_0
		.WORD PTR_9DB0|BANK_0
		.WORD PTR_9DC0|BANK_0
		.WORD PTR_9DD0|BANK_0
		.WORD PTR_9DE0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_3C:.WORD PTR_9DF0|BANK_0	; ...
		.WORD PTR_9E00|BANK_0
		.WORD PTR_9E10|BANK_0
		.WORD PTR_9E20|BANK_0
		.WORD PTR_9E30|BANK_0
		.WORD PTR_9E40|BANK_0
		.WORD PTR_9E50|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_3D:.WORD PTR_9E60|BANK_0	; ...
		.WORD PTR_9E70|BANK_0
		.WORD PTR_9E80|BANK_0
		.WORD PTR_9E90|BANK_0
		.WORD PTR_9EA0|BANK_0
		.WORD PTR_9EB0|BANK_0
		.WORD PTR_9EC0|BANK_0
		.WORD PTR_9ED0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_3E:.WORD PTR_9EE0|BANK_0	; ...
		.WORD PTR_9EF0|BANK_0
		.WORD PTR_9F00|BANK_0
		.WORD PTR_9F10|BANK_0
		.WORD PTR_9F20|BANK_0
		.WORD PTR_9F30|BANK_0
		.WORD PTR_9F40|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_3F:.WORD PTR_9F50|BANK_0	; ...
		.WORD PTR_9F60|BANK_0
		.WORD PTR_9F70|BANK_0
		.WORD PTR_9F80|BANK_0
		.WORD PTR_9F90|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_40:.WORD PTR_9FA0|BANK_0	; ...
		.WORD PTR_9FB0|BANK_0
		.WORD PTR_9FC0|BANK_0
		.WORD PTR_9FD0|BANK_0
		.WORD PTR_9FE0|BANK_0
		.WORD PTR_9FF0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_41:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_A000|BANK_0
		.WORD PTR_A010|BANK_0
		.WORD PTR_A020|BANK_0
		.WORD PTR_A030|BANK_0
		.WORD PTR_A040|BANK_0
		.WORD PTR_A050|BANK_0
		.WORD PTR_A060|BANK_0
		.WORD PTR_A070|BANK_0
		.WORD PTR_A080|BANK_0
		.WORD PTR_A090|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_42:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_A0A0|BANK_0
		.WORD PTR_A0B0|BANK_0
		.WORD PTR_9A30|BANK_0
		.WORD PTR_A0C0|BANK_0
		.WORD PTR_A0D0|BANK_0
		.WORD PTR_A0E0|BANK_0
		.WORD PTR_A0F0|BANK_0
		.WORD PTR_A100|BANK_0
		.WORD PTR_A110|BANK_0
		.WORD PTR_A120|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_43:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_A130|BANK_0
		.WORD PTR_A140|BANK_0
		.WORD PTR_A150|BANK_0
		.WORD PTR_A160|BANK_0
		.WORD PTR_A170|BANK_0
		.WORD PTR_A180|BANK_0
		.WORD PTR_A190|BANK_0
		.WORD PTR_A1A0|BANK_0
		.WORD PTR_A1B0|BANK_0
		.WORD PTR_A1C0|BANK_0
		.WORD PTR_A1D0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_44:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_A1E0|BANK_0
		.WORD PTR_A1F0|BANK_0
		.WORD PTR_A200|BANK_0
		.WORD PTR_A210|BANK_0
		.WORD PTR_A220|BANK_0
		.WORD PTR_A230|BANK_0
		.WORD PTR_A240|BANK_0
		.WORD PTR_A250|BANK_0
		.WORD PTR_A260|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_45:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_A270|BANK_0
		.WORD PTR_A280|BANK_0
		.WORD PTR_A290|BANK_0
		.WORD PTR_A2A0|BANK_0
		.WORD PTR_A2B0|BANK_0
		.WORD PTR_A2C0|BANK_0
		.WORD PTR_A2D0|BANK_0
		.WORD PTR_A2E0|BANK_0
		.WORD PTR_A2F0|BANK_0
		.WORD PTR_A300|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_46:.WORD PTR_A310|BANK_0	; ...
		.WORD PTR_A320|BANK_0
		.WORD PTR_A330|BANK_0
		.WORD PTR_A340|BANK_0
		.WORD PTR_A350|BANK_0
		.WORD PTR_A360|BANK_0
		.WORD PTR_A370|BANK_0
		.WORD PTR_A380|BANK_0
		.WORD PTR_A390|BANK_0
		.WORD PTR_A3A0|BANK_0
		.WORD PTR_A3B0|BANK_0
		.WORD PTR_A3C0|BANK_0
		.WORD PTR_A3D0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_48:.WORD PTR_A3E0|BANK_0	; ...
		.WORD PTR_A3F0|BANK_0
		.WORD PTR_A400|BANK_0
		.WORD PTR_A410|BANK_0
		.WORD PTR_A420|BANK_0
		.WORD PTR_A430|BANK_0
		.WORD PTR_A440|BANK_0
		.WORD PTR_A450|BANK_0
		.WORD PTR_A460|BANK_0
		.WORD PTR_A470|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_49:.WORD PTR_A480|BANK_0	; ...
		.WORD PTR_A490|BANK_0
		.WORD PTR_A4A0|BANK_0
		.WORD PTR_A4B0|BANK_0
		.WORD PTR_A4C0|BANK_0
		.WORD PTR_A4D0|BANK_0
		.WORD PTR_A4E0|BANK_0
		.WORD PTR_A4F0|BANK_0
		.WORD PTR_A500|BANK_0
		.WORD PTR_A510|BANK_0
		.WORD PTR_A520|BANK_0
		.WORD PTR_A530|BANK_0
		.WORD PTR_A540|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_4B:.WORD PTR_A550|BANK_0	; ...
		.WORD PTR_A560|BANK_0
		.WORD PTR_A570|BANK_0
		.WORD PTR_A580|BANK_0
		.WORD PTR_A590|BANK_0
		.WORD PTR_A5A0|BANK_0
		.WORD PTR_A5B0|BANK_0
		.WORD PTR_A510|BANK_0
		.WORD PTR_A5C0|BANK_0
		.WORD PTR_A5D0|BANK_0
		.WORD PTR_A5E0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_4C:.WORD PTR_A5F0|BANK_0	; ...
		.WORD PTR_9B30|BANK_0
		.WORD PTR_A600|BANK_0
		.WORD PTR_A610|BANK_0
		.WORD PTR_A620|BANK_0
		.WORD PTR_A630|BANK_0
		.WORD PTR_A640|BANK_0
		.WORD PTR_A650|BANK_0
		.WORD PTR_A660|BANK_0
		.WORD PTR_A670|BANK_0
		.WORD PTR_A680|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_4D:.WORD PTR_A5F0|BANK_0	; ...
		.WORD PTR_9B30|BANK_0
		.WORD PTR_A690|BANK_0
		.WORD PTR_A6A0|BANK_0
		.WORD PTR_A6B0|BANK_0
		.WORD PTR_A6C0|BANK_0
		.WORD PTR_A6D0|BANK_0
		.WORD PTR_A6E0|BANK_0
		.WORD PTR_A6F0|BANK_0
		.WORD PTR_A700|BANK_0
		.WORD PTR_A710|BANK_0
		.WORD PTR_A720|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_4E:.WORD PTR_A730|BANK_0	; ...
		.WORD PTR_A740|BANK_0
		.WORD PTR_A750|BANK_0
		.WORD PTR_A760|BANK_0
		.WORD PTR_A770|BANK_0
		.WORD PTR_A780|BANK_0
		.WORD PTR_A790|BANK_0
		.WORD PTR_A7A0|BANK_0
		.WORD PTR_A7B0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_4F:.WORD PTR_A7C0|BANK_0	; ...
		.WORD PTR_A7D0|BANK_0
		.WORD PTR_A7E0|BANK_0
		.WORD PTR_A7F0|BANK_0
		.WORD PTR_A800|BANK_0
		.WORD PTR_A810|BANK_0
		.WORD PTR_A820|BANK_0
		.WORD PTR_A830|BANK_0
		.WORD PTR_A840|BANK_0
		.WORD PTR_A850|BANK_0
		.WORD PTR_A860|BANK_0
		.WORD PTR_A870|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_50:.WORD PTR_A880|BANK_0	; ...
		.WORD PTR_A890|BANK_0
		.WORD PTR_A8A0|BANK_0
		.WORD PTR_A8B0|BANK_0
		.WORD PTR_A8C0|BANK_0
		.WORD PTR_A8D0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_51:.WORD PTR_A8E0|BANK_0	; ...
		.WORD PTR_A8F0|BANK_0
		.WORD PTR_A900|BANK_0
		.WORD PTR_A910|BANK_0
		.WORD PTR_A920|BANK_0
		.WORD PTR_A930|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_52:.WORD PTR_A940|BANK_0	; ...
		.WORD PTR_A950|BANK_0
		.WORD PTR_A960|BANK_0
		.WORD PTR_A970|BANK_0
		.WORD PTR_A980|BANK_0
		.WORD PTR_A990|BANK_0
		.WORD PTR_A9A0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_54:.WORD PTR_A940|BANK_0	; ...
		.WORD PTR_A9B0|BANK_0
		.WORD PTR_A9C0|BANK_0
		.WORD PTR_A9D0|BANK_0
		.WORD PTR_A9E0|BANK_0
		.WORD PTR_A9F0|BANK_0
		.WORD PTR_AA00|BANK_0
		.WORD PTR_AA10|BANK_0
		.WORD PTR_AA20|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_56:.WORD PTR_AA30|BANK_0	; ...
		.WORD PTR_AA40|BANK_0
		.WORD PTR_AA50|BANK_0
		.WORD PTR_AA60|BANK_0
		.WORD PTR_AA70|BANK_0
		.WORD PTR_AA80|BANK_0
		.WORD PTR_AA90|BANK_0
		.WORD PTR_AA10|BANK_0
		.WORD PTR_AA20|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_58:.WORD PTR_AA30|BANK_0	; ...
		.WORD PTR_AAA0|BANK_0
		.WORD PTR_AAB0|BANK_0
		.WORD PTR_AAC0|BANK_0
		.WORD PTR_AAD0|BANK_0
		.WORD PTR_AAE0|BANK_0
		.WORD PTR_AAF0|BANK_0
		.WORD PTR_AB00|BANK_0
		.WORD PTR_AB10|BANK_0
		.WORD PTR_AB20|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_59:.WORD PTR_AA30|BANK_0	; ...
		.WORD PTR_AB30|BANK_0
		.WORD PTR_AB40|BANK_0
		.WORD PTR_A690|BANK_0
		.WORD PTR_AB50|BANK_0
		.WORD PTR_AB60|BANK_0
		.WORD PTR_AB70|BANK_0
		.WORD PTR_AB80|BANK_0
		.WORD PTR_AB90|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_5A:.WORD PTR_AA30|BANK_0	; ...
		.WORD PTR_ABA0|BANK_0
		.WORD PTR_ABB0|BANK_0
		.WORD PTR_ABC0|BANK_0
		.WORD PTR_ABD0|BANK_0
		.WORD PTR_ABE0|BANK_0
		.WORD PTR_ABF0|BANK_0
		.WORD PTR_AC00|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_5B:.WORD PTR_AC10|BANK_0	; ...
		.WORD PTR_AC20|BANK_0
		.WORD PTR_AC30|BANK_0
		.WORD PTR_AC40|BANK_0
		.WORD PTR_AC50|BANK_0
		.WORD PTR_AC60|BANK_0
		.WORD PTR_AC70|BANK_0
		.WORD PTR_AC80|BANK_0
		.WORD PTR_AC90|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_5C:.WORD PTR_ACA0|BANK_0	; ...
		.WORD PTR_ACB0|BANK_0
		.WORD PTR_ACC0|BANK_0
		.WORD PTR_ACD0|BANK_0
		.WORD PTR_ACE0|BANK_0
		.WORD PTR_ACF0|BANK_0
		.WORD PTR_AD00|BANK_0
		.WORD PTR_AD10|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_5D:.WORD PTR_AD20|BANK_0	; ...
		.WORD PTR_AD30|BANK_0
		.WORD PTR_AD40|BANK_0
		.WORD PTR_AD50|BANK_0
		.WORD PTR_AD60|BANK_0
		.WORD PTR_AD70|BANK_0
		.WORD PTR_AD80|BANK_0
		.WORD PTR_AD90|BANK_0
		.WORD PTR_ADA0|BANK_0
		.WORD PTR_ADB0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_5E:.WORD PTR_ADC0|BANK_0	; ...
		.WORD PTR_ADD0|BANK_0
		.WORD PTR_AD40|BANK_0
		.WORD PTR_ADE0|BANK_0
		.WORD PTR_ADF0|BANK_0
		.WORD PTR_AE00|BANK_0
		.WORD PTR_AE10|BANK_0
		.WORD PTR_ACF0|BANK_0
		.WORD PTR_ACE0|BANK_0
		.WORD PTR_AE20|BANK_0
		.WORD PTR_AE30|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_60:.WORD PTR_AE40|BANK_0	; ...
		.WORD PTR_AE50|BANK_0
		.WORD PTR_AE60|BANK_0
		.WORD PTR_AD90|BANK_0
		.WORD PTR_AE70|BANK_0
		.WORD PTR_AE80|BANK_0
		.WORD PTR_AE90|BANK_0
		.WORD PTR_ACE0|BANK_0
		.WORD PTR_AEA0|BANK_0
		.WORD PTR_AEB0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_61:.WORD PTR_ADD0|BANK_0	; ...
		.WORD PTR_AEC0|BANK_0
		.WORD PTR_AED0|BANK_0
		.WORD PTR_AEE0|BANK_0
		.WORD PTR_AEF0|BANK_0
		.WORD PTR_AF00|BANK_0
		.WORD PTR_AF10|BANK_0
		.WORD PTR_AF20|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_62:.WORD PTR_AF30|BANK_0	; ...
		.WORD PTR_AF40|BANK_0
		.WORD PTR_AF50|BANK_0
		.WORD PTR_AF60|BANK_0
		.WORD PTR_AF70|BANK_0
		.WORD PTR_AF80|BANK_0
		.WORD PTR_AF90|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_64:.WORD PTR_AFA0|BANK_0	; ...
		.WORD PTR_AFB0|BANK_0
		.WORD PTR_AFC0|BANK_0
		.WORD PTR_AFD0|BANK_0
		.WORD PTR_AFE0|BANK_0
		.WORD PTR_AFF0|BANK_0
		.WORD PTR_B000|BANK_0
		.WORD PTR_B010|BANK_0
		.WORD PTR_B020|BANK_0
		.WORD PTR_B030|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_65:.WORD PTR_AFA0|BANK_0	; ...
		.WORD PTR_B040|BANK_0
		.WORD PTR_B050|BANK_0
		.WORD PTR_B060|BANK_0
		.WORD PTR_B070|BANK_0
		.WORD PTR_B080|BANK_0
		.WORD PTR_B090|BANK_0
		.WORD PTR_B0A0|BANK_0
		.WORD PTR_B0B0|BANK_0
		.WORD PTR_B0C0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_67:.WORD PTR_AFA0|BANK_0	; ...
		.WORD PTR_B0D0|BANK_0
		.WORD PTR_B0E0|BANK_0
		.WORD PTR_B0F0|BANK_0
		.WORD PTR_B100|BANK_0
		.WORD PTR_B110|BANK_0
		.WORD PTR_B120|BANK_0
		.WORD PTR_B130|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_69:.WORD PTR_B140|BANK_0	; ...
		.WORD PTR_B150|BANK_0
		.WORD PTR_B160|BANK_0
		.WORD PTR_B170|BANK_0
		.WORD PTR_B180|BANK_0
		.WORD PTR_B190|BANK_0
		.WORD PTR_ACE0|BANK_0
		.WORD PTR_B1A0|BANK_0
		.WORD PTR_AD00|BANK_0
		.WORD PTR_B1B0|BANK_0
		.WORD PTR_9410|BANK_0
		.WORD PTR_B1C0|BANK_0
		.WORD PTR_B1D0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_6B:.WORD PTR_B1E0|BANK_0	; ...
		.WORD PTR_B1F0|BANK_0
		.WORD PTR_B160|BANK_0
		.WORD PTR_B200|BANK_0
		.WORD PTR_AD00|BANK_0
		.WORD PTR_B210|BANK_0
		.WORD PTR_B220|BANK_0
		.WORD PTR_B230|BANK_0
		.WORD PTR_B240|BANK_0
		.WORD PTR_B250|BANK_0
		.WORD PTR_B260|BANK_0
		.WORD PTR_B270|BANK_0
		.WORD PTR_B280|BANK_0
		.WORD PTR_B290|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_6D:.WORD PTR_B1E0|BANK_0	; ...
		.WORD PTR_B2A0|BANK_0
		.WORD PTR_B160|BANK_0
		.WORD PTR_B2B0|BANK_0
		.WORD PTR_B2C0|BANK_0
		.WORD PTR_B2D0|BANK_0
		.WORD PTR_B2E0|BANK_0
		.WORD PTR_B2F0|BANK_0
		.WORD PTR_B300|BANK_0
		.WORD PTR_B310|BANK_0
		.WORD PTR_B320|BANK_0
		.WORD PTR_B330|BANK_0
		.WORD PTR_B340|BANK_0
		.WORD PTR_B350|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_6F:.WORD PTR_B1E0|BANK_0	; ...
		.WORD PTR_B360|BANK_0
		.WORD PTR_B160|BANK_0
		.WORD PTR_B370|BANK_0
		.WORD PTR_B180|BANK_0
		.WORD PTR_B380|BANK_0
		.WORD PTR_B390|BANK_0
		.WORD PTR_B3A0|BANK_0
		.WORD PTR_B3B0|BANK_0
		.WORD PTR_B3C0|BANK_0
		.WORD PTR_B3D0|BANK_0
		.WORD PTR_B3E0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_71:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_B3F0|BANK_0
		.WORD PTR_B400|BANK_0
		.WORD PTR_B410|BANK_0
		.WORD PTR_B420|BANK_0
		.WORD PTR_B430|BANK_0
		.WORD PTR_B440|BANK_0
		.WORD PTR_B450|BANK_0
		.WORD PTR_B460|BANK_0
		.WORD PTR_8500|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_72:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_B470|BANK_0
		.WORD PTR_B480|BANK_0
		.WORD PTR_B490|BANK_0
		.WORD PTR_B4A0|BANK_0
		.WORD PTR_B4B0|BANK_0
		.WORD PTR_B4C0|BANK_0
		.WORD PTR_B4D0|BANK_0
		.WORD PTR_B4E0|BANK_0
		.WORD PTR_B4F0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_73:.WORD PTR_B500|BANK_0	; ...
		.WORD PTR_B510|BANK_0
		.WORD PTR_B520|BANK_0
		.WORD PTR_B530|BANK_0
		.WORD PTR_B540|BANK_0
		.WORD PTR_B550|BANK_0
		.WORD PTR_B560|BANK_0
		.WORD PTR_B570|BANK_0
		.WORD PTR_B580|BANK_0
		.WORD PTR_B590|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_74:.WORD PTR_B5A0|BANK_0	; ...
		.WORD PTR_B5B0|BANK_0
		.WORD PTR_B5C0|BANK_0
		.WORD PTR_B5D0|BANK_0
		.WORD PTR_B5E0|BANK_0
		.WORD PTR_B5F0|BANK_0
		.WORD PTR_B600|BANK_0
		.WORD PTR_B610|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_75:.WORD PTR_B620|BANK_0	; ...
		.WORD PTR_B630|BANK_0
		.WORD PTR_B640|BANK_0
		.WORD PTR_B650|BANK_0
		.WORD PTR_B660|BANK_0
		.WORD PTR_B670|BANK_0
		.WORD PTR_B680|BANK_0
		.WORD PTR_B690|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_76:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_B6A0|BANK_0
		.WORD PTR_B6B0|BANK_0
		.WORD PTR_B6C0|BANK_0
		.WORD PTR_B6D0|BANK_0
		.WORD PTR_B6E0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_77:.WORD PTR_B6F0|BANK_0	; ...
		.WORD PTR_B700|BANK_0
		.WORD PTR_B710|BANK_0
		.WORD PTR_B720|BANK_0
		.WORD PTR_B730|BANK_0
		.WORD PTR_B740|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_78:.WORD PTR_B750|BANK_0	; ...
		.WORD PTR_B760|BANK_0
		.WORD PTR_B770|BANK_0
		.WORD PTR_B780|BANK_0
		.WORD PTR_B790|BANK_0
		.WORD PTR_B7A0|BANK_0
		.WORD PTR_B7B0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_79:.WORD PTR_B7C0|BANK_0	; ...
		.WORD PTR_B7D0|BANK_0
		.WORD PTR_B7E0|BANK_0
		.WORD PTR_B7F0|BANK_0
		.WORD PTR_B800|BANK_0
		.WORD PTR_B810|BANK_0
		.WORD PTR_B820|BANK_0
		.WORD PTR_B830|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_7B:.WORD PTR_B6F0|BANK_0	; ...
		.WORD PTR_B840|BANK_0
		.WORD PTR_B850|BANK_0
		.WORD PTR_B860|BANK_0
		.WORD PTR_B870|BANK_0
		.WORD PTR_B880|BANK_0
		.WORD PTR_B890|BANK_0
		.WORD PTR_B8A0|BANK_0
		.WORD PTR_B8B0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_7C:.WORD PTR_B6F0|BANK_0	; ...
		.WORD PTR_B8C0|BANK_0
		.WORD PTR_B8D0|BANK_0
		.WORD PTR_B8E0|BANK_0
		.WORD PTR_B8F0|BANK_0
		.WORD PTR_B900|BANK_0
		.WORD PTR_B910|BANK_0
		.WORD PTR_B920|BANK_0
		.WORD PTR_B930|BANK_0
		.WORD PTR_B940|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_7D:.WORD PTR_B950|BANK_0	; ...
		.WORD PTR_B960|BANK_0
		.WORD PTR_B970|BANK_0
		.WORD PTR_B980|BANK_0
		.WORD PTR_B990|BANK_0
		.WORD PTR_B9A0|BANK_0
		.WORD PTR_B9B0|BANK_0
		.WORD PTR_B9C0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_7E:.WORD PTR_B950|BANK_0	; ...
		.WORD PTR_B960|BANK_0
		.WORD PTR_B9D0|BANK_0
		.WORD PTR_B9E0|BANK_0
		.WORD PTR_B9F0|BANK_0
		.WORD PTR_BA00|BANK_0
		.WORD PTR_BA10|BANK_0
		.WORD PTR_BA20|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_7F:.WORD PTR_BA30|BANK_0	; ...
		.WORD PTR_BA40|BANK_0
		.WORD PTR_BA50|BANK_0
		.WORD PTR_BA60|BANK_0
		.WORD PTR_BA70|BANK_0
		.WORD PTR_BA80|BANK_0
		.WORD PTR_BA90|BANK_0
		.WORD PTR_BAA0|BANK_0
		.WORD PTR_BAB0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_80:.WORD PTR_BA30|BANK_0	; ...
		.WORD PTR_BAC0|BANK_0
		.WORD PTR_BAD0|BANK_0
		.WORD PTR_BAE0|BANK_0
		.WORD PTR_B780|BANK_0
		.WORD PTR_BAF0|BANK_0
		.WORD PTR_B7B0|BANK_0
		.WORD PTR_BB00|BANK_0
		.WORD PTR_BB10|BANK_0
		.WORD PTR_BB20|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_81:.WORD PTR_BB30|BANK_0	; ...
		.WORD PTR_BB40|BANK_0
		.WORD PTR_BB50|BANK_0
		.WORD PTR_BB60|BANK_0
		.WORD PTR_BB70|BANK_0
		.WORD PTR_BB80|BANK_0
		.WORD PTR_BB90|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_82:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_BBA0|BANK_0
		.WORD PTR_BBB0|BANK_0
		.WORD PTR_BBC0|BANK_0
		.WORD PTR_BBD0|BANK_0
		.WORD PTR_BBE0|BANK_0
		.WORD PTR_BBF0|BANK_0
		.WORD PTR_BC00|BANK_0
		.WORD PTR_BC10|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_86:.WORD PTR_BC20|BANK_0	; ...
		.WORD PTR_BC30|BANK_0
		.WORD PTR_BC40|BANK_0
		.WORD PTR_BC50|BANK_0
		.WORD PTR_BC60|BANK_0
		.WORD PTR_BC70|BANK_0
		.WORD PTR_BC80|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_87:.WORD PTR_BC20|BANK_0	; ...
		.WORD PTR_BC90|BANK_0
		.WORD PTR_BCA0|BANK_0
		.WORD PTR_BCB0|BANK_0
		.WORD PTR_BCC0|BANK_0
		.WORD PTR_BCD0|BANK_0
		.WORD PTR_BCE0|BANK_0
		.WORD PTR_BCF0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_88:.WORD PTR_BC20|BANK_0	; ...
		.WORD PTR_BD00|BANK_0
		.WORD PTR_BD10|BANK_0
		.WORD PTR_BD20|BANK_0
		.WORD PTR_BD30|BANK_0
		.WORD PTR_BD40|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_89:.WORD PTR_BC20|BANK_0	; ...
		.WORD PTR_BD50|BANK_0
		.WORD PTR_BD60|BANK_0
		.WORD PTR_BD70|BANK_0
		.WORD PTR_BD80|BANK_0
		.WORD PTR_BD90|BANK_0
		.WORD PTR_BDA0|BANK_0
		.WORD PTR_BDB0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_8B:.WORD PTR_BC20|BANK_0	; ...
		.WORD PTR_BDC0|BANK_0
		.WORD PTR_BDD0|BANK_0
		.WORD PTR_BDE0|BANK_0
		.WORD PTR_BDF0|BANK_0
		.WORD PTR_BE00|BANK_0
		.WORD PTR_BE10|BANK_0
		.WORD PTR_BE20|BANK_0
		.WORD PTR_BE30|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_8C:.WORD PTR_BC20|BANK_0	; ...
		.WORD PTR_BDC0|BANK_0
		.WORD PTR_BE40|BANK_0
		.WORD PTR_BE50|BANK_0
		.WORD PTR_BE60|BANK_0
		.WORD PTR_BE70|BANK_0
		.WORD PTR_BE80|BANK_0
		.WORD PTR_BE90|BANK_0
		.WORD PTR_BEA0|BANK_0
		.WORD PTR_BEB0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_8E:.WORD PTR_BC20|BANK_0	; ...
		.WORD PTR_BDC0|BANK_0
		.WORD PTR_BE40|BANK_0
		.WORD PTR_BE50|BANK_0
		.WORD PTR_BE60|BANK_0
		.WORD PTR_BE70|BANK_0
		.WORD PTR_BE80|BANK_0
		.WORD PTR_BE90|BANK_0
		.WORD PTR_BEA0|BANK_0
		.WORD PTR_BEB0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_8F:.WORD PTR_BC20|BANK_0	; ...
		.WORD PTR_BEC0|BANK_0
		.WORD PTR_BED0|BANK_0
		.WORD PTR_BEE0|BANK_0
		.WORD PTR_BEF0|BANK_0
		.WORD PTR_BF00|BANK_0
		.WORD PTR_BF10|BANK_0
		.WORD PTR_BF20|BANK_0
		.WORD PTR_BF30|BANK_0
		.WORD PTR_BF40|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_90:.WORD PTR_BC20|BANK_0	; ...
		.WORD PTR_BEC0|BANK_0
		.WORD PTR_BED0|BANK_0
		.WORD PTR_BEE0|BANK_0
		.WORD PTR_BEF0|BANK_0
		.WORD PTR_BF50|BANK_0
		.WORD PTR_BF60|BANK_0
		.WORD PTR_BF70|BANK_0
		.WORD PTR_BF80|BANK_0
		.WORD PTR_BF90|BANK_0
		.BYTE $FF
		.BYTE $FF
pPrinceChars_91:.WORD PTR_BFA0|BANK_0	; ...
		.WORD PTR_BFB0|BANK_0
		.WORD PTR_BFC0|BANK_0
		.WORD PTR_BFD0|BANK_0
		.WORD PTR_BFE0|BANK_0
		.WORD PTR_BFF0|BANK_0
		.WORD PTR_8000|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_92:.WORD PTR_8010|BANK_1	; ...
		.WORD PTR_8020|BANK_1
		.WORD PTR_8030|BANK_1
		.WORD PTR_8040|BANK_1
		.WORD PTR_8050|BANK_1
		.WORD PTR_8060|BANK_1
		.WORD PTR_8070|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_94:.WORD PTR_8080|BANK_1	; ...
		.WORD PTR_86E0|BANK_0
		.WORD PTR_8090|BANK_1
		.WORD PTR_80A0|BANK_1
		.WORD PTR_80B0|BANK_1
		.WORD PTR_80C0|BANK_1
		.WORD PTR_80D0|BANK_1
		.WORD PTR_80E0|BANK_1
		.WORD PTR_80F0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_95:.WORD PTR_8100|BANK_1	; ...
		.WORD PTR_8110|BANK_1
		.WORD PTR_8120|BANK_1
		.WORD PTR_8130|BANK_1
		.WORD PTR_8140|BANK_1
		.WORD PTR_8150|BANK_1
		.WORD PTR_8160|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_96:.WORD PTR_8170|BANK_1	; ...
		.WORD PTR_8180|BANK_1
		.WORD PTR_8190|BANK_1
		.WORD PTR_81A0|BANK_1
		.WORD PTR_81B0|BANK_1
		.WORD PTR_81C0|BANK_1
		.WORD PTR_81D0|BANK_1
		.WORD PTR_81E0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_97:.WORD PTR_8170|BANK_1	; ...
		.WORD PTR_8180|BANK_1
		.WORD PTR_8190|BANK_1
		.WORD PTR_81F0|BANK_1
		.WORD PTR_8200|BANK_1
		.WORD PTR_8210|BANK_1
		.WORD PTR_8220|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_98:.WORD PTR_8D30|BANK_0	; ...
		.WORD PTR_8230|BANK_1
		.WORD PTR_8240|BANK_1
		.WORD PTR_8250|BANK_1
		.WORD PTR_8260|BANK_1
		.WORD PTR_8270|BANK_1
		.WORD PTR_8280|BANK_1
		.WORD PTR_8290|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_9A:.WORD PTR_8D30|BANK_0	; ...
		.WORD PTR_8230|BANK_1
		.WORD PTR_82A0|BANK_1
		.WORD PTR_82B0|BANK_1
		.WORD PTR_82C0|BANK_1
		.WORD PTR_82D0|BANK_1
		.WORD PTR_82E0|BANK_1
		.WORD PTR_82F0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_9B:.WORD PTR_8300|BANK_1	; ...
		.WORD PTR_8310|BANK_1
		.WORD PTR_8320|BANK_1
		.WORD PTR_8330|BANK_1
		.WORD PTR_8340|BANK_1
		.WORD PTR_8350|BANK_1
		.WORD PTR_8360|BANK_1
		.WORD PTR_8370|BANK_1
		.WORD PTR_8380|BANK_1
		.WORD PTR_8390|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_9C:.WORD PTR_83A0|BANK_1	; ...
		.WORD PTR_83B0|BANK_1
		.WORD PTR_83C0|BANK_1
		.WORD PTR_83D0|BANK_1
		.WORD PTR_83E0|BANK_1
		.WORD PTR_83F0|BANK_1
		.WORD PTR_8400|BANK_1
		.WORD PTR_8410|BANK_1
		.WORD PTR_8420|BANK_1
		.WORD PTR_8430|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_9D:.WORD PTR_8D30|BANK_0	; ...
		.WORD PTR_8440|BANK_1
		.WORD PTR_8450|BANK_1
		.WORD PTR_8460|BANK_1
		.WORD PTR_8470|BANK_1
		.WORD PTR_8480|BANK_1
		.WORD PTR_8490|BANK_1
		.WORD PTR_84A0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_9E:.WORD PTR_84B0|BANK_1	; ...
		.WORD PTR_84C0|BANK_1
		.WORD PTR_84D0|BANK_1
		.WORD PTR_84E0|BANK_1
		.WORD PTR_84F0|BANK_1
		.WORD PTR_8500|BANK_1
		.WORD PTR_8510|BANK_1
		.WORD PTR_8520|BANK_1
		.WORD PTR_8530|BANK_1
		.WORD PTR_8540|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_9F:.WORD PTR_84B0|BANK_1	; ...
		.WORD PTR_8550|BANK_1
		.WORD PTR_8560|BANK_1
		.WORD PTR_8570|BANK_1
		.WORD PTR_8580|BANK_1
		.WORD PTR_8590|BANK_1
		.WORD PTR_85A0|BANK_1
		.WORD PTR_85B0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_100:.WORD PTR_85C0|BANK_1	; ...
		.WORD PTR_85D0|BANK_1
		.WORD PTR_85E0|BANK_1
		.WORD PTR_85F0|BANK_1
		.WORD PTR_8600|BANK_1
		.WORD PTR_8610|BANK_1
		.WORD PTR_8620|BANK_1
		.WORD PTR_8630|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_101:.WORD PTR_BFA0|BANK_0	; ...
		.WORD PTR_8640|BANK_1
		.WORD PTR_8650|BANK_1
		.WORD PTR_8660|BANK_1
		.WORD PTR_8670|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_102:.WORD PTR_8680|BANK_1	; ...
		.WORD PTR_8690|BANK_1
		.WORD PTR_86A0|BANK_1
		.WORD PTR_86B0|BANK_1
		.WORD PTR_86C0|BANK_1
		.WORD PTR_86D0|BANK_1
		.WORD PTR_86E0|BANK_1
		.WORD PTR_86F0|BANK_1
		.WORD PTR_8700|BANK_1
		.WORD PTR_8710|BANK_1
		.WORD PTR_8720|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_103:.WORD PTR_8730|BANK_1	; ...
		.WORD PTR_8740|BANK_1
		.WORD PTR_8750|BANK_1
		.WORD PTR_8760|BANK_1
		.WORD PTR_8770|BANK_1
		.WORD PTR_8780|BANK_1
		.WORD PTR_8790|BANK_1
		.WORD PTR_87A0|BANK_1
		.WORD PTR_87B0|BANK_1
		.WORD PTR_87C0|BANK_1
		.WORD PTR_8720|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_104:.WORD PTR_87D0|BANK_1	; ...
		.WORD PTR_87E0|BANK_1
word_5B0E9:	.WORD PTR_87F0|BANK_1
		.WORD PTR_8800|BANK_1
		.WORD PTR_8810|BANK_1
		.WORD PTR_8820|BANK_1
		.WORD PTR_8830|BANK_1
		.WORD PTR_8840|BANK_1
		.WORD PTR_8850|BANK_1
		.WORD PTR_8710|BANK_1
		.WORD PTR_8720|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_105:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_8860|BANK_1
		.WORD PTR_8870|BANK_1
		.WORD PTR_8880|BANK_1
		.WORD PTR_8890|BANK_1
		.WORD PTR_88A0|BANK_1
		.WORD PTR_88B0|BANK_1
		.WORD PTR_88C0|BANK_1
		.WORD PTR_88D0|BANK_1
		.WORD PTR_88E0|BANK_1
		.WORD PTR_88F0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_106:.WORD PTR_8900|BANK_1	; ...
		.WORD PTR_8910|BANK_1
		.WORD PTR_8920|BANK_1
		.WORD PTR_8930|BANK_1
		.WORD PTR_8940|BANK_1
		.WORD PTR_8950|BANK_1
		.WORD PTR_8960|BANK_1
		.WORD PTR_8970|BANK_1
		.WORD PTR_8980|BANK_1
		.WORD PTR_8990|BANK_1
		.WORD PTR_89A0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_107:.WORD PTR_89B0|BANK_1	; ...
		.WORD PTR_89C0|BANK_1
		.WORD PTR_89D0|BANK_1
		.WORD PTR_89E0|BANK_1
		.WORD PTR_89F0|BANK_1
		.WORD PTR_8A00|BANK_1
		.WORD PTR_8A10|BANK_1
		.WORD PTR_8A20|BANK_1
		.WORD PTR_8A30|BANK_1
		.WORD PTR_8990|BANK_1
		.WORD PTR_89A0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_108:.WORD PTR_8A40|BANK_1	; ...
		.WORD PTR_8A50|BANK_1
		.WORD PTR_89D0|BANK_1
		.WORD PTR_8A60|BANK_1
		.WORD PTR_8A70|BANK_1
		.WORD PTR_8A80|BANK_1
		.WORD PTR_8A90|BANK_1
		.WORD PTR_8AA0|BANK_1
		.WORD PTR_8AB0|BANK_1
		.WORD PTR_8AC0|BANK_1
		.WORD PTR_8AD0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_109:.WORD PTR_8A40|BANK_1	; ...
		.WORD PTR_8A50|BANK_1
		.WORD PTR_87F0|BANK_1
		.WORD PTR_8A60|BANK_1
		.WORD PTR_8A70|BANK_1
		.WORD PTR_8A80|BANK_1
		.WORD PTR_8A90|BANK_1
		.WORD PTR_8AA0|BANK_1
		.WORD PTR_8AB0|BANK_1
		.WORD PTR_8AC0|BANK_1
		.WORD PTR_8AD0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_10A:.WORD PTR_8AE0|BANK_1	; ...
		.WORD PTR_8AF0|BANK_1
		.WORD PTR_8B00|BANK_1
		.WORD PTR_8B10|BANK_1
		.WORD PTR_8B20|BANK_1
		.WORD PTR_8B30|BANK_1
		.WORD PTR_8B40|BANK_1
		.WORD PTR_8B50|BANK_1
		.WORD PTR_8B60|BANK_1
		.WORD PTR_8B70|BANK_1
		.WORD PTR_8B80|BANK_1
		.WORD PTR_8B90|BANK_1
		.WORD PTR_8BA0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_10B:.WORD PTR_8BB0|BANK_1	; ...
		.WORD PTR_8BC0|BANK_1
		.WORD PTR_8BD0|BANK_1
		.WORD PTR_8BE0|BANK_1
		.WORD PTR_8BF0|BANK_1
		.WORD PTR_8C00|BANK_1
		.WORD PTR_8C10|BANK_1
		.WORD PTR_8C20|BANK_1
		.WORD PTR_8C30|BANK_1
		.WORD PTR_8B80|BANK_1
		.WORD PTR_8B90|BANK_1
		.WORD PTR_8BA0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_10C:.WORD PTR_8C40|BANK_1	; ...
		.WORD PTR_8BC0|BANK_1
		.WORD PTR_8BD0|BANK_1
		.WORD PTR_8C50|BANK_1
		.WORD PTR_8C60|BANK_1
		.WORD PTR_8C70|BANK_1
		.WORD PTR_8C80|BANK_1
		.WORD PTR_8C90|BANK_1
		.WORD PTR_8CA0|BANK_1
		.WORD PTR_8B80|BANK_1
		.WORD PTR_8B90|BANK_1
		.WORD PTR_8BA0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_10D:.WORD PTR_8CB0|BANK_1	; ...
		.WORD PTR_8CC0|BANK_1
		.WORD PTR_8CD0|BANK_1
		.WORD PTR_8CE0|BANK_1
		.WORD PTR_8CF0|BANK_1
		.WORD PTR_8D00|BANK_1
		.WORD PTR_8D10|BANK_1
		.WORD PTR_8D20|BANK_1
		.WORD PTR_8D30|BANK_1
		.WORD PTR_8B80|BANK_1
		.WORD PTR_8B90|BANK_1
		.WORD PTR_8BA0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_10E:.WORD PTR_8D40|BANK_1	; ...
		.WORD PTR_8D50|BANK_1
		.WORD PTR_8D60|BANK_1
		.WORD PTR_8D70|BANK_1
		.WORD PTR_8D80|BANK_1
		.WORD PTR_8D90|BANK_1
		.WORD PTR_8DA0|BANK_1
		.WORD PTR_8DB0|BANK_1
		.WORD PTR_8DC0|BANK_1
		.WORD PTR_8DD0|BANK_1
		.WORD PTR_8DE0|BANK_1
		.WORD PTR_8DF0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_111:.WORD PTR_8E00|BANK_1	; ...
		.WORD PTR_8E10|BANK_1
		.WORD PTR_8E20|BANK_1
		.WORD PTR_8E30|BANK_1
		.WORD PTR_8E40|BANK_1
		.WORD PTR_8E50|BANK_1
		.WORD PTR_8E60|BANK_1
		.WORD PTR_8E70|BANK_1
		.WORD PTR_8E80|BANK_1
		.WORD PTR_8E90|BANK_1
		.WORD PTR_8EA0|BANK_1
		.WORD PTR_8EB0|BANK_1
		.WORD PTR_8EC0|BANK_1
		.WORD PTR_8ED0|BANK_1
		.WORD PTR_8EE0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_112:.WORD PTR_8900|BANK_1	; ...
		.WORD PTR_8EF0|BANK_1
		.WORD PTR_8F00|BANK_1
		.WORD PTR_8F10|BANK_1
		.WORD PTR_8F20|BANK_1
		.WORD PTR_8F30|BANK_1
		.WORD PTR_8F40|BANK_1
		.WORD PTR_8F50|BANK_1
		.WORD PTR_8F60|BANK_1
		.WORD PTR_8F70|BANK_1
		.WORD PTR_8F80|BANK_1
		.WORD PTR_8F90|BANK_1
		.WORD PTR_8FA0|BANK_1
		.WORD PTR_8FB0|BANK_1
		.WORD PTR_8FC0|BANK_1
		.WORD PTR_8FD0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_113:.WORD PTR_8FE0|BANK_1	; ...
		.WORD PTR_8FF0|BANK_1
		.WORD PTR_9000|BANK_1
		.WORD PTR_9010|BANK_1
		.WORD PTR_9020|BANK_1
		.WORD PTR_9030|BANK_1
		.WORD PTR_9040|BANK_1
		.WORD PTR_9050|BANK_1
		.WORD PTR_9060|BANK_1
		.WORD PTR_9070|BANK_1
		.WORD PTR_9080|BANK_1
		.WORD PTR_9090|BANK_1
		.WORD PTR_90A0|BANK_1
		.WORD PTR_90B0|BANK_1
		.WORD PTR_90C0|BANK_1
		.WORD PTR_90D0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_114:.WORD PTR_90E0|BANK_1	; ...
		.WORD PTR_90F0|BANK_1
		.WORD PTR_9100|BANK_1
		.WORD PTR_9110|BANK_1
		.WORD PTR_9120|BANK_1
		.WORD PTR_9130|BANK_1
		.WORD PTR_9140|BANK_1
		.WORD PTR_9150|BANK_1
		.WORD PTR_9160|BANK_1
		.WORD PTR_9170|BANK_1
		.WORD PTR_9180|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_115:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_9190|BANK_1
		.WORD PTR_91A0|BANK_1
		.WORD PTR_91B0|BANK_1
		.WORD PTR_91C0|BANK_1
		.WORD PTR_91D0|BANK_1
		.WORD PTR_91E0|BANK_1
		.WORD PTR_91F0|BANK_1
		.WORD PTR_9200|BANK_1
		.WORD PTR_9210|BANK_1
		.WORD PTR_9220|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_116:.WORD PTR_BB30|BANK_0	; ...
		.WORD PTR_9230|BANK_1
		.WORD PTR_9240|BANK_1
		.WORD PTR_9250|BANK_1
		.WORD PTR_9260|BANK_1
		.WORD PTR_9270|BANK_1
		.WORD PTR_9280|BANK_1
		.WORD PTR_9290|BANK_1
		.WORD PTR_92A0|BANK_1
		.WORD PTR_92B0|BANK_1
		.WORD PTR_92C0|BANK_1
		.WORD PTR_92D0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_117:.WORD PTR_92E0|BANK_1	; ...
		.WORD PTR_92F0|BANK_1
		.WORD PTR_9300|BANK_1
		.WORD PTR_9310|BANK_1
		.WORD PTR_9320|BANK_1
		.WORD PTR_9330|BANK_1
		.WORD PTR_9340|BANK_1
		.WORD PTR_9350|BANK_1
		.WORD PTR_9360|BANK_1
		.WORD PTR_9370|BANK_1
		.WORD PTR_9380|BANK_1
		.WORD PTR_9390|BANK_1
		.WORD PTR_93A0|BANK_1
		.WORD PTR_93B0|BANK_1
		.WORD PTR_93C0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_118:.WORD PTR_93D0|BANK_1	; ...
		.WORD PTR_93E0|BANK_1
		.WORD PTR_93F0|BANK_1
		.WORD PTR_9400|BANK_1
		.WORD PTR_9410|BANK_1
		.WORD PTR_9420|BANK_1
		.WORD PTR_9430|BANK_1
		.WORD PTR_9440|BANK_1
		.WORD PTR_8830|BANK_1
		.WORD PTR_9450|BANK_1
		.WORD PTR_9460|BANK_1
		.WORD PTR_9470|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_11A:.WORD PTR_9480|BANK_1	; ...
		.WORD PTR_9490|BANK_1
		.WORD PTR_94A0|BANK_1
		.WORD PTR_94B0|BANK_1
		.WORD PTR_94C0|BANK_1
		.WORD PTR_94D0|BANK_1
		.WORD PTR_94E0|BANK_1
		.WORD PTR_94F0|BANK_1
		.WORD PTR_9500|BANK_1
		.WORD PTR_9510|BANK_1
		.WORD PTR_9520|BANK_1
		.WORD PTR_9530|BANK_1
		.WORD PTR_9540|BANK_1
		.WORD PTR_9550|BANK_1
		.WORD PTR_9560|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_11B:.WORD PTR_92E0|BANK_1	; ...
		.WORD PTR_92F0|BANK_1
		.WORD PTR_9300|BANK_1
		.WORD PTR_9570|BANK_1
		.WORD PTR_9580|BANK_1
		.WORD PTR_94D0|BANK_1
		.WORD PTR_9590|BANK_1
		.WORD PTR_95A0|BANK_1
		.WORD PTR_95B0|BANK_1
		.WORD PTR_95C0|BANK_1
		.WORD PTR_95D0|BANK_1
		.WORD PTR_95E0|BANK_1
		.WORD PTR_95F0|BANK_1
		.WORD PTR_9600|BANK_1
		.WORD PTR_9610|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_11D:.WORD PTR_9620|BANK_1	; ...
		.WORD PTR_9630|BANK_1
		.WORD PTR_9640|BANK_1
		.WORD PTR_9650|BANK_1
		.WORD PTR_9660|BANK_1
		.WORD PTR_9670|BANK_1
		.WORD PTR_9680|BANK_1
		.WORD PTR_9690|BANK_1
		.WORD PTR_96A0|BANK_1
		.WORD PTR_96B0|BANK_1
		.WORD PTR_96C0|BANK_1
		.WORD PTR_96D0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_11E:.WORD PTR_96E0|BANK_1	; ...
		.WORD PTR_96F0|BANK_1
		.WORD PTR_9700|BANK_1
		.WORD PTR_9710|BANK_1
		.WORD PTR_9720|BANK_1
		.WORD PTR_9730|BANK_1
		.WORD PTR_9740|BANK_1
		.WORD PTR_9750|BANK_1
		.WORD PTR_9760|BANK_1
		.WORD PTR_9770|BANK_1
		.WORD PTR_9780|BANK_1
		.WORD PTR_9790|BANK_1
		.WORD PTR_97A0|BANK_1
		.WORD PTR_97B0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_11F:.WORD PTR_97C0|BANK_1	; ...
		.WORD PTR_97D0|BANK_1
		.WORD PTR_97E0|BANK_1
		.WORD PTR_97F0|BANK_1
		.WORD PTR_9800|BANK_1
		.WORD PTR_9810|BANK_1
		.WORD PTR_9820|BANK_1
		.WORD PTR_9830|BANK_1
		.WORD PTR_9840|BANK_1
		.WORD PTR_9850|BANK_1
		.WORD PTR_9860|BANK_1
		.WORD PTR_9870|BANK_1
		.WORD PTR_9880|BANK_1
		.WORD PTR_9890|BANK_1
		.WORD PTR_98A0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_120:.WORD PTR_8000|BANK_0	; ...
		.WORD PTR_A7F0|BANK_1
		.WORD PTR_A800|BANK_1
		.WORD PTR_A810|BANK_1
		.WORD PTR_A820|BANK_1
		.WORD PTR_A830|BANK_1
		.WORD PTR_A840|BANK_1
		.WORD PTR_A850|BANK_1
		.WORD PTR_A860|BANK_1
		.WORD PTR_A870|BANK_1
		.WORD PTR_A880|BANK_1
		.WORD PTR_BDC0|BANK_0
		.WORD PTR_A890|BANK_1
		.WORD PTR_A8A0|BANK_1
		.WORD PTR_A8B0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_121:.WORD PTR_92E0|BANK_1	; ...
		.WORD PTR_92F0|BANK_1
		.WORD PTR_98B0|BANK_1
		.WORD PTR_98C0|BANK_1
		.WORD PTR_98D0|BANK_1
		.WORD PTR_98E0|BANK_1
		.WORD PTR_98F0|BANK_1
		.WORD PTR_9900|BANK_1
		.WORD PTR_9910|BANK_1
		.WORD PTR_9920|BANK_1
		.WORD PTR_9930|BANK_1
		.WORD PTR_9940|BANK_1
		.WORD PTR_9950|BANK_1
		.WORD PTR_9960|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_122:.WORD PTR_9970|BANK_1	; ...
		.WORD PTR_9980|BANK_1
		.WORD PTR_9990|BANK_1
		.WORD PTR_99A0|BANK_1
		.WORD PTR_99B0|BANK_1
		.WORD PTR_99C0|BANK_1
		.WORD PTR_99D0|BANK_1
		.WORD PTR_99E0|BANK_1
		.WORD PTR_99F0|BANK_1
		.WORD PTR_9A00|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_123:.WORD PTR_9A10|BANK_1	; ...
		.WORD PTR_9A20|BANK_1
		.WORD PTR_9A30|BANK_1
		.WORD PTR_9A40|BANK_1
		.WORD PTR_9A50|BANK_1
		.WORD PTR_9A60|BANK_1
		.WORD PTR_9A70|BANK_1
		.WORD PTR_9A80|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_125:.WORD PTR_9A90|BANK_1	; ...
		.WORD PTR_9AA0|BANK_1
		.WORD PTR_9AB0|BANK_1
		.WORD PTR_9AC0|BANK_1
		.WORD PTR_9AD0|BANK_1
		.WORD PTR_9AE0|BANK_1
		.WORD PTR_9AF0|BANK_1
		.WORD PTR_9B00|BANK_1
		.WORD PTR_9B10|BANK_1
		.WORD PTR_9B20|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_127:.WORD PTR_9B30|BANK_1	; ...
		.WORD PTR_9B40|BANK_1
		.WORD PTR_9B50|BANK_1
		.WORD PTR_9B60|BANK_1
		.WORD PTR_9B70|BANK_1
		.WORD PTR_9B80|BANK_1
		.WORD PTR_9B90|BANK_1
		.WORD PTR_9BA0|BANK_1
		.WORD PTR_9BB0|BANK_1
		.WORD PTR_9BC0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_128:.WORD PTR_9BD0|BANK_1	; ...
		.WORD PTR_9BE0|BANK_1
		.WORD PTR_9BF0|BANK_1
		.WORD PTR_9C00|BANK_1
		.WORD PTR_9C10|BANK_1
		.WORD PTR_9C20|BANK_1
		.WORD PTR_9C30|BANK_1
		.WORD PTR_9C40|BANK_1
		.WORD PTR_9C50|BANK_1
		.WORD PTR_9C60|BANK_1
		.WORD PTR_9C70|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_12A:.WORD PTR_9C80|BANK_1	; ...
		.WORD PTR_9C90|BANK_1
		.WORD PTR_9CA0|BANK_1
		.WORD PTR_9CB0|BANK_1
		.WORD PTR_9CC0|BANK_1
		.WORD PTR_9CD0|BANK_1
		.WORD PTR_9CE0|BANK_1
		.WORD PTR_9C40|BANK_1
		.WORD PTR_9C50|BANK_1
		.WORD PTR_9C60|BANK_1
		.WORD PTR_9C70|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_12C:.WORD PTR_9CF0|BANK_1	; ...
		.WORD PTR_9D00|BANK_1
		.WORD PTR_9D10|BANK_1
		.WORD PTR_9D20|BANK_1
		.WORD PTR_9D30|BANK_1
		.WORD PTR_9D40|BANK_1
		.WORD PTR_B0B0|BANK_0
		.WORD PTR_9D50|BANK_1
		.WORD PTR_9D60|BANK_1
		.WORD PTR_9D70|BANK_1
		.WORD PTR_9D80|BANK_1
		.WORD PTR_9D90|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_12D:.WORD PTR_9DA0|BANK_1	; ...
		.WORD PTR_9DB0|BANK_1
		.WORD PTR_9DC0|BANK_1
		.WORD PTR_9DD0|BANK_1
		.WORD PTR_B0E0|BANK_0
		.WORD PTR_9DE0|BANK_1
		.WORD PTR_9DF0|BANK_1
		.WORD PTR_9E00|BANK_1
		.WORD PTR_9E10|BANK_1
		.WORD PTR_9E20|BANK_1
		.WORD PTR_9E30|BANK_1
		.WORD PTR_9E40|BANK_1
		.WORD PTR_9D80|BANK_1
		.WORD PTR_9D90|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_12E:.WORD PTR_9E50|BANK_1	; ...
		.WORD PTR_9E60|BANK_1
		.WORD PTR_9E70|BANK_1
		.WORD PTR_9E80|BANK_1
		.WORD PTR_9E90|BANK_1
		.WORD PTR_9EA0|BANK_1
		.WORD PTR_9EB0|BANK_1
		.WORD PTR_9EC0|BANK_1
		.WORD PTR_9E30|BANK_1
		.WORD PTR_9E40|BANK_1
		.WORD PTR_9D80|BANK_1
		.WORD PTR_9D90|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_12F:.WORD PTR_9ED0|BANK_1	; ...
		.WORD PTR_9EE0|BANK_1
		.WORD PTR_9EF0|BANK_1
		.WORD PTR_9F00|BANK_1
		.WORD PTR_9F10|BANK_1
		.WORD PTR_9F20|BANK_1
		.WORD PTR_B0B0|BANK_0
		.WORD PTR_9F30|BANK_1
		.WORD PTR_9E30|BANK_1
		.WORD PTR_9E40|BANK_1
		.WORD PTR_9D80|BANK_1
		.WORD PTR_9D90|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_130:.WORD PTR_9F40|BANK_1	; ...
		.WORD PTR_9F50|BANK_1
		.WORD PTR_9F60|BANK_1
		.WORD PTR_9F70|BANK_1
		.WORD PTR_9F80|BANK_1
		.WORD PTR_9F90|BANK_1
		.WORD PTR_9FA0|BANK_1
		.WORD PTR_9FB0|BANK_1
		.WORD PTR_9FC0|BANK_1
		.WORD PTR_9FD0|BANK_1
		.WORD PTR_9FE0|BANK_1
		.WORD PTR_9FF0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_131:.WORD PTR_BB30|BANK_0	; ...
		.WORD PTR_A000|BANK_1
		.WORD PTR_A010|BANK_1
		.WORD PTR_A020|BANK_1
		.WORD PTR_A030|BANK_1
		.WORD PTR_A040|BANK_1
		.WORD PTR_A050|BANK_1
		.WORD PTR_A060|BANK_1
		.WORD PTR_A070|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_132:.WORD PTR_A080|BANK_1	; ...
		.WORD PTR_A090|BANK_1
		.WORD PTR_A0A0|BANK_1
		.WORD PTR_A0B0|BANK_1
		.WORD PTR_A0C0|BANK_1
		.WORD PTR_A0D0|BANK_1
		.WORD PTR_A0E0|BANK_1
		.WORD PTR_A0F0|BANK_1
		.WORD PTR_A100|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_133:.WORD PTR_A110|BANK_1	; ...
		.WORD PTR_A120|BANK_1
		.WORD PTR_A130|BANK_1
		.WORD PTR_A140|BANK_1
		.WORD PTR_A150|BANK_1
		.WORD PTR_A160|BANK_1
		.WORD PTR_A170|BANK_1
		.WORD PTR_A180|BANK_1
		.WORD PTR_A190|BANK_1
		.WORD PTR_A1A0|BANK_1
		.WORD PTR_A1B0|BANK_1
		.WORD PTR_A1C0|BANK_1
		.WORD PTR_A1D0|BANK_1
		.WORD PTR_A1E0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_134:.WORD PTR_A1F0|BANK_1	; ...
		.WORD PTR_A200|BANK_1
		.WORD PTR_A210|BANK_1
		.WORD PTR_A220|BANK_1
		.WORD PTR_A230|BANK_1
		.WORD PTR_A240|BANK_1
		.WORD PTR_A250|BANK_1
		.WORD PTR_A260|BANK_1
		.WORD PTR_A270|BANK_1
		.WORD PTR_A280|BANK_1
		.WORD PTR_A290|BANK_1
		.WORD PTR_A2A0|BANK_1
		.WORD PTR_A2B0|BANK_1
		.WORD PTR_A2C0|BANK_1
		.WORD PTR_A2D0|BANK_1
		.WORD PTR_A2E0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_135:.WORD PTR_8010|BANK_0	; ...
		.WORD PTR_A2F0|BANK_1
		.WORD PTR_A300|BANK_1
		.WORD PTR_A310|BANK_1
		.WORD PTR_A320|BANK_1
		.WORD PTR_A330|BANK_1
		.WORD PTR_A340|BANK_1
		.WORD PTR_A350|BANK_1
		.WORD PTR_A360|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_136:.WORD PTR_92E0|BANK_1	; ...
		.WORD PTR_A370|BANK_1
		.WORD PTR_A380|BANK_1
		.WORD PTR_A390|BANK_1
		.WORD PTR_A3A0|BANK_1
		.WORD PTR_A3B0|BANK_1
		.WORD PTR_A3C0|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_137:.WORD PTR_92E0|BANK_1	; ...
		.WORD PTR_A3D0|BANK_1
		.WORD PTR_A3E0|BANK_1
		.WORD PTR_A3F0|BANK_1
		.WORD PTR_A400|BANK_1
		.WORD PTR_A410|BANK_1
		.WORD PTR_A420|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_138:.WORD PTR_A430|BANK_1	; ...
		.WORD PTR_A440|BANK_1
		.WORD PTR_A450|BANK_1
		.WORD PTR_A460|BANK_1
		.WORD PTR_A470|BANK_1
		.BYTE $FF
		.BYTE $FF
pPrinceChars_139:.WORD PTR_A480|BANK_1	; ...
		.WORD PTR_A490|BANK_1
		.WORD PTR_A4A0|BANK_1
		.WORD PTR_A4B0|BANK_1
		.WORD PTR_A4C0|BANK_1
		.WORD PTR_A4D0|BANK_1
		.WORD PTR_A4E0|BANK_1
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_64:.WORD PTR_8890|BANK_0 ; ...
		.WORD PTR_88A0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_62:.WORD PTR_9ED0|BANK_0 ; ...
		.WORD PTR_9EE0|BANK_0
		.WORD PTR_9EF0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_61:.WORD PTR_9EB0|BANK_0 ; ...
		.WORD PTR_9EC0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_60:.WORD PTR_9E60|BANK_0 ; ...
		.WORD PTR_9E70|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_5F:.WORD PTR_9E10|BANK_0 ; ...
		.WORD PTR_9E20|BANK_0
		.WORD PTR_9E30|BANK_0
		.WORD PTR_9E40|BANK_0
		.WORD PTR_9E50|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_5E:.WORD PTR_9DD0|BANK_0 ; ...
		.WORD PTR_9DE0|BANK_0
		.WORD PTR_9DF0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_5D:.WORD PTR_9C30|BANK_0 ; ...
		.WORD PTR_9C40|BANK_0
		.WORD PTR_9C50|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_5C:.WORD PTR_9B90|BANK_0 ; ...
		.WORD PTR_9BA0|BANK_0
		.WORD PTR_9BB0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_5B:.WORD PTR_9770|BANK_0 ; ...
		.WORD PTR_8B90|BANK_0
		.WORD PTR_8BA0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_5A:.WORD PTR_9780|BANK_0 ; ...
		.WORD PTR_9790|BANK_0
		.WORD PTR_97A0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_59:.WORD PTR_9740|BANK_0 ; ...
		.WORD PTR_9590|BANK_0
		.WORD PTR_95A0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_58:.WORD PTR_9570|BANK_0 ; ...
		.WORD PTR_8DE0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_57:.WORD PTR_9580|BANK_0 ; ...
		.WORD PTR_9590|BANK_0
		.WORD PTR_95A0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_56:.WORD PTR_9550|BANK_0 ; ...
		.WORD PTR_9560|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_55:.WORD PTR_9520|BANK_0 ; ...
		.WORD PTR_9530|BANK_0
		.WORD PTR_9540|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_54:.WORD PTR_9E80|BANK_0 ; ...
		.WORD PTR_9E90|BANK_0
		.WORD PTR_9EA0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_53:.WORD PTR_94F0|BANK_0 ; ...
		.WORD PTR_9500|BANK_0
		.WORD PTR_9510|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_52:.WORD PTR_94B0|BANK_0 ; ...
		.WORD PTR_94C0|BANK_0
		.WORD PTR_94D0|BANK_0
		.WORD PTR_94E0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_51:.WORD PTR_9490|BANK_0 ; ...
		.WORD PTR_94A0|BANK_0
		.WORD PTR_9460|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_50:.WORD PTR_9470|BANK_0 ; ...
		.WORD PTR_9480|BANK_0
		.WORD PTR_9460|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_4F:.WORD PTR_9440|BANK_0 ; ...
		.WORD PTR_9450|BANK_0
		.WORD PTR_9460|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_4E:.WORD PTR_9F40|BANK_0 ; ...
		.WORD PTR_9F50|BANK_0
		.WORD PTR_9F20|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_4D:.WORD PTR_9F30|BANK_0 ; ...
		.WORD PTR_95E0|BANK_0
		.WORD PTR_9F20|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_4C:.WORD PTR_9F00|BANK_0 ; ...
		.WORD PTR_9F10|BANK_0
		.WORD PTR_9F20|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_4B:.WORD PTR_9C60|BANK_0 ; ...
		.WORD PTR_9C90|BANK_0
		.WORD PTR_9CA0|BANK_0
		.WORD PTR_8180|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_4A:.WORD PTR_9C60|BANK_0 ; ...
		.WORD PTR_9C70|BANK_0
		.WORD PTR_9C80|BANK_0
		.WORD PTR_8180|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_49:.WORD PTR_9CB0|BANK_0 ; ...
		.WORD PTR_9CC0|BANK_0
		.WORD PTR_8180|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_48:.WORD PTR_9CD0|BANK_0 ; ...
		.WORD PTR_9CE0|BANK_0
		.WORD PTR_9CF0|BANK_0
		.WORD PTR_94E0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_47:.WORD PTR_9C00|BANK_0 ; ...
		.WORD PTR_9C10|BANK_0
		.WORD PTR_9BE0|BANK_0
		.WORD PTR_9C20|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_46:.WORD PTR_9BC0|BANK_0 ; ...
		.WORD PTR_9BD0|BANK_0
		.WORD PTR_9BE0|BANK_0
		.WORD PTR_9BF0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_45:.WORD PTR_9800|BANK_0 ; ...
		.WORD PTR_9810|BANK_0
		.WORD PTR_9670|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_44:.WORD PTR_97E0|BANK_0 ; ...
		.WORD PTR_97F0|BANK_0
		.WORD PTR_8160|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_43:.WORD PTR_97B0|BANK_0 ; ...
		.WORD PTR_97C0|BANK_0
		.WORD PTR_97D0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_42:.WORD PTR_95F0|BANK_0 ; ...
		.WORD PTR_9750|BANK_0
		.WORD PTR_9600|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_41:.WORD PTR_9650|BANK_0 ; ...
		.WORD PTR_9760|BANK_0
		.WORD PTR_9670|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_40:.WORD PTR_95D0|BANK_0 ; ...
		.WORD PTR_95E0|BANK_0
		.WORD PTR_8160|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_3F:.WORD PTR_96E0|BANK_0 ; ...
		.WORD PTR_95C0|BANK_0
		.WORD PTR_8160|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_3E:.WORD PTR_96F0|BANK_0 ; ...
		.WORD PTR_95E0|BANK_0
		.WORD PTR_8160|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_3D:.WORD PTR_9700|BANK_0 ; ...
		.WORD PTR_8120|BANK_0
		.WORD PTR_9600|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_3C:.WORD PTR_9710|BANK_0 ; ...
		.WORD PTR_9720|BANK_0
		.WORD PTR_9640|BANK_0
		.WORD PTR_94E0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_3B:.WORD PTR_9730|BANK_0 ; ...
		.WORD PTR_9660|BANK_0
		.WORD PTR_9670|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_3A:.WORD PTR_96D0|BANK_0 ; ...
		.WORD PTR_8120|BANK_0
		.WORD PTR_8160|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_39:.WORD PTR_9680|BANK_0 ; ...
		.WORD PTR_8120|BANK_0
		.WORD PTR_8160|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_38:.WORD PTR_96B0|BANK_0 ; ...
		.WORD PTR_96C0|BANK_0
		.WORD PTR_9640|BANK_0
		.WORD PTR_94E0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_37:.WORD PTR_96A0|BANK_0 ; ...
		.WORD PTR_95C0|BANK_0
		.WORD PTR_8160|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_36:.WORD PTR_9690|BANK_0 ; ...
		.WORD PTR_95E0|BANK_0
		.WORD PTR_8160|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_35:.WORD PTR_9620|BANK_0 ; ...
		.WORD PTR_9630|BANK_0
		.WORD PTR_9640|BANK_0
		.WORD PTR_94E0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_34:.WORD PTR_95B0|BANK_0 ; ...
		.WORD PTR_95C0|BANK_0
		.WORD PTR_8160|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_33:.WORD PTR_9610|BANK_0 ; ...
		.WORD PTR_8160|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_32:.WORD PTR_95F0|BANK_0 ; ...
		.WORD PTR_8120|BANK_0
		.WORD PTR_9600|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_31:.WORD PTR_9650|BANK_0 ; ...
		.WORD PTR_9660|BANK_0
		.WORD PTR_9670|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_30:.WORD PTR_95D0|BANK_0 ; ...
		.WORD PTR_95E0|BANK_0
		.WORD PTR_8160|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_2F:.WORD PTR_8130|BANK_0 ; ...
		.WORD PTR_8120|BANK_0
		.WORD PTR_8160|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_66:.WORD PTR_AAE0|BANK_0 ; ...
		.WORD PTR_AAF0|BANK_0
		.WORD PTR_AB00|BANK_0
		.WORD PTR_AB10|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_67:.WORD PTR_AB40|BANK_0 ; ...
		.WORD PTR_AB50|BANK_0
		.WORD PTR_AB60|BANK_0
		.BYTE $FF
		.BYTE $FF
pDugneonChars_ExitDoor:.WORD PTR_86D0|BANK_0 ; ...
		.WORD PTR_86E0|BANK_0
		.WORD PTR_86F0|BANK_0
		.WORD PTR_8700|BANK_0
		.WORD PTR_8710|BANK_0
		.WORD PTR_8720|BANK_0
		.WORD PTR_8730|BANK_0
		.WORD PTR_8740|BANK_0
		.WORD PTR_8320|BANK_0
		.WORD PTR_8440|BANK_0
		.WORD PTR_8450|BANK_0
		.WORD PTR_8750|BANK_0
		.WORD PTR_8760|BANK_0
		.WORD PTR_8770|BANK_0
		.WORD PTR_8780|BANK_0
		.WORD PTR_8790|BANK_0
		.WORD PTR_87A0|BANK_0
		.WORD PTR_87B0|BANK_0
		.WORD PTR_87C0|BANK_0
		.WORD PTR_87D0|BANK_0
		.WORD PTR_87E0|BANK_0
		.WORD PTR_87F0|BANK_0
		.WORD PTR_8800|BANK_0
		.WORD PTR_8810|BANK_0
		.WORD PTR_8820|BANK_0
		.WORD PTR_8830|BANK_0
		.BYTE $FF
		.BYTE $FF
pDugneonChars_SkeletonPlate:.WORD PTR_85B0|BANK_0 ; ...
		.WORD PTR_85C0|BANK_0
		.WORD PTR_85D0|BANK_0
		.WORD PTR_8380|BANK_0
		.WORD PTR_85E0|BANK_0
		.WORD PTR_85F0|BANK_0
		.WORD PTR_8310|BANK_0
		.WORD PTR_8320|BANK_0
		.WORD PTR_8540|BANK_0
		.WORD PTR_8600|BANK_0
		.WORD PTR_8610|BANK_0
		.WORD PTR_8620|BANK_0
		.WORD PTR_8330|BANK_0
		.WORD PTR_8450|BANK_0
		.BYTE $FF
		.BYTE $FF
pDugneonChars_Spikes:.WORD PTR_9040|BANK_0 ; ...
		.WORD PTR_9050|BANK_0
		.WORD PTR_8440|BANK_0
		.WORD PTR_9060|BANK_0
		.WORD PTR_9070|BANK_0
		.WORD PTR_8810|BANK_0
		.WORD PTR_8A10|BANK_0
		.WORD PTR_9080|BANK_0
		.WORD PTR_9090|BANK_0
		.WORD PTR_90A0|BANK_0
		.WORD PTR_8820|BANK_0
		.WORD PTR_8830|BANK_0
		.WORD PTR_90B0|BANK_0
		.WORD PTR_90C0|BANK_0
		.WORD PTR_90D0|BANK_0
		.WORD PTR_90E0|BANK_0
		.WORD PTR_90F0|BANK_0
		.WORD PTR_9100|BANK_0
		.WORD PTR_9110|BANK_0
		.WORD PTR_9120|BANK_0
		.WORD PTR_9130|BANK_0
		.WORD PTR_9140|BANK_0
		.WORD PTR_9150|BANK_0
		.WORD PTR_9160|BANK_0
		.WORD PTR_9170|BANK_0
		.WORD PTR_9180|BANK_0
		.WORD PTR_9190|BANK_0
		.WORD PTR_91A0|BANK_0
		.WORD PTR_91B0|BANK_0
		.WORD PTR_91C0|BANK_0
		.WORD PTR_91D0|BANK_0
		.WORD PTR_91E0|BANK_0
		.WORD PTR_91F0|BANK_0
		.WORD PTR_9200|BANK_0
		.WORD PTR_9210|BANK_0
		.BYTE $FF
		.BYTE $FF
pDugneonChars_DebrisPlate:.WORD	PTR_8D40|BANK_0	; ...
		.WORD PTR_8D50|BANK_0
		.WORD PTR_8D60|BANK_0
		.WORD PTR_8360|BANK_0
		.WORD PTR_8D70|BANK_0
		.WORD PTR_8D80|BANK_0
		.WORD PTR_8D90|BANK_0
		.WORD PTR_8DA0|BANK_0
		.WORD PTR_8510|BANK_0
		.WORD PTR_8DB0|BANK_0
		.WORD PTR_8DC0|BANK_0
		.WORD PTR_8DD0|BANK_0
		.WORD PTR_8820|BANK_0
		.WORD PTR_8830|BANK_0
		.BYTE $FF
		.BYTE $FF
pDugneonChars_HiBtn:.WORD PTR_9390|BANK_0 ; ...
		.WORD PTR_93A0|BANK_0
		.WORD PTR_93B0|BANK_0
		.WORD PTR_8440|BANK_0
		.WORD PTR_8320|BANK_0
		.WORD PTR_93C0|BANK_0
		.WORD PTR_93D0|BANK_0
		.WORD PTR_93E0|BANK_0
		.WORD PTR_93F0|BANK_0
		.WORD PTR_9400|BANK_0
		.WORD PTR_9410|BANK_0
		.WORD PTR_9420|BANK_0
		.WORD PTR_9430|BANK_0
		.BYTE $FF
		.BYTE $FF
pDugneonChars_PressedBtn:.WORD PTR_A830|BANK_0 ; ...
		.WORD PTR_A810|BANK_0
		.WORD PTR_A850|BANK_0
		.WORD PTR_A900|BANK_0
		.WORD PTR_A910|BANK_0
		.WORD PTR_A920|BANK_0
		.WORD PTR_A820|BANK_0
		.WORD PTR_A930|BANK_0
		.WORD PTR_A940|BANK_0
		.WORD PTR_A950|BANK_0
		.WORD PTR_A960|BANK_0
		.WORD PTR_A970|BANK_0
		.BYTE $FF
		.BYTE $FF
pDugneonChars_LoBtn:.WORD PTR_8320|BANK_0 ; ...
		.WORD PTR_8440|BANK_0
		.WORD PTR_8800|BANK_0
		.WORD PTR_8810|BANK_0
		.WORD PTR_8D20|BANK_0
		.WORD PTR_8D30|BANK_0
		.WORD PTR_8820|BANK_0
		.WORD PTR_8830|BANK_0
		.BYTE $FF
		.BYTE $FF
pDugneonChars_BigColumn:.WORD PTR_8900|BANK_0 ;	...
		.WORD PTR_8910|BANK_0
		.WORD PTR_8920|BANK_0
		.WORD PTR_8930|BANK_0
		.WORD PTR_8940|BANK_0
		.WORD PTR_8950|BANK_0
		.WORD PTR_8960|BANK_0
		.WORD PTR_8970|BANK_0
		.WORD PTR_8980|BANK_0
		.WORD PTR_8990|BANK_0
		.WORD PTR_89A0|BANK_0
		.WORD PTR_89B0|BANK_0
		.WORD PTR_89C0|BANK_0
		.WORD PTR_89D0|BANK_0
		.WORD PTR_89E0|BANK_0
		.WORD PTR_89F0|BANK_0
		.WORD PTR_8A00|BANK_0
		.WORD PTR_8810|BANK_0
		.WORD PTR_8A10|BANK_0
		.WORD PTR_8A20|BANK_0
		.WORD PTR_8A30|BANK_0
		.WORD PTR_8A40|BANK_0
		.WORD PTR_8820|BANK_0
		.WORD PTR_8830|BANK_0
		.WORD PTR_8420|BANK_0
		.WORD PTR_8430|BANK_0
		.WORD PTR_8A50|BANK_0
		.WORD PTR_8A60|BANK_0
		.WORD PTR_8A70|BANK_0
		.WORD PTR_8A80|BANK_0
		.WORD PTR_8A90|BANK_0
		.WORD PTR_8AA0|BANK_0
		.WORD PTR_8AB0|BANK_0
		.WORD PTR_8AC0|BANK_0
		.BYTE $FF
		.BYTE $FF
pDugneonChars_OverDoor:.WORD PTR_88F0|BANK_0 ; ...
		.BYTE $FF
		.BYTE $FF
pDugneonChars_Cutters:.WORD PTR_8DE0|BANK_0 ; ...
		.WORD PTR_8DF0|BANK_0
		.WORD PTR_8E00|BANK_0
		.WORD PTR_8E10|BANK_0
		.WORD PTR_8E20|BANK_0
		.WORD PTR_8E30|BANK_0
		.WORD PTR_8E40|BANK_0
		.WORD PTR_8E50|BANK_0
		.WORD PTR_8E60|BANK_0
		.WORD PTR_8E70|BANK_0
		.WORD PTR_8440|BANK_0
		.WORD PTR_8320|BANK_0
		.WORD PTR_8800|BANK_0
		.WORD PTR_8810|BANK_0
		.WORD PTR_8E80|BANK_0
		.WORD PTR_8450|BANK_0
		.WORD PTR_8750|BANK_0
		.WORD PTR_8820|BANK_0
		.WORD PTR_8830|BANK_0
		.WORD PTR_8E90|BANK_0
		.WORD PTR_8EA0|BANK_0
		.WORD PTR_8EB0|BANK_0
		.WORD PTR_8EC0|BANK_0
		.WORD PTR_8ED0|BANK_0
		.WORD PTR_8EE0|BANK_0
		.WORD PTR_8EF0|BANK_0
		.WORD PTR_8F00|BANK_0
		.WORD PTR_8F10|BANK_0
		.WORD PTR_8F20|BANK_0
		.WORD PTR_8F30|BANK_0
		.WORD PTR_8F40|BANK_0
		.WORD PTR_8F50|BANK_0
		.WORD PTR_8F60|BANK_0
		.WORD PTR_8F70|BANK_0
		.WORD PTR_8F80|BANK_0
		.WORD PTR_8F90|BANK_0
		.WORD PTR_83E0|BANK_0
		.WORD PTR_8FA0|BANK_0
		.WORD PTR_8FB0|BANK_0
		.WORD PTR_8FC0|BANK_0
		.WORD PTR_8FD0|BANK_0
		.WORD PTR_8FE0|BANK_0
		.WORD PTR_8FF0|BANK_0
		.WORD PTR_9000|BANK_0
		.WORD PTR_9010|BANK_0
		.WORD PTR_9020|BANK_0
		.WORD PTR_9030|BANK_0
		.BYTE $FF
		.BYTE $FF
pPalaceChars_Arch:.WORD	PTR_9820|BANK_0	; ...
		.WORD PTR_9830|BANK_0
		.WORD PTR_9840|BANK_0
		.WORD PTR_9850|BANK_0
		.WORD PTR_9860|BANK_0
		.WORD PTR_9870|BANK_0
		.WORD PTR_9880|BANK_0
		.WORD PTR_9890|BANK_0
		.WORD PTR_98A0|BANK_0
		.WORD PTR_8F90|BANK_0
		.WORD PTR_98B0|BANK_0
		.WORD PTR_98C0|BANK_0
		.WORD PTR_98D0|BANK_0
		.WORD PTR_98E0|BANK_0
		.WORD PTR_98F0|BANK_0
		.WORD PTR_9900|BANK_0
		.WORD PTR_9910|BANK_0
		.WORD PTR_9920|BANK_0
		.WORD PTR_9930|BANK_0
		.WORD PTR_9940|BANK_0
		.WORD PTR_9950|BANK_0
		.WORD PTR_9960|BANK_0
		.WORD PTR_9970|BANK_0
		.WORD PTR_9980|BANK_0
		.WORD PTR_9990|BANK_0
		.WORD PTR_99A0|BANK_0
		.WORD PTR_99B0|BANK_0
		.WORD PTR_99C0|BANK_0
		.WORD PTR_99D0|BANK_0
		.WORD PTR_99E0|BANK_0
		.WORD PTR_99F0|BANK_0
		.WORD PTR_9A00|BANK_0
		.WORD PTR_9A10|BANK_0
		.WORD PTR_9A20|BANK_0
		.WORD PTR_9A30|BANK_0
		.WORD PTR_9A40|BANK_0
		.WORD PTR_9A50|BANK_0
		.WORD PTR_9A60|BANK_0
		.WORD PTR_9A70|BANK_0
		.WORD PTR_9A80|BANK_0
		.WORD PTR_9A90|BANK_0
		.WORD PTR_9AA0|BANK_0
		.WORD PTR_9AB0|BANK_0
		.WORD PTR_9AC0|BANK_0
		.WORD PTR_9AD0|BANK_0
		.WORD PTR_9AE0|BANK_0
		.WORD PTR_9AF0|BANK_0
		.WORD PTR_9B00|BANK_0
		.WORD PTR_8820|BANK_0
		.WORD PTR_8830|BANK_0
		.BYTE $FF
		.BYTE $FF
pDungeonWallWindowChars:.WORD PTR_A980|BANK_0 ;	...
		.WORD PTR_A990|BANK_0
		.WORD PTR_A9A0|BANK_0
		.WORD PTR_A9B0|BANK_0
		.WORD PTR_A9C0|BANK_0
		.WORD PTR_A9D0|BANK_0
		.WORD PTR_A9E0|BANK_0
		.WORD PTR_A9F0|BANK_0
		.WORD PTR_AA00|BANK_0
		.WORD PTR_AA10|BANK_0
		.WORD PTR_AA20|BANK_0
		.WORD PTR_AA30|BANK_0
		.WORD PTR_AA40|BANK_0
		.WORD PTR_AA50|BANK_0
		.WORD PTR_AA60|BANK_0
		.BYTE $FF
		.BYTE $FF
pDugneonChars_Base:.WORD PTR_8B10|BANK_0 ; ...
		.WORD PTR_8B20|BANK_0
		.WORD PTR_8440|BANK_0
		.WORD PTR_8320|BANK_0
		.WORD PTR_8800|BANK_0
		.WORD PTR_8810|BANK_0
		.WORD PTR_8A10|BANK_0
		.WORD PTR_8450|BANK_0
		.WORD PTR_8750|BANK_0
		.WORD PTR_8820|BANK_0
		.WORD PTR_8830|BANK_0
		.WORD PTR_BA40|BANK_0
		.WORD PTR_BA50|BANK_0
		.WORD PTR_BA60|BANK_0
		.WORD PTR_BA70|BANK_0
		.WORD PTR_BA80|BANK_0
		.WORD PTR_BA90|BANK_0
		.WORD PTR_BAA0|BANK_0
		.WORD PTR_8DE0|BANK_0
		.WORD PTR_BAB0|BANK_0
		.WORD PTR_BAC0|BANK_0
		.WORD PTR_BAD0|BANK_0
		.WORD PTR_BAE0|BANK_0
		.WORD PTR_BAF0|BANK_0
		.WORD PTR_BB00|BANK_0
		.WORD PTR_BB10|BANK_0
		.WORD PTR_BB20|BANK_0
		.WORD PTR_BB30|BANK_0
		.WORD PTR_BB40|BANK_0
		.WORD PTR_BB50|BANK_0
		.WORD PTR_BB60|BANK_0
		.WORD PTR_BB70|BANK_0
		.WORD PTR_BB80|BANK_0
		.WORD PTR_BB90|BANK_0
		.WORD PTR_BBA0|BANK_0
		.WORD PTR_BBB0|BANK_0
		.WORD PTR_BBC0|BANK_0
		.WORD PTR_BBD0|BANK_0
		.WORD PTR_BBE0|BANK_0
		.WORD PTR_BBF0|BANK_0
		.WORD PTR_BC00|BANK_0
		.WORD PTR_BC10|BANK_0
		.WORD PTR_BC20|BANK_0
		.WORD PTR_83D0|BANK_0
		.WORD PTR_83E0|BANK_0
		.WORD PTR_BC30|BANK_0
		.WORD PTR_BC40|BANK_0
		.WORD PTR_BC50|BANK_0
		.WORD PTR_8F90|BANK_0
		.WORD PTR_BC60|BANK_0
		.WORD PTR_BC70|BANK_0
		.WORD PTR_8FA0|BANK_0
		.WORD PTR_8FB0|BANK_0
		.WORD PTR_BC80|BANK_0
		.WORD PTR_BC90|BANK_0
		.WORD PTR_BCA0|BANK_0
		.WORD PTR_BCB0|BANK_0
		.WORD PTR_8570|BANK_0
		.WORD PTR_BCC0|BANK_0
		.WORD PTR_BCD0|BANK_0
		.WORD PTR_BCE0|BANK_0
		.WORD PTR_BCF0|BANK_0
		.WORD PTR_BD00|BANK_0
		.WORD PTR_BD10|BANK_0
		.WORD PTR_BD20|BANK_0
		.WORD PTR_BD30|BANK_0
		.WORD PTR_80B0|BANK_0
		.WORD PTR_BD40|BANK_0
		.WORD PTR_BD50|BANK_0
		.WORD PTR_BD60|BANK_0
		.WORD PTR_BD70|BANK_0
		.WORD PTR_BD80|BANK_0
		.WORD PTR_B360|BANK_0
		.WORD PTR_B370|BANK_0
		.WORD PTR_B380|BANK_0
		.WORD PTR_B390|BANK_0
		.WORD PTR_B3A0|BANK_0
		.WORD PTR_B3B0|BANK_0
		.WORD PTR_B3C0|BANK_0
		.WORD PTR_B3D0|BANK_0
		.WORD PTR_B3E0|BANK_0
		.WORD PTR_B3F0|BANK_0
		.BYTE $FF
		.BYTE $FF
pDugneonChars_Door:.WORD PTR_83F0|BANK_0 ; ...
		.WORD PTR_8400|BANK_0
		.WORD PTR_8410|BANK_0
		.WORD PTR_8AD0|BANK_0
		.WORD PTR_88F0|BANK_0
		.WORD PTR_8AE0|BANK_0
		.WORD PTR_8AF0|BANK_0
		.WORD PTR_8B00|BANK_0
		.WORD PTR_8B10|BANK_0
		.WORD PTR_8B20|BANK_0
		.WORD PTR_8B30|BANK_0
		.WORD PTR_8B40|BANK_0
		.WORD PTR_8B50|BANK_0
		.WORD PTR_8B60|BANK_0
		.WORD PTR_8A10|BANK_0
		.WORD PTR_8B70|BANK_0
		.WORD PTR_8450|BANK_0
		.WORD PTR_8B80|BANK_0
		.WORD PTR_8820|BANK_0
		.WORD PTR_8830|BANK_0
		.WORD PTR_8B90|BANK_0
		.WORD PTR_8BA0|BANK_0
		.WORD PTR_8BB0|BANK_0
		.WORD PTR_8BC0|BANK_0
		.WORD PTR_8BD0|BANK_0
		.WORD PTR_8BE0|BANK_0
		.WORD PTR_8800|BANK_0
		.WORD PTR_8BF0|BANK_0
		.WORD PTR_8C00|BANK_0
		.WORD PTR_8C10|BANK_0
		.WORD PTR_8C20|BANK_0
		.WORD PTR_8C30|BANK_0
		.WORD PTR_8C40|BANK_0
		.WORD PTR_8C50|BANK_0
		.WORD PTR_8C60|BANK_0
		.WORD PTR_8C70|BANK_0
		.WORD PTR_8C80|BANK_0
		.WORD PTR_8C90|BANK_0
		.WORD PTR_8CA0|BANK_0
		.WORD PTR_8CB0|BANK_0
		.WORD PTR_8CC0|BANK_0
		.WORD PTR_8CD0|BANK_0
		.WORD PTR_8320|BANK_0
		.WORD PTR_8CE0|BANK_0
		.WORD PTR_8CF0|BANK_0
		.WORD PTR_8D00|BANK_0
		.WORD PTR_8D10|BANK_0
		.BYTE $FF
		.BYTE $FF
pPalaceChars_ExitDoor:.WORD PTR_9D00|BANK_0 ; ...
		.WORD PTR_9D10|BANK_0
		.WORD PTR_9D20|BANK_0
		.WORD PTR_9B10|BANK_0
		.WORD PTR_8720|BANK_0
		.WORD PTR_8730|BANK_0
		.WORD PTR_8740|BANK_0
		.WORD PTR_8B10|BANK_0
		.WORD PTR_9D30|BANK_0
		.WORD PTR_8130|BANK_0
		.WORD PTR_8120|BANK_0
		.WORD PTR_9D40|BANK_0
		.WORD PTR_8190|BANK_0
		.WORD PTR_8160|BANK_0
		.WORD PTR_8170|BANK_0
		.WORD PTR_9D50|BANK_0
		.WORD PTR_9D60|BANK_0
		.WORD PTR_9D70|BANK_0
		.WORD PTR_87B0|BANK_0
		.WORD PTR_9D80|BANK_0
		.WORD PTR_87D0|BANK_0
		.WORD PTR_87F0|BANK_0
		.WORD PTR_9D90|BANK_0
		.WORD PTR_9DA0|BANK_0
		.WORD PTR_9DB0|BANK_0
		.WORD PTR_9DC0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPalaceChars_Cutters:.WORD PTR_8DE0|BANK_0 ; ...
		.WORD PTR_8DF0|BANK_0
		.WORD PTR_8E00|BANK_0
		.WORD PTR_8E10|BANK_0
		.WORD PTR_9B10|BANK_0
		.WORD PTR_8E20|BANK_0
		.WORD PTR_8E30|BANK_0
		.WORD PTR_8E40|BANK_0
		.WORD PTR_A360|BANK_0
		.WORD PTR_A370|BANK_0
		.WORD PTR_A380|BANK_0
		.WORD PTR_8130|BANK_0
		.WORD PTR_8120|BANK_0
		.WORD PTR_9D90|BANK_0
		.WORD PTR_9DA0|BANK_0
		.WORD PTR_A390|BANK_0
		.WORD PTR_8190|BANK_0
		.WORD PTR_8160|BANK_0
		.WORD PTR_8170|BANK_0
		.WORD PTR_9DB0|BANK_0
		.WORD PTR_9DC0|BANK_0
		.WORD PTR_8E90|BANK_0
		.WORD PTR_8EA0|BANK_0
		.WORD PTR_8EB0|BANK_0
		.WORD PTR_8EC0|BANK_0
		.WORD PTR_A3A0|BANK_0
		.WORD PTR_8EE0|BANK_0
		.WORD PTR_A3B0|BANK_0
		.WORD PTR_A3C0|BANK_0
		.WORD PTR_A3D0|BANK_0
		.WORD PTR_8F00|BANK_0
		.WORD PTR_8F10|BANK_0
		.WORD PTR_8F20|BANK_0
		.WORD PTR_8F30|BANK_0
		.WORD PTR_8F40|BANK_0
		.WORD PTR_8F50|BANK_0
		.WORD PTR_8F60|BANK_0
		.WORD PTR_A3E0|BANK_0
		.WORD PTR_A3F0|BANK_0
		.WORD PTR_A400|BANK_0
		.WORD PTR_A410|BANK_0
		.WORD PTR_A420|BANK_0
		.WORD PTR_A430|BANK_0
		.WORD PTR_A440|BANK_0
		.WORD PTR_A450|BANK_0
		.WORD PTR_A460|BANK_0
		.WORD PTR_A470|BANK_0
		.WORD PTR_A480|BANK_0
		.WORD PTR_A490|BANK_0
		.WORD PTR_A4A0|BANK_0
		.WORD PTR_A4B0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPalaceChars_Door:.WORD	PTR_A1B0|BANK_0	; ...
		.WORD PTR_A1C0|BANK_0
		.WORD PTR_A1D0|BANK_0
		.WORD PTR_A1E0|BANK_0
		.WORD PTR_9A60|BANK_0
		.WORD PTR_8BB0|BANK_0
		.WORD PTR_8BC0|BANK_0
		.WORD PTR_8BD0|BANK_0
		.WORD PTR_A1F0|BANK_0
		.WORD PTR_9D30|BANK_0
		.WORD PTR_A200|BANK_0
		.WORD PTR_9D90|BANK_0
		.WORD PTR_A210|BANK_0
		.WORD PTR_9D40|BANK_0
		.WORD PTR_8190|BANK_0
		.WORD PTR_8160|BANK_0
		.WORD PTR_A220|BANK_0
		.WORD PTR_9530|BANK_0
		.WORD PTR_9540|BANK_0
		.WORD PTR_8B90|BANK_0
		.WORD PTR_8BA0|BANK_0
		.WORD PTR_8BF0|BANK_0
		.WORD PTR_8C00|BANK_0
		.WORD PTR_8C10|BANK_0
		.WORD PTR_8C20|BANK_0
		.WORD PTR_8C30|BANK_0
		.WORD PTR_A230|BANK_0
		.WORD PTR_8C50|BANK_0
		.WORD PTR_8C60|BANK_0
		.WORD PTR_8C70|BANK_0
		.WORD PTR_8C80|BANK_0
		.WORD PTR_8C90|BANK_0
		.WORD PTR_8CA0|BANK_0
		.WORD PTR_A240|BANK_0
		.WORD PTR_8400|BANK_0
		.WORD PTR_8410|BANK_0
		.WORD PTR_8AE0|BANK_0
		.WORD PTR_8AF0|BANK_0
		.WORD PTR_8B00|BANK_0
		.WORD PTR_8CC0|BANK_0
		.WORD PTR_8CD0|BANK_0
		.WORD PTR_8120|BANK_0
		.WORD PTR_8CE0|BANK_0
		.WORD PTR_8CF0|BANK_0
		.WORD PTR_8D00|BANK_0
		.WORD PTR_8D10|BANK_0
		.BYTE $FF
		.BYTE $FF
pPalaceChars_PressedBtn:.WORD PTR_AC00|BANK_0 ;	...
		.WORD PTR_AC10|BANK_0
		.WORD PTR_ABD0|BANK_0
		.WORD PTR_ABE0|BANK_0
		.WORD PTR_AB40|BANK_0
		.WORD PTR_AB50|BANK_0
		.WORD PTR_AC20|BANK_0
		.WORD PTR_AC30|BANK_0
		.WORD PTR_ABF0|BANK_0
		.WORD PTR_AC40|BANK_0
		.WORD PTR_AB60|BANK_0
		.BYTE $FF
		.BYTE $FF
pPalaceChars_MirrorPlate:.WORD PTR_8010|BANK_0 ; ...
		.WORD PTR_8020|BANK_0
		.WORD PTR_8030|BANK_0
		.WORD PTR_8040|BANK_0
		.WORD PTR_8050|BANK_0
		.WORD PTR_8060|BANK_0
		.WORD PTR_8070|BANK_0
		.WORD PTR_8080|BANK_0
		.WORD PTR_8090|BANK_0
		.WORD PTR_80A0|BANK_0
		.WORD PTR_80B0|BANK_0
		.WORD PTR_80C0|BANK_0
		.WORD PTR_80D0|BANK_0
		.WORD PTR_80E0|BANK_0
		.WORD PTR_80F0|BANK_0
		.WORD PTR_8100|BANK_0
		.WORD PTR_8110|BANK_0
		.WORD PTR_8120|BANK_0
		.WORD PTR_8130|BANK_0
		.WORD PTR_8140|BANK_0
		.WORD PTR_8150|BANK_0
		.WORD PTR_8160|BANK_0
		.WORD PTR_8170|BANK_0
		.WORD PTR_8180|BANK_0
		.WORD PTR_8190|BANK_0
		.BYTE $FF
		.BYTE $FF
pPalaceChars_HiButton:.WORD PTR_9B10|BANK_0 ; ...
		.WORD PTR_9390|BANK_0
		.WORD PTR_A620|BANK_0
		.WORD PTR_A630|BANK_0
		.WORD PTR_A640|BANK_0
		.WORD PTR_9660|BANK_0
		.WORD PTR_A650|BANK_0
		.WORD PTR_A660|BANK_0
		.WORD PTR_A670|BANK_0
		.WORD PTR_A680|BANK_0
		.WORD PTR_A690|BANK_0
		.WORD PTR_A6A0|BANK_0
		.WORD PTR_A6B0|BANK_0
		.WORD PTR_A6C0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPalaceChars_Base:.WORD	PTR_9B10|BANK_0	; ...
		.WORD PTR_A1F0|BANK_0
		.WORD PTR_9D30|BANK_0
		.WORD PTR_8130|BANK_0
		.WORD PTR_8120|BANK_0
		.WORD PTR_9D90|BANK_0
		.WORD PTR_9DA0|BANK_0
		.WORD PTR_9D40|BANK_0
		.WORD PTR_8190|BANK_0
		.WORD PTR_8160|BANK_0
		.WORD PTR_8170|BANK_0
		.WORD PTR_9DB0|BANK_0
		.WORD PTR_9DC0|BANK_0
		.WORD PTR_B250|BANK_0
		.WORD PTR_B260|BANK_0
		.WORD PTR_ACB0|BANK_0
		.WORD PTR_B270|BANK_0
		.WORD PTR_B280|BANK_0
		.WORD PTR_B290|BANK_0
		.WORD PTR_ACC0|BANK_0
		.WORD PTR_A400|BANK_0
		.WORD PTR_A410|BANK_0
		.WORD PTR_ACD0|BANK_0
		.WORD PTR_A420|BANK_0
		.WORD PTR_A430|BANK_0
		.WORD PTR_A440|BANK_0
		.WORD PTR_A450|BANK_0
		.WORD PTR_ACE0|BANK_0
		.WORD PTR_B2A0|BANK_0
		.WORD PTR_B2B0|BANK_0
		.WORD PTR_B2C0|BANK_0
		.WORD PTR_94A0|BANK_0
		.WORD PTR_B2D0|BANK_0
		.WORD PTR_9710|BANK_0
		.WORD PTR_B2E0|BANK_0
		.WORD PTR_B2F0|BANK_0
		.WORD PTR_B300|BANK_0
		.WORD PTR_B310|BANK_0
		.WORD PTR_B320|BANK_0
		.WORD PTR_B330|BANK_0
		.WORD PTR_8B10|BANK_0
		.WORD PTR_A250|BANK_0
		.WORD PTR_A260|BANK_0
		.WORD PTR_9600|BANK_0
		.WORD PTR_A270|BANK_0
		.WORD PTR_B340|BANK_0
		.WORD PTR_B350|BANK_0
		.WORD PTR_B360|BANK_0
		.WORD PTR_B370|BANK_0
		.WORD PTR_B380|BANK_0
		.WORD PTR_B390|BANK_0
		.WORD PTR_B3A0|BANK_0
		.WORD PTR_B3B0|BANK_0
		.WORD PTR_B3C0|BANK_0
		.WORD PTR_B3D0|BANK_0
		.WORD PTR_B3E0|BANK_0
		.WORD PTR_B3F0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPalaceChars_BaseAlt:.WORD PTR_9B10|BANK_0 ; ...
		.WORD PTR_A1F0|BANK_0
		.WORD PTR_9D30|BANK_0
		.WORD PTR_8130|BANK_0
		.WORD PTR_8120|BANK_0
		.WORD PTR_9D90|BANK_0
		.WORD PTR_9DA0|BANK_0
		.WORD PTR_9D40|BANK_0
		.WORD PTR_8190|BANK_0
		.WORD PTR_8160|BANK_0
		.WORD PTR_8170|BANK_0
		.WORD PTR_9DB0|BANK_0
		.WORD PTR_9DC0|BANK_0
		.WORD PTR_B250|BANK_0
		.WORD PTR_B260|BANK_0
		.WORD PTR_ACB0|BANK_0
		.WORD PTR_B270|BANK_0
		.WORD PTR_B280|BANK_0
		.WORD PTR_B290|BANK_0
		.WORD PTR_ACC0|BANK_0
		.WORD PTR_A400|BANK_0
		.WORD PTR_A410|BANK_0
		.WORD PTR_ACD0|BANK_0
		.WORD PTR_A420|BANK_0
		.WORD PTR_A430|BANK_0
		.WORD PTR_A440|BANK_0
		.WORD PTR_A450|BANK_0
		.WORD PTR_ACE0|BANK_0
		.WORD PTR_B2A0|BANK_0
		.WORD PTR_B2B0|BANK_0
		.WORD PTR_B2C0|BANK_0
		.WORD PTR_94A0|BANK_0
		.WORD PTR_B2D0|BANK_0
		.WORD PTR_9710|BANK_0
		.WORD PTR_B2E0|BANK_0
		.WORD PTR_B2F0|BANK_0
		.WORD PTR_B300|BANK_0
		.WORD PTR_B310|BANK_0
		.WORD PTR_B320|BANK_0
		.WORD PTR_B330|BANK_0
		.WORD PTR_8B10|BANK_0
		.WORD PTR_A250|BANK_0
		.WORD PTR_A260|BANK_0
		.WORD PTR_9600|BANK_0
		.WORD PTR_A270|BANK_0
		.WORD PTR_B340|BANK_0
		.WORD PTR_B350|BANK_0
		.WORD PTR_B360|BANK_0
		.BYTE $FF
		.BYTE $FF
pPalaceChars_Wall:.WORD	PTR_8DE0|BANK_0	; ...
		.WORD PTR_B400|BANK_0
		.WORD PTR_B410|BANK_0
		.WORD PTR_B420|BANK_0
		.WORD PTR_B430|BANK_0
		.WORD PTR_B440|BANK_0
		.WORD PTR_B450|BANK_0
		.WORD PTR_B460|BANK_0
		.WORD PTR_B470|BANK_0
		.WORD PTR_B480|BANK_0
		.WORD PTR_B490|BANK_0
		.WORD PTR_B4A0|BANK_0
		.WORD PTR_B4B0|BANK_0
		.WORD PTR_B4C0|BANK_0
		.WORD PTR_B4D0|BANK_0
		.WORD PTR_B4E0|BANK_0
		.WORD PTR_B4F0|BANK_0
		.WORD PTR_B500|BANK_0
		.WORD PTR_B510|BANK_0
		.WORD PTR_B520|BANK_0
		.WORD PTR_B530|BANK_0
		.BYTE $FF
		.BYTE $FF
pPalaceChars_BigWindow:.WORD PTR_B000|BANK_0 ; ...
		.WORD PTR_B010|BANK_0
		.WORD PTR_B020|BANK_0
		.WORD PTR_B030|BANK_0
		.WORD PTR_B040|BANK_0
		.WORD PTR_B050|BANK_0
		.WORD PTR_B060|BANK_0
		.WORD PTR_B070|BANK_0
		.WORD PTR_B080|BANK_0
		.WORD PTR_B090|BANK_0
		.WORD PTR_B0A0|BANK_0
		.WORD PTR_B0B0|BANK_0
		.WORD PTR_B0C0|BANK_0
		.WORD PTR_9B10|BANK_0
		.WORD PTR_B0D0|BANK_0
		.WORD PTR_B0E0|BANK_0
		.WORD PTR_B0F0|BANK_0
		.WORD PTR_B100|BANK_0
		.WORD PTR_B110|BANK_0
		.WORD PTR_B120|BANK_0
		.WORD PTR_B130|BANK_0
		.WORD PTR_B140|BANK_0
		.WORD PTR_B150|BANK_0
		.WORD PTR_8120|BANK_0
		.WORD PTR_8130|BANK_0
		.WORD PTR_8160|BANK_0
		.WORD PTR_8190|BANK_0
		.WORD PTR_8170|BANK_0
		.WORD PTR_B160|BANK_0
		.WORD PTR_B170|BANK_0
		.WORD PTR_B180|BANK_0
		.WORD PTR_B190|BANK_0
		.WORD PTR_B1A0|BANK_0
		.WORD PTR_B1B0|BANK_0
		.WORD PTR_B1C0|BANK_0
		.WORD PTR_B1D0|BANK_0
		.WORD PTR_B1E0|BANK_0
		.WORD PTR_B1F0|BANK_0
		.WORD PTR_B200|BANK_0
		.WORD PTR_B210|BANK_0
		.WORD PTR_B220|BANK_0
		.WORD PTR_B230|BANK_0
		.WORD PTR_B240|BANK_0
		.WORD PTR_9D90|BANK_0
		.WORD PTR_9DA0|BANK_0
		.WORD PTR_9DB0|BANK_0
		.WORD PTR_9DC0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPalaceChars_OverDoor:.WORD PTR_AF20|BANK_0 ; ...
		.WORD PTR_AF30|BANK_0
		.WORD PTR_AF40|BANK_0
		.WORD PTR_AF50|BANK_0
		.WORD PTR_9A60|BANK_0
		.WORD PTR_AF60|BANK_0
		.WORD PTR_AF70|BANK_0
		.WORD PTR_9AB0|BANK_0
		.WORD PTR_AF80|BANK_0
		.WORD PTR_AF90|BANK_0
		.WORD PTR_AFA0|BANK_0
		.WORD PTR_AFB0|BANK_0
		.WORD PTR_AFC0|BANK_0
		.WORD PTR_AFD0|BANK_0
		.WORD PTR_AFE0|BANK_0
		.WORD PTR_AFF0|BANK_0
		.WORD PTR_9B00|BANK_0
		.WORD PTR_8820|BANK_0
		.WORD PTR_8830|BANK_0
		.WORD PTR_A1F0|BANK_0
		.WORD PTR_9D30|BANK_0
		.WORD PTR_9D40|BANK_0
		.WORD PTR_8190|BANK_0
		.WORD PTR_8160|BANK_0
		.WORD PTR_A220|BANK_0
		.BYTE $FF
		.BYTE $FF
		.WORD PTR_9B10|BANK_0
		.WORD PTR_8B10|BANK_0
		.WORD PTR_9D30|BANK_0
		.WORD PTR_8130|BANK_0
		.WORD PTR_8120|BANK_0
		.WORD PTR_A250|BANK_0
		.WORD PTR_A260|BANK_0
		.WORD PTR_9600|BANK_0
		.WORD PTR_A270|BANK_0
		.WORD PTR_8180|BANK_0
		.WORD PTR_8190|BANK_0
		.BYTE $FF
		.BYTE $FF
pPalaceChars_DebrisPlate:.WORD PTR_9B10|BANK_0 ; ...
		.WORD PTR_A280|BANK_0
		.WORD PTR_A290|BANK_0
		.WORD PTR_A2A0|BANK_0
		.WORD PTR_A2B0|BANK_0
		.WORD PTR_A2C0|BANK_0
		.WORD PTR_A2D0|BANK_0
		.WORD PTR_9C60|BANK_0
		.WORD PTR_A2E0|BANK_0
		.WORD PTR_A2F0|BANK_0
		.WORD PTR_A300|BANK_0
		.WORD PTR_A310|BANK_0
		.WORD PTR_A320|BANK_0
		.WORD PTR_A330|BANK_0
		.WORD PTR_A340|BANK_0
		.WORD PTR_A350|BANK_0
		.BYTE $FF
		.BYTE $FF
pPalaceChars_Spikes:.WORD PTR_A4C0|BANK_0 ; ...
		.WORD PTR_A4D0|BANK_0
		.WORD PTR_8130|BANK_0
		.WORD PTR_A4E0|BANK_0
		.WORD PTR_A4F0|BANK_0
		.WORD PTR_9DA0|BANK_0
		.WORD PTR_9D40|BANK_0
		.WORD PTR_A500|BANK_0
		.WORD PTR_A510|BANK_0
		.WORD PTR_A520|BANK_0
		.WORD PTR_A530|BANK_0
		.WORD PTR_9DC0|BANK_0
		.WORD PTR_A540|BANK_0
		.WORD PTR_A550|BANK_0
		.WORD PTR_A560|BANK_0
		.WORD PTR_A570|BANK_0
		.WORD PTR_91E0|BANK_0
		.WORD PTR_90E0|BANK_0
		.WORD PTR_A580|BANK_0
		.WORD PTR_A590|BANK_0
		.WORD PTR_A5A0|BANK_0
		.WORD PTR_A5B0|BANK_0
		.WORD PTR_A5C0|BANK_0
		.WORD PTR_91D0|BANK_0
		.WORD PTR_9170|BANK_0
		.WORD PTR_A5D0|BANK_0
		.WORD PTR_A5E0|BANK_0
		.WORD PTR_A5F0|BANK_0
		.WORD PTR_9140|BANK_0
		.WORD PTR_9150|BANK_0
		.WORD PTR_9160|BANK_0
		.WORD PTR_9180|BANK_0
		.WORD PTR_9190|BANK_0
		.WORD PTR_A600|BANK_0
		.WORD PTR_A610|BANK_0
		.BYTE $FF
		.BYTE $FF
pPalaceChars_SkeletonPlate:.WORD PTR_9B10|BANK_0 ; ...
		.WORD PTR_85B0|BANK_0
		.WORD PTR_85C0|BANK_0
		.WORD PTR_9B20|BANK_0
		.WORD PTR_8380|BANK_0
		.WORD PTR_85E0|BANK_0
		.WORD PTR_85F0|BANK_0
		.WORD PTR_9B30|BANK_0
		.WORD PTR_8120|BANK_0
		.WORD PTR_9B40|BANK_0
		.WORD PTR_9B50|BANK_0
		.WORD PTR_9B60|BANK_0
		.WORD PTR_9B70|BANK_0
		.WORD PTR_9B80|BANK_0
		.WORD PTR_8190|BANK_0
		.BYTE $FF
		.BYTE $FF
pPalaceChars_BigClmn:.WORD PTR_9F60|BANK_0 ; ...
		.WORD PTR_9F70|BANK_0
		.WORD PTR_9F80|BANK_0
		.WORD PTR_9F90|BANK_0
		.WORD PTR_9FA0|BANK_0
		.WORD PTR_9B10|BANK_0
		.WORD PTR_9FB0|BANK_0
		.WORD PTR_9FC0|BANK_0
		.WORD PTR_9FD0|BANK_0
		.WORD PTR_9FE0|BANK_0
		.WORD PTR_9FF0|BANK_0
		.WORD PTR_A000|BANK_0
		.WORD PTR_A010|BANK_0
		.WORD PTR_A020|BANK_0
		.WORD PTR_A030|BANK_0
		.WORD PTR_A040|BANK_0
		.WORD PTR_A050|BANK_0
		.WORD PTR_A060|BANK_0
		.WORD PTR_A070|BANK_0
		.WORD PTR_A080|BANK_0
		.WORD PTR_A090|BANK_0
		.WORD PTR_A0A0|BANK_0
		.WORD PTR_9D40|BANK_0
		.WORD PTR_A0B0|BANK_0
		.WORD PTR_A0C0|BANK_0
		.WORD PTR_A0D0|BANK_0
		.WORD PTR_9DB0|BANK_0
		.WORD PTR_9DC0|BANK_0
		.WORD PTR_9570|BANK_0
		.WORD PTR_8DE0|BANK_0
		.WORD PTR_A0E0|BANK_0
		.WORD PTR_A0F0|BANK_0
		.WORD PTR_A100|BANK_0
		.WORD PTR_A110|BANK_0
		.WORD PTR_A120|BANK_0
		.WORD PTR_A130|BANK_0
		.WORD PTR_A140|BANK_0
		.WORD PTR_A150|BANK_0
		.WORD PTR_A160|BANK_0
		.WORD PTR_A170|BANK_0
		.WORD PTR_A180|BANK_0
		.WORD PTR_A190|BANK_0
		.WORD PTR_A1A0|BANK_0
		.BYTE $FF
		.BYTE $FF
pPalaceWallWindowChars:.WORD PTR_8780|BANK_0 ; ...
		.WORD PTR_A6D0|BANK_0
		.WORD PTR_A6E0|BANK_0
		.WORD PTR_80B0|BANK_0
		.WORD PTR_A6F0|BANK_0
		.WORD PTR_A700|BANK_0
		.WORD PTR_A710|BANK_0
		.WORD PTR_A720|BANK_0
		.WORD PTR_A730|BANK_0
		.WORD PTR_A740|BANK_0
		.WORD PTR_A750|BANK_0
		.WORD PTR_A760|BANK_0
		.WORD PTR_A770|BANK_0
		.WORD PTR_A780|BANK_0
		.WORD PTR_A790|BANK_0
		.WORD PTR_A7A0|BANK_0
		.WORD PTR_A7B0|BANK_0
		.WORD PTR_A7C0|BANK_0
		.WORD PTR_A7D0|BANK_0
		.WORD PTR_A7E0|BANK_0
		.WORD PTR_A7F0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_00:.WORD PTR_8440|BANK_0 ; ...
		.WORD PTR_8320|BANK_0
		.WORD PTR_8450|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_01:.WORD PTR_8450|BANK_0 ; ...
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_02:.WORD PTR_8490|BANK_0 ; ...
		.WORD PTR_8450|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_03:.WORD PTR_8440|BANK_0 ; ...
		.WORD PTR_8320|BANK_0
		.WORD PTR_84A0|BANK_0
		.BYTE $FF
		.BYTE $FF
		.WORD PTR_8440|BANK_0
		.WORD PTR_8320|BANK_0
		.WORD PTR_8480|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_04:.WORD PTR_8460|BANK_0 ; ...
		.WORD PTR_8470|BANK_0
		.WORD PTR_8450|BANK_0
		.BYTE $FF
		.BYTE $FF
		.WORD PTR_84F0|BANK_0
		.WORD PTR_8500|BANK_0
		.WORD PTR_8360|BANK_0
		.WORD PTR_8510|BANK_0
		.BYTE $FF
		.BYTE $FF
		.WORD PTR_8660|BANK_0
		.WORD PTR_8670|BANK_0
		.BYTE $FF
		.BYTE $FF
		.WORD PTR_88B0|BANK_0
		.WORD PTR_88C0|BANK_0
		.WORD PTR_88E0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_05:.WORD PTR_8370|BANK_0 ; ...
		.WORD PTR_8380|BANK_0
		.WORD PTR_8390|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_06:.WORD PTR_84B0|BANK_0 ; ...
		.WORD PTR_84C0|BANK_0
		.WORD PTR_84D0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_07:.WORD PTR_84E0|BANK_0 ; ...
		.WORD PTR_8470|BANK_0
		.WORD PTR_8450|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_08:.WORD PTR_84F0|BANK_0 ; ...
		.WORD PTR_8500|BANK_0
		.WORD PTR_8360|BANK_0
		.WORD PTR_8510|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_09:.WORD PTR_8520|BANK_0 ; ...
		.WORD PTR_8320|BANK_0
		.WORD PTR_8450|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_0A:.WORD PTR_8560|BANK_0 ; ...
		.WORD PTR_8360|BANK_0
		.WORD PTR_8510|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_0B:.WORD PTR_8570|BANK_0 ; ...
		.WORD PTR_8520|BANK_0
		.WORD PTR_8580|BANK_0
		.WORD PTR_84A0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_0C:.WORD PTR_8530|BANK_0 ; ...
		.WORD PTR_8380|BANK_0
		.WORD PTR_8540|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_65:.WORD PTR_A850|BANK_0 ; ...
		.WORD PTR_A860|BANK_0
		.WORD PTR_A870|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_0D:.WORD PTR_8550|BANK_0 ; ...
		.WORD PTR_8470|BANK_0
		.WORD PTR_8450|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_0E:.WORD PTR_8450|BANK_0 ; ...
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_0F:.WORD PTR_8440|BANK_0 ; ...
		.WORD PTR_8590|BANK_0
		.WORD PTR_84A0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_10:.WORD PTR_8440|BANK_0 ; ...
		.WORD PTR_8590|BANK_0
		.WORD PTR_8450|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_11:.WORD PTR_8440|BANK_0 ; ...
		.WORD PTR_8590|BANK_0
		.WORD PTR_8480|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_12:.WORD PTR_85A0|BANK_0 ; ...
		.WORD PTR_84C0|BANK_0
		.WORD PTR_8450|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_13:.WORD PTR_85A0|BANK_0 ; ...
		.WORD PTR_84C0|BANK_0
		.WORD PTR_84A0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_14:.WORD PTR_8640|BANK_0 ; ...
		.WORD PTR_8650|BANK_0
		.WORD PTR_8450|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_15:.WORD PTR_86A0|BANK_0 ; ...
		.WORD PTR_86B0|BANK_0
		.WORD PTR_86C0|BANK_0
		.WORD PTR_8510|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_16:.WORD PTR_8680|BANK_0 ; ...
		.WORD PTR_8690|BANK_0
		.WORD PTR_8450|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_17:.WORD PTR_8660|BANK_0 ; ...
		.WORD PTR_8670|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_18:.WORD PTR_88B0|BANK_0 ; ...
		.WORD PTR_88C0|BANK_0
		.WORD PTR_88D0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_19:.WORD PTR_88D0|BANK_0 ; ...
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_1A:.WORD PTR_88B0|BANK_0 ; ...
		.WORD PTR_88C0|BANK_0
		.WORD PTR_88E0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_1B:.WORD PTR_82A0|BANK_0 ; ...
		.WORD PTR_82B0|BANK_0
		.WORD PTR_82C0|BANK_0
		.WORD PTR_82D0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_1C:.WORD PTR_8220|BANK_0 ; ...
		.WORD PTR_8230|BANK_0
		.WORD PTR_8240|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_1D:.WORD PTR_8280|BANK_0 ; ...
		.WORD PTR_8290|BANK_0
		.WORD PTR_8240|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_1E:.WORD PTR_8240|BANK_0 ; ...
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_1F:.WORD PTR_8250|BANK_0 ; ...
		.WORD PTR_8260|BANK_0
		.WORD PTR_8270|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_20:.WORD PTR_82E0|BANK_0 ; ...
		.WORD PTR_82F0|BANK_0
		.WORD PTR_8300|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_21:.WORD PTR_8330|BANK_0 ; ...
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_22:.WORD PTR_8340|BANK_0 ; ...
		.WORD PTR_8350|BANK_0
		.WORD PTR_8360|BANK_0
		.WORD PTR_82D0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_23:.WORD PTR_8310|BANK_0 ; ...
		.WORD PTR_8320|BANK_0
		.WORD PTR_8330|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_24:.WORD PTR_8370|BANK_0 ; ...
		.WORD PTR_8380|BANK_0
		.WORD PTR_8390|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsEncPtr_D2:.WORD PTR_97D0|BANK_0 ; ...
		.WORD PTR_9BC0|BANK_0
		.WORD PTR_9AA0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_25:.WORD PTR_83A0|BANK_0 ; ...
		.WORD PTR_83B0|BANK_0
		.WORD PTR_83C0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_26:.WORD PTR_81D0|BANK_0 ; ...
		.WORD PTR_81E0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_27:.WORD PTR_83D0|BANK_0 ; ...
		.WORD PTR_83E0|BANK_0
		.BYTE $FF
		.BYTE $FF
pJointCharsBits_2E:.WORD PTR_8420|BANK_0 ; ...
		.WORD PTR_8430|BANK_0
		.BYTE $FF
		.BYTE $FF
pResidualData_01:.BYTE	$B1, $BA, $BA, $BA, $20


.PAD $C000,$FF
