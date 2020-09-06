
.base $8000

	include	src\bank02.rc\bank02_tiles.asm

pTitleScreenTiles:	
	include	src\bank02.rc\bank02_tiles_title_screen.asm


RenderSuccessText:			; ...
		LDX	#>(PPU_PAGE_1_LINE_8+7)
		LDY	#<(PPU_PAGE_1_LINE_8+7)
		LDA	#9
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_9+$B)
		LDY	#<(PPU_PAGE_1_LINE_9+$B)
		LDA	#$A
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_11+6)
		LDY	#<(PPU_PAGE_1_LINE_11+6)
		LDA	#$B
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_12+5)
		LDY	#<(PPU_PAGE_1_LINE_12+5)
		LDA	#$C
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_13+5)
		LDY	#<(PPU_PAGE_1_LINE_13+5)
		LDA	#$D
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_14+5)
		LDY	#<(PPU_PAGE_1_LINE_14+5)
		LDA	#$E
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_15+6)
		LDY	#<(PPU_PAGE_1_LINE_15+6)
		LDA	#$F
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_16+6)
		LDY	#<(PPU_PAGE_1_LINE_16+6)
		LDA	#$10
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_17+4)
		LDY	#<(PPU_PAGE_1_LINE_17+4)
		LDA	#$11
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_18+5)
		LDY	#<(PPU_PAGE_1_LINE_18+5)
		LDA	#$12
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_19+4)
		LDY	#<(PPU_PAGE_1_LINE_19+4)
		LDA	#$13
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_20+7)
		LDY	#<(PPU_PAGE_1_LINE_20+7)
		LDA	#$14
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_22+5)
		LDY	#<(PPU_PAGE_1_LINE_22+5)
		LDA	#$15
		JMP	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
; ---------------------------------------------------------------------------
TEXT09_aTheTyrantJaffa:.BYTE 'THE TYRANT JAFFAR',0 ; ...
TEXT0A_aLiesDead_:.BYTE	'LIES DEAD.',0  ; ...
TEXT0B_aHisPowerShatte:.BYTE 'HIS POWER SHATTERED.',0 ; ...
TEXT0C_aThroughoutTheL:.BYTE 'THROUGHOUT THE LAND,',0 ; ...
TEXT0D_aThePeopleOfPer:.BYTE 'THE PEOPLE OF PERSIA',0 ; ...
TEXT0E_aHailTheirPrincess:.BYTE	'HAIL THEIR PRINCESS,',0 ; ...
TEXT0F_aAndTheBraveYou:.BYTE 'AND THE BRAVE YOUTH',0 ; ...
TEXT10_aWhoSavedHerFro:.BYTE 'WHO SAVED HER FROM',0 ; ...
TEXT11_aTheForcesOfDar:.BYTE 'THE FORCES OF DARKNESS.',0 ; ...
TEXT12_aNoLongerAStranger:.BYTE	'NO LONGER A STRANGER,',0 ; ...
TEXT13_aHeShallFromThisDay:.BYTE 'HE SHALL FROM THIS DAY',0 ; ...
TEXT14_aForthBeKnownAs:.BYTE 'FORTH BE KNOWN AS..',0 ; ...
TEXT15_a__princeOfPers:.BYTE '..PRINCE OF PERSIA..',0 ; ...
TEXT16_aWellDone__:.BYTE 'WELL DONE..',0 ; ...

; =============== S U B	R O U T	I N E =======================================


RenderGameFailText:			; ...
		LDX	#>(PPU_PAGE_1_LINE_9+7)
		LDY	#<(PPU_PAGE_1_LINE_9+7)
		LDA	#$17
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_10+6)
		LDY	#<(PPU_PAGE_1_LINE_10+6)
		LDA	#$18
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_11+4)
		LDY	#<(PPU_PAGE_1_LINE_11+4)
		LDA	#$19
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_12+$C)
		LDY	#<(PPU_PAGE_1_LINE_12+$C)
		LDA	#$1A
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_15+6)
		LDY	#<(PPU_PAGE_1_LINE_15+6)
		LDA	#$1B
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_16+4)
		LDY	#<(PPU_PAGE_1_LINE_16+4)
		LDA	#$1C
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_17+5)
		LDY	#<(PPU_PAGE_1_LINE_17+5)
		LDA	#$1D
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_18+4)
		LDY	#<(PPU_PAGE_1_LINE_18+4)
		LDA	#$1E
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_19+8)
		LDY	#<(PPU_PAGE_1_LINE_19+8)
		LDA	#$1F
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_20+$B)
		LDY	#<(PPU_PAGE_1_LINE_20+$B)
		LDA	#$20 ; ' '
		JMP	WriteText	; X - PPU HI
; End of function RenderGameFailText	; Y - PPU LO
					; A - id of Data
; ---------------------------------------------------------------------------
TEXT17_aDespiteTheBrav:.BYTE 'DESPITE THE BRAVE',0 ; ...
TEXT18_aYouthsBestEffo:.BYTE 'YOUTHS BEST EFFORTS,',0 ; ...
TEXT19_aTheSandsOfTime:.BYTE 'THE SANDS OF TIME HAVE',0 ; ...
TEXT1A_aRunOut_:.BYTE 'RUN OUT.',0      ; ...
TEXT1B_aHopingForAnoth:.BYTE 'HOPING FOR ANOTHER',0 ; ...
TEXT1C_aChanceHeHasAlr:.BYTE 'CHANCE, HE HAS ALREADY',0 ; ...
TEXT1D_aBegunToPrepare:.BYTE 'BEGUN TO PREPARE FOR',0 ; ...
TEXT1E_aHisInevitableRematch:.BYTE 'HIS INEVITABLE REMATCH',0 ; ...
TEXT1F_aWithTheTyrant:.BYTE 'WITH THE TYRANT',0 ; ...
TEXT20_aJaffar___:.BYTE	'JAFFAR...',0   ; ...
pMouseTiles:	.BYTE 0, 0, 0, 0, 0, 0,	0, 0; bitsTileLo ; ...
		.BYTE 0, 0, 0, 0, 0, 0,	0, 0; bitsTileHi
		.BYTE 0, 0, 0, 0, $37, $3F, $7F, $FF; bitsTileLo
		.BYTE 0, 0, 0, 0, $37, $3F, $77, $FB; bitsTileHi
		.BYTE 0, 0, 0, 0, $80, $E0, $E0, $BF; bitsTileLo
		.BYTE 0, 0, 0, 0, $80, $C0, $E0, $BC; bitsTileHi
		.BYTE 0, 0, 0, 0, $37, $3F, $7F, $FB; bitsTileLo
		.BYTE 0, 0, 0, 0, $33, $3F, $77, $FD; bitsTileHi
		.BYTE 0, 0, 0, 0, $C0, $F0, $F0, $DF; bitsTileLo
		.BYTE 0, 0, 0, 0, $C0, $E0, $F0, $DE; bitsTileHi
		.BYTE $98, $FC,	$78, $78, $BC, $3C, $3E, $7B; bitsTileLo
		.BYTE $80, $FC,	$78, $18, $BC, $1C, $1E, $7B; bitsTileHi
		.BYTE 0, 0, 0, 0, 0, 0,	$60, $C0; bitsTileLo
		.BYTE 0, 0, 0, 0, 0, 0,	$40, $C0; bitsTileHi
pPrincessTiles:	.BYTE 0, 0, 0, 0, 0, 0,	0, 0; bitsTileLo ; ...
		.BYTE 0, 0, 0, 0, 0, 0,	0, 0; bitsTileHi
		.BYTE 0, 0, 0, 0, 0, 0,	0, 0; bitsTileLo
		.BYTE 0, 0, 3, 3, 3, 3,	7, 7; bitsTileHi
		.BYTE 0, 0, 0, 0, 0, $18, $18, 0; bitsTileLo
		.BYTE 0, $F8, $FC, $FC,	$F8, $E0, $E0, $C0; bitsTileHi
		.BYTE 0, 0, 0, 0, 0, 0,	0, 0; bitsTileLo
		.BYTE 7, 7, 7, 7, 3, 0,	0, 0; bitsTileHi
		.BYTE $C0, $F0,	$D8, $FC, $FC, $F8, $F8, $FE; bitsTileLo
		.BYTE $20, 0, $38, $3C,	$3C, $38, $38, 0; bitsTileHi
		.BYTE 0, 0, 1, 1, 1, 1,	3, 3; bitsTileLo
		.BYTE 0, 0, 1, 1, 1, 1,	3, 3; bitsTileHi
		.BYTE $72, $F0,	$F0, $F0, $F8, $F8, $F8, $F8; bitsTileLo
		.BYTE $70, $F0,	$F0, $F0, $F8, $F8, $F8, $F8; bitsTileHi
		.BYTE 1, 2, 5, 2, 5, $A, 4, $A;	bitsTileLo
		.BYTE 2, 1, 2, 5, 2, 5,	$B, 5; bitsTileHi
		.BYTE $FC, $FC,	$7C, $BC, $54, $A8, $54, $A8; bitsTileLo
		.BYTE $FC, $7C,	$BC, $5C, $AC, $54, $A8, $54; bitsTileHi
		.BYTE $14, 8, $10, 8, 0, 0, 0, 0; bitsTileLo
		.BYTE $B, $17, 8, $10, 0, 0, 0,	0; bitsTileHi
		.BYTE $54, $A8,	$54, $88, $40, $A0, $70, $FC; bitsTileLo
		.BYTE $A8, $54,	$A8, $54, $80, $40, $80, 0; bitsTileHi
		.BYTE 0, 0, 0, 0, 0, 3,	6, 7; bitsTileLo
		.BYTE 0, 0, 0, $F, $3F,	$7C, $F8, $F8; bitsTileHi
		.BYTE 0, 0, 0, 0, 0, 0,	0, 0; bitsTileLo
		.BYTE 3, $F, 7,	1, 0, 0, 0, 0; bitsTileHi
		.BYTE 7, 0, $C,	$36, $77, $6F, $DF, $BF; bitsTileLo
		.BYTE $F8, $FC,	$F0, 8,	9, $1F,	$3F, $7F; bitsTileHi
		.BYTE 0, 0, 0, 0, 0, $80, $80, 0; bitsTileLo
		.BYTE 0, 0, 0, 0, 0, $80, $80, 0; bitsTileHi
		.BYTE 1, 1, 0, 0, 0, 1,	1, 1; bitsTileLo
		.BYTE 0, 0, 0, 0, 0, 1,	1, 1; bitsTileHi
		.BYTE $BE, $BE,	$FE, $FE, $FE, $FE, $FF, $FF; bitsTileLo
		.BYTE $3E, $3E,	$1E, $C2, $F2, $FE, $FF, $FF; bitsTileHi
		.BYTE 3, 7, 7, $B, $14,	$A, $15, $2A; bitsTileLo
		.BYTE 3, 7, $F,	7, $B, $15, $2A, $55; bitsTileHi
		.BYTE $FF, $FF,	$FF, $FF, $FF, $AE, $55, $AA; bitsTileLo
		.BYTE $FF, $FF,	$FF, $FF, $FF, $5F, $AA, $55; bitsTileHi
		.BYTE 0, $80, $80, $80,	$80, $A0, $40, $A0; bitsTileLo
		.BYTE 0, $80, $80, $80,	$80, $40, $A0, $50; bitsTileHi
		.BYTE $55, $2A,	5, 0, 6, $E, $E, $F; bitsTileLo
		.BYTE $AA, $15,	$A, 6, 0, 0, 0,	0; bitsTileHi
		.BYTE $55, $AA,	$55, $AA, $10, $18, $3C, $3F; bitsTileLo
		.BYTE $AA, $55,	$AA, $55, 8, 0,	0, 0; bitsTileHi
		.BYTE $50, $A8,	$54, $A0, 0, 0,	0, 0; bitsTileLo
		.BYTE $A8, $54,	$AA, $40, 0, 0,	0, 0; bitsTileHi
TEXT2F_aYourNew:.BYTE 'YOUR NEW',0      ; ...
TEXT30_aPassword:.BYTE 'PASSWORD',0     ; ...
TEXT31_aIs:	.BYTE 'IS',0            ; ...
TEXT27_aMusicOn:.BYTE 'MUSIC ON ',0     ; ...
TEXT28_aMusicOff:.BYTE 'MUSIC OFF',0    ; ...
TEXT08_aToBegin:.BYTE 'TO BEGIN',0      ; ...
TEXT00_aPushStart:.BYTE	'PUSH START',0  ; ...
TEXT01_asc_296FD:.BYTE '          ',0   ; ...
TEXT21_aSoftwareInc_:.BYTE 'SOFTWARE, INC.',0 ; ...
TEXT2B_aJordanMechner_:.BYTE 'JORDAN MECHNER.',0 ; ...
TEXT2C_aMindscape:.BYTE	'MINDSCAPE',0   ; ...
TEXT2D_aInternationalLimited:.BYTE 'INTERNATIONAL LIMITED',0 ; ...
TEXT2E_aLicensedToMindscapeIn:.BYTE 'LICENSED TO MINDSCAPE INT.',0 ; ...
TEXT02_aPrinceOfPersia:.BYTE 'PRINCE OF PERSIA',0 ; ...
TEXT03_aByJordanMechne:.BYTE 'BY JORDAN MECHNER',0 ; ...
TEXT04_aPresentedBy:.BYTE 'PRESENTED BY',0 ; ...
TEXT05_aLicensedByNintendo:.BYTE 'LICENSED BY NINTENDO',0 ; ...
TEXT06_a1992VirginGame:.BYTE '/1992 VIRGIN GAMES, INC.',0 ; ...
TEXT07_a19891992Broder:.BYTE '/1989, 1992 BRODERBUND',0 ; ...
TEXT22_aAllRightsReserved:.BYTE	'ALL RIGHTS RESERVED',0 ; ...
TEXT23_aPrinceOfPers_0:.BYTE 'PRINCE OF PERSIA IS A',0 ; ...
TEXT24_aRegisteredTrad:.BYTE 'REGISTERED TRADEMARK OF',0 ; ...
TEXT25_aBroderbundSoft:.BYTE 'BRODERBUND SOFTWARE, INC.',0 ; ...
TEXT26_aDevelopedByMotivetime:.BYTE 'DEVELOPED BY MOTIVETIME LTD.',0 ; ...
; ---------------------------------------------------------------------------

DrawTitleScreen:			; ...
		LDX	#>(PPU_PAGE_1_LINE_2+8)
		LDY	#<(PPU_PAGE_1_LINE_2+8)
		LDA	#2
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_3+8)
		LDY	#<(PPU_PAGE_1_LINE_3+8)
		LDA	#3
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_4+$A)
		LDY	#<(PPU_PAGE_1_LINE_4+$A)
		LDA	#4
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_25+6)
		LDY	#<(PPU_PAGE_1_LINE_25+6)
		LDA	#5
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_16+4)
		LDY	#<(PPU_PAGE_1_LINE_16+4)
		LDA	#6
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_14+5)
		LDY	#<(PPU_PAGE_1_LINE_14+5)
		LDA	#7
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_15+$A)
		LDY	#<(PPU_PAGE_1_LINE_15+$A)
		LDA	#$21 ; '!'
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_17+7)
		LDY	#<(PPU_PAGE_1_LINE_17+7)
		LDA	#$22 ; '"'
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_18+6)
		LDY	#<(PPU_PAGE_1_LINE_18+6)
		LDA	#$23 ; '#'
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_19+5)
		LDY	#<(PPU_PAGE_1_LINE_19+5)
		LDA	#$24 ; '$'
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_20+4)
		LDY	#<(PPU_PAGE_1_LINE_20+4)
		LDA	#$25 ; '%'
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#>(PPU_PAGE_1_LINE_22+2)
		LDY	#<(PPU_PAGE_1_LINE_22+2)
		LDA	#$26 ; '&'
		JMP	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data

; =============== S U B	R O U T	I N E =======================================


RenderWellDoneAttr:			; ...
		LDA	#>(PPU_ATTR_PAGE_1_LINES_0_1_2_3)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_ATTR_PAGE_1_LINES_0_1_2_3)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#$55 ; 'U'
		LDX	#$40 ; '@'

lbRenderWellDoneAttrLoop:		; ...
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		DEX
		BNE	lbRenderWellDoneAttrLoop
		LDA	#>(PPU_ATTR_PAGE_1_LINES_0_1_2_3)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_ATTR_PAGE_1_LINES_0_1_2_3)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		JSR	WriteLineAttr_FF
		LDA	#>(PPU_ATTR_PAGE_1_LINES_16_17_18_19)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_ATTR_PAGE_1_LINES_16_17_18_19)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		JSR	WriteLineAttr_FF
		JSR	WriteLineAttr_FF
		LDA	#>(PPU_ATTR_PAGE_1_LINES_8_9_10_11)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_ATTR_PAGE_1_LINES_8_9_10_11)
		JSR	WriteSingleAttr_FF
		LDA	#>(PPU_ATTR_PAGE_1_LINES_12_13_14_15)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_ATTR_PAGE_1_LINES_12_13_14_15)
		JSR	WriteSingleAttr_FF
		LDA	#>(PPU_ATTR_PAGE_1_LINES_8_9_10_11+6)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_ATTR_PAGE_1_LINES_8_9_10_11+6)
		JSR	WriteSingleAttr_FF
		LDA	#>(PPU_ATTR_PAGE_1_LINES_12_13_14_15+6)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_ATTR_PAGE_1_LINES_12_13_14_15+6)
; End of function RenderWellDoneAttr


; =============== S U B	R O U T	I N E =======================================


WriteSingleAttr_FF:			; ...
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#$FF
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		RTS
; End of function WriteSingleAttr_FF


; =============== S U B	R O U T	I N E =======================================


WriteLineAttr_FF:			; ...
		LDA	#$FF
		LDX	#$10

lbWriteLineAttr_FF:			; ...
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		DEX
		BNE	lbWriteLineAttr_FF
		RTS
; End of function WriteLineAttr_FF


; =============== S U B	R O U T	I N E =======================================


RenderFrame:				; ...
		LDA	#8
		STA	vPPU_ScrollVert
		LDA	#<(ptrPal_Titles)
		STA	vptrPalette
		LDA	#>(ptrPal_Titles)
		STA	vptrPalette+1
		LDA	#>(PPU_ATTR_PAGE_1_LINES_4_5_6_7)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_ATTR_PAGE_1_LINES_4_5_6_7)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDX	#0
		LDY	#48

lbWriteFrameAttributes:			; ...
		LDA	pFrameAttributes,X
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INX
		DEY
		BNE	lbWriteFrameAttributes
		LDA	#>(PPU_PAGE_1_LINE_4)
		STA	vPPUPtr
		LDA	#<(PPU_PAGE_1_LINE_4)
		STA	vPPUPtr+1
		JSR	SendPatternTiles_0e_Amount
		LDA	#>(PPU_PAGE_1_LINE_26)
		STA	vPPUPtr
		LDA	#<(PPU_PAGE_1_LINE_26)
		STA	vPPUPtr+1
		JSR	SendPatternTiles_0e_Amount
		LDA	#>(PPU_PAGE_1_LINE_4)
		STA	vPPUPtr
		LDA	#<(PPU_PAGE_1_LINE_4)
		STA	vPPUPtr+1
		JSR	SendPatternTiles_0b_Amount
		LDA	#>(PPU_PAGE_1_LINE_4+$1C)
		STA	vPPUPtr
		LDA	#<(PPU_PAGE_1_LINE_4+$1C)
		STA	vPPUPtr+1
		JSR	SendPatternTiles_0b_Amount
		LDX	#>(PPU_PAGE_1_LINE_4+$1C)
		LDY	#<(PPU_PAGE_1_LINE_4+$1C)
		JSR	WritePatternTiles_2
		LDX	#>(PPU_PAGE_1_LINE_4)
		LDY	#<(PPU_PAGE_1_LINE_4)
		JSR	WritePatternTiles_2
		LDX	#>(PPU_PAGE_1_LINE_26+$1C)
		LDY	#<(PPU_PAGE_1_LINE_26+$1C)
		JSR	WritePatternTiles_2
		LDX	#>(PPU_PAGE_1_LINE_26)
		LDY	#<(PPU_PAGE_1_LINE_26)
		JMP	WritePatternTiles_2
; End of function RenderFrame


; =============== S U B	R O U T	I N E =======================================


SendPatternTiles_0b_Amount:		; ...
		LDX	#$B

lbSendPatternTiles_0b_Amount:		; ...
		TXA
		PHA
		LDX	vPPUPtr
		LDY	vPPUPtr+1
		JSR	WritePatternTiles_1
		LDA	vPPUPtr+1
		CLC
		ADC	#$40 ; '@'
		STA	vPPUPtr+1
		LDA	vPPUPtr
		ADC	#0
		STA	vPPUPtr
		PLA
		TAX
		DEX
		BNE	lbSendPatternTiles_0b_Amount
		RTS
; End of function SendPatternTiles_0b_Amount


; =============== S U B	R O U T	I N E =======================================


SendPatternTiles_0e_Amount:		; ...
		LDX	#$E

lbSendPatternTiles_0e_Amount:		; ...
		TXA
		PHA
		LDX	vPPUPtr
		LDY	vPPUPtr+1
		JSR	WritePatternTiles_1
		INC	vPPUPtr+1
		INC	vPPUPtr+1
		PLA
		TAX
		DEX
		BNE	lbSendPatternTiles_0e_Amount
		RTS
; End of function SendPatternTiles_0e_Amount


; =============== S U B	R O U T	I N E =======================================


WritePatternTiles_1:			; ...
		LDA	#>(pPatternTiles1)
		STA	vptrBlockData+1
		LDA	#<(pPatternTiles1)
		JMP	lbWritePatternTiles
; End of function WritePatternTiles_1


; =============== S U B	R O U T	I N E =======================================


WritePatternTiles_2:			; ...
		LDA	#>(pPatternTiles2)
		STA	vptrBlockData+1
		LDA	#<(pPatternTiles2)

lbWritePatternTiles:			; ...
		STA	vptrBlockData
		LDA	#2
;		STA	vtmpCounter19
		.BYTE	$8D, $19, $00
		LDA	#2
		JMP	WritePatternTiles
; End of function WritePatternTiles_2


; =============== S U B	R O U T	I N E =======================================


RenderPrinceOfPersiaLogo_07_07:		; ...
		LDX	#>(PPU_PAGE_1_LINE_8+7)
		LDY	#<(PPU_PAGE_1_LINE_8+7)

RenderPrinceOfPersiaLogo:		; ...
		LDA	#>(pPrinceOfPersiaLogo)
		STA	vptrBlockData+1
		LDA	#<(pPrinceOfPersiaLogo)
		STA	vptrBlockData
		LDA	#$10
;		STA	vtmpCounter19
		.BYTE	$8D, $19, $00
		LDA	#4
		JMP	WritePatternTiles
; End of function RenderPrinceOfPersiaLogo_07_07


; =============== S U B	R O U T	I N E =======================================


WaitAnyJoyKey:				; ...
		JSR	WaitNMI_PRG6
		LDA	vJoypad1
		BNE	WaitAnyJoyKey
		RTS
; End of function WaitAnyJoyKey


; =============== S U B	R O U T	I N E =======================================

; returns: X not null if key pressed

WaitTitleScreenAndCheckJoy:		; ...
		JSR	WaitNMI_PRG6
		LDA	vfSetupLevelPalette
		BNE	WaitTitleScreenAndCheckJoy ; returns: X	not null if key	pressed
		DEC	vTitleScreenTimer
		LDA	vTitleScreenTimer
		BEQ	lbWaitTitleScreenAndCheckJoyExit
		LDA	vJoypad1
		BEQ	WaitTitleScreenAndCheckJoy ; returns: X	not null if key	pressed
		JSR	WaitClearNMI
		LDX	#1
		RTS
; ---------------------------------------------------------------------------

lbWaitTitleScreenAndCheckJoyExit:	; ...
		LDX	#0
		RTS
; End of function WaitTitleScreenAndCheckJoy

; ---------------------------------------------------------------------------
pPrinceOfPersiaLogo:.BYTE    9,	 $A,  $B,  $C,	$D,  $E,  $F, $10, $11,	$12, $13, $14, $15, $16, $17, $18 ; ...
		.BYTE  $19, $1A, $1B, $1C, $1D,	$1E, $1F, $20, $21, $22, $23, $24, $25,	$26, $27, $28
		.BYTE  $29, $2A, $2B, $2C, $2D,	$2E, $2F, $30, $31, $32, $33, $34, $35,	$36, $37, $38
		.BYTE  $39, $3A, $3B, $3C,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	$3D, $3E, $3F
pPatternTiles2:	.BYTE	 1,   2,   3,	4 ; ...
pPatternTiles1:	.BYTE	 5,   6,   7,	8 ; ...
pTextLibrary:	.WORD TEXT00_aPushStart	; ...
					; "PUSH	START"
		.WORD TEXT01_asc_296FD	; "	     "
		.WORD TEXT02_aPrinceOfPersia ; "PRINCE OF PERSIA"
		.WORD TEXT03_aByJordanMechne ; "BY JORDAN MECHNER"
		.WORD TEXT04_aPresentedBy ; "PRESENTED BY"
		.WORD TEXT05_aLicensedByNintendo ; "LICENSED BY	NINTENDO"
		.WORD TEXT06_a1992VirginGame ; "/1992 VIRGIN GAMES, INC."
		.WORD TEXT07_a19891992Broder ; "/1989, 1992 BRODERBUND"
		.WORD TEXT08_aToBegin	; "TO BEGIN"
		.WORD TEXT09_aTheTyrantJaffa ; "THE TYRANT JAFFAR"
		.WORD TEXT0A_aLiesDead_	; "LIES	DEAD."
		.WORD TEXT0B_aHisPowerShatte ; "HIS POWER SHATTERED."
		.WORD TEXT0C_aThroughoutTheL ; "THROUGHOUT THE LAND,"
		.WORD TEXT0D_aThePeopleOfPer ; "THE PEOPLE OF PERSIA"
		.WORD TEXT0E_aHailTheirPrincess	; "HAIL	THEIR PRINCESS,"
		.WORD TEXT0F_aAndTheBraveYou ; "AND THE	BRAVE YOUTH"
		.WORD TEXT10_aWhoSavedHerFro ; "WHO SAVED HER FROM"
		.WORD TEXT11_aTheForcesOfDar ; "THE FORCES OF DARKNESS."
		.WORD TEXT12_aNoLongerAStranger	; "NO LONGER A STRANGER,"
		.WORD TEXT13_aHeShallFromThisDay ; "HE SHALL FROM THIS DAY"
		.WORD TEXT14_aForthBeKnownAs ; "FORTH BE KNOWN AS.."
		.WORD TEXT15_a__princeOfPers ; "..PRINCE OF PERSIA.."
		.WORD TEXT16_aWellDone__ ; "WELL DONE.."
		.WORD TEXT17_aDespiteTheBrav ; "DESPITE	THE BRAVE"
		.WORD TEXT18_aYouthsBestEffo ; "YOUTHS BEST EFFORTS,"
		.WORD TEXT19_aTheSandsOfTime ; "THE SANDS OF TIME HAVE"
		.WORD TEXT1A_aRunOut_	; "RUN OUT."
		.WORD TEXT1B_aHopingForAnoth ; "HOPING FOR ANOTHER"
		.WORD TEXT1C_aChanceHeHasAlr ; "CHANCE,	HE HAS ALREADY"
		.WORD TEXT1D_aBegunToPrepare ; "BEGUN TO PREPARE FOR"
		.WORD TEXT1E_aHisInevitableRematch ; "HIS INEVITABLE REMATCH"
		.WORD TEXT1F_aWithTheTyrant ; "WITH THE	TYRANT"
		.WORD TEXT20_aJaffar___	; "JAFFAR..."
		.WORD TEXT21_aSoftwareInc_ ; "SOFTWARE,	INC."
		.WORD TEXT22_aAllRightsReserved	; "ALL RIGHTS RESERVED"
		.WORD TEXT23_aPrinceOfPers_0 ; "PRINCE OF PERSIA IS A"
		.WORD TEXT24_aRegisteredTrad ; "REGISTERED TRADEMARK OF"
		.WORD TEXT25_aBroderbundSoft ; "BRODERBUND SOFTWARE, INC."
		.WORD TEXT26_aDevelopedByMotivetime ; "DEVELOPED BY MOTIVETIME LTD."
		.WORD TEXT27_aMusicOn	; "MUSIC ON "
		.WORD TEXT28_aMusicOff	; "MUSIC OFF"
		.WORD pMouseTiles
		.WORD TEXT16_aWellDone__ ; "WELL DONE.."
		.WORD TEXT2B_aJordanMechner_ ; "JORDAN MECHNER."
		.WORD TEXT2C_aMindscape	; "MINDSCAPE"
		.WORD TEXT2D_aInternationalLimited ; "INTERNATIONAL LIMITED"
		.WORD TEXT2E_aLicensedToMindscapeIn ; "LICENSED	TO MINDSCAPE INT."
		.WORD TEXT2F_aYourNew	; "YOUR	NEW"
		.WORD TEXT30_aPassword	; "PASSWORD"
		.WORD TEXT31_aIs	; "IS"

; =============== S U B	R O U T	I N E =======================================

; X - PPU HI
; Y - PPU LO
; A - id of Data

WriteText:				; ...
		STX	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		STY	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		ASL	A
		TAY
		LDA	pTextLibrary,Y
		STA	vtmpCounter19
		LDA	pTextLibrary+1,Y
		STA	vtmpCounter19+1
		LDY	#0

lbLoopOutputText:			; ...
		LDA	(vtmpCounter19),Y
		BNE	lbOutputText
		JMP	lbOutputTextExit
; ---------------------------------------------------------------------------

lbOutputText:				; ...
		JSR	ConvertTextCharToTile
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INY
		JMP	lbLoopOutputText
; ---------------------------------------------------------------------------

lbOutputTextExit:			; ...
		RTS
; End of function WriteText


; =============== S U B	R O U T	I N E =======================================


LogoScreen:				; ...
		LDA	#$F8 ; 'ø'
		STA	vPPU_ScrollHorz
		LDA	#8
		STA	vPPU_ScrollVert
		STA	vfSkipNMI
		JSR	LoadTitleTiles
		LDA	#>(PPU_PAGE_1_LINE_0)
		JSR	ErasePPUPage
		JSR	DrawLogoScreen
		JSR	SetupLogoScreenAttr
		LDA	#<(ptrPal_Titles)
		STA	vptrPalette
		LDA	#>(ptrPal_Titles)
		STA	vptrPalette+1
		JSR	SetupWaitScreenVars
		JSR	WaitAnyJoyKey
		JSR	WaitTitleScreenAndCheckJoy ; returns: X	not null if key	pressed
		JMP	WaitClearNMI
; End of function LogoScreen


; =============== S U B	R O U T	I N E =======================================


SetupLogoScreenAttr:			; ...
		LDA	#>(PPU_ATTR_PAGE_1_LINES_4_5_6_7)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_ATTR_PAGE_1_LINES_4_5_6_7)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDX	#0
		LDY	#48

lbSetupLogoScreenAttr:			; ...
		LDA	pLogoScreenAttr,X
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INX
		DEY
		BNE	lbSetupLogoScreenAttr
		RTS
; End of function SetupLogoScreenAttr


; =============== S U B	R O U T	I N E =======================================


DrawLogoScreen:				; ...
		LDX	#>(PPU_PAGE_1_LINE_4)
		LDY	#<(PPU_PAGE_1_LINE_4)
		LDA	#>(pLogoScreenTiles)
		STA	vptrBlockData+1
		LDA	#<(pLogoScreenTiles)
		STA	vptrBlockData
		LDA	#30
;		STA	vtmpCounter19
		.BYTE	$8D, $19, $00
		LDA	#24
		JMP	WritePatternTiles
; End of function DrawLogoScreen

; ---------------------------------------------------------------------------
pLogoScreenTiles:.BYTE	  1,   2,   5,	 6,   5,   6,	5,   6,	  5,   6,   5,	 6,   0,   0,	0,   0,	  0,   0,   5,	 6,   5,   6,	5,   6,	  5,   6,   5,	 6,   1,   2 ; ...
		.BYTE	 3,   4,   7,	8,   7,	  8,   7,   8,	 7,   8,   7,	8,   0,	$40, $41, $42, $43,   0,   7,	8,   7,	  8,   7,   8,	 7,   8,   7,	8,   3,	  4
		.BYTE	 5,   6, $44, $45, $46,	$47, $48, $44, $45, $49, $4A, $4B, $4C,	$4D, $4E, $4F, $50, $51, $52, $53, $54,	$48, $44, $45, $46, $47, $48, $44,   5,	  6
		.BYTE	 7,   8, $46, $47, $48,	$44, $45, $49, $4A, $55, $56, $57, $58,	$59, $59, $58, $59, $58, $5A, $5B, $5C,	$53, $5D, $47, $48, $44, $45, $46,   7,	  8
		.BYTE	 5,   6, $48, $44, $45,	$49, $4A, $55, $56, $57, $5E, $59, $59,	$59, $59, $59, $59, $59, $5F, $59, $5A,	$5B, $5C, $53, $60, $46, $47, $48,   5,	  6
		.BYTE	 7,   8, $45, $46, $61,	$55, $56, $57, $59, $59, $59, $59, $59,	$62, $62, $59, $59, $59, $59, $59, $59,	$59, $5A, $5B, $63, $64, $44, $45,   7,	  8
		.BYTE	 5,   6, $47, $65, $66,	$57, $59, $5F, $59, $59, $59, $59, $67,	$68, $69, $6A, $6B, $59, $58, $59, $59,	$59, $5E, $59, $5A, $6C, $6D, $47,   5,	  6
		.BYTE	 7,   8, $6E, $6F, $70,	$59, $59, $59, $59, $59, $71, $72, $73,	$74, $69, $75, $76, $6B, $59, $59, $58,	$59, $59, $59, $59, $77, $78, $79,   7,	  8
		.BYTE	 5,   6, $7A, $7B, $59,	$59, $59, $59, $5E, $7C, $7D, $7E, $7F,	$80, $81, $82, $83, $84, $59, $7C, $59,	$59, $85, $86, $59, $59, $87, $88,   5,	  6
		.BYTE	 7,   8, $89, $8A, $8B,	$8B, $8C, $8D, $8E, $8F, $90, $90, $90,	$91, $92, $93, $94, $95, $96, $8F, $8B,	$8B, $97, $98, $8B, $8B, $99, $9A,   7,	  8
		.BYTE	 5,   6, $45, $9B, $9C,	$9D, $9E, $9F, $A0, $A1, $A2, $A3, $A2,	$A4, $A5, $A6, $A7, $A8, $A9, $AA, $AB,	$AC, $AD, $AE, $AC, $AF, $B0, $45,   5,	  6
		.BYTE	 7,   8, $47, $48, $B1,	$9C, $A0, $B2, $B3, $B4, $B5, $A8, $A9,	$B6, $B5, $A8, $AA, $B7, $B8, $9D, $9D,	$B7, $B9, $9D, $AF, $BA, $46, $47,   7,	  8
		.BYTE	 5,   6,   0,	0,   0,	$BB, $B2, $BC, $BD, $BE, $BF, $C0, $44,	$C1, $C2, $C3, $C3, $C3, $C4, $C5, $C6,	$C7, $C8, $C9, $BB,   0,   0,	0,   5,	  6
		.BYTE	 7,   8, $CA, $CB,   0,	$CC, $CD, $BE, $C9, $BE, $CE, $BC, $CF,	$D0, $C5, $D1, $C4, $C5, $D2, $B4, $D3,	$D4, $D5, $D6, $CC,   0, $CA, $CB,   7,	  8
		.BYTE	 5,   6, $CB, $CA,   0,	$D7, $CE, $D8, $D9, $DA, $D5, $B2, $BC,	$B3, $B4, $DB, $DC, $DD, $DE, $BE, $DF,	$C9, $E0, $E1, $D7,   0, $CB, $CA,   5,	  6
		.BYTE	 7,   8, $CA, $CB,   0,	$E2, $E3, $E4, $DD, $E5, $E6, $E7, $E8,	$BD, $BE, $E9, $EA, $EB, $EC, $EC, $C9,	$ED, $EE, $EF, $E2,   0, $CA, $CB,   7,	  8
		.BYTE	 5,   6, $CB, $CA,   0,	$CC, $DE, $D9, $EE, $F0, $E6, $F1, $DB,	$DC, $F2, $DD, $F3, $86, $F4, $F4, $D8,	$C3, $44, $EE, $CC,   0, $CB, $CA,   5,	  6
		.BYTE	 7,   8, $CA, $CB,   0,	$BB,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0, $BB,   0, $CA, $CB,   7,	  8
		.BYTE	 5,   6, $CB, $CA,   0,	$BB,   0,   9,	$A,  $B,  $C,  $D,  $E,	 $F, $10, $11, $12, $13, $14, $15, $16,	$17, $18,   0, $BB,   0, $CB, $CA,   5,	  6
		.BYTE	 7,   8, $CA, $CB,   0,	$BB,   0, $19, $1A, $1B, $1C, $1D, $1E,	$1F, $20, $21, $22, $23, $24, $25, $26,	$27, $28,   0, $BB,   0, $CA, $CB,   7,	  8
		.BYTE	 5,   6, $CB, $CA,   0,	$BB,   0, $29, $2A, $2B, $2C, $2D, $2E,	$2F, $30, $31, $32, $33, $34, $35, $36,	$37, $38,   0, $BB,   0, $CB, $CA,   5,	  6
		.BYTE	 7,   8,   0,	0,   0,	$CC,   0, $39, $3A, $3B, $3C,	0,   0,	  0,   0,   0,	 0,   0,   0,	0, $3D,	$3E, $3F,   0, $CC,   0,   0,	0,   7,	  8
		.BYTE	 1,   2,   5,	6,   5,	  6,   5,   6,	 5,   6,   5,	6,   5,	  6,   5,   6,	 5,   6,   5,	6,   5,	  6,   5,   6,	 5,   6,   5,	6,   1,	  2
		.BYTE	 3,   4,   7,	8,   7,	  8,   7,   8,	 7,   8,   7,	8,   7,	  8,   7,   8,	 7,   8,   7,	8,   7,	  8,   7,   8,	 7,   8,   7,	8,   3,	  4
pLogoScreenAttr:.BYTE  $7C, $5F, $5F, $55, $5D,	$5F, $5F, $30, $77, $95	; ...
		.BYTE  $99, $AA, $6A, $95, $55,	$33, $77, $15, $4A, $56
		.BYTE  $5A, $55, $55, $33, $33,	  1,   0,   0,	 0,   0
		.BYTE	 1, $33, $33, $91, $A0,	$A0, $A5, $A0, $11, $33
		.BYTE  $C3, $F9, $FA, $FA, $FA,	$FA, $F1,   3
pGameTitleAttrs:.BYTE $7C,$5F,$5F,$5F,$5F,$5F,$5F,$30,$77,$AA,$AA,$AA ;	...
		.BYTE $AA,$AA,	0,$33,$77,$AA,$AA,$AA,$AA,$AA,	0,$33
		.BYTE $33,$FF,$FF,$FF,$FF,$FF,$FF,$33,$33,  0,	0,  0
		.BYTE	0,  0,	0,$33,$C3,$F9,$FA,$FA,$FA,$FA,$F1,  3
pAttributes_YourNewPassword:.BYTE $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA ; ...
		.BYTE $AA,$AA,$AA,$AA,$AA,  0,	0,  0,	0,  0,	0,$AA
		.BYTE $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
		.BYTE $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
		.BYTE $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA
pWellDoneScreenAttr:.BYTE  $7C,	$5F, $5F, $5F, $5F, $5F, $5F, $30, $77,	$AA ; ...
		.BYTE  $FF, $FF, $FF, $FF,   0,	$33, $77, $AA, $AA, $AA
		.BYTE  $AA, $AA,   0, $33, $33,	  0, $AA, $AA, $AA, $AA
		.BYTE	 0, $33, $33,	0, $AA,	$AA, $AA, $AA,	 0, $33
		.BYTE  $C3, $F9, $FA, $FA, $FA,	$FA, $F1,   3
pFrameAttributes:.BYTE	$7C, $FF, $FF, $FF, $FF, $FF, $FF, $30,	$FF, $FF ; ...
		.BYTE  $FF, $FF, $FF, $FF, $FF,	$33, $FF, $FF, $FF, $FF
		.BYTE  $FF, $FF, $FF, $33, $FF,	$FF, $FF, $FF, $FF, $FF
		.BYTE  $FF, $33, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $33
		.BYTE  $C3, $F9, $FA, $FA, $FA,	$FA, $F1,   3

; =============== S U B	R O U T	I N E =======================================


CheckForLevelRestart:			; ...

; FUNCTION CHUNK AT A4CB SIZE 0000001D BYTES

		LDA	vfWaitRestartLevel
		BEQ	lbCheckForTimeoutExit
		LDA	vfTimerIsOut
		BEQ	lbCheckForWaitAfterDeath
		JMP	lbGameFailScreen
; ---------------------------------------------------------------------------

lbCheckForWaitAfterDeath:		; ...
		LDA	vPushStartWaitTimer
		CMP	#100
		BCC	lbCheckDeathTimer
		LDA	#0
		STA	vPushStartWaitTimer
		JSR	WaitClearNMI
		JMP	lbBeginGame
; ---------------------------------------------------------------------------

lbCheckDeathTimer:			; ...
		LDA	vDeathSceneTimer
		BEQ	lbWaitUserInput
		DEC	vDeathSceneTimer
		RTS
; ---------------------------------------------------------------------------

lbWaitUserInput:			; ...
		LDA	#5
		STA	vLevelStatusText
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BNE	lbCheckForTimeoutExit
		LDA	vJoypad1
		AND	#Btn_Start
		BEQ	lbCheckForTimeoutExit
		JSR	WaitClearNMI
		JMP	SetupLevelLoop
; ---------------------------------------------------------------------------

lbCheckForTimeoutExit:			; ...
		RTS
; End of function CheckForLevelRestart


; =============== S U B	R O U T	I N E =======================================


SetupGameTitle:				; ...
		LDA	#$F8 ; 'ø'
		STA	vfEnableInput	; Used when game starts
		STA	vPPU_ScrollHorz
		STA	vfSkipNMI
		LDA	#0
		STA	vPPU_ScrollVert
		STA	vLevelNumber
		JSR	LoadTitleTiles
		JSR	LoadTextTiles
		JSR	nullsub_1
		LDA	#>(PPU_PAGE_1_LINE_0)
		JSR	ErasePPUPage
		JSR	RenderPrinceOfPersiaLogo_07_07
		JSR	RenderFrame
		LDA	#>(PPU_ATTR_PAGE_1_LINES_4_5_6_7)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_ATTR_PAGE_1_LINES_4_5_6_7)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDX	#0
		LDY	#48

lbRenderMenuScreenAttrLoop:		; ...
		LDA	pGameTitleAttrs,X
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INX
		DEY
		BNE	lbRenderMenuScreenAttrLoop
		JSR	WritePushStartToBegin
		LDA	#<(ptrPal_Titles)
		STA	vptrPalette
		LDA	#>(ptrPal_Titles)
		STA	vptrPalette+1
		JSR	SetupWaitScreenVars
		STA	vfMenuScreen
		JSR	WaitTitleScreen
		LDA	#0
		STA	vPPU_CR_2
		STA	vfMenuScreen
		JMP	WaitNMI_PRG6
; End of function SetupGameTitle

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR WaitTitleScreen

lbStartGameChoice:			; ...
		LDA	#0
		STA	vPPU_CR_2
		STA	vfSword
		STA	vfMenuScreen
		JSR	WaitNMI_PRG6
		LDA	#8
		STA	vRoomHorzScroll
		LDA	#1
		STA	vPPU_ScrollVert
		LDA	vfDemoPlay
		BNE	lbStartGameChoiceExit
		LDA	#1
		STA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)

lbStartGameChoiceExit:			; ...
		JMP	SetupLevelLoop
; END OF FUNCTION CHUNK	FOR WaitTitleScreen

; =============== S U B	R O U T	I N E =======================================


WaitTitleScreen:			; ...

; FUNCTION CHUNK AT 9FA8 SIZE 00000021 BYTES
; FUNCTION CHUNK AT C063 SIZE 0000002E BYTES

		JSR	WaitNMI_PRG6
		JSR	WaitNMI_PRG6
		LDA	vfSetupLevelPalette
		BNE	WaitTitleScreen
		JSR	ResetSounds
		DEC	vTitleScreenTimer
		BEQ	lbWaitTitleScreenExit
		LDA	vJoypad1
		AND	#Btn_Start
		BEQ	WaitTitleScreen
		JMP	lbStartGameChoice
; ---------------------------------------------------------------------------

lbWaitTitleScreenExit:			; ...
		RTS
; End of function WaitTitleScreen


; =============== S U B	R O U T	I N E =======================================


ResetupLevel1GuardPalette:		; ...
		LDA	vLevelNumber
		BNE	lbResetupLevel1GuardPaletteExit
		LDA	vfGuardPresent
		BEQ	lbResetupLevel1GuardPaletteExit
		JSR	LoadLevelPalette
		LDA	#1
		STA	vfSetupLevelPalette
		LDA	#0
		STA	vPaletteOffset

lbResetupLevel1GuardPaletteExit:	; ...
		RTS
; End of function ResetupLevel1GuardPalette


; =============== S U B	R O U T	I N E =======================================


RenderExitDoor:				; ...
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BEQ	lbRenderExitDoorGameMode
		LDA	vRoomId
		CMP	#2		; for room #2 in password mode
		BNE	lbDrawExitDoorFrame
		LDA	vDrawExitDoorLine
		BNE	lbDrawExitDoorFrame
		CLC
		ADC	#5
		STA	vDrawExitDoorLine
		LDA	vExitDoorAnimPPUPtrLo
		ADC	#$20 ; ' '
		STA	vExitDoorAnimPPUPtrLo
		JMP	lbDrawExitDoorFrame
; ---------------------------------------------------------------------------

lbRenderExitDoorGameMode:		; ...
		LDA	vfExitDoorCharLoad
		BEQ	lbRenderExitDoorExit
		LDA	vEnteredRoomId
		CMP	vRoomId
		BEQ	lbRenderEnterDoor
		LDA	vfExitOpened
		BNE	lbRenderExitDoorExit

lbRenderEnterDoor:			; ...
		LDA	vfSetupLevelPalette
		BNE	lbRenderExitDoorExit
		LDA	#0
		STA	vDrawExitDoorLine
; End of function RenderExitDoor

; START	OF FUNCTION CHUNK FOR ValidateExitDoorPPUPtr

lbDrawExitDoorFrame:			; ...
		LDA	vExitDoorAnimPPUPtrHi
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	vExitDoorAnimPPUPtrLo
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDX	vDrawExitDoorLine
		JSR	DrawClosedExitDoorTile
		JSR	DrawClosedExitDoorTile
		JSR	DrawClosedExitDoorTile
		JSR	DrawClosedExitDoorTile
		JSR	DrawClosedExitDoorTile
; END OF FUNCTION CHUNK	FOR ValidateExitDoorPPUPtr

; =============== S U B	R O U T	I N E =======================================


ValidateExitDoorPPUPtr:

; FUNCTION CHUNK AT A036 SIZE 0000001E BYTES

		STX	vDrawExitDoorLine
		CPX	#$23 ; '#'
		BEQ	lbRenderExitDoorExit
		LDA	vExitDoorAnimPPUPtrLo
		CLC
		ADC	#>(PPU_PAGE_0_LINE_0)
		STA	vExitDoorAnimPPUPtrLo
		LDA	vExitDoorAnimPPUPtrHi
		ADC	#<(PPU_PAGE_0_LINE_0)
		STA	vExitDoorAnimPPUPtrHi
		JMP	lbDrawExitDoorFrame
; ---------------------------------------------------------------------------

lbRenderExitDoorExit:			; ...
		RTS
; End of function ValidateExitDoorPPUPtr


; =============== S U B	R O U T	I N E =======================================


OpeningExitDoor:			; ...
		INC	vfExitDoorOpeningFrame
		LDA	vfExitDoorOpeningFrame
		CMP	#1
		BCC	lbOpeningExitDoorExit
		LDA	#0
		STA	vfExitDoorOpeningFrame
		LDA	vfExitDoorAnimation
		CMP	#2
		BEQ	lbDoNextExitDoorFrame
		JMP	lbDrawClosedExitDoor
; ---------------------------------------------------------------------------

lbDoNextExitDoorFrame:			; ...
		JSR	DrawExitDoorAnim

lbOpeningExitDoorExit:			; ...
		RTS
; ---------------------------------------------------------------------------

lbDrawClosedExitDoor:			; ...
		LDA	vExitDoorAnimPPUPtrHi
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	vExitDoorAnimPPUPtrLo
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDX	vDrawExitDoorLine
		JSR	DrawClosedExitDoorTile
		JSR	DrawClosedExitDoorTile
		JSR	DrawClosedExitDoorTile
		JSR	DrawClosedExitDoorTile
		JSR	DrawClosedExitDoorTile
		STX	vDrawExitDoorLine
		CPX	#$23 ; '#'
		BCC	loc_2A0B8
		LDA	#0
		STA	vfExitDoorAnimation
		RTS
; ---------------------------------------------------------------------------

loc_2A0B8:				; ...
		LDA	vExitDoorAnimPPUPtrLo
		CLC
		ADC	#$20 ; ' '
		STA	vExitDoorAnimPPUPtrLo
		LDA	vExitDoorAnimPPUPtrHi
		ADC	#0
		STA	vExitDoorAnimPPUPtrHi
		RTS
; End of function OpeningExitDoor


; =============== S U B	R O U T	I N E =======================================


DrawClosedExitDoorTile:			; ...
		LDA	pClosedExitDoorTiles,X
		CLC
		ADC	#$F5 ; 'õ'
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INX
		RTS
; End of function DrawClosedExitDoorTile


; =============== S U B	R O U T	I N E =======================================


DrawExitDoorAnimFrame:			; ...
		LDA	vLevelType
		BNE	lbDraeExitCastleDoorAnimation
		LDA	pDungeonExitDoorFrame,X
		JMP	lbDoDrawExitDraw
; ---------------------------------------------------------------------------

lbDraeExitCastleDoorAnimation:		; ...
		LDA	pPalaceExitDoorFrame,X

lbDoDrawExitDraw:			; ...
		BEQ	lbWriteExitDoorChar
		CLC
		ADC	vExitDoorAnimOffset

lbWriteExitDoorChar:			; ...
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		DEX
		RTS
; End of function DrawExitDoorAnimFrame


; =============== S U B	R O U T	I N E =======================================


DrawExitDoorAnim:			; ...
		LDA	vExitDoorAnimPPUPtrHi
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	vExitDoorAnimPPUPtrLo
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDX	vDrawExitDoorLine
		LDY	#5

lbDrawExitDoorAnimFrameLoop:		; ...
		JSR	DrawExitDoorAnimFrame
		DEY
		BNE	lbDrawExitDoorAnimFrameLoop
		STX	vDrawExitDoorLine
		CPX	#$F0 ; 'ð'
		BCC	lbDecrementExitDoorPPUPtr
		LDA	#0
		STA	vfExitDoorAnimation
		RTS
; ---------------------------------------------------------------------------

lbDecrementExitDoorPPUPtr:		; ...
		LDA	vExitDoorAnimPPUPtrLo
		SEC
		SBC	#$20 ; ' '
		STA	vExitDoorAnimPPUPtrLo
		LDA	vExitDoorAnimPPUPtrHi
		SBC	#0
		STA	vExitDoorAnimPPUPtrHi
		RTS
; End of function DrawExitDoorAnim


; =============== S U B	R O U T	I N E =======================================


CheckAndSetupEOF14Level:		; ...
		LDA	#0
		STA	vfSpecialObjectPresent
		LDA	vLevelNumber
		CMP	#Level_14
		BNE	lbExitSetupEOF14Level
		LDA	vRoomId
		CMP	#4
		BNE	lbExitSetupEOF14Level
		LDA	#1
		STA	vfSpecialObjectPresent
		JSR	LoadPrincessTiles
		JSR	SetupPrincess
		LDA	#1
		STA	vEnemy.XPos+1
		LDA	#$4A ; 'J'
		STA	vEnemy.XPos
		LDA	#$80 ; '€'
		STA	vEnemy.YPos
		LDA	#<(pActionRunning1)
		STA	vEnemy.ptrAction
		LDA	#>(pActionRunning1)
		STA	vEnemy.ptrAction+1

lbExitSetupEOF14Level:			; ...
		RTS
; End of function CheckAndSetupEOF14Level


; =============== S U B	R O U T	I N E =======================================


CheckAndSetupLevelsScripts:		; ...

; FUNCTION CHUNK AT A21E SIZE 0000000F BYTES

		JSR	CheckAndSetupEOF14Level
		JSR	CheckAndSetupLevel8Mouse
		JMP	CheckAndSetupMirrorImage
; End of function CheckAndSetupLevelsScripts


; =============== S U B	R O U T	I N E =======================================


SetupPrincess:				; ...
		JSR	FindFreeSlotPtr	; return: Y - slot offset
		LDA	#<(pPrincessSlotData)
		STA	vSlotDataPtr
		LDA	#>(pPrincessSlotData)
		STA	vSlotDataPtr+1
		JMP	WriteSlotData	; Y - slot ptr
; End of function SetupPrincess		; 2F,30	- ptr to data for write

; ---------------------------------------------------------------------------

LoadPrincessTiles:			; ...
		LDA	#>(pPrincessTiles)
		STA	vwTmp_17+1
		LDA	#<(pPrincessTiles)
		STA	vwTmp_17
		LDA	#>(PPU_CG_PAGE_0_TILE_82)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_CG_PAGE_0_TILE_82)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDX	#7
		JMP	WritePPUCharsFrom_tmp17	; X - number of	tiles to write

; =============== S U B	R O U T	I N E =======================================


DoSpritesShuffle:			; ...
		LDA	vfDisableGuardAnimation
		BNE	lbDoSpritesShuffleExit
		LDA	vfDisableSpritesShuffle
		BNE	lbDoSpritesShuffleExit
		LDA	#0
		STA	vwTmp_17
		LDX	#$CB ; 'Ë'
		LDY	#$8F ; ''

lbDoSpritesShuffleLoop:			; ...
		JSR	SpriteShuffle
		JSR	SpriteShuffle
		JSR	SpriteShuffle
		JSR	SpriteShuffle
		LDA	vwTmp_17
		INC	vwTmp_17
		CMP	#$F
		BNE	lbDoSpritesShuffleLoop

lbDoSpritesShuffleExit:			; ...
		RTS
; End of function DoSpritesShuffle


; =============== S U B	R O U T	I N E =======================================


SpriteShuffle:				; ...
		LDA	vSprite,Y
		PHA
		LDA	vSprite,X
		STA	vSprite,Y
		PLA
		STA	vSprite,X
		DEY
		DEX
		RTS
; End of function SpriteShuffle

; ---------------------------------------------------------------------------
pPrincessSlotData:SLOT_ENEMY  $89,  110,  126,	pPrincessAction,    0, oaNone,	  0,   0,    0,	   0,	 0
		.BYTE $FF
		.BYTE $FF
; ---------------------------------------------------------------------------

CheckAndSetupMirrorImage:		; ...
		LDA	#0
		STA	vfMirrorPresent
		LDA	vRoomId
		STA	vMirrorRoom
		LDA	vfMirrorExitOpened
		BNE	lbCheckAndSetupMirrorImageExit
		LDA	#<(pMirror6SlotData)
		STA	vSlotDataPtr
		LDA	#>(pMirror6SlotData)
		STA	vSlotDataPtr+1
		LDA	vLevelNumber
		CMP	#Level_6
		BNE	lbCheckMirrorInLevel4
		LDA	vRoomId
		BEQ	lbSetupMirrorImage

lbCheckMirrorInLevel4:			; ...
		LDA	#<(pMirror4SlotData)
		STA	vSlotDataPtr
		LDA	#>(pMirror4SlotData)
		STA	vSlotDataPtr+1
		LDA	vfMirrorLevel4Done
		BNE	lbCheckMirrorInLevel5
		LDA	vLevelNumber
		CMP	#Level_4
		BNE	lbCheckMirrorInLevel5
		LDA	vRoomId
		CMP	#3
		BEQ	lbSetupMirrorImage

lbCheckMirrorInLevel5:			; ...
		LDA	#<(pMirror5SlotData)
		STA	vSlotDataPtr
		LDA	#>(pMirror5SlotData)
		STA	vSlotDataPtr+1
		LDA	vLevelNumber
		CMP	#Level_5
		BNE	lbCheckAndSetupMirrorImageExit
		LDA	vRoomId
		CMP	#$17
		BNE	lbCheckAndSetupMirrorImageExit
; START	OF FUNCTION CHUNK FOR CheckAndSetupLevelsScripts

lbSetupMirrorImage:			; ...
		LDA	#1
		STA	vfMirrorPresent
		STA	vfGuardPresent
		JSR	FindFreeSlotPtr	; return: Y - slot offset
		JSR	WriteSlotData	; Y - slot ptr
					; 2F,30	- ptr to data for write

lbCheckAndSetupMirrorImageExit:		; ...
		RTS
; END OF FUNCTION CHUNK	FOR CheckAndSetupLevelsScripts
; ---------------------------------------------------------------------------
pMirror5SlotData:SLOT_ENEMY $89, 65520, 64, pActionStaying, $FF, oaNone, 0, 0,	0, 0, 0
		.BYTE $FF
		.BYTE $FF
pMirror6SlotData:SLOT_ENEMY $89, 56, 128, pActionStaying, $FF,	oaNone,	0, 0, 0, 0, 0 
		.BYTE $FF
		.BYTE $FF
pMirror4SlotData:SLOT_ENEMY $DF, 664, 64, pActionStaying, $FF,	oaNone,	0, 0, 0, 0, 0 ; ...
		.BYTE $FF
		.BYTE $FF
; ---------------------------------------------------------------------------

CheckForMirrorImage:			; ...
		LDA	vfMirrorPresent
		BEQ	lbCheckForMirrorImageExit
		STA	vfGuardPresent
		LDA	vLevelNumber
		CMP	#Level_4
		BEQ	lbPrepareAndSetupLevel4MirrorImage
		CMP	#Level_5
		BNE	lbCheckForLevel6MirrorImage
		JMP	lbSetupLevel5MirrorImage
; ---------------------------------------------------------------------------

lbCheckForLevel6MirrorImage:		; ...
		CMP	#Level_6
		JMP	lbPrepareAndSetupLevel6MirrorImage
; ---------------------------------------------------------------------------

lbCheckForMirrorImageExit:		; ...
		RTS
; ---------------------------------------------------------------------------

lbSetupLevel4MirrorImage:		; ...
		LDA	#<(pLevel4MirrorImageActionData)
		STA	vMirrorImageActionPtr
		LDA	#>(pLevel4MirrorImageActionData)
		STA	vMirrorImageActionPtr+1
		LDA	#0
		STA	vfPrinceWithinRoomHeight
		LDA	#$40 ; '@'
		STA	vEnemy.YPos+$E
		JMP	DoMirrorImageAction
; ---------------------------------------------------------------------------

lbPrepareAndSetupLevel4MirrorImage:	; ...
		LDA	#0
		STA	vfDisableSpritesShuffle
		STA	vfMirrorExitOpened
		LDA	#$FF
		STA	vEnemy.nDirection+$E
		LDA	vRoomId
		CMP	#3
		BNE	locret_2A2CF
		LDA	vfMirrorLevel4Done
		BNE	lbSetupLevel4MirrorImage
		LDA	vEnemy.YPos
		CMP	#$48 ; 'H'
		BCS	locret_2A2CF
		LDA	vfLevel4ExitOpened
		STA	vfDisableSpritesShuffle
		LDA	vfDisableSpritesShuffle
		BEQ	loc_2A2C3
		LDA	vEnemy.XPos+1
		BNE	loc_2A2C3
		LDA	vEnemy.XPos
		CMP	#$AC ; '¬'
		BCC	loc_2A2D0

loc_2A2C3:				; ...
		LDA	#oaStaying
		LDY	#$E
		JSR	SetupEnemyAction_Wrapper ; A - action id
					; Y - slot offset
		LDA	#2
		STA	vEnemy.XPos+$F

locret_2A2CF:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_2A2D0:				; ...
		LDX	#$98 ; '˜'
		LDA	vEnemy.nDirection
		BEQ	loc_2A2D9
		LDX	#$94 ; '”'

loc_2A2D9:				; ...
		STX	vEnemy.XPos+$E
		LDA	#0
		STA	vEnemy.XPos+$F
		LDA	vEnemy.YPos
		STA	vEnemy.YPos+$E
		LDA	vEnemy.nAction
		CMP	#oaRunningTurnBack
		BEQ	loc_2A2C3
		LDA	vEnemy.nPose
		CMP	#pPrincePose06_offset -	pPrincePosesLo
		BCC	loc_2A2F9
		CMP	#pPrincePose0E_offset -	pPrincePosesLo
		BCC	locret_2A301

loc_2A2F9:				; ...
		CMP	#pPrincePose20_offset -	pPrincePosesLo
		BCC	lbCopyPrinceMovementsToMirrorImage
		CMP	#pPrincePose28_offset -	pPrincePosesLo
		BCS	lbCopyPrinceMovementsToMirrorImage

locret_2A301:				; ...
		RTS
; ---------------------------------------------------------------------------

lbCopyPrinceMovementsToMirrorImage:	; ...
		LDX	#0
		LDY	#5

lbCopyPrinceMovementsLoop:		; ...
		LDA	vEnemy.ptrAction,X
		STA	vEnemy.ptrAction+$E,X
		INX
		DEY
		BNE	lbCopyPrinceMovementsLoop
		LDA	vEnemy.nDirection ; Invert direction of	mirror image
		EOR	#$FF
		STA	vEnemy.nDirection+$E
		RTS
; ---------------------------------------------------------------------------

lbSetupLevel5MirrorImage:		; ...
		LDA	#<(pLevel5MirrorImageActionData)
		STA	vMirrorImageActionPtr
		LDA	#>(pLevel5MirrorImageActionData)
		STA	vMirrorImageActionPtr+1
		LDA	vfMirrorExitOpened
		BEQ	lbDoMirrorImageActionExit

; =============== S U B	R O U T	I N E =======================================


DoMirrorImageAction:			; ...
		LDA	vfMirrorPresent
		BEQ	lbDoMirrorImageActionExit
		INC	vMirrorImageActionTimer
		LDY	vMirrorImageActionOffset
		LDA	(vMirrorImageActionPtr),Y
		CMP	#$FF
		BEQ	lbStopMirrorImage
		CMP	vMirrorImageActionTimer
		BNE	lbContinueMirrorImageAction
		LDA	#0
		STA	vMirrorImageActionTimer
		INC	vMirrorImageActionOffset
		INC	vMirrorImageActionOffset

lbContinueMirrorImageAction:		; ...
		INY
		LDA	(vMirrorImageActionPtr),Y
		LDY	#$E
		JSR	SetupEnemyAction_Wrapper ; A - action id
					; Y - slot offset
		LDA	vEnemy.nPose+$E
		CMP	#pPrincePose6D_offset -	pPrincePosesLo
		BNE	lbDoMirrorImageActionExit
		LDA	#0
		STA	v54
		STA	vfExternalRoomId
		LDA	#3
		STA	vEnemyPlace
		JSR	UpdateObjectBits
		LDA	#$27 ; '''
		JSR	FindEnemyById_Wrapper ;	$A - enemy id to search
					; return: Y=0 -	not found, Y=1 - found,	X - slot offset
		LDA	#2
		STA	vEnemy.XPos+1,X
		LDA	#$20 ; ' '
		JSR	FindEnemyById_Wrapper ;	$A - enemy id to search
					; return: Y=0 -	not found, Y=1 - found,	X - slot offset
		LDA	#2
		STA	vEnemy.XPos+1,X

lbDoMirrorImageActionExit:		; ...
		RTS
; ---------------------------------------------------------------------------

lbStopMirrorImage:			; ...
		LDA	#0
		STA	vfGuardPresent
		STA	vEnemy.nEnemyID+$E
		STA	vfMirrorPresent
		RTS
; End of function DoMirrorImageAction

; ---------------------------------------------------------------------------
pLevel4MirrorImageActionData:MIRROR_IMAGE_PLAY_DATA 28, oaRunning1 ; ...
		.BYTE $FF
pLevel5MirrorImageActionData:MIRROR_IMAGE_PLAY_DATA   21, oaRunning1 ; ...
		MIRROR_IMAGE_PLAY_DATA    6, oaStopping
		MIRROR_IMAGE_PLAY_DATA    2, oaStaying
		MIRROR_IMAGE_PLAY_DATA    3, oaSitDown3
		MIRROR_IMAGE_PLAY_DATA   12, oaDrinkPotion
		MIRROR_IMAGE_PLAY_DATA    2, oaTurnBack1
		MIRROR_IMAGE_PLAY_DATA   23, oaRunning1
		.BYTE $FF
; ---------------------------------------------------------------------------

lbPrepareAndSetupLevel6MirrorImage:	; ...
		LDA	vEnemy.XPos+1
		BEQ	loc_2A3A7
		LDA	vEnemy.XPos
		CMP	#$10
		BCC	loc_2A3A7
		JMP	locret_2A3D1
; ---------------------------------------------------------------------------

loc_2A3A7:				; ...
		LDA	#0
		STA	v54
		LDA	#$C
		STA	vEnemyPlace
		JSR	GetBitsForPlace
		BEQ	locret_2A3D1
		LDA	#<(pLevel6MirrorImageActionData)
		STA	vMirrorImageActionPtr
		LDA	#>(pLevel6MirrorImageActionData)
		STA	vMirrorImageActionPtr+1
		JSR	DoMirrorImageAction
		LDA	vEnemy.nPose+$E
		CMP	#pPrincePose7C_offset -	pPrincePosesLo
		BNE	locret_2A3D1
		LDA	#0
		STA	vFallingPlateRoom
		LDA	#$B
		STA	vFallingPlateCheckPlace

locret_2A3D1:				; ...
		RTS
; ---------------------------------------------------------------------------
pLevel6MirrorImageActionData:MIRROR_IMAGE_PLAY_DATA 	4, oaStaying ;	...
		MIRROR_IMAGE_PLAY_DATA   25, oaStartSteal14
		MIRROR_IMAGE_PLAY_DATA  240, oaStaying
		MIRROR_IMAGE_PLAY_DATA  240, oaStaying
		MIRROR_IMAGE_PLAY_DATA  240, oaStaying
		.BYTE $FF

; =============== S U B	R O U T	I N E =======================================


CheckAndWalkPrinceAtLevel14:		; ...
		LDA	vLevelNumber
		CMP	#Level_14
		BNE	lbExitPrinceWalkAtLevel14
		LDA	vRoomId
		CMP	#4
		BNE	lbExitPrinceWalkAtLevel14
		STA	vfFreezePrince
		LDA	vEnemy.XPos+1
		BNE	lbContinuePrinceWalk
		LDA	vEnemy.XPos
		CMP	#$9D ; ''
		BCC	lbStopPrinceWalkAtLevel14

lbContinuePrinceWalk:			; ...
		LDA	#Btn_Left
		STA	vJoypad1
		RTS
; ---------------------------------------------------------------------------

lbStopPrinceWalkAtLevel14:		; ...
		LDA	#0
		STA	vJoypad1
		LDA	vGameSuccessTimer
		CLC
		ADC	#1
		STA	vGameSuccessTimer
		BNE	lbExitPrinceWalkAtLevel14
		JSR	WaitClearNMI
		JMP	loc_2A415
; ---------------------------------------------------------------------------

lbExitPrinceWalkAtLevel14:		; ...
		RTS
; ---------------------------------------------------------------------------

loc_2A415:				; ...
		JSR	WaitNMI_PRG6
		LDX	#$FF
		TXS
		STX	vfSkipNMI
		JSR	DrawSuccessScreen

loc_2A421:				; ...
		LDX	#4

loc_2A423:				; ...
		JSR	WaitNMI_PRG6
		DEX
		BNE	loc_2A423
		LDA	vGameSuccessTimer
		CLC
		ADC	#1
		STA	vGameSuccessTimer
		BEQ	lbGameWellDoneScreen
		JMP	loc_2A421
; ---------------------------------------------------------------------------

lbGameWellDoneScreen:			; ...
		LDA	#0
		STA	vPPU_CR_2
		STA	vfFreezePrince
		JSR	WaitNMI_PRG6
		JSR	GameWellDoneScreen

lbWaitAnyJoyKey:			; ...
		JSR	WaitNMI_PRG6
		LDA	vJoypad1
		BEQ	lbWaitAnyJoyKey
		LDA	#0
		STA	vPPU_CR_2
		JSR	WaitNMI_PRG6
		JMP	lbBeginGame
; End of function CheckAndWalkPrinceAtLevel14


; =============== S U B	R O U T	I N E =======================================


DrawTextFrame:				; ...
		LDA	#$F8 ; 'ø'
		STA	vPPU_ScrollHorz
		STA	vfSkipNMI
		LDA	#0
		STA	vPPU_ScrollVert
		JSR	LoadTitleTiles
		JSR	LoadTextTiles
		JSR	nullsub_1
		LDA	#>(PPU_PAGE_1_LINE_0)
		JSR	ErasePPUPage
		LDA	#>(PPU_ATTR_PAGE_1_LINES_0_1_2_3)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_ATTR_PAGE_1_LINES_0_1_2_3)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#$FF
		LDX	#$40 ; '@'

loc_2A47D:				; ...
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		DEX
		BNE	loc_2A47D
		JMP	RenderFrame
; End of function DrawTextFrame


; =============== S U B	R O U T	I N E =======================================


DrawSuccessScreen:			; ...
		JSR	DrawTextFrame
		JSR	RenderSuccessText
		JSR	SetupWaitScreenVars
		JMP	WaitAnyJoyKey
; End of function DrawSuccessScreen


; =============== S U B	R O U T	I N E =======================================


GameWellDoneScreen:			; ...
		LDA	#>(PPU_PAGE_1_LINE_0)
		STA	vfSkipNMI
		JSR	ErasePPUPage
		JSR	RenderWellDoneAttr
		LDX	#>(PPU_PAGE_1_LINE_12+7)
		LDY	#<(PPU_PAGE_1_LINE_12+7)
		JSR	RenderPrinceOfPersiaLogo
		JSR	RenderFrame
		LDA	#>(PPU_ATTR_PAGE_1_LINES_4_5_6_7)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_ATTR_PAGE_1_LINES_4_5_6_7)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDX	#0
		LDY	#$30 ; '0'

lbWriteWellDoneScreenAttr:		; ...
		LDA	pWellDoneScreenAttr,X
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INX
		DEY
		BNE	lbWriteWellDoneScreenAttr
		LDX	#>(PPU_PAGE_1_LINE_8+$A)
		LDY	#<(PPU_PAGE_1_LINE_8+$A)
		LDA	#$2A ; '*'
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		JMP	SetupWaitScreenVars
; End of function GameWellDoneScreen

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR CheckForLevelRestart

lbGameFailScreen:			; ...
		JSR	WaitClearNMI
		JSR	DrawTextFrame
		JSR	RenderGameFailText
		JSR	SetupWaitScreenVars
		JSR	WaitAnyJoyKey

lbWaitAnyJoyKey2:			; ...
		JSR	WaitNMI_PRG6
		LDA	vJoypad1
		BEQ	lbWaitAnyJoyKey2
		JSR	WaitClearNMI
		JMP	lbBeginGame
; END OF FUNCTION CHUNK	FOR CheckForLevelRestart

; =============== S U B	R O U T	I N E =======================================


CheckDemoPlayControl:			; ...

; FUNCTION CHUNK AT C047 SIZE 0000001C BYTES
; FUNCTION CHUNK AT DC14 SIZE 00000010 BYTES

		LDA	vfDemoPlay
		BNE	lbDemoPlayControl
		RTS
; ---------------------------------------------------------------------------
		JMP	locret_2A4FF
; ---------------------------------------------------------------------------

lbResetDemoPlay:			; ...
		LDA	#0
		STA	vDemoPlayDataOffset
		STA	vDemoPlayControlTimer
		STA	vLevelStatusText
		JMP	loc_7DC14
; ---------------------------------------------------------------------------

locret_2A4FF:				; ...
		RTS
; ---------------------------------------------------------------------------

lbDemoPlayControl:			; ...
		LDA	vJoypad1
		AND	#Btn_Start|Btn_Select
		BNE	lbResetDemoPlay
		LDX	vDemoPlayDataOffset
		LDA	pDemoPlayData.nTimer,X
		CMP	#$FF
		BEQ	lbResetDemoPlay
		CMP	vDemoPlayControlTimer
		BNE	lbDemoPlayWait
		LDA	#0
		STA	byte_4F4
		STA	vDemoPlayControlTimer
		INC	vDemoPlayDataOffset
		INC	vDemoPlayDataOffset

lbDemoPlayWait:				; ...
		LDA	pDemoPlayData.nJoyControl,X
		STA	vJoypad1
		INC	vDemoPlayControlTimer
		RTS
; End of function CheckDemoPlayControl


; =============== S U B	R O U T	I N E =======================================


SelectMusicOption:			; ...
		LDX	#$27 ; '''
		LDA	vfEnableMusic
		BEQ	loc_2A537
		LDX	#$28 ; '('

loc_2A537:				; ...
		TXA
		LDX	#>(PPU_PAGE_1_LINE_22+$B)
		LDY	#<(PPU_PAGE_1_LINE_22+$B)
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDA	vJoypad1
		AND	#Btn_Select
		BEQ	lbResetMenuOptionFlag
		LDA	vfMenuButtonPressed ; Prevents to blinking option while	joy button pressed
		BNE	lbSelectMusicOptionExit
		LDA	#1
		STA	vfMenuButtonPressed ; Prevents to blinking option while	joy button pressed
		LDA	vfEnableMusic
		EOR	#$FF
		STA	vfEnableMusic

lbSelectMusicOptionExit:		; ...
		RTS
; ---------------------------------------------------------------------------

lbResetMenuOptionFlag:			; ...
		LDA	#0
		STA	vfMenuButtonPressed ; Prevents to blinking option while	joy button pressed
		RTS
; End of function SelectMusicOption


; =============== S U B	R O U T	I N E =======================================


WritePushStartToBegin:			; ...
		LDY	#0
		LDA	#>(vAnimBlock)
		STA	vwTmp_17+1
		LDA	#<(vAnimBlock)
		STA	vwTmp_17
		JSR	WriteTextToBuffer ; $17,$18 - pointer to RAM buffer
		LDY	#2
		LDA	#>(vPasswordCaretY)
		STA	vwTmp_17+1
		LDA	#<(vPasswordCaretY)
		STA	vwTmp_17
		JSR	WriteTextToBuffer ; $17,$18 - pointer to RAM buffer
		LDY	#$10
		LDA	#>(vTextBuffer)
		STA	vwTmp_17+1
		LDA	#<(vTextBuffer)
		STA	vwTmp_17
; End of function WritePushStartToBegin


; =============== S U B	R O U T	I N E =======================================

; $17,$18 - pointer to RAM buffer

WriteTextToBuffer:			; ...
		LDA	pTextLibrary,Y
		STA	vtmpCounter19
		LDA	pTextLibrary+1,Y
		STA	vtmpCounter19+1
		LDY	#0

loc_2A58F:				; ...
		LDA	(vtmpCounter19),Y
		CMP	#$20
		BNE	loc_2A59A
		LDA	#0
		JMP	loc_2A5A1
; ---------------------------------------------------------------------------

loc_2A59A:				; ...
		CMP	#0
		BEQ	loc_2A5A7
		JSR	ConvertTextCharToTile

loc_2A5A1:				; ...
		STA	(vwTmp_17),Y
		INY
		JMP	loc_2A58F
; ---------------------------------------------------------------------------

loc_2A5A7:				; ...
		LDA	#$FF
		STA	(vwTmp_17),Y
		RTS
; End of function WriteTextToBuffer


; =============== S U B	R O U T	I N E =======================================


ConvertTextCharToTile:			; ...
		CMP	#$41
		BCC	loc_2A5B6
		CLC
		ADC	#$40 ; '@'
		JMP	locret_2A5E6
; ---------------------------------------------------------------------------

loc_2A5B6:				; ...
		CMP	#$20
		BEQ	loc_2A5E4
		CMP	#$29
		BNE	loc_2A5C3
		LDA	#$BD ; '½'
		JMP	locret_2A5E6
; ---------------------------------------------------------------------------

loc_2A5C3:				; ...
		CMP	#$2E
		BNE	loc_2A5CC
		LDA	#$A5 ; '¥'
		JMP	locret_2A5E6
; ---------------------------------------------------------------------------

loc_2A5CC:				; ...
		CMP	#$2C
		BNE	loc_2A5D5
		LDA	#$A6 ; '¦'
		JMP	locret_2A5E6
; ---------------------------------------------------------------------------

loc_2A5D5:				; ...
		CMP	#$2F
		BNE	loc_2A5DE
		LDA	#$A7 ; '§'
		JMP	locret_2A5E6
; ---------------------------------------------------------------------------

loc_2A5DE:				; ...
		CLC
		ADC	#$6B ; 'k'
		JMP	locret_2A5E6
; ---------------------------------------------------------------------------

loc_2A5E4:				; ...
		LDA	#0

locret_2A5E6:				; ...
		RTS
; End of function ConvertTextCharToTile


; =============== S U B	R O U T	I N E =======================================

; $19 -	ptr to buffer with #$FF	terminator

SendBufferToPPU:			; ...
		LDA	(vtmpCounter19),Y
		CMP	#$FF
		BEQ	locret_2A5F4
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INY
		JMP	SendBufferToPPU	; $19 -	ptr to buffer with #$FF	terminator
; ---------------------------------------------------------------------------

locret_2A5F4:				; ...
		RTS
; End of function SendBufferToPPU

; ---------------------------------------------------------------------------
pObjectPlaceValues:ENEMY_PLACE    0,	 0 ; ...
		ENEMY_PLACE   32,    0
		ENEMY_PLACE   64,    0
		ENEMY_PLACE   96,    0
		ENEMY_PLACE  128,    0
		ENEMY_PLACE  160,    0
		ENEMY_PLACE  192,    0
		ENEMY_PLACE  224,    0
		ENEMY_PLACE  256,    0
		ENEMY_PLACE  288,    0
		ENEMY_PLACE 	0,   64
		ENEMY_PLACE   32,   64
		ENEMY_PLACE   64,   64
		ENEMY_PLACE   96,   64
		ENEMY_PLACE  128,   64
		ENEMY_PLACE  160,   64
		ENEMY_PLACE  192,   64
		ENEMY_PLACE  224,   64
		ENEMY_PLACE  256,   64
		ENEMY_PLACE  288,   64
		ENEMY_PLACE 	0,  128
		ENEMY_PLACE   32,  128
		ENEMY_PLACE   64,  128
		ENEMY_PLACE   96,  128
		ENEMY_PLACE  128,  128
		ENEMY_PLACE  160,  128
		ENEMY_PLACE  192,  128
		ENEMY_PLACE  224,  128
		ENEMY_PLACE  256,  128
		ENEMY_PLACE  288,  128
pExitDoorTileData:.BYTE	 $FF, $FF,   0,	$FF, $B9, $AA, $AC, $A2, $11, $AA, $FF,	$FF, $66, $75, $73, $7D	; ...
		.BYTE  $FF, $FF,   0, $FF, $99,	$AA, $CC, $22, $11, $AA, $FF, $FF, $66,	$55, $33, $DD
		.BYTE  $FF, $FF,   0, $FF, $9B,	$AB, $CF, $23, $11, $AA, $FF, $FF, $64,	$54, $30, $DC
		.BYTE  $B9, $AA, $AC, $A2, $B9,	$AA, $AC, $A2, $66, $75, $73, $7D, $66,	$75, $73, $7D
		.BYTE  $99, $AA, $CC, $22, $99,	$AA, $CC, $22, $66, $55, $33, $DD, $66,	$55, $33, $DD
		.BYTE  $9B, $AB, $CF, $23, $9B,	$AB, $CF, $23, $64, $54, $30, $DC, $64,	$54, $30, $DC
		.BYTE  $B9, $AA, $AC, $A2, $B9,	$AA, $80, $FF, $66, $75, $73, $7D, $66,	$75, $7F,   0
		.BYTE  $99, $AA, $CC, $22, $99,	$AA,   0, $FF, $66, $55, $33, $DD, $66,	$55, $FF,   0
		.BYTE  $9B, $AB, $CF, $23, $9B,	$AB,   3, $FF, $64, $54, $30, $DC, $64,	$54, $FC,   0
		.BYTE $FF
		.BYTE $FF
		.BYTE	0
		.BYTE $FF
		.BYTE $B9 ; ¹
		.BYTE $AA ; ª
		.BYTE $80 ; €
		.BYTE $FF
		.BYTE $11
		.BYTE $AA ; ª
		.BYTE $FF
		.BYTE $FF
		.BYTE $66 ; f
		.BYTE $75 ; u
		.BYTE $7F ; 
		.BYTE	0
		.BYTE $FF
		.BYTE $FF
		.BYTE	0
		.BYTE $FF
		.BYTE $99 ; ™
		.BYTE $AA ; ª
		.BYTE	0
		.BYTE $FF
		.BYTE $11
		.BYTE $AA ; ª
		.BYTE $FF
		.BYTE $FF
		.BYTE $66 ; f
		.BYTE $55 ; U
		.BYTE $FF
		.BYTE	0
		.BYTE $FF
		.BYTE $FF
		.BYTE	0
		.BYTE $FF
		.BYTE $9B ; ›
		.BYTE $AB ; «
		.BYTE	3
		.BYTE $FF
		.BYTE $11
		.BYTE $AA ; ª
		.BYTE $FF
		.BYTE $FF
		.BYTE $64 ; d
		.BYTE $54 ; T
		.BYTE $FC ; ü
		.BYTE	0
pDemoPlayData:	DEMO_PLAY_DATA  100,	 0 ; ...
		DEMO_PLAY_DATA  160, Btn_Right
		DEMO_PLAY_DATA   40,	 0
		DEMO_PLAY_DATA  230, Btn_Down|Btn_A
		DEMO_PLAY_DATA  230, Btn_Left
		DEMO_PLAY_DATA  130, Btn_Up
		DEMO_PLAY_DATA   80, Btn_Left
		DEMO_PLAY_DATA   40, Btn_Left|Btn_A
		DEMO_PLAY_DATA   60, Btn_Up|Btn_A
		DEMO_PLAY_DATA  200, Btn_Left
		DEMO_PLAY_DATA  108, Btn_Right
		DEMO_PLAY_DATA   70, Btn_Left
		DEMO_PLAY_DATA   70, Btn_Left|Btn_A
		DEMO_PLAY_DATA  120, Btn_Up
		DEMO_PLAY_DATA  240, Btn_Left
		DEMO_PLAY_DATA  110, Btn_Left
		DEMO_PLAY_DATA   48, Btn_Left|Btn_A
		DEMO_PLAY_DATA   60, Btn_Left
		DEMO_PLAY_DATA  130, Btn_Up
		DEMO_PLAY_DATA   42, Btn_Left
		DEMO_PLAY_DATA   70,	 0
		DEMO_PLAY_DATA   40, Btn_Left|Btn_A
		DEMO_PLAY_DATA   80, Btn_Up|Btn_A
		DEMO_PLAY_DATA  170, Btn_Left
		DEMO_PLAY_DATA   40,	 0
		DEMO_PLAY_DATA   30, Btn_Right
		DEMO_PLAY_DATA   20,	 0
		DEMO_PLAY_DATA   50, Btn_Down
		DEMO_PLAY_DATA   20,	 0
		DEMO_PLAY_DATA   50, Btn_Down
		DEMO_PLAY_DATA   94, Btn_Left
		DEMO_PLAY_DATA  220, Btn_Down
		DEMO_PLAY_DATA  128, Btn_Right
		DEMO_PLAY_DATA  130, Btn_Up
		DEMO_PLAY_DATA  180, Btn_Right
		DEMO_PLAY_DATA  120, Btn_Up
		DEMO_PLAY_DATA   40, Btn_B
		DEMO_PLAY_DATA   80, Btn_Right|Btn_A
		DEMO_PLAY_DATA   50, Btn_Right
		DEMO_PLAY_DATA  100, Btn_Up
		DEMO_PLAY_DATA   30, Btn_B
		DEMO_PLAY_DATA  130, Btn_Up
		DEMO_PLAY_DATA  170, Btn_Right
		DEMO_PLAY_DATA  100, Btn_Up
		DEMO_PLAY_DATA  190, Btn_Right
		DEMO_PLAY_DATA  110, Btn_Up
		DEMO_PLAY_DATA  240, Btn_Right
		DEMO_PLAY_DATA   20,	 0
		DEMO_PLAY_DATA   10, Btn_Right
		DEMO_PLAY_DATA    2,	 0
		DEMO_PLAY_DATA   43, Btn_Right
		DEMO_PLAY_DATA   20,	 0
		DEMO_PLAY_DATA   80, Btn_B
		DEMO_PLAY_DATA  120, Btn_A
		DEMO_PLAY_DATA   10, Btn_Right
		DEMO_PLAY_DATA  110, Btn_B
		DEMO_PLAY_DATA   30, Btn_Right
		DEMO_PLAY_DATA   70, Btn_B
		DEMO_PLAY_DATA   90, Btn_A
		DEMO_PLAY_DATA  160, Btn_Right
		.BYTE  $FF,   0

; =============== S U B	R O U T	I N E =======================================


sub_2A789:				; ...
		LDA	vCurrentFallingPlateHandlingOffset
		ASL	A
		ASL	A
		TAX
		LDA	vtmp_4C0
		CMP	#lbLowButton
		BEQ	loc_2A79A
		CMP	#lbHighButton
		BNE	loc_2A7A7

loc_2A79A:				; ...
		LDA	vFallingPlateData.fplRoom,X
		CMP	vRoomId
		BEQ	loc_2A7A7
		STA	vFallingPlateRoom
		STY	vFallingPlateCheckPlace

loc_2A7A7:				; ...
		LDA	vFallingPlateData.fplPlace,X
		AND	#$7F ; ''
		STA	byte_4B8
		STA	vEnemyPlace
		LDA	#$FF
		STA	vFallingPlateData.fplPlace,X
		LDA	vFallingPlateData.fplRoom,X
		STA	vRoomId
		STA	vRoomGuardPlace
		LDA	#0
		STA	v54
		STA	vfExternalRoomId
		RTS
; End of function sub_2A789


; =============== S U B	R O U T	I N E =======================================


sub_2A7C7:				; ...
		LDA	vFallingPlatePlace
		CMP	#$FF
		BNE	loc_2A7F1
		LDY	#0

loc_2A7D0:				; ...
		LDA	vCurrentFallingPlateHandlingOffset
		TAX
		LDA	vFallingPlateData.fplPlace,X
		CMP	#$FF
		BNE	loc_2A7F1
		INC	vCurrentFallingPlateHandlingOffset
		INC	vCurrentFallingPlateHandlingOffset
		INC	vCurrentFallingPlateHandlingOffset
		INC	vCurrentFallingPlateHandlingOffset
		INY
		CPY	#3
		BNE	loc_2A7D0
		PLA
		PLA
		JMP	loc_7DD4F
; ---------------------------------------------------------------------------

loc_2A7F1:				; ...
		LDA	#0
		LDX	#$70 ; 'p'

loc_2A7F5:				; ...
		STA	byte_419,X
		DEX
		BNE	loc_2A7F5
		STA	v54
		STA	vfRoomScreenDraw
		STA	byte_499
		RTS
; End of function sub_2A7C7

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7F882

loc_2A804:				; ...
		LDA	vEnemy.nAction
		CMP	#oaMoveUp
		BEQ	locret_2A825
		CMP	#oaSlipDown
		BEQ	locret_2A825
		CMP	#oaGrabLedge
		BEQ	locret_2A825
		CMP	#oaJumpUpAndSwing2
		BEQ	locret_2A825
		CMP	#oaJumpUpAndSwing1
		BEQ	locret_2A825
		LDA	vfFalling
		BNE	locret_2A825
		LDA	#$FF
		STA	vRemoteActionPlace ; do	action at this place while it is not equal to 0xFF

locret_2A825:				; ...
		RTS
; END OF FUNCTION CHUNK	FOR sub_7F882

; =============== S U B	R O U T	I N E =======================================


GetPushedButtonTilesPtr:		; ...
		LDA	vPushedButtonPlace
		STA	vEnemyPlace
		LDA	#0
		STA	vfAllowRenderAnimBg
		LDA	#<(pDungeonPressedLoBtnTiles)
		STA	v21
		LDA	#>(pDungeonPressedLoBtnTiles)
		STA	v22
		LDA	vLevelType
		BEQ	lbDungeonButtonPressed
		LDA	#<(pPalacePressedLoBtnTiles)
		STA	v21
		LDA	#>(pPalacePressedLoBtnTiles)
		STA	v22

lbDungeonButtonPressed:			; ...
		LDX	#1
		LDA	byte_4C8
		CMP	#lbLowButton
		BNE	lbGetPushedButtonTilesPtr ; there is a hi button was pressed
		LDX	#lbPressedButton
		STX	vPreviousBlockId
		LDA	#<(pPressedHiBtnTiles)
		STA	v21
		LDA	#>(pPressedHiBtnTiles)
		STA	v22
		LDA	vLevelType
		BEQ	lbGetPushedButtonTilesPtr
		LDA	#<(pPressedHiBtnTiles)
		STA	v21
		LDA	#>(pPressedHiBtnTiles)
		STA	v22

lbGetPushedButtonTilesPtr:		; ...
		TXA
		RTS
; End of function GetPushedButtonTilesPtr

; ---------------------------------------------------------------------------

loc_2A86A:				; ...
		LDA	#0
		STA	vwTmp_17+1
		LDX	#6

loc_2A870:				; ...
		LSR	vwTmp_17+1
		ROR	vwTmp_17
		DEX
		BNE	loc_2A870
		LDA	vwTmp_17
		AND	#3
		ASL	A
		STA	vwTmp_17+1
		ASL	A
		ASL	A
		CLC
		ADC	vwTmp_17+1
		CLC
		PHA
		ADC	vEnemyPlace
		JSR	sub_7D172
		STA	vEnemyPlace
		PLA
		CLC
		ADC	vDupEnemyPlace
		JSR	sub_7D172
		STA	vDupEnemyPlace
		RTS
; ---------------------------------------------------------------------------

loc_2A89A:				; ...
		LDA	vfPrinceWithinRoomHeight
		BEQ	loc_2A8B1
		LDA	vEnemy.nDirection
		BNE	loc_2A8B1
		LDA	vwTmp_17
		CLC
		ADC	#$14
		STA	vwTmp_17
		LDA	vwTmp_17+1
		ADC	#0
		STA	vwTmp_17+1

loc_2A8B1:				; ...
		LDA	#0
		STA	v54
		LDA	vwTmp_17+1
		BNE	loc_2A8BF
		LDA	vwTmp_17
		CMP	#5
		BCC	loc_2A8C7

loc_2A8BF:				; ...
		LDA	vwTmp_17+1
		BEQ	sub_2A8D6
		CMP	#$7F ; ''
		BCC	sub_2A8D6

loc_2A8C7:				; ...
		JSR	GetLeftBorderBlocksPtr
		LDA	#9
		STA	v54
		STA	vEnemyPlace
		LDA	#0
		JMP	loc_2A8EA

; =============== S U B	R O U T	I N E =======================================


sub_2A8D6:				; ...
		LDX	#5

loc_2A8D8:				; ...
		LSR	vwTmp_17+1
		ROR	vwTmp_17
		DEX
		BNE	loc_2A8D8
		LDA	vwTmp_17
		CMP	#9
		BCC	loc_2A8E7
		LDA	#9

loc_2A8E7:				; ...
		STA	vEnemyPlace

loc_2A8EA:				; ...
		STA	vDupEnemyPlace
		RTS
; End of function sub_2A8D6


; =============== S U B	R O U T	I N E =======================================


sub_2A8EE:				; ...
		LDY	#3
		LDX	#0
		LDA	#$FF

loc_2A8F4:				; ...
		STA	vPasswordChars+9,X
		STA	vPasswordChars+$10,X
		STA	vPasswordChars+$17,X
		INX
		CPX	#3
		BNE	loc_2A8F4
		RTS
; End of function sub_2A8EE


; =============== S U B	R O U T	I N E =======================================


sub_2A903:				; ...
		LDX	#0
		LDA	vEnemy.nAction
		CMP	#oaSlipDown
		BNE	loc_2A91C
		LDA	vEnemy.nPose
		CMP	#pPrincePose01_offset -	pPrincePosesLo
		BEQ	locret_2A91B
		CMP	#pPrincePose95_offset -	pPrincePosesLo
		BCS	loc_2A91C
		CMP	#pPrincePose8D_offset -	pPrincePosesLo
		BCC	loc_2A91C

locret_2A91B:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_2A91C:				; ...
		LDA	vEnemy.YPos
		CMP	#$E0 ; 'à'
		BCS	locret_2A956
		CMP	#$40 ; '@'
		BCC	locret_2A956
		LDA	vEnemy.nAction
		CMP	#oaMoveUp
		BEQ	loc_2A95A
		CMP	#oaSlipDown
		BEQ	loc_2A95A
		CMP	#oaJumpUpAndSwing1
		BEQ	loc_2A95A
		CMP	#oaJumpUpAndSwing2
		BEQ	loc_2A95A
		CMP	#oaSwinging
		BEQ	loc_2A95A
		CMP	#oaBeginFalling
		BEQ	loc_2A957
		CMP	#oaStartFalling1
		BEQ	loc_2A957
		CMP	#oaStartFalling3
		BEQ	loc_2A957
		CMP	#oaGrabLedge
		BEQ	loc_2A95A
		CMP	#oaShortJumpUp1
		BEQ	loc_2A95A
		CMP	#oaStartFalling4
		BEQ	loc_2A95A

locret_2A956:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_2A957:				; ...
		JMP	loc_2A95F
; ---------------------------------------------------------------------------

loc_2A95A:				; ...
		LDA	vEnemy.nDirection
		BEQ	locret_2A956

loc_2A95F:				; ...
		LDX	#1
		RTS
; End of function sub_2A903


; =============== S U B	R O U T	I N E =======================================


sub_2A962:				; ...
		LDA	vfDisableGuardAnimation
		BEQ	locret_2A9AA
		LDA	vEnemy.YPos+$E
		CMP	#$E8 ; 'è'
		BEQ	locret_2A9AA
		LDA	vEnemy.nPose+$E
		CMP	#$B9 ; '¹'
		BNE	locret_2A9AA
		LDA	byte_4F8
		BNE	loc_2A980
		LDA	vEnemy.YPos+$E
		STA	byte_4F8

loc_2A980:				; ...
		LDA	byte_4F8
		STA	vEnemy.YPos+$E
		LDA	byte_4F9
		CLC
		ADC	#1
		STA	byte_4F9
		CMP	#$A
		BCC	loc_2A99E
		LDA	#$E8 ; 'è'
		STA	vEnemy.XPos+$F
		LDA	#0
		STA	vfGuardPresent
		RTS
; ---------------------------------------------------------------------------

loc_2A99E:				; ...
		LDA	byte_4F9
		AND	#1
		BNE	locret_2A9AA
		LDA	#$E4 ; 'ä'
		STA	vEnemy.YPos+$E

locret_2A9AA:				; ...
		RTS
; End of function sub_2A962


; =============== S U B	R O U T	I N E =======================================


FallBrokenPlate:			; ...
		LDA	#4
		JSR	FindEnemyById_Wrapper ;	$A - enemy id to search
					; return: Y=0 -	not found, Y=1 - found,	X - slot offset
		STX	vwEnemySlotOffset
		CPY	#0
		BEQ	loc_2A9CB

loc_2A9B6:				; ...
		LDA	vEnemy.XPos+1,X
		CMP	#1
		BCS	loc_2A9D0
		JSR	GetNextSlot	; X - current slot offset
		LDA	#4
		JSR	FindEnemyById	; $17 -	enemy id to search
					; return: Y=0 -	not found, Y=1 - found,	X - slot offset
		STX	vwEnemySlotOffset
		CPY	#0
		BNE	loc_2A9B6

loc_2A9CB:				; ...
		JSR	FindFreeSlotPtr	; return: Y - slot offset
		STY	vwEnemySlotOffset

loc_2A9D0:				; ...
		LDA	#<(pFallingPlate1)
		STA	vSlotDataPtr
		LDA	#>(pFallingPlate1)
		STA	vSlotDataPtr+1
		LDA	v54
		BEQ	loc_2A9E4
		LDA	#<(pFallingPlate2)
		STA	vSlotDataPtr
		LDA	#>(pFallingPlate2)
		STA	vSlotDataPtr+1

loc_2A9E4:				; ...
		LDA	#0
		STA	byte_362
		LDY	vwEnemySlotOffset
		JMP	WriteSlotData	; Y - slot ptr
; End of function FallBrokenPlate	; 2F,30	- ptr to data for write


; =============== S U B	R O U T	I N E =======================================


SetupFallingPlateSlot:			; ...
		LDX	#0

loc_2A9F0:				; ...
		LDA	vFallingPlateData.fplPlace,X
		CMP	#$FF
		BEQ	loc_2A9FE
		INX
		INX
		INX
		INX
		JMP	loc_2A9F0
; ---------------------------------------------------------------------------

loc_2A9FE:				; ...
		LDA	v54
		BEQ	loc_2AA0D
		LDA	vEnemyPlace
		SEC
		SBC	#20
		ORA	#$80 ; '€'
		STA	vEnemyPlace

loc_2AA0D:				; ...
		LDA	vEnemyPlace
		STA	vFallingPlateData.fplPlace,X
		LDA	#0
		STA	vFallingPlateData.fplFloorTimer,X
		LDA	vRoomId
		STA	vFallingPlateData.fplRoom,X
		LDA	#8
		STA	vFallingPlateData.field_3,X
		LDA	vEnemy.nAction
		CMP	#oaStartSteal1
		BCC	loc_2AA30
		CMP	#oaRunning2
		BCS	loc_2AA30
		JMP	locret_2AA3A
; ---------------------------------------------------------------------------

loc_2AA30:				; ...
		LDA	vEnemy.nUnknown1
		CMP	#1
		BNE	locret_2AA3A
		STA	byte_4ED

locret_2AA3A:				; ...
		RTS
; End of function SetupFallingPlateSlot

; ---------------------------------------------------------------------------

CheckDoorsTimeouts:			; ...
		LDA	vfDisabledBlockAction
		BEQ	lbCheckDoorsTimeouts
		RTS
; ---------------------------------------------------------------------------

lbCheckDoorsTimeouts:			; ...
		LDA	vCheckDoorTimeoutPass
		CLC
		ADC	#1
		CMP	#2
		BCC	lbBeginDoorTimeoutCheck
		LDA	#0

lbBeginDoorTimeoutCheck:		; ...
		STA	vCheckDoorTimeoutPass
		LDA	#1
		STA	v54
		LDX	#0

lbNextDoor:				; ...
		STX	vRoomGuardPlace
		LDA	vDoorTimers.nRoom,X
		CMP	#$FF
		BEQ	lbNextDoorCheck
		STA	vDoorRoom
		LDA	vDoorTimers.nPlace,X
		STA	vEnemyPlace
		LDA	vDoorTimers.nTimer,X
		BEQ	CloseDoorByTimeout
		LDA	vCheckDoorTimeoutPass
		BNE	lbSkipDoorTimerDecrease
		DEC	vDoorTimers.nTimer,X

lbSkipDoorTimerDecrease:		; ...
		JMP	lbNextDoorCheck
; ---------------------------------------------------------------------------

CloseDoorByTimeout:			; ...
		LDA	#$FF
		STA	vDoorTimers.nRoom,X
		JSR	GetBitsByRoomId	; input:
					;  $54 or $6f0 True - get by vDoorRoom id
					;  $4b1	- place	in room
					; return:
					;  $6D - array offset
					;  $6E (and A) - bit mask (2 bits)
					;  X - bits pattern id
		EOR	#$FF
		STA	vwTmp_17
		LDY	vLevelDataPtr
		LDA	vObjectsMasks,Y
		AND	vwTmp_17
		ORA	pObjectBitmaskHi,X
		STA	vObjectsMasks,Y
		JSR	PlaySound_DoorClosed
		LDX	vRoomGuardPlace

lbNextDoorCheck:			; ...
		INX
		INX
		INX
		CPX	#$18
		BNE	lbNextDoor
		RTS

; =============== S U B	R O U T	I N E =======================================


SetupOpenedDoorTimer:			; ...
		LDX	#0

lbFindOpenedDoorSlot:			; ...
		LDA	vDoorTimers.nRoom,X
		CMP	vDoorRoom
		BNE	lbNextDoorSlot
		LDA	vDoorTimers.nPlace,X
		CMP	vEnemyPlace
		BEQ	lbSetupDoorTimer

lbNextDoorSlot:				; ...
		INX
		INX
		INX
		CPX	#$18
		BNE	lbFindOpenedDoorSlot
		LDX	#0

lbFindFreeSlotLoop:			; ...
		LDA	vDoorTimers.nRoom,X
		CMP	#$FF
		BNE	lbNextFindFreeSlotLoop

lbSetupDoorTimer:			; ...
		LDA	vDoorRoom
		STA	vDoorTimers.nRoom,X
		LDA	vEnemyPlace
		STA	vDoorTimers.nPlace,X
		LDY	#75
		LDA	vRoomId
		CMP	#$11
		BCC	lbCheckDoorLongTimer
		LDA	vLevelNumber
		CMP	#Level_8
		BEQ	lbSetupDoorLongTimer

lbCheckDoorLongTimer:			; ...
		LDA	vLevelNumber
		CMP	#Level_5
		BEQ	lbSetupDoorLongTimer
		CMP	#Level_3
		BNE	lbNotDoorLongTimer

lbSetupDoorLongTimer:			; ...
		LDY	#165

lbNotDoorLongTimer:			; ...
		TYA
		STA	vDoorTimers.nTimer,X
		RTS
; ---------------------------------------------------------------------------

lbNextFindFreeSlotLoop:			; ...
		INX
		INX
		INX
		CPX	#$18
		BNE	lbFindFreeSlotLoop
		RTS
; End of function SetupOpenedDoorTimer


; =============== S U B	R O U T	I N E =======================================


SetupTimeoutsBuffers:			; ...
		LDA	#100
		STA	vDeathSceneTimer
		LDA	#$FF
		LDX	#0
		STX	vfMirrorExitOpened
		STX	byte_4F7
		STX	vPushStartWaitTimer

lbEraseDoorsBuffer:			; ...
		STA	vDoorTimers.nRoom,X
		INX
		CPX	#24
		BNE	lbEraseDoorsBuffer
		RTS
; End of function SetupTimeoutsBuffers

; ---------------------------------------------------------------------------

loc_2AB0F:				; ...
		LDX	#$1C
		LDA	#>(PPU_PAGE_0_LINE_25+5)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_PAGE_0_LINE_25+5)
		JSR	ErasePPU	; X - count of tiles that will be erased
					; A - lo byte of PPU ptr
		LDX	#28
		LDA	#>(PPU_PAGE_0_LINE_23+4)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_PAGE_0_LINE_23+4)
		JSR	ErasePPU	; X - count of tiles that will be erased
					; A - lo byte of PPU ptr
		LDX	#30
		LDA	#>(PPU_PAGE_0_LINE_26+2)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_PAGE_0_LINE_26+2)
		JMP	ErasePPU	; X - count of tiles that will be erased
					; A - lo byte of PPU ptr

; =============== S U B	R O U T	I N E =======================================


CheckAndSetupLevel8Mouse:		; ...
		LDA	vEnemy.YPos
		CMP	#$46 ; 'F'
		BCS	locret_2AB78
		LDA	vEnemy.XPos+1
		BNE	locret_2AB78
		LDA	vLevelNumber
		CMP	#Level_8
		BNE	locret_2AB78
		LDA	vRoomId
		CMP	#$F
		BNE	locret_2AB78
		LDA	#1
		STA	vfSpecialObjectPresent
		STA	vfFalling
		LDA	#>(pMouseTiles)
		STA	vwTmp_17+1
		LDA	#<(pMouseTiles)
		STA	vwTmp_17
		LDA	#>(PPU_CG_PAGE_0_TILE_82)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_CG_PAGE_0_TILE_82)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDX	#5
		JSR	WritePPUCharsFrom_tmp17	; X - number of	tiles to write
		JSR	FindFreeSlotPtr	; return: Y - slot offset
		LDA	#<(pMouseSlotData)
		STA	vSlotDataPtr
		LDA	#>(pMouseSlotData)
		STA	vSlotDataPtr+1
		JMP	WriteSlotData	; Y - slot ptr
					; 2F,30	- ptr to data for write
; ---------------------------------------------------------------------------

locret_2AB78:				; ...
		RTS
; End of function CheckAndSetupLevel8Mouse

; ---------------------------------------------------------------------------
pMouseSlotData:	SLOT_ENEMY $89, 330, 64, pMouseAction,	0, oaNone, 0, 0, 0, 0, 0 ; ...
		.BYTE $FF
		.BYTE $FF
; ---------------------------------------------------------------------------

loc_2AB89:				; ...
		LDA	vfFalling
		BEQ	locret_2ABBE
		LDA	#$FF
		STA	vRemoteActionPlace ; do	action at this place while it is not equal to 0xFF
		LDA	vEnemy.nDirection+$E
		BEQ	loc_2ABB2
		LDA	vEnemy.XPos+$F
		BEQ	locret_2ABB1
		LDA	vEnemy.XPos+$E
		CMP	#$44 ; 'D'
		BCC	locret_2ABB1
		LDA	#$C8 ; 'È'
		STA	vEnemy.XPos+$E
		STA	vEnemy.XPos+$F
		LDA	#0
		STA	vfFalling

locret_2ABB1:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_2ABB2:				; ...
		LDA	vEnemy.XPos+$E
		CMP	#$28 ; '('
		BCS	locret_2ABBE
		LDA	#7
		STA	vRemoteActionPlace ; do	action at this place while it is not equal to 0xFF

locret_2ABBE:				; ...
		RTS
; ---------------------------------------------------------------------------
pPrinceObject:	SLOT_ENEMY $80, 160, 128, pActionStaying, $FF,	oaNone,	0, 0, 0, 0, 0 ; ...
		.BYTE $FF
		.BYTE $FF

; =============== S U B	R O U T	I N E =======================================


EraseRoomArea:				; ...
		LDX	#$20 ; ' '
		LDA	#>(PPU_PAGE_0_LINE_1)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_PAGE_0_LINE_1)
		JSR	ErasePPU	; X - count of tiles that will be erased
					; A - lo byte of PPU ptr
		LDX	#$20 ; ' '
		LDA	#>(PPU_PAGE_1_LINE_1)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_PAGE_1_LINE_1)
		JMP	ErasePPU	; X - count of tiles that will be erased
; End of function EraseRoomArea		; A - lo byte of PPU ptr


; =============== S U B	R O U T	I N E =======================================


sub_2ABE7:				; ...
		LDA	vPreviousBlockId
		CMP	#lbPlate
		BNE	loc_2ABFF
		LDA	#0
		STA	v54
		JSR	GetBitsForPlace
		BNE	loc_2AC48
		LDA	byte_40F
		STA	vBlockPPUTileId
		JSR	GetJoints_00_or_03

loc_2ABFF:				; ...
		LDA	vPreviousBlockId
		CMP	#lbPlateWithDebris
		BNE	loc_2AC13
		LDA	byte_411
		STA	vBlockPPUTileId
		LDA	#<(pJointTiles_03)
		STA	v21
		LDA	#>(pJointTiles_03)
		STA	v22

loc_2AC13:				; ...
		LDA	vPreviousBlockId
		CMP	#lbDoubleColumns
		BNE	loc_2AC34
		LDA	byte_412
		STA	vBlockPPUTileId
		LDA	#<(pJointTiles_01)
		STA	v21
		LDA	#>(pJointTiles_01)
		STA	v22
		LDA	vLevelType
		BEQ	loc_2AC34
		LDA	#<(pJointTiles_00)
		STA	v21
		LDA	#>(pJointTiles_00)
		STA	v22

loc_2AC34:				; ...
		LDA	vPreviousBlockId
		CMP	#lbDoor
		BNE	loc_2AC48
		LDA	byte_40F
		STA	vBlockPPUTileId
		LDA	#<(pJointTiles_00)
		STA	v21
		LDA	#>(pJointTiles_00)
		STA	v22

loc_2AC48:				; ...
		LDA	vPreviousBlockId
		CMP	#lbSpikesPlate
		BNE	loc_2AC5C
		LDA	byte_410
		STA	vBlockPPUTileId
		LDA	#<(pJointTiles_00)
		STA	v21
		LDA	#>(pJointTiles_00)
		STA	v22

loc_2AC5C:				; ...
		JSR	sub_7E9DB
		LDA	vtmp_4C0
		STA	vPreviousBlockId
		LDA	vLevelType
		BNE	loc_2AC71
		LDA	vPreviousBlockId
		CMP	#lbPlate
		BEQ	locret_2ACB1

loc_2AC71:				; ...
		LDA	vPreviousBlockId
		CMP	#lbBrickWall
		BEQ	loc_2AC7E
		LDA	byte_417
		JMP	loc_2AC81
; ---------------------------------------------------------------------------

loc_2AC7E:				; ...
		LDA	byte_414

loc_2AC81:				; ...
		STA	vBlockPPUTileId
		LDA	#<(pJointTiles_03)
		STA	v21
		LDA	#>(pJointTiles_03)
		STA	v22
		LDA	vPreviousBlockId
		CMP	#lbPlateWithDebris
		BNE	loc_2AC9F
		LDA	byte_415
		STA	vBlockPPUTileId
		LDA	#<(pJointTiles_03)
		STA	v21
		LDA	#>(pJointTiles_03)
		STA	v22

loc_2AC9F:				; ...
		LDA	vPreviousBlockId
		CMP	#lbDoubleColumns
		BNE	loc_2ACAE
		LDA	byte_416
		STA	vBlockPPUTileId
		JSR	GetJoints_00_or_03

loc_2ACAE:				; ...
		JSR	sub_7E9ED

locret_2ACB1:				; ...
		RTS
; End of function sub_2ABE7


; =============== S U B	R O U T	I N E =======================================


SetupScroll_Text_Buffers:		; ...
		LDX	vLevelNumber
		LDA	pLevelEnterScrollPos,X
		STA	vRoomHorzScroll
		STA	byte_6F5
		LDA	#$F
		STA	vLevelStatusTimer
		LDA	#0
		STA	vLevelStatusTimer+1
		LDY	#4		; Show level number
		CPX	#Level_7
		BNE	lbInitTextId
		LDY	#1		; for level 7 just show	timer

lbInitTextId:				; ...
		STY	vLevelStatusText
		LDX	#0
		STX	vFallingHeight
		STX	vfTimerIsOut
		STX	vfMirrorExitOpened
		STX	vfExitOpened
		STX	vfLevel4ExitOpened
		STX	vfMirrorLevel4Done
		STX	vfExitDoorAnimation
		TXA

lbEraseObjectsMaskBuffer:		; ...
		STA	vObjectsMasks,X
		INX
		BNE	lbEraseObjectsMaskBuffer
		STA	vfLevelFinished
		LDX	#$C
		LDA	#$FF

lbSetupFallingPlatesBuffersLoop:	; ...
		STA	vFallingPlateData,X
		DEX
		BNE	lbSetupFallingPlatesBuffersLoop
		STA	vFallingPlateData,X
		RTS
; End of function SetupScroll_Text_Buffers

; ---------------------------------------------------------------------------
pSpikesObjectSlot:SLOT_ENEMY $81, 160,	90, pActionSpikes, 0, oaNone, 0, 0, 0, 0, 0 ; ...
		.BYTE $FF
		.BYTE $FF
pSwordObjectSlot:SLOT_ENEMY $91, 160, 90, pSwordAction, $80, oaNone, 0, 0, 0, 0, 0 ; ...
		.BYTE $FF
		.BYTE $FF
pFallingPlate2:	SLOT_ENEMY $84, 160, 0, pActionFallingPlate2, 0, oaNone, 0, 0, 0, 0, 0
		.BYTE $FF
		.BYTE $FF
pFallingPlate1:	SLOT_ENEMY $84, 160, 90, pActionFallingPlate1,	0, oaNone, 0, 0, 0, 0, 0
		.BYTE $FF
		.BYTE $FF

; =============== S U B	R O U T	I N E =======================================


_CorrectCharsPointerForLevel5:		; ...
		LDA	vLevelBlocksCharsPtr
		CMP	#<(pPalaceChars_Base)
		BNE	lbCorrectCharsPointerForLevel5Exit
		LDA	vLevelBlocksCharsPtr+1
		CMP	#>(pPalaceChars_Base)
		BNE	lbCorrectCharsPointerForLevel5Exit
		LDA	vLevelNumber
		CMP	#Level_5
		BNE	lbCorrectCharsPointerForLevel5Exit
		LDA	vRoomId
		CMP	#23
		BNE	lbCorrectCharsPointerForLevel5Exit
		LDA	#<(pPalaceChars_BaseAlt)
		STA	vLevelBlocksCharsPtr
		LDA	#>(pPalaceChars_BaseAlt)
		STA	vLevelBlocksCharsPtr+1

lbCorrectCharsPointerForLevel5Exit:	; ...
		RTS
; End of function _CorrectCharsPointerForLevel5

; ---------------------------------------------------------------------------

loc_2AD61:				; ...
		LDX	#$FF

loc_2AD63:				; ...
		INX
		CPX	#3
		BEQ	loc_2AD75
		LDA	vFallingPlatePlace,X
		CMP	vEnemyPlace
		BNE	loc_2AD63
		STX	v11
		STA	vEnemyPlace

loc_2AD75:				; ...
		LDY	#0

loc_2AD77:				; ...
		LDX	v11
		LDA	vFallingPlatePlace,X
		CMP	#$FF
		BNE	loc_2AD8A
		INC	v11
		INY
		CPY	#3
		BNE	loc_2AD77
		PLA
		PLA
		RTS
; ---------------------------------------------------------------------------

loc_2AD8A:				; ...
		STA	v13
		LDA	v54
		BEQ	loc_2AD99
		LDA	v13
		SEC
		SBC	#$14
		ORA	#$80 ; '€'
		STA	v13

loc_2AD99:				; ...
		LDX	v11
		LDA	#$FF
		STA	vFallingPlatePlace,X
		RTS
; ---------------------------------------------------------------------------
pSmallPotionJar:SLOT_ENEMY $C0, 160, 90, pActionSmallPotionJar, 0, oaNone, 0, 0, 0, 0, 0
		.BYTE $FF
		.BYTE $FF
pBigPotionJar:	SLOT_ENEMY $A7, 160, 90, pActionBigPotionJar, 0, oaNone, 0, 0,	0, 0, 0
		.BYTE $FF
		.BYTE $FF
pPotionSmokeObject:SLOT_ENEMY $A0, 160, 90, pActionPotionSmoke, 0, oaNone, 0, 0, 0, 0, 0
		.BYTE $FF
		.BYTE $FF

; =============== S U B	R O U T	I N E =======================================


sub_2ADD1:				; ...
		LDA	#0
		STA	v54
		STA	vCurrentObjectSlot
		LDA	vEnemy.nAction
		LDX	#$28 ; '('
		CMP	#oaJumping1
		BEQ	loc_2ADF2
		LDX	#$1E
		CMP	#oaRunningJump
		BEQ	loc_2ADF2
		LDX	#$23 ; '#'
		CMP	#oaSlipDown
		BEQ	loc_2ADF2
		CMP	#oaMoveUp
		BEQ	loc_2ADF2
		LDX	#$23 ; '#'

loc_2ADF2:				; ...
		LDA	vEnemy.nDirection
		BNE	loc_2AE2A
		LDX	#$A
		LDA	vEnemy.XPos+1
		BNE	loc_2AE05
		LDA	vEnemy.XPos
		CMP	#$32 ; '2'
		BCC	loc_2AE24

loc_2AE05:				; ...
		LDA	vEnemy.nAction
		LDX	#0
		CMP	#oaMoveUp
		BEQ	loc_2AE24
		CMP	#oaShortJumpUp2
		BEQ	loc_2AE24
		CMP	#oaSlipDown
		BEQ	loc_2AE24
		LDX	#6
		CMP	#oaJumping1
		BNE	loc_2AE1E
		LDX	#$10

loc_2AE1E:				; ...
		CMP	#oaRunningJump
		BNE	loc_2AE24
		LDX	#$A

loc_2AE24:				; ...
		JSR	sub_7FA66
		JMP	locret_2AE2D
; ---------------------------------------------------------------------------

loc_2AE2A:				; ...
		JSR	sub_7FA60

locret_2AE2D:				; ...
		RTS
; End of function sub_2ADD1

; ---------------------------------------------------------------------------

loc_2AE2E:				; ...
		JSR	sub_2ADD1
		LDX	#$3C ; ''
		LDA	vEnemy.nAction
		CMP	#oaStartFalling3
		BEQ	loc_2AE42
		CMP	#oaStartFalling1
		BEQ	loc_2AE42
		CMP	#oaBeginFalling
		BNE	loc_2AE52

loc_2AE42:				; ...
		LDX	#0
		LDA	vEnemy.nDirection
		BNE	loc_2AE52
		LDA	vEnemy.nPose
		CMP	#pPrincePose6A_offset -	pPrincePosesLo
		BNE	loc_2AE52
		LDX	#$1E

loc_2AE52:				; ...
		LDA	vEnemy.nAction
		CMP	#oaJumping1
		BEQ	loc_2AE6D
		CMP	#oaRunningJump
		BEQ	loc_2AE6D
		CMP	#oaMoveUp
		BEQ	loc_2AE6D
		CMP	#oaSlipDown
		BEQ	loc_2AE6D
		CMP	#oaJumpUpAndSwing2
		BEQ	loc_2AE6D
		CMP	#oaJumpUpAndSwing1
		BNE	loc_2AE6F

loc_2AE6D:				; ...
		LDX	#$20 ; ' '

loc_2AE6F:				; ...
		STX	vwTmp_17
		LDA	vEnemy.YPos
		SEC
		SBC	vwTmp_17
		RTS

; =============== S U B	R O U T	I N E =======================================


_MovePrince:				; ...
		LDY	#0
		LDA	vEnemyPlace
		ASL	A
		ADC	vEnemyPlace
		TAX
		LDA	pObjectPlaceValues.XPos,X
		CLC
		ADC	vwTmp_17
		STA	vEnemy.XPos,Y
		LDA	pObjectPlaceValues.XPos+1,X
		ADC	#0
		STA	vEnemy.XPos+1,Y
		LDA	pObjectPlaceValues.YPos,X
		CLC
		ADC	vwTmp_17+1
		STA	vEnemy.YPos,Y
		LDA	vEnemy.nDirection
		BNE	lbSetPrincePositionExit
		LDA	vfPrinceWithinRoomHeight
		BEQ	lbSetPrincePositionExit
		LDA	vEnemy.XPos
		SEC
		SBC	#$1E
		STA	vEnemy.XPos

lbSetPrincePositionExit:		; ...
		RTS
; End of function _MovePrince

; ---------------------------------------------------------------------------

PatchDoorJoint:				; ...
		LDA	vfRenderPrinceTiles
		BNE	lbPatchDoorJointExit
		LDA	vDoorPlacedCounter
		BEQ	lbPatchDoorJointExit
		TAY

lbPatchDoorJointLoop:			; ...
		LDA	#1
		STA	vwTmp_17
		LDA	vDoorPlacedPlaces,Y
		CMP	#9
		BEQ	lbPatchDoorJointNext
		CMP	#19
		BEQ	lbPatchDoorJointNext
		CMP	#29
		BEQ	lbPatchDoorJointNext
		ASL	A
		TAX
		LDA	vDoorPlacedPlaces,Y
		CMP	#0
		BEQ	lbWriteJointPatchTile
		CMP	#10
		BEQ	lbWriteJointPatchTile
		CMP	#20
		BEQ	lbWriteJointPatchTile
		LDA	#5
		STA	vwTmp_17

lbWriteJointPatchTile:			; ...
		LDA	pPPUOffsets+1,X
		CLC
		ADC	#1
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	pPPUOffsets,X
		CLC
		ADC	vwTmp_17
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDX	#$2B ; '+'
		LDA	vLevelType
		BNE	pLevelEnterScrollPos
		TXA
		CLC
		ADC	vDoorBlockPPUStartTile
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.

lbPatchDoorJointNext:			; ...
		DEY
		BNE	lbPatchDoorJointLoop

lbPatchDoorJointExit:			; ...
		RTS
; ---------------------------------------------------------------------------
pLevelEnterScrollPos:.BYTE    8,   8, $2C, $50,	$20,   8 ; ...
		.BYTE  $28, $50, $50, $20, $4C,	$38
		.BYTE	 8, $20
pClosedExitDoorTiles:.BYTE    1,   2,	2,   2,	  3,   4 ; ...
		.BYTE	 5,   5,   5,	6,   4,	  5
		.BYTE	 5,   5,   6,	4,   5,	  5
		.BYTE	 5,   6,   4,	5,   5,	  5
		.BYTE	 6,   4,   5,	5,   5,	  6
		.BYTE	 7,   8,   8,	8,   9
pDungeonExitDoorFrame:.BYTE    4,   4,	 4,   4,   4,	0 ; ...
		.BYTE	 0,   0,   0,	0, $10,	 $F
		.BYTE	 0,   0,   0, $12, $11,	  0
		.BYTE	 0,   0, $14, $14, $13,	  0
		.BYTE	 0, $16, $16, $15,   6,	  0
		.BYTE	 8,   8,   8,	8,   7
pPalaceExitDoorFrame:.BYTE    0,   0,	0,   0,	  0,   0 ; ...
		.BYTE	 0,   0,   0,	0, $12,	$11
		.BYTE	 0,   0,   0, $13, $13,	  0
		.BYTE	 0,   0, $15, $15, $14,	  0
		.BYTE	 0, $16, $16, $16,   5,	  0
		.BYTE	 7,   7,   7,	7,   6

; =============== S U B	R O U T	I N E =======================================


nullsub_1:				; ...
		RTS
; End of function nullsub_1


; =============== S U B	R O U T	I N E =======================================


sub_2AF7F:				; ...
		LDA	vEnemy.nAction
		CMP	#oaMoveUp
		BEQ	nullsub_1
		CMP	#oaSlipDown
		BEQ	nullsub_1
		JSR	LookForActionFloor
		LDA	#<(vAnimBlock)
		STA	v21
		LDA	#>(vAnimBlock)
		STA	v22
		LDA	#0
		STA	byte_4F3
		STA	byte_4D2
		STA	byte_4D3
		STA	word_47

loc_2AFA2:				; ...
		LDY	word_47
		LDA	(v21),Y
		CMP	#$FF
		BNE	loc_2AFAD
		JMP	loc_2B036
; ---------------------------------------------------------------------------

loc_2AFAD:				; ...
		CMP	#3
		BEQ	loc_2AFB4
		JMP	loc_2B030
; ---------------------------------------------------------------------------

loc_2AFB4:				; ...
		JSR	sub_7FA89
		CMP	#9
		BCS	loc_2AFC0
		LDA	#0
		JMP	loc_2AFCB
; ---------------------------------------------------------------------------

loc_2AFC0:				; ...
		CMP	#$13
		BCS	loc_2AFC9
		LDA	#$A
		JMP	loc_2AFCB
; ---------------------------------------------------------------------------

loc_2AFC9:				; ...
		LDA	#$14

loc_2AFCB:				; ...
		CMP	vEnemyPlace
		BNE	loc_2B030
		INC	byte_4D3
		LDA	#1
		STA	byte_4F3
		LDA	word_47
		CLC
		ADC	#4
		TAY
		PHA
		LDA	vEnemy.nAction
		CMP	#oaDeathFromCutters
		BNE	loc_2AFF3
		LDA	(v21),Y
		CMP	#3
		BCC	loc_2AFF3
		LDA	#2
		STA	(v21),Y
		JMP	loc_2AFFC
; ---------------------------------------------------------------------------

loc_2AFF3:				; ...
		LDA	(v21),Y
		CMP	#5
		BNE	loc_2AFFC
		JSR	PlayMetallSound

loc_2AFFC:				; ...
		PLA
		LDA	byte_4D2
		BNE	loc_2B007
		LDA	byte_4D0
		BNE	loc_2B02D

loc_2B007:				; ...
		LDA	(v21),Y
		CMP	#$12
		BNE	locret_2B02C
		LDA	#0
		STA	(v21),Y
		INC	byte_4D1
		LDA	byte_4D1
		CMP	#2
		BNE	locret_2B02C
		LDA	#0
		STA	byte_4D1
		LDA	#$D
		STA	(v21),Y
		LDA	byte_4D0
		EOR	#$FF
		STA	byte_4D0

locret_2B02C:				; ...
		RTS
; ---------------------------------------------------------------------------

loc_2B02D:				; ...
		STA	byte_4D2

loc_2B030:				; ...
		JSR	IncrementAnimBlockOffset
		JMP	loc_2AFA2
; ---------------------------------------------------------------------------

loc_2B036:				; ...
		LDA	byte_4D3
		CMP	#1
		BNE	locret_2B042
		LDA	#0
		STA	byte_4D0

locret_2B042:				; ...
		RTS
; End of function sub_2AF7F

; ---------------------------------------------------------------------------
pPalaceCharsLibrary:.WORD pPalaceChars_Base ; ...
		.WORD pPalaceChars_Base
		.WORD pPalaceChars_Spikes
		.WORD pPalaceChars_Base
		.WORD pPalaceChars_Door
		.WORD pPalaceChars_PressedBtn
		.WORD pPalaceChars_Base
		.WORD pPalaceChars_OverDoor
		.WORD pPalaceChars_BigClmn
		.WORD pPalaceChars_BigClmn
		.WORD pPalaceChars_Base
		.WORD pPalaceChars_Base
		.WORD pPalaceChars_OverDoor
		.WORD pPalaceChars_MirrorPlate
		.WORD pPalaceChars_DebrisPlate
		.WORD pPalaceChars_HiButton
		.WORD pPalaceChars_ExitDoor
		.WORD pPalaceChars_ExitDoor
		.WORD pPalaceChars_Cutters
		.WORD pPalaceChars_Base
		.WORD pPalaceChars_Wall
		.WORD pPalaceChars_SkeletonPlate
		.WORD pPalaceChars_Base
		.WORD pPalaceChars_BigWindow
		.WORD pPalaceChars_BigWindow
		.WORD pPalaceChars_Base
		.WORD pPalaceChars_Arch
		.WORD pPalaceChars_Arch
		.WORD pPalaceChars_Arch
		.WORD pPalaceChars_Arch
pDungeonBlocksVertJoints:.WORD pPalaceHorzJoint_Space ;	...
		.WORD pDungeonVertJoint_Plate
		.WORD pDungeonVertJoint_Spikes
		.WORD pDungeonVertJoint_DblClmns
		.WORD pDungeonVertJoint_Door
		.WORD pDungeonVertJoint_Plate
		.WORD pDungeonVertJoint_LoBtn
		.WORD pPalaceVertJoint_MirrorPlate
		.WORD pDungeonVertJoint_LoBtn
		.WORD pDungeonVertJoint_BigClmnHi
		.WORD pDungeonVertJoint_Plate
		.WORD pDungeonVertJoint_Plate
		.WORD pPalaceVertJoint_MirrorPlate
		.WORD pPalaceVertJoint_MirrorPlate
		.WORD pPalaceVertJoint_MirrorPlate
		.WORD pDungeonVertJoint_HiBtn
		.WORD pPalaceVertJoint_MirrorPlate
		.WORD pPalaceVertJoint_MirrorPlate
		.WORD pDungeonVertJoint_Cutters
		.WORD pDungeonVertJoint_TorchPlate
		.WORD pDungeonVertJoint_Wall
		.WORD pDungeonVertJoint_Plate
		.WORD pDungeonVertJoint_Plate
pPalaceBlocksVertJoints:.WORD pPalaceHorzJoint_Space ; ...
		.WORD pDungeonVertJoint_Cutters
		.WORD pPalaceVertJoint_Spikes
		.WORD pDungeonVertJoint_Cutters
		.WORD pPalaceVertJoint_Door
		.WORD pDungeonVertJoint_Cutters
		.WORD pDungeonVertJoint_LoBtn
		.WORD pPalaceVertJoint_OverDoorPlate
		.WORD pPalaceVertJoint_BigClmn
		.WORD pPalaceVertJoint_BigClmn
		.WORD pDungeonVertJoint_Cutters
		.WORD pDungeonVertJoint_Cutters
		.WORD pPalaceVertJoint_OverDoor
		.WORD pPalaceVertJoint_MirrorPlate
		.WORD pPalaceVertJoint_DebrisPlate
		.WORD pPalaceVertJoint_HiBtn
		.WORD pPalaceVertJoint_MirrorPlate
		.WORD pPalaceVertJoint_MirrorPlate
		.WORD pDungeonVertJoint_Cutters
		.WORD pPalaceVertJoint_MirrorPlate
		.WORD pPalaceVertJoint_Wall
		.WORD pDungeonVertJoint_Cutters
		.WORD pDungeonVertJoint_Cutters
		.WORD pPalaceVertJoint_MirrorPlate
		.WORD pPalaceVertJoint_MirrorPlate
		.WORD pPalaceVertJoint_MirrorPlate
		.WORD pPalaceVertJoint_MirrorPlate
		.WORD pPalaceVertJoint_MirrorPlate
		.WORD pPalaceVertJoint_MirrorPlate
		.WORD pPalaceVertJoint_MirrorPlate
pDungeonCharsLibrary:.WORD pDugneonChars_Base ;	...
		.WORD pDugneonChars_Base
		.WORD pDugneonChars_Spikes
		.WORD pDugneonChars_Base
		.WORD pDugneonChars_Door
		.WORD pDugneonChars_PressedBtn
		.WORD pDugneonChars_LoBtn
		.WORD pDugneonChars_OverDoor
		.WORD pDugneonChars_BigColumn
		.WORD pDugneonChars_BigColumn
		.WORD pDugneonChars_Base
		.WORD pDugneonChars_Base
		.WORD pDugneonChars_OverDoor
		.WORD pPalaceVertJoint_BigClmn
		.WORD pDugneonChars_DebrisPlate
		.WORD pDugneonChars_HiBtn
		.WORD pDugneonChars_ExitDoor
		.WORD pDugneonChars_ExitDoor
		.WORD pDugneonChars_Cutters
		.WORD pDugneonChars_Base
		.WORD pDugneonChars_Base
		.WORD pDugneonChars_SkeletonPlate
		.WORD pDugneonChars_Base

; =============== S U B	R O U T	I N E =======================================


_PseudoRandomGen:			; ...
		STX	vPseudoRandomGenSaveX
		LDA	vPseudoRandomGenIter
		CLC
		ADC	vPseudoRandomGenAddit
		STA	vPseudoRandomGenIter
		TAX
		LDA	pRandomGenSeed,X
		STA	vPseudoRandomGenResult
		LDX	vPseudoRandomGenSaveX
		RTS
; End of function _PseudoRandomGen

; ---------------------------------------------------------------------------
pRandomCounter:	.BYTE	$D, $13, $23, $33, $4D,	$5D, $6D, $73, $8D, $93, $A3, $B3, $CD,	$DD, $ED, $F3 ;	...
pRandomGenSeed:	.BYTE	 0,   2,   8, $1A, $50,	$F2, $D6, $82, $87, $96, $C3, $49, $DD,	$97, $C6, $52 ;	...
		.BYTE  $F8, $E8, $B8, $28, $7A,	$6F, $4E, $EC, $C4, $4C, $E6, $B2, $16,	$44, $CE, $6A
		.BYTE  $3F, $BF, $3D, $B9, $2B,	$83, $8A, $9F, $DE, $9A, $CF, $6D, $48,	$DA, $8E, $AB
		.BYTE	 1,   5, $11, $35, $A1,	$E4, $AC,   4,	$E, $2C, $86, $93, $BA,	$2E, $8C, $A5
		.BYTE  $F0, $D0, $70, $51, $F5,	$DF, $9D, $D8, $88, $99, $CC, $64, $2D,	$89, $9C, $D5
		.BYTE  $7F, $7E, $7B, $72, $57,	  6, $14, $3E, $BC, $34, $9E, $DB, $91,	$B4, $1C, $56
		.BYTE	 3,  $B, $23, $6B, $42,	$C8, $58,   9, $1D, $59,  $C, $26, $74,	$5D, $18, $4A
		.BYTE  $E0, $A0, $E1, $A3, $EA,	$BE, $3A, $B0, $10, $32, $98, $C9, $5B,	$12, $38, $AA
		.BYTE  $FF, $FD, $F7, $E5, $AF,	 $D, $29, $7D, $78, $69, $3C, $B6, $22,	$68, $39, $AD
		.BYTE	 7, $17, $47, $D7, $85,	$90, $B1, $13, $3B, $B3, $19, $4D, $E9,	$BB, $31, $95
		.BYTE  $C0, $40, $C2, $46, $D4,	$7C, $75, $60, $21, $65, $30, $92, $B7,	$25, $71, $54
		.BYTE  $FE, $FA, $EE, $CA, $5E,	$1B, $53, $FB, $F1, $D3, $79, $6C, $45,	$D1, $73, $5A
		.BYTE	$F, $2F, $8F, $AE,  $A,	$20, $62, $27, $77, $66, $33, $9B, $D2,	$76, $63, $2A
		.BYTE  $80, $81, $84, $8D, $A8,	$F9, $EB, $C1, $43, $CB, $61, $24, $6E,	$4B, $E3, $A9
		.BYTE  $FC, $F4, $DC, $94, $BD,	$37, $A7, $F6, $E2, $A6, $F3, $D9, $8B,	$A2, $E7, $B5
		.BYTE  $1F, $5F, $1E, $5C, $15,	$41, $C5, $4F, $EF, $CD, $67, $36, $A4,	$ED, $C7, $55

; =============== S U B	R O U T	I N E =======================================


InitRandomAddit:			; ...
		LDA	vGameCounter
		AND	#$F
		TAX
		LDA	pRandomCounter,X
		STA	vPseudoRandomGenAddit
		RTS
; End of function InitRandomAddit

; ---------------------------------------------------------------------------

loc_2B24C:				; ...
		LDA	vEnemy.nDirection
		BNE	loc_2B260
		LDA	vEnemy.nAction
		CMP	#oaMoveUp
		BEQ	locret_2B281
		CMP	#oaSlipDown
		BEQ	locret_2B281
		CMP	#oaGrabLedge
		BEQ	locret_2B281

loc_2B260:				; ...
		LDX	#$E
		LDY	#$4C ; 'L'
		JSR	SetBlockObjectPlace ; X	- additional for posX
					; Y - additional for posY
		LDA	#>(pBrokenPlateWave_04)
		STA	vEnemy.ptrAction+1,X
		LDA	#<(pBrokenPlateWave_04)
		STA	vEnemy.ptrAction,X
		LDA	vEnemy.nPose
		CMP	#pPrincePose6A_offset -	pPrincePosesLo
		BNE	locret_2B281
		LDA	vEnemy.YPos
		CLC
		ADC	#8
		STA	vEnemy.YPos,X

locret_2B281:				; ...
		RTS

; =============== S U B	R O U T	I N E =======================================


GetJoints_00_or_03:			; ...
		LDA	#<(pJointTiles_00)
		STA	v21
		LDA	#>(pJointTiles_00)
		STA	v22
		LDA	vLevelType
		BEQ	locret_2B297
		LDA	#<(pJointTiles_03)
		STA	v21
		LDA	#>(pJointTiles_03)
		STA	v22

locret_2B297:				; ...
		RTS
; End of function GetJoints_00_or_03

; ---------------------------------------------------------------------------

BeginFindEnemyById:			; ...
		LDX	#0		; $17 -	enemy id to search
					; return: Y=0 -	not found, Y=1 - found,	X - slot offset

; =============== S U B	R O U T	I N E =======================================

; $17 -	enemy id to search
; return: Y=0 -	not found, Y=1 - found,	X - slot offset

FindEnemyById:				; ...
		LDY	#0
		LDA	vEnemy.nEnemyID,X
		CMP	#$FF
		BNE	lbFindEnemyIdSkipPass1
		INY

lbFindEnemyIdSkipPass1:			; ...
		AND	#$7F ; ''
		CMP	vwTmp_17
		BEQ	lbFindEnemyIdFound
		LDA	vEnemy.XPos,X
		CMP	#$FF
		BNE	lbFindEnemyIdSkipPass2
		INY

lbFindEnemyIdSkipPass2:			; ...
		CPY	#2
		BEQ	lbFindEnemyIdNotFound
		JSR	GetNextSlot	; X - current slot offset
		JMP	FindEnemyById	; $17 -	enemy id to search
					; return: Y=0 -	not found, Y=1 - found,	X - slot offset
; ---------------------------------------------------------------------------

lbFindEnemyIdFound:			; ...
		LDY	#1
		RTS
; ---------------------------------------------------------------------------

lbFindEnemyIdNotFound:			; ...
		LDY	#0
		RTS
; End of function FindEnemyById


; =============== S U B	R O U T	I N E =======================================


ErasePPUPage:				; ...
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
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
		LDY	#30

lbErasePageLine:			; ...
		LDX	#32

lbErasePageTile:			; ...
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		DEX
		BNE	lbErasePageTile
		DEY
		BNE	lbErasePageLine
		RTS
; End of function ErasePPUPage


; =============== S U B	R O U T	I N E =======================================


WritePatternTiles:			; ...
		STA	vtmpCounter4F
		STX	vwTmp_17
		STY	vwTmp_17+1
		LDY	#0

loc_2B2E0:				; ...
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
		LDX	vtmpCounter19

loc_2B2EC:				; ...
		LDA	(vptrBlockData),Y
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INY
		BNE	loc_2B2F6
		INC	vptrBlockData+1

loc_2B2F6:				; ...
		DEX
		BNE	loc_2B2EC
		LDA	vwTmp_17+1
		CLC
		ADC	#$20 ; ' '
		STA	vwTmp_17+1
		LDA	vwTmp_17
		ADC	#0
		STA	vwTmp_17
		DEC	vtmpCounter4F
		BNE	loc_2B2E0
		RTS
; End of function WritePatternTiles


; =============== S U B	R O U T	I N E =======================================


LoadTitleTiles:				; ...
		LDA	#$10
		STA	word_47
		LDY	#<(PPU_CG_PAGE_1_TILE_00)
		LDX	#>(PPU_CG_PAGE_1_TILE_00)
		LDA	#>(pTitleScreenTiles)
		STA	vwTmp_17+1
		LDA	#<(pTitleScreenTiles)

SetupTitlePPUChars:			; ...
		STA	vwTmp_17
		STX	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		STY	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDX	word_47

WritePPUCharsFrom_tmp17:		; ...
		LDY	#0		; X - number of	tiles to write

loc_2B325:				; ...
		LDA	(vwTmp_17),Y
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INY
		BNE	loc_2B325
		INC	vwTmp_17+1
		DEX
		BNE	WritePPUCharsFrom_tmp17	; X - number of	tiles to write
		RTS
; End of function LoadTitleTiles


; =============== S U B	R O U T	I N E =======================================


PlayGameTitles:				; ...
		LDA	vResidual_4DF
		STA	vfFreezePrince
		LDA	#0
		STA	vEnteredToLevel13
		JSR	SetupTimerAndTitleScreen ; returns X non null if joy pressed
		CPX	#0
		BNE	lbSkipLogoScreen
		JSR	LogoScreen

lbSkipLogoScreen:			; ...
		LDA	vfEnableInput	; Used when game starts
		BNE	lbSkipPlayWelcomeMusic
		JSR	PlayGameBeginMusic

lbSkipPlayWelcomeMusic:			; ...
		LDA	#0
		STA	vResidual_4DF
		STA	vfDemoPlay
		STA	vfFreezePrince
		JSR	SetupGameTitle
		LDA	#1
		STA	vfDemoPlay
		JMP	lbStartGameChoice
; End of function PlayGameTitles


; =============== S U B	R O U T	I N E =======================================


SetupTimerAndTitleScreen:		; ...
		LDA	#'6'
		STA	vTimerCharHi
		STA	vfSkipNMI
		LDA	#'0'
		STA	vTimerCharLo
		LDA	#$F8 ; 'ø'
		STA	vPPU_ScrollHorz
		LDA	#0
		STA	vPPU_ScrollVert
		JSR	LoadTitleTiles
		JSR	LoadTextTiles
		JSR	nullsub_1
		LDA	#5
		STA	word_47
		LDX	#>(PPU_CG_PAGE_1_TILE_00)
		LDY	#<(PPU_CG_PAGE_1_TILE_00)
		LDA	#>(pTitleScreenTileBits)
		STA	vwTmp_17+1
		LDA	#<(pTitleScreenTileBits)
		JSR	SetupTitlePPUChars
		LDA	#>(PPU_PAGE_1_LINE_0)
		JSR	ErasePPUPage
		LDA	#>(PPU_ATTR_PAGE_1_LINES_0_1_2_3)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_ATTR_PAGE_1_LINES_0_1_2_3)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#0
		LDX	#$40 ; '@'

lbWriteTitleScreenAttrs1:		; ...
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		DEX
		BNE	lbWriteTitleScreenAttrs1
		JSR	DrawTitleScreen
		LDA	#>(PPU_ATTR_PAGE_1_LINES_4_5_6_7)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_ATTR_PAGE_1_LINES_4_5_6_7)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#$F0 ; 'ð'
		JSR	FlushTitleScreenAttr ; A - attribute
		LDA	#>(PPU_ATTR_PAGE_1_LINES_8_9_10_11)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_ATTR_PAGE_1_LINES_8_9_10_11)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#$FF
		JSR	FlushTitleScreenAttr ; A - attribute
		LDA	#>(PPU_ATTR_PAGE_1_LINES_12_13_14_15)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_ATTR_PAGE_1_LINES_12_13_14_15)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#$F
		JSR	FlushTitleScreenAttr ; A - attribute
		LDX	#>(PPU_PAGE_1_LINE_6+$D)
		LDY	#<(PPU_PAGE_1_LINE_6+$D)
		LDA	#>(pTitleScreen)
		STA	vptrBlockData+1
		LDA	#<(pTitleScreen)
		STA	vptrBlockData
		LDA	#6
		STA	vtmpCounter19
		LDA	#7
		JSR	WritePatternTiles
		LDA	#<(pTitleScreenPalettePtr)
		STA	vptrPalette
		LDA	#>(pTitleScreenPalettePtr)
		STA	vptrPalette+1
		JSR	SetupWaitScreenVars
		JSR	WaitAnyJoyKey
		JSR	WaitTitleScreenAndCheckJoy ; returns: X	not null if key	pressed
; End of function SetupTimerAndTitleScreen


; =============== S U B	R O U T	I N E =======================================


WaitClearNMI:				; ...
		LDA	#1
		STA	vfSkipNMI
		LDA	#0
		STA	vPPU_CR_2
		JMP	WaitNMI_PRG6
; End of function WaitClearNMI

; ---------------------------------------------------------------------------
		LDA	#<(ptrPal_Residual)
		STA	vptrPalette
		LDA	#>(ptrPal_Residual)
		STA	vptrPalette+1

; =============== S U B	R O U T	I N E =======================================


SetupWaitScreenVars:			; ...
		LDA	#1
		STA	vPreviousBlockId
		LDA	#0
		STA	vTitleScreenTimer
		LDA	#1
		STA	vfSetupLevelPalette
		JSR	WaitNMI_PRG6
		LDA	#0
		STA	vJoypad1
		STA	vfSkipNMI
		LDA	#8
		STA	vPPU_CR_2
		RTS
; End of function SetupWaitScreenVars


; =============== S U B	R O U T	I N E =======================================

; A - attribute

FlushTitleScreenAttr:			; ...
		LDX	#8

lbFlushTitleScreenAttr:			; ...
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		DEX
		BNE	lbFlushTitleScreenAttr
		RTS
; End of function FlushTitleScreenAttr


; =============== S U B	R O U T	I N E =======================================


RenderMenuScreen:			; ...
		LDA	vfMenuScreen
		BEQ	lbRenderMenuScreenExit
		INC	vfDisallowLoadEmptyTile
		LDX	#0
		LDA	#>(vAnimBlock)
		STA	vtmpCounter19+1
		LDA	#<(vAnimBlock)
		STA	vtmpCounter19
		LDA	vfDisallowLoadEmptyTile
		AND	#$3F ; '?'
		CMP	#$1F
		BCC	loc_2B463
		LDA	#>(vPasswordCaretY)
		STA	vtmpCounter19+1
		LDA	#<(vPasswordCaretY)
		STA	vtmpCounter19
		LDX	#1

loc_2B463:				; ...
		LDA	vfDisallowLoadEmptyTile
		LSR	A
		BCC	lbSelectMusicOption
		TXA
		PHA
		LDX	#>(PPU_PAGE_1_LINE_17+$A)
		LDY	#<(PPU_PAGE_1_LINE_17+$A)
		STX	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		STY	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDY	#0
		JSR	SendBufferToPPU	; $19 -	ptr to buffer with #$FF	terminator
		LDA	#>(vPasswordCaretY)
		STA	vtmpCounter19+1
		LDA	#<(vPasswordCaretY)
		STA	vtmpCounter19
		PLA
		BNE	loc_2B490
		CLC
		ADC	#8
		LDA	#>(vTextBuffer)
		STA	vtmpCounter19+1
		LDA	#<(vTextBuffer)
		STA	vtmpCounter19

loc_2B490:				; ...
		LDX	#>(PPU_PAGE_1_LINE_18+$B)
		LDY	#<(PPU_PAGE_1_LINE_18+$B)
		STX	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		STY	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDY	#0
		JMP	SendBufferToPPU	; $19 -	ptr to buffer with #$FF	terminator
; ---------------------------------------------------------------------------

lbSelectMusicOption:			; ...
		JSR	SelectMusicOption

lbRenderMenuScreenExit:			; ...
		RTS
; End of function RenderMenuScreen

; ---------------------------------------------------------------------------
pLevelGuardDifficulty1:.BYTE  $EA, $E0,	$D0, $CD, $C3, $BE, $C8, $DC, $C8, $A0,	$8C, $A0, $A5 ;	...
					; less values -	more difficulty
pLevelGuardDifficulty2:.BYTE	8, $14,	$28, $3C, $37, $41, $14, $32, $28, $23,	$1E, $41, $37 ;	...
					; greater values - more	difficulty
pLevelGuardDifficulty3:.BYTE  $C8, $B4,	$7D, $A5, $CD, $96, $FA, $DC, $B9, $C3,	$A5, $78, $6E ;	...
					; less values -	more difficulty
pLevelHealth:	.BYTE	 3,   3,   3,	3,   3,	  4,   4,   4,	 4,   5,   5,	5,   4,	  5 ; ...
		.BYTE	3

; =============== S U B	R O U T	I N E =======================================


InitGuardsDefaults:			; ...
		LDX	vLevelNumber
		LDA	pLevelGuardDifficulty1,X ; less	values - more difficulty
		STA	vGuardAttack1Probability
		LDA	pLevelGuardDifficulty2,X ; greater values - more difficulty
		STA	vGuardAttack2Probability
		LDA	pLevelGuardDifficulty3,X
		STA	vGuardReflectProbability
		LDA	pLevelHealth,X
		STA	vMaximumHealth
		LDA	pLevelGuardDifficulty1,X ; less	values - more difficulty
		STA	vResidualGuardAttachData
		RTS
; End of function InitGuardsDefaults


; =============== S U B	R O U T	I N E =======================================


SetupBuffers_Palettes_Health:		; ...
		JSR	SetupScroll_Text_Buffers
		JSR	SetupTimeoutsBuffers
		JSR	LoadLevelPalette
		LDX	vLevelNumber
		LDA	pLevelHealth,X
		STA	vCurrentGuardHealth
		STA	vCurrentMaximumGuardHealth
		CLC
		ADC	vGotMaximumHealth
		CMP	#5
		BCC	lbSetupCurrentHealth
		LDA	#5

lbSetupCurrentHealth:			; ...
		STA	vCurrentMaximumHealth
		STA	vCurrentHealth
		RTS
; End of function SetupBuffers_Palettes_Health

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_7FA91

loc_2B51F:				; ...
		LDA	vEnemyPlace
		STA	byte_6D8
		ASL	A
		TAX
		LDA	pPPUOffsets,X
		STA	vPushedButtonPPUPtrLo
		LDA	pPPUOffsets+1,X
		CLC
		ADC	#1
		STA	vPushedButtonPPUPtrHi
		LDA	#1
		STA	vfPushedButton
		STA	vPressedButtonAction
		RTS
; END OF FUNCTION CHUNK	FOR sub_7FA91
; ---------------------------------------------------------------------------
pJointCharsEncPtrLibrary:.WORD pJointCharsBits_00 ; ...
		.WORD pJointCharsBits_01
		.WORD pJointCharsBits_02
		.WORD pJointCharsBits_03
		.WORD pJointCharsBits_04
		.WORD pJointCharsBits_05
		.WORD pJointCharsBits_06
		.WORD pJointCharsBits_07
		.WORD pJointCharsBits_08
		.WORD pJointCharsBits_09
		.WORD pJointCharsBits_0A
		.WORD pJointCharsBits_0B
		.WORD pJointCharsBits_0C
		.WORD pJointCharsBits_0D
		.WORD pJointCharsBits_0E
		.WORD pJointCharsBits_0F
		.WORD pJointCharsBits_10
		.WORD pJointCharsBits_11
		.WORD pJointCharsBits_12
		.WORD pJointCharsBits_13
		.WORD pJointCharsBits_14
		.WORD pJointCharsBits_15
		.WORD pJointCharsBits_16
		.WORD pJointCharsBits_17
		.WORD pJointCharsBits_18
		.WORD pJointCharsBits_19
		.WORD pJointCharsBits_1A
		.WORD pJointCharsBits_1B
		.WORD pJointCharsBits_1C
		.WORD pJointCharsBits_1D
		.WORD pJointCharsBits_1E
		.WORD pJointCharsBits_1F
		.WORD pJointCharsBits_20
		.WORD pJointCharsBits_21
		.WORD pJointCharsBits_22
		.WORD pJointCharsBits_23
		.WORD pJointCharsBits_24
		.WORD pJointCharsBits_25
		.WORD pJointCharsBits_26
		.WORD pJointCharsBits_27
		.WORD pJointCharsBits_28
		.WORD pJointCharsBits_29
		.WORD pJointCharsBits_2A
		.WORD pJointCharsBits_2B
		.WORD pJointCharsBits_2C
		.WORD pJointCharsBits_2D
		.WORD pJointCharsBits_2E
		.WORD pJointCharsBits_2F
		.WORD pJointCharsBits_30
		.WORD pJointCharsBits_31
		.WORD pJointCharsBits_32
		.WORD pJointCharsBits_33
		.WORD pJointCharsBits_34
		.WORD pJointCharsBits_35
		.WORD pJointCharsBits_36
		.WORD pJointCharsBits_37
		.WORD pJointCharsBits_38
		.WORD pJointCharsBits_39
		.WORD pJointCharsBits_3A
		.WORD pJointCharsBits_3B
		.WORD pJointCharsBits_3C
		.WORD pJointCharsBits_3D
		.WORD pJointCharsBits_3E
		.WORD pJointCharsBits_3F
		.WORD pJointCharsBits_2F
		.WORD pJointCharsBits_40
		.WORD pJointCharsBits_41
		.WORD pJointCharsBits_42
		.WORD pJointCharsBits_43
		.WORD pJointCharsBits_44
		.WORD pJointCharsBits_45
		.WORD pJointCharsBits_46
		.WORD pJointCharsBits_47
		.WORD pJointCharsBits_48
		.WORD pJointCharsBits_49
		.WORD pJointCharsBits_4A
		.WORD pJointCharsBits_4B
		.WORD pJointCharsBits_4C
		.WORD pJointCharsBits_4D
		.WORD pJointCharsBits_4E
		.WORD pJointCharsBits_4F
		.WORD pJointCharsBits_50
		.WORD pJointCharsBits_51
		.WORD pJointCharsBits_52
		.WORD pJointCharsBits_53
		.WORD pJointCharsBits_54
		.WORD pJointCharsBits_55
		.WORD pJointCharsBits_56
		.WORD pJointCharsBits_57
		.WORD pJointCharsBits_58
		.WORD pJointCharsBits_59
		.WORD pJointCharsBits_5A
		.WORD pJointCharsBits_5B
		.WORD pJointCharsBits_5C
		.WORD pJointCharsBits_5D
		.WORD pJointCharsBits_5E
		.WORD pJointCharsBits_5F
		.WORD pJointCharsBits_60
		.WORD pJointCharsBits_61
		.WORD pJointCharsBits_62
		.WORD pJointCharsBits_63
		.WORD pJointCharsBits_64
		.WORD pJointCharsBits_65
		.WORD pJointCharsBits_66
		.WORD pJointCharsBits_67
		.WORD pJointCharsBits_68

; =============== S U B	R O U T	I N E =======================================


SetupSwordPalette:			; ...
		LDA	vfSwordPresent
		BEQ	lbSetupSwordPaletteExit
		LDA	#0
		STA	vfSwordPresent
		LDA	#>(PPU_PALETTE_SPRITES+8)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_PALETTE_SPRITES+8)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#$F
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		LDA	#$30 ; '0'
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		LDA	#$20 ; ' '
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		LDA	#$F
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.

lbSetupSwordPaletteExit:		; ...
		RTS
; End of function SetupSwordPalette

; ---------------------------------------------------------------------------

SetupPalette:				; ...
		JSR	SetupSwordPalette
		LDA	vfSetupLevelPalette
		BEQ	lbSetupPaletteExit
		LDX	#0
		LDY	vPaletteOffset
		LDA	(vptrPalette),Y
		CMP	#$FF
		BNE	lbSetupPaletteSkipPass1
		INX

lbSetupPaletteSkipPass1:		; ...
		STA	vwTmp_17
		INY
		LDA	(vptrPalette),Y
		CMP	#$FF
		BNE	lbSetupPaletteSkipPass2
		INX

lbSetupPaletteSkipPass2:		; ...
		STA	vwTmp_17+1
		CPX	#2
		BNE	lbSetupPalette
		LDA	#0
		STA	vPaletteOffset
		STA	vfSetupLevelPalette
		RTS
; ---------------------------------------------------------------------------

lbSetupPalette:				; ...
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
		JSR	WritePaletteData
		INC	vPaletteOffset
		INC	vPaletteOffset
		RTS
; ---------------------------------------------------------------------------

lbSetupPaletteExit:			; ...
		LDA	#0
		STA	vPaletteOffset
		RTS

; =============== S U B	R O U T	I N E =======================================


WritePaletteData:			; ...
		LDY	#0
		LDX	#$20 ; ' '

loc_2B680:				; ...
		LDA	(vwTmp_17),Y
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INY
		DEX
		BNE	loc_2B680
		RTS
; End of function WritePaletteData


; =============== S U B	R O U T	I N E =======================================


LoadLevelPalette:			; ...
		LDA	#1
		STA	vfSetupLevelPalette
		LDX	#0
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BNE	lbLoadLevelPalette
		LDA	vLevelNumber
		ASL	A
		TAX

lbLoadLevelPalette:			; ...
		LDA	pPaletteLibrary,X
		STA	vptrPalette
		LDA	pPaletteLibrary+1,X
		STA	vptrPalette+1
		RTS
; End of function LoadLevelPalette

; ---------------------------------------------------------------------------
pPaletteLibrary:.WORD ptrPalLevel_1	; ...
		.WORD ptrPalLevel_2
		.WORD ptrPalLevel_1
		.WORD ptrPalLevel_4
		.WORD ptrPalLevel_4
		.WORD ptrPalLevel_4
		.WORD ptrPalLevel_7
		.WORD ptrPalLevel_8
		.WORD ptrPalLevel_9
		.WORD ptrPalLevel_4
		.WORD ptrPalLevel_4
		.WORD ptrPalLevel_2
		.WORD ptrPalLevel_1
		.WORD ptrPalLevel_4
ptrPalLevel_1:	.WORD pDungeonPal_1	; ...
		.WORD $FFFF
ptrPalLevel_8:	.WORD pDungeonPal_4	; ...
		.WORD $FFFF
ptrPalLevel_2:	.WORD pDungeonPal_2	; ...
		.WORD $FFFF
ptrPalLevel_7:	.WORD pDungeonPal_3	; ...
		.WORD $FFFF
ptrPalLevel_9:	.WORD pDungeonPal_5	; ...
		.WORD $FFFF
ptrPal_Residual:.WORD pDungeonPal_1	; ...
		.WORD $FFFF
ptrPal_Titles:	.WORD ptrPal_Titles_00	; ...
		.WORD ptrPal_Titles_00
		.WORD ptrPal_Titles_00
		.WORD ptrPal_Titles_00
		.WORD ptrPal_Titles_04
		.WORD ptrPal_Titles_04
		.WORD ptrPal_Titles_04
		.WORD ptrPal_Titles_07
		.WORD $FFFF
ptrPal_Titles_07:.BYTE	 $F,   1, $13, $23 ; ...
		.BYTE	$F, $17, $27,	1
		.BYTE	$F, $17, $27, $30
		.BYTE	$F,   5, $15, $20
ptrPal_Titles_04:.BYTE	 $F,   1, $13, $13 ; ...
		.BYTE	$F, $17, $17,	1
		.BYTE	$F, $17, $17, $20
		.BYTE	$F,   5, $15, $10
ptrPal_Titles_00:.BYTE	 $F,   1,   3,	 3 ; ...
		.BYTE	$F,   7,   7,	1
		.BYTE	$F,   7,   7,	0
		.BYTE	$F,   5,   5,	0
pDungeonPal_1:	.BYTE	$F,   3, $13, $33 ; ...
		.BYTE	$F,   2, $22, $31
		.BYTE	$F, $36, $26, $37
		.BYTE	$F, $15,   3, $30
		.BYTE	$F,  $F,  $F,  $F
		.BYTE	$F, $27, $16, $20
		.BYTE	$F,   5, $27, $33
		.BYTE	$F,   3, $13, $33
pDungeonPal_4:	.BYTE	$F,   3, $13, $33 ; ...
		.BYTE	$F,   2, $22, $31
		.BYTE	$F, $36, $26, $37
		.BYTE	$F, $15,   3, $30
		.BYTE	$F,  $F,  $F,  $F
		.BYTE	$F, $27, $16, $20
		.BYTE	$F, $16, $37, $26
		.BYTE	$F,   3, $13, $33
pDungeonPal_2:	.BYTE	$F,   3, $13, $33 ; ...
		.BYTE	$F,   2, $22, $31
		.BYTE	$F, $36, $26, $37
		.BYTE	$F, $15,   3, $30
		.BYTE	$F,  $F,  $F,  $F
		.BYTE	$F, $27, $16, $20
		.BYTE	$F, $1B, $37, $2B
		.BYTE	$F,   3, $13, $33
pDungeonPal_3:	.BYTE	$F,   3, $13, $33 ; ...
		.BYTE	$F,   2, $22, $31
		.BYTE	$F, $36, $26, $37
		.BYTE	$F, $15,   3, $30
		.BYTE	$F,  $F,  $F,  $F
		.BYTE	$F, $27, $16, $20
		.BYTE	$F, $14, $37, $24
		.BYTE	$F,   3, $13, $33
pDungeonPal_5:	.BYTE	$F,   3, $13, $33 ; ...
		.BYTE	$F,   2, $22, $31
		.BYTE	$F, $36, $26, $37
		.BYTE	$F, $15,   3, $30
		.BYTE	$F,  $F,  $F,  $F
		.BYTE	$F, $27, $16, $20
		.BYTE	$F, $19, $37, $29
		.BYTE	$F,   3, $13, $33
ptrPalLevel_4:	.WORD pPalacePal_1	; ...
		.WORD $FFFF
pTitleScreenPalette:.BYTE   $F,	  0, $10, $20 ;	...
		.BYTE	$F, $17, $27,	1
		.BYTE	$F, $17, $27, $30
		.BYTE	$F,   5, $15, $16
pPalacePal_1:	.BYTE	$F, $17, $28, $37 ; ...
		.BYTE	$F, $37, $26, $36
		.BYTE	$F, $36, $26, $37
		.BYTE	$F, $15, $17, $30
		.BYTE	$F,  $F,  $F,  $F
		.BYTE	$F, $27, $16, $20
		.BYTE	$F,   5, $27, $33
		.BYTE	$F, $17, $28, $37
pTitleScreenPalettePtr:.WORD pTitleScreenPalette ; ...
		.WORD $FFFF

; =============== S U B	R O U T	I N E =======================================


ClearRenderVars:			; ...
		LDX	#0
		STX	vfRoomScreenDraw
		STX	v60
		LDX	#$14
		LDA	#$FF

loc_2B7FD:				; ...
		STA	vBlockCharsData,X
		DEX
		BNE	loc_2B7FD
		LDX	#3

loc_2B805:				; ...
		STA	vFallingPlatePlace,X
		DEX
		BNE	loc_2B805
		STA	vFallingPlatePlace,X
		LDA	#<(PPU_CG_PAGE_1_TILE_01)
		STA	vMirrorImageActionPtr
		STA	vMirrorImageActionPtr+1
		LDA	#0
		STA	vBlockPPUTileId
		STA	vfLowButton
		STA	vLevelBlocksCharsNextTileId
		STA	vCurrentFallingPlateHandlingOffset
		STA	vFallingPlateSlotOffset
		STA	v54
		STA	v5E
		STA	vAnimBlockOffset
		STA	v61
		LDA	#3
		STA	vBlockCharsDataOffset
		STA	vfExternalRoomId
		RTS
; End of function ClearRenderVars


; =============== S U B	R O U T	I N E =======================================


EraseRoomScreen:			; ...
		LDA	#0
		STA	vfRoomScreenDraw
		LDX	#$20 ; ' '
		LDA	#>(PPU_PAGE_0_LINE_0)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_PAGE_0_LINE_0)
		JSR	ErasePPU	; X - count of tiles that will be erased
					; A - lo byte of PPU ptr
		LDX	#$20 ; ' '
		LDA	#>(PPU_PAGE_1_LINE_0)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_PAGE_1_LINE_0)
		JSR	ErasePPU	; X - count of tiles that will be erased
					; A - lo byte of PPU ptr
		LDX	#$20 ; ' '
		LDA	#>(PPU_PAGE_0_LINE_28)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_PAGE_0_LINE_28)
		JSR	ErasePPU	; X - count of tiles that will be erased
					; A - lo byte of PPU ptr
		RTS
; End of function EraseRoomScreen


; =============== S U B	R O U T	I N E =======================================

; X - count of tiles that will be erased
; A - lo byte of PPU ptr

ErasePPU:				; ...
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#0

lbErasePPU:				; ...
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		DEX
		BNE	lbErasePPU
		RTS
; End of function ErasePPU

; ---------------------------------------------------------------------------

loc_2B86A:				; ...
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BEQ	locret_2B888
		LDA	vRoomId
		CMP	#2
		BEQ	locret_2B888
		LDA	vEnemy.nAction
		CMP	#oaStopping
		BNE	loc_2B885
		JSR	ShowPasswordCaret
		JSR	sub_2B9DD
		JSR	sub_2B88F

loc_2B885:				; ...
		JSR	sub_2BA59

locret_2B888:				; ...
		RTS
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_2B88F

loc_2B889:				; ...
		LDA	#0
		STA	vfRightLeftPressed
		RTS
; END OF FUNCTION CHUNK	FOR sub_2B88F

; =============== S U B	R O U T	I N E =======================================


sub_2B88F:				; ...

; FUNCTION CHUNK AT B889 SIZE 00000006 BYTES

		LDA	vJoypad1
		AND	#Btn_Right|Btn_Left
		BEQ	loc_2B889
		LDA	vfRightLeftPressed
		BNE	locret_2B8C9
		LDA	#1
		STA	vfRightLeftPressed
		LDA	vJoypad1
		AND	#Btn_Left
		BEQ	loc_2B8B5
		LDA	vPasswordCaretX
		CMP	#$8F ; ''
		BEQ	loc_2B8B5
		SEC
		SBC	#8
		STA	vPasswordCaretX
		RTS
; ---------------------------------------------------------------------------

loc_2B8B5:				; ...
		LDA	vJoypad1
		AND	#Btn_Right
		BEQ	locret_2B8C9
		LDA	vPasswordCaretX
		CMP	#$C7 ; 'Ç'
		BEQ	locret_2B8C9
		CLC
		ADC	#8
		STA	vPasswordCaretX

locret_2B8C9:				; ...
		RTS
; End of function sub_2B88F


; =============== S U B	R O U T	I N E =======================================


ShowPasswordCaret:			; ...
		LDA	vPasswordCaretY
		STA	vSprite.sprY+$50
		LDA	#$F2 ; 'ò'
		STA	vSprite.sprTile+$50
		LDA	#Attr_01
		STA	vSprite.sprAttr+$50
		LDA	vPasswordCaretX
		STA	vSprite.sprX+$50
		LDA	vPasswordCaretY
		STA	vSprite.sprY+$54
		LDA	#$F2 ; 'ò'

loc_2B8E8:
		STA	vSprite.sprTile+$54
		LDA	#$41 ; 'A'
		STA	vSprite.sprAttr+$54
		LDA	vPasswordCaretX
		CLC
		ADC	#2
		STA	vSprite.sprX+$54
		LDA	vPasswordCaretY
		CLC
		ADC	#6
		STA	vSprite.sprY+$58
		LDA	#$F2 ; 'ò'
		STA	vSprite.sprTile+$58
		LDA	#Attr_01|VertFlip
		STA	vSprite.sprAttr+$58
		LDA	vPasswordCaretX
		STA	vSprite.sprX+$58
		LDA	vPasswordCaretY
		CLC
		ADC	#6
		STA	vSprite.sprY+$5C
		LDA	#$F2 ; 'ò'
		STA	vSprite.sprTile+$5C
		LDA	#$C1 ; 'Á'
		STA	vSprite.sprAttr+$5C
		LDA	vPasswordCaretX
		CLC
		ADC	#2
		STA	vSprite.sprX+$5C
		RTS
; End of function ShowPasswordCaret


; =============== S U B	R O U T	I N E =======================================


LoadPasswordRoomSpecialChars:		; ...
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BNE	lbLoadPasswordRoomSpecialChars
		RTS
; ---------------------------------------------------------------------------

lbLoadPasswordRoomSpecialChars:		; ...
		LDA	#0
		STA	vfWrongPassword
		LDA	#>(PPU_CG_PAGE_0_TILE_CE)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_CG_PAGE_0_TILE_CE)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		JSR	LoadSpecialTxtChars
		LDA	#>(PPU_CG_PAGE_1_TILE_EC)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_CG_PAGE_1_TILE_EC)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
; End of function LoadPasswordRoomSpecialChars ;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.

; =============== S U B	R O U T	I N E =======================================


LoadSpecialTxtChars:				; ...
		LDA	#>(pSpecialTextChars)
		STA	vwTmp_17+1
		LDA	#<(pSpecialTextChars)
		STA	vwTmp_17
		LDX	#128
		LDY	#0

loc_2B95D:				; ...
		LDA	(vwTmp_17),Y
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INY
		DEX
		BNE	loc_2B95D
		RTS
; End of function sub_2B951

; ---------------------------------------------------------------------------
pSpecialTextChars: .BYTE 0, 0, 0, $FF, $FF, 0, 0, 0; bitsTileLo ; ...
		.BYTE 0, 0, 0, $FF, $FF, 0, 0, 0; bitsTileHi
		.BYTE 0, 0, 0, $FC, $FC, 0, 0, 0; bitsTileLo
		.BYTE 0, 0, 0, $FC, $FC, 0, 0, 0; bitsTileHi
		.BYTE $18, $30,	$60, $FF, $FF, $60, $30, $18; bitsTileLo
		.BYTE $18, $30,	$60, $FF, $FF, $60, $30, $18; bitsTileHi
		.BYTE $18, $C, 6, $FF, $FF, 6, $C, $18;	bitsTileLo
		.BYTE $18, $C, 6, $FF, $FF, 6, $C, $18;	bitsTileHi
		.BYTE 0, 0, 0, $3F, $3F, 0, 0, 0; bitsTileLo
		.BYTE 0, 0, 0, $3F, $3F, 0, 0, 0; bitsTileHi
		.BYTE 0, 0, $7E, $7E, 0, $7E, $7E, 0; bitsTileLo
		.BYTE 0, 0, $7E, $7E, 0, $7E, $7E, 0; bitsTileHi
		.BYTE $FF, $80,	$80, $80, $80, $80, $80, $80; bitsTileLo
		.BYTE $FF, $80,	$80, $80, $80, $80, $80, $80; bitsTileHi
; ---------------------------------------------------------------------------

loc_2B9D7:				; ...
		LDA	#0
		STA	vfUpDownPressed
; START	OF FUNCTION CHUNK FOR sub_2B9DD

locret_2B9DC:				; ...
		RTS
; END OF FUNCTION CHUNK	FOR sub_2B9DD

; =============== S U B	R O U T	I N E =======================================


sub_2B9DD:				; ...

; FUNCTION CHUNK AT B9DC SIZE 00000001 BYTES

		LDA	byte_762
		BNE	locret_2B9DC
		LDA	vJoypad1
		AND	#Btn_Down|Btn_Up
		BEQ	loc_2B9D7
		LDA	vfUpDownPressed
		BNE	locret_2B9DC
		LDA	#1
		STA	vfUpDownPressed
		JSR	sub_2BA4C
		LDX	vRoomGuardPlace
		LDA	vJoypad1
		AND	#Btn_Up
		BEQ	DecreasePasswordChar
		LDA	vPasswordChars,X
		CLC
		ADC	#1
		CMP	#10
		BCC	loc_2BA0C
		LDA	#0

loc_2BA0C:				; ...
		STA	vPasswordChars,X
		RTS
; ---------------------------------------------------------------------------

DecreasePasswordChar:			; ...
		LDA	vJoypad1
		AND	#Btn_Down
		BEQ	locret_2BA24
		LDA	vPasswordChars,X
		SEC
		SBC	#1
		BCS	loc_2BA21
		LDA	#9

loc_2BA21:				; ...
		STA	vPasswordChars,X

locret_2BA24:				; ...
		RTS
; End of function sub_2B9DD

; ---------------------------------------------------------------------------

DrawPasswordDigits:			; ...
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BEQ	locret_2BA4B
		LDA	vRoomId
		CMP	#2
		BEQ	locret_2BA4B
		JSR	sub_2BA4C
		TAX
		LDA	#>(PPU_PAGE_0_LINE_27+$12)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_PAGE_0_LINE_27+$12)
		CLC
		ADC	vRoomGuardPlace
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	vPasswordChars,X
		CLC
		ADC	#$F1 ; 'ñ'
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.

locret_2BA4B:				; ...
		RTS

; =============== S U B	R O U T	I N E =======================================


sub_2BA4C:				; ...
		LDA	vPasswordCaretX
		SEC
		SBC	#$8F ; ''
		LSR	A
		LSR	A
		LSR	A
		STA	vRoomGuardPlace
		RTS
; End of function sub_2BA4C


; =============== S U B	R O U T	I N E =======================================


sub_2BA59:				; ...

; FUNCTION CHUNK AT BAA0 SIZE 00000028 BYTES

		LDA	vfWrongPassword
		BNE	loc_2BA61
		JMP	loc_2BAA0
; ---------------------------------------------------------------------------

loc_2BA61:				; ...
		JSR	sub_2BA65
		RTS
; End of function sub_2BA59


; =============== S U B	R O U T	I N E =======================================


sub_2BA65:				; ...
		LDA	vEnemy.nPose
		CMP	#pPrincePoseC5_offset -	pPrincePosesLo
		BNE	loc_2BA7C
		JSR	KillAndSwitchToPRG2
		LDY	#0
		LDA	#oaHealthOffDeath1
		STA	byte_763
		STA	byte_762
		JMP	SetupEnemyAction_Wrapper ; A - action id
					; Y - slot offset
; ---------------------------------------------------------------------------

loc_2BA7C:				; ...
		LDA	byte_762
		BEQ	locret_2BA9F
		DEC	byte_763
		BNE	locret_2BA9F
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
		STX	vfSkipNMI
		JSR	WaitNMI_PRG6
		DEX
		TXS
		LDA	#0
		STA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		STA	vLevelNumber
		JMP	lbBeginGame
; ---------------------------------------------------------------------------

locret_2BA9F:				; ...
		RTS
; End of function sub_2BA65

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_2BA59

loc_2BAA0:				; ...
		LDA	vEnemy.nPose
		CMP	#pPrincePoseC5_offset -	pPrincePosesLo
		BNE	loc_2BAAC
		LDA	#$16
		STA	byte_765

loc_2BAAC:				; ...
		LDA	byte_765
		BEQ	locret_2BAC7
		CMP	#1
		BEQ	loc_2BAC2
		DEC	byte_765
		LDY	#0
		LDA	#oaRunning1
		STA	byte_762
		JMP	SetupEnemyAction_Wrapper ; A - action id
					; Y - slot offset
; ---------------------------------------------------------------------------

loc_2BAC2:				; ...
		LDA	#Btn_Up
		STA	vJoypad1

locret_2BAC7:				; ...
		RTS
; END OF FUNCTION CHUNK	FOR sub_2BA59

; =============== S U B	R O U T	I N E =======================================


ResetChoiceLevelFlag:			; ...
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BEQ	lbResetChoiceLevelFlagExit
		LDA	#0
		STA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		STA	byte_765

lbResetChoiceLevelFlagExit:		; ...
		RTS
; End of function ResetChoiceLevelFlag


; =============== S U B	R O U T	I N E =======================================


GenerateLevelPassword:			; ...
		JSR	PseudoRandomGen
		AND	#7
		STA	vwTmp_17
		STA	vPasswordChars+2
		JSR	PseudoRandomGen
		JSR	PseudoRandomGen
		JSR	PseudoRandomGen
		JSR	PseudoRandomGen
		AND	#7
		STA	vPasswordChars+5
		STA	vwTmp_17+1
		LDA	vLevelNumber
		AND	#3
		JSR	SumLoAndMod10
		STA	vPasswordChars+1
		LDA	vLevelNumber
		LSR	A
		LSR	A
		AND	#3
		JSR	SumHiAndMod10
		STA	vPasswordChars+7
		LDA	vTimerCharHi
		SEC
		SBC	#'0'
		JSR	SumLoAndMod10
		STA	vPasswordChars
		LDA	vTimerCharLo
		SEC
		SBC	#'0'
		JSR	SumHiAndMod10
		STA	vPasswordChars+3

loc_2BB21:				; ...
		LDX	#0

loc_2BB23:				; ...
		LDA	vPasswordChars+4
		CLC
		ADC	vPasswordChars,X
		CMP	#10
		BCC	loc_2BB46
		STA	vRoomGuardPlace
		LDA	vPasswordChars+6
		ADC	#0
		CMP	#10
		BCC	loc_2BB3D
		SEC
		SBC	#10

loc_2BB3D:				; ...
		STA	vPasswordChars+6
		LDA	vRoomGuardPlace
		SEC
		SBC	#10

loc_2BB46:				; ...
		STA	vPasswordChars+4
		INX
		CPX	#8
		BNE	loc_2BB23
		RTS
; End of function GenerateLevelPassword


; =============== S U B	R O U T	I N E =======================================


ValidatePassword:			; ...
		LDA	#0
		LDX	#0

lbValidatePasswordLoop:			; ...
		CLC
		ADC	vPasswordChars,X
		INX
		CPX	#8
		BNE	lbValidatePasswordLoop
		CMP	#0
		BEQ	lbPasswordWrong
		LDA	vPasswordChars+4
		STA	vwTmp_17
		LDA	vPasswordChars+6
		STA	vwTmp_17+1
		LDA	#0
		STA	vPasswordChars+4
		STA	vPasswordChars+6
		JSR	loc_2BB21
		LDA	vPasswordChars+4
		CMP	vwTmp_17
		BNE	lbPasswordWrong
		LDA	vPasswordChars+6
		CMP	vwTmp_17+1
		BNE	lbPasswordWrong
		LDA	#0
		STA	vfWrongPassword
		LDA	vPasswordChars+7
		JSR	sub_2BBEA
		AND	#3
		ASL	A
		ASL	A
		STA	vPasswordChars+7
		LDA	vPasswordChars+1
		JSR	sub_2BBE0
		ORA	vPasswordChars+7
		STA	vLevelNumber
		BEQ	lbValidatePasswordTimer
		LDA	#1
		STA	vfSword

lbValidatePasswordTimer:		; ...
		LDA	vPasswordChars
		JSR	sub_2BBE0
		CLC
		ADC	#'0'
		STA	vTimerCharHi
		LDA	vPasswordChars+3
		JSR	sub_2BBEA
		CLC
		ADC	#'0'
		STA	vTimerCharLo
		RTS
; ---------------------------------------------------------------------------

lbPasswordWrong:			; ...
		LDA	#1
		STA	vfWrongPassword
		LDA	#0
		STA	vLevelNumber
		RTS
; End of function ValidatePassword


; =============== S U B	R O U T	I N E =======================================


SumLoAndMod10:				; ...
		CLC
		ADC	vwTmp_17
		CMP	#10
		BCC	locret_2BBD4
		SEC
		SBC	#10

locret_2BBD4:				; ...
		RTS
; End of function SumLoAndMod10


; =============== S U B	R O U T	I N E =======================================


SumHiAndMod10:				; ...
		CLC
		ADC	vwTmp_17+1
		CMP	#10
		BCC	locret_2BBDF
		SEC
		SBC	#10

locret_2BBDF:				; ...
		RTS
; End of function SumHiAndMod10


; =============== S U B	R O U T	I N E =======================================


sub_2BBE0:				; ...
		SEC
		SBC	vPasswordChars+2
		BCS	locret_2BBE9
		CLC
		ADC	#$A

locret_2BBE9:				; ...
		RTS
; End of function sub_2BBE0


; =============== S U B	R O U T	I N E =======================================


sub_2BBEA:				; ...
		SEC
		SBC	vPasswordChars+5
		BCS	locret_2BBF3
		CLC
		ADC	#$A

locret_2BBF3:				; ...
		RTS
; End of function sub_2BBEA

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR ShowNewLevelPassword

lbResetChoiceLevelFlag:			; ...
		JMP	_ResetChoiceLevelFlag
; END OF FUNCTION CHUNK	FOR ShowNewLevelPassword

; =============== S U B	R O U T	I N E =======================================


ShowNewLevelPassword:			; ...

; FUNCTION CHUNK AT BBF4 SIZE 00000003 BYTES
; FUNCTION CHUNK AT EADA SIZE 00000009 BYTES

		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BNE	lbResetChoiceLevelFlag
		LDA	#0
		STA	vfAllowRenderAnimBg
		STA	vfAllowRenderPushButtonAnim
		STA	vfPushedButton
		STA	vfExitDoorAnimation
		STA	vUpdateHealthBar
		LDX	#8

lbErasePasswordsChars:			; ...
		STA	vPasswordChars,X
		DEX
		BNE	lbErasePasswordsChars
		STA	vPasswordChars,X
		JSR	GenerateLevelPassword
		LDA	#0
		STA	vfExitDoorAnimation
		LDA	vfChoiceLevel	; Waits	for choice: Password (left) or New game	(right)
		BNE	lbExitNewPassword
		LDA	vLevelNumber
		BNE	lbYourNewPasswordScreen

lbExitNewPassword:			; ...
		RTS
; ---------------------------------------------------------------------------

lbYourNewPasswordScreen:		; ...
		LDA	#$F8 ; 'ø'
		STA	vPPU_ScrollHorz
		LDA	#8
		STA	vPPU_ScrollVert
		STA	vfSkipNMI
		JSR	LoadTitleTiles
		JSR	LoadTextTiles
		LDA	#>(PPU_PAGE_1_LINE_0)
		JSR	ErasePPUPage
		LDA	#$2F ; '/'
		LDX	#>(PPU_PAGE_1_LINE_13+$C)
		LDY	#<(PPU_PAGE_1_LINE_13+$C)
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDA	#$30 ; '0'
		LDX	#>(PPU_PAGE_1_LINE_14+$C)
		LDY	#<(PPU_PAGE_1_LINE_14+$C)

loc_2BC4E:				; X - PPU HI
		JSR	WriteText	; Y - PPU LO
					; A - id of Data
		LDA	#$31 ; '1'
		LDX	#>(PPU_PAGE_1_LINE_15+$F)
		LDY	#<(PPU_PAGE_1_LINE_15+$F)
		JSR	WriteText	; X - PPU HI
					; Y - PPU LO
					; A - id of Data
		LDX	#0
		LDA	#>(PPU_PAGE_1_LINE_17+$C)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_PAGE_1_LINE_17+$C)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.

loc_2BC66:				; ...
		LDA	vPasswordChars,X
		CLC
		ADC	#$9B ; '›'
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INX
		CPX	#8
		BNE	loc_2BC66
		LDA	#>(PPU_ATTR_PAGE_1_LINES_0_1_2_3)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_ATTR_PAGE_1_LINES_0_1_2_3)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDX	#0
		LDY	#56

loc_2BC82:				; ...
		LDA	pAttributes_YourNewPassword,X
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INX
		DEY
		BNE	loc_2BC82
		LDA	#<(ptrPal_Titles)
		STA	vptrPalette
		LDA	#>(ptrPal_Titles)
		STA	vptrPalette+1
		JSR	SetupWaitScreenVars
		JSR	WaitAnyJoyKey

loc_2BC9A:				; ...
		JSR	WaitNMI_PRG6
		LDA	vJoypad1
		AND	#Btn_Select
		BNE	loc_2BC9A

loc_2BCA4:				; ...
		JSR	WaitNMI_PRG6
		LDA	vfSetupLevelPalette
		BNE	loc_2BCA4
		LDA	vJoypad1
		BEQ	loc_2BCA4

loc_2BCB0:				; ...
		JSR	WaitNMI_PRG6
		LDA	vJoypad1
		BNE	loc_2BCB0
		LDA	#8
		STA	vRoomHorzScroll
		LDA	#1
		STA	vPPU_ScrollVert
		JMP	WaitClearNMI
; End of function ShowNewLevelPassword

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR LoadExitDoorTiles

_LoadExitDoorTiles:			; ...
		LDA	vfExitDoorCharLoad
		BNE	lbLoadExitDoorTiles
		RTS
; ---------------------------------------------------------------------------

lbLoadExitDoorTiles:			; ...
		LDA	#>(pExitDoorTileData)
		STA	vwTmp_17+1
		LDA	#<(pExitDoorTileData)
		STA	vwTmp_17
		LDX	#>(PPU_CG_PAGE_1_TILE_F6)
		STX	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDA	#<(PPU_CG_PAGE_1_TILE_F6)
		STA	VRAM_AR_2	; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
		LDY	#0

lbLoadExitDoorTilesLoop:		; ...
		LDA	(vwTmp_17),Y
		STA	VRAM_IOR	; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.
		INY
		CPY	#$90 ; ''
		BCC	lbLoadExitDoorTilesLoop
		RTS
; END OF FUNCTION CHUNK	FOR LoadExitDoorTiles
; ---------------------------------------------------------------------------
pTitleScreen:	.BYTE	 1,   2,   3,	4,   5,	  6 ; ...
		.BYTE	 7,   8,   9,  $A,  $B,	 $C
		.BYTE	$D,  $E,  $F, $10, $11,	$12
		.BYTE  $13, $14, $15, $16, $17,	$18
		.BYTE  $19, $1A, $1B, $1C, $1D,	 $C
		.BYTE  $1E, $1F, $20, $21, $22,	$23
		.BYTE  $24, $25, $26, $27, $28,	$29
pTitleScreenTileBits:
		.BYTE 0, 0, 0, 0, 0, 0, 0, 0
		.BYTE 0, 0, 0, 0, 0, 0, 0, 0
		.BYTE 0, 0, $3F, $20, $20, $20,	$20, $20; nTileLoBits
		.BYTE 0, 0, $3F, $20, $20, $20,	$20, $20; nTileHiBits
		.BYTE 0, 0, $FF, 0, 0, 0, 0, 1;	nTileLoBits
		.BYTE 0, 0, $FF, 0, 0, 0, 0, 3;	nTileHiBits
		.BYTE 0, 0, $FF, 0, 0, $27, $7F, $EC; nTileLoBits
		.BYTE 0, 0, $FF, 0, 0, $1F, $FF, $F0; nTileHiBits
		.BYTE 0, 0, $FF, 0, 0, $C8, $FC, $6F; nTileLoBits
		.BYTE 0, 0, $FF, 0, 0, $F0, $FE, $1F; nTileHiBits
		.BYTE 0, 0, $FF, 0, 0, 0, 0, 0;	nTileLoBits
		.BYTE 0, 0, $FF, 0, 0, 0, 0, $80; nTileHiBits
		.BYTE 0, 0, $F8, 8, 8, 8, 8, 8;	nTileLoBits
		.BYTE 0, 0, $F8, 8, 8, 8, 8, 8;	nTileHiBits
		.BYTE $20, $20,	$20, $20, $20, $20, $20, $21; nTileLoBits
		.BYTE $20, $20,	$20, $20, $20, $20, $21, $21; nTileHiBits
		.BYTE $F, $C, $1C, $38,	$F0, $E0, $80, $C0; nTileLoBits
		.BYTE 7, $1E, $38, $70,	$60, $C0, $C0, $80; nTileHiBits
		.BYTE $40, 0, 0, $C, $14, $20, 0, $40; nTileLoBits
		.BYTE $80, 0, 0, $C, $18, $20, $60, $40; nTileHiBits
		.BYTE 5, 1, 0, 0, 0, 0,	0, 2; nTileLoBits
		.BYTE 3, 0, 0, 0, 0, 0,	0, 3; nTileHiBits
		.BYTE $E0, $60,	$70, $38, $1E, $E, 2, 7; nTileLoBits
		.BYTE $C0, $F0,	$38, $1C, $C, 6, 7, 3; nTileHiBits
		.BYTE 8, 8, 8, 8, 8, 8,	8, 8; nTileLoBits
		.BYTE 8, 8, 8, 8, 8, 8,	8, 8; nTileHiBits
		.BYTE $21, $23,	$27, $22, $23, $27, $26, $26; nTileLoBits
		.BYTE $23, $23,	$23, $27, $26, $26, $26, $26; nTileHiBits
		.BYTE 0, $80, 0, 1, $12, $33, $16, $54;	nTileLoBits
		.BYTE $80, 0, 1, $11, $33, $32,	$72, $56; nTileHiBits
		.BYTE 0, $80, $20, $20,	6, $5A,	$69, $B1; nTileLoBits
		.BYTE $C0, $80,	$B0, $30, $E, $6F, $D9,	$DB; nTileHiBits
		.BYTE 2, 0, 2, $44, $A5, $29, $29, $C8;	nTileLoBits
		.BYTE 3, 0, 6, $D5, $BD, $AD, $6B, $E8;	nTileHiBits
		.BYTE 1, $A3, $D1, $90,	$A1, $21, $2E, $34; nTileLoBits
		.BYTE 3, $71, $F1, $B1,	$B0, $B0, $3E, $7A; nTileHiBits
		.BYTE 8, $88, $C8, $88,	$88, $C8, $C8, $C8; nTileLoBits
		.BYTE $88, $88,	$88, $C8, $C8, $C8, $C8, $C8; nTileHiBits
		.BYTE $26, $27,	$23, $22, $27, $23, $21, $21; nTileLoBits
		.BYTE $26, $26,	$26, $27, $23, $23, $23, $21; nTileHiBits
		.BYTE $56, $14,	$19, $1D, $10, $98, $10, $C1; nTileLoBits
		.BYTE $54, $1D,	$1D, $19, $18, $10, $90, $93; nTileHiBits
		.BYTE $B1, $92,	$80, 1,	4, $10,	$40, 1;	nTileLoBits
		.BYTE $93, $B1,	$B0, $83, $E, $38, $E1,	$81; nTileHiBits
		.BYTE $C1, $4C,	$60, $80, $80, $80, 0, $80; nTileLoBits
		.BYTE $C3, $DE,	$F0, $C0, $80, $80, $80, 0; nTileHiBits
		.BYTE $80, 1, 1, 0, 1, 3, 1, 7;	nTileLoBits
		.BYTE $C0, 0, 0, 1, 1, 1, 3, 3;	nTileHiBits
		.BYTE $C8, $C8,	$88, $88, $C8, $88, 8, 8; nTileLoBits
		.BYTE $C8, $C8,	$C8, $C8, $88, $88, $88, 8; nTileHiBits
		.BYTE $20, $20,	$20, $20, $20, $20, $20, $20; nTileLoBits
		.BYTE $21, $20,	$20, $20, $20, $20, $20, $20; nTileHiBits
		.BYTE $84, $E8,	$F0, $38, $1C, $D, $F, 1; nTileLoBits
		.BYTE $CE, $C8,	$60, $70, $38, $1E, 7, 3; nTileHiBits
		.BYTE 1, 1, 1, 1, 1, 1,	$40, $EC; nTileLoBits
		.BYTE 1, 1, 1, 1, 1, 1,	$80, $F0; nTileHiBits
		.BYTE $80, 0, 0, $80, $80, 1, 5, $6F; nTileLoBits
		.BYTE 0, 0, 0, 0, 0, $80, 3, $1F; nTileHiBits
		.BYTE 2, $E, $1E, $38, $70, $60, $E0, 0; nTileLoBits
		.BYTE 7, 6, $C,	$1C, $38, $F0, $C0, $80; nTileHiBits
		.BYTE $20, $20,	$20, $20, $3F, $20, $27, $2C; nTileLoBits
		.BYTE $20, $20,	$20, $20, $3F, $20, $27, $2E; nTileHiBits
		.BYTE 0, 0, 0, 0, $FF, 0, $C3, $63; nTileLoBits
		.BYTE 0, 0, 0, 0, $FF, 0, $E3, $E7; nTileHiBits
		.BYTE $7F, $27,	0, 0, $FF, 0, $8E, $8E;	nTileLoBits
		.BYTE $FF, $1F,	0, 0, $FF, 0, $8E, $CF;	nTileHiBits
		.BYTE $FC, $C8,	0, 0, $FF, 0, $3B, $3B;	nTileLoBits
		.BYTE $FE, $F0,	0, 0, $FF, 0, $3B, $7B;	nTileHiBits
		.BYTE 0, 0, 0, 0, $FF, 0, $F3, 6; nTileLoBits
		.BYTE 0, 0, 0, 0, $FF, 0, $F7, 6; nTileHiBits
		.BYTE 8, 8, 8, 8, $F8, 8, $C8, $68; nTileLoBits
		.BYTE 8, 8, 8, 8, $F8, 8, $E8, $68; nTileHiBits
		.BYTE $2C, $2C,	$2C, $2C, $27, $20, $3F, 0; nTileLoBits
		.BYTE $2C, $2C,	$2C, $2E, $27, $20, $3F, 0; nTileHiBits
		.BYTE 2, $E6, $67, $E4,	$6C, 0,	$FF, 0;	nTileLoBits
		.BYTE 6, $E6, $6F, $EE,	$6C, 0,	$FF, 0;	nTileHiBits
		.BYTE $8F, $CD,	$CD, $4C, $6C, 0, $FF, 0; nTileLoBits
		.BYTE $CF, $CF,	$ED, $ED, $6C, 0, $FF, 0; nTileHiBits
		.BYTE $7B, $5B,	$DB, $9B, $9B, 0, $FF, 0; nTileLoBits
		.BYTE $7B, $FB,	$DB, $DB, $9B, 0, $FF, 0; nTileHiBits
		.BYTE 6, $E3, 0, 6, $F3, 0, $FF, 0; nTileLoBits
		.BYTE 6, $F7, 0, 6, $F7, 0, $FF, 0; nTileHiBits
		.BYTE 8, $C8, $68, $68,	$C8, 8,	$F8, 0;	nTileLoBits
		.BYTE 8, $E8, $68, $68,	$E8, 8,	$F8, 0;	nTileHiBits
		.BYTE 0, 0, 0, $7F, 0, $40, $40, $60; nTileLoBits
		.BYTE 0, 0, 0, $7F, 0, $40, $60, $60; nTileHiBits
		.BYTE	0
		.BYTE	0
		.BYTE $A7 ; §
		.BYTE $17
		.BYTE $7F ; 
		.BYTE $E8 ; è
		.BYTE $B6 ; ¶
		.BYTE $70 ; p
		.BYTE $BE ; ¾
		.BYTE $33 ; 3
		.BYTE	3
		.BYTE $BB ; »
		.BYTE	1
		.BYTE	0
		.BYTE $A1 ; ¡
		.BYTE $42 ; B
		.BYTE  $B
		.BYTE $2B ; +
		.BYTE	6
		.BYTE $40 ; @
		.BYTE  $B
		.BYTE $E8 ; è
		.BYTE $7B ; {
		.BYTE $7B ; {
		.BYTE $BA ; º
		.BYTE $33 ; 3
		.BYTE	3
		.BYTE $E8 ; è
		.BYTE $FE ; þ
		.BYTE $70 ; p
		.BYTE $80 ; €
		.BYTE $3E ; 
		.BYTE $AE ; ®
		.BYTE	8
		.BYTE	1
		.BYTE $75 ; u
		.BYTE $2A ; *
		.BYTE $BA ; º
		.BYTE $4F ; O
		.BYTE	3
		.BYTE $E8 ; è
		.BYTE $F1 ; ñ
		.BYTE $70 ; p
		.BYTE $8C ; Œ
		.BYTE $C0 ; À
		.BYTE $8A ; Š
		.BYTE $D4 ; Ô
		.BYTE $2A ; *
		.BYTE $16
		.BYTE $8C ; Œ
		.BYTE $16
		.BYTE $D0 ; Ð
		.BYTE $EA ; ê
		.BYTE $D0 ; Ð
		.BYTE $EA ; ê
		.BYTE $D0 ; Ð
		.BYTE $EA ; ê
		.BYTE $80 ; €
		.BYTE $C2 ; Â
		.BYTE $30 ; 0
		.BYTE $80 ; €
		.BYTE $FA ; ú

.PAD $C000,$FF
