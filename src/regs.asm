
PPU_CR_1	equ  $2000	; (uninited)	; DATA XREF: WaitHealthBarScanline+1Fw
					; ZeroMemoryAndSetupPPUPatternTable+34w ...
					; PPU Control Register #1 (W)
					;
					;    D7: Execute NMI on	VBlank
					;    D6: PPU Master/Slave Selection
					;    D5: Sprite	Size
					;    D4: Background Pattern Table Address
					;    D3: Sprite	Pattern	Table Address
					;    D2: PPU Address Increment
					; D1-D0: Name Table Address
PPU_CR_2	equ $2001	; (uninited)	; DATA XREF: sub_2BA65+25w
					; WaitHealthBarScanline+1Aw ...
					; PPU Control Register #2 (W)
					;
					; D7-D5: Full Background Colour	(when D0 == 1)
					; D7-D5: Colour	Intensity (when	D0 == 0)
					;    D4: Sprite	Visibility
					;    D3: Background Visibility
					;    D2: Sprite	Clipping
					;    D1: Background Clipping
					;    D0: Display Type
PPU_SR		equ $2002	; (uninited)	; DATA XREF: WaitHealthBarScanline:lbWaitSprite0HitPass1r
					; WaitHealthBarScanline:lbWaitSprite0HitPass2r	...
					; PPU Status Register (R)
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
SPR_RAM_AR	equ $2003	; (uninited)	; DATA XREF: SetupSprite0AndDMA+19w
					; SPR-RAM Address Register (W)
					;
					; D7-D0: 8-bit address in SPR-RAM to access via	$2004.
SPR_RAM_IOR	equ $2004	; (uninited)	; SPR-RAM I/O Register (W)
					;
					; D7-D0: 8-bit data written to SPR-RAM.
VRAM_AR_1	equ $2005	; (uninited)	; DATA XREF: WaitHealthBarScanline+25w
					; WaitHealthBarScanline+2Aw ...
					; VRAM Address Register	#1 (W2)
					;
					; Commonly used	used to	"pan/scroll" the screen	(sprites
					; excluded) horizontally and vertically. However, there
					; is no	actual panning hardware	inside the NES.	This
					; register controls VRAM addressing lines.
VRAM_AR_2	equ $2006	; (uninited)	; DATA XREF: RenderWellDoneAttr+2w
					; RenderWellDoneAttr+7w ...
					; VRAM Address Register	#2 (W2)
					;
					; Commonly used	to specify the 16-bit address in VRAM to
					; access via $2007. However, this register controls VRAM
					; addressing bits, and therefore should	be used	with
					; knowledge of how it works, and when it works.
VRAM_IOR	equ $2007	; (uninited)	; DATA XREF: RenderWellDoneAttr:lbRenderWellDoneAttrLoopw
					; WriteSingleAttr_FF+5w ...
					; VRAM I/O Register (RW)
					;
					; D7-D0: 8-bit data read/written from/to VRAM.


pAPU_P_1_CR	equ $4000
pAPU_P_1_RCR	equ $4001
pAPU_P_1_FTR	equ $4002
pAPU_P_1_CTR	equ $4003
pAPU_P_2_CR	equ $4004
pAPU_P_2_RCR	equ $4005
pAPU_P_2_FTR	equ $4006
pAPU_P_2_CTR	equ $4007
pAPU_T_CR_1	equ $4008
pAPU_T_CR_2	equ $4009
pAPU_T_FR_1	equ $400A
pAPU_T_FR_2	equ $400B
pAPU_N_CR_1	equ $400C
pAPU_N_FR_1	equ $400E
pAPU_N_FR_2	equ $400F
pAPU_DM_CR	equ $4010
pAPU_DM_DAR	equ $4011
pAPU_DM_AR	equ $4012
pAPU_DM_DLR	equ $4013
SPRITE_DMAR	equ $4014
pAPU_SV_CSR	equ $4015
Joypad_1	equ $4016
Joypad_2	equ $4017