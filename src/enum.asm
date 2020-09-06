; enum LevelId
Level_1	 equ 0
Level_2	 equ 1
Level_3	 equ 2
Level_4	 equ 3
Level_5	 equ 4
Level_6	 equ 5
Level_7	 equ 6
Level_8	 equ 7
Level_9	 equ 8
Level_10	 equ 9
Level_11	 equ $A
Level_12	 equ $B
Level_13	 equ $C
Level_14	 equ $D

; ---------------------------------------------------------------------------

; enum SPRITE_ATTR (bitfield)
Attr_01	 equ 1
Attr_10	 equ 2
Attr_11	 equ 3
Unused_001	 equ 4
Unused_010	 equ 8
Unused_011	 equ $C
Unused_100	 equ $10
Unused_101	 equ $14
Unused_110	 equ $18
Unused_111	 equ $1C
fBehind	 	 equ $20
HorzFlip	 equ $40
VertFlip	 equ $80

; ---------------------------------------------------------------------------

; enum JOYPAD (bitfield)
Btn_Right	 equ 1
Btn_Left	 equ 2
Btn_Down	 equ 4
Btn_Up		 equ 8
Btn_Start	 equ $10
Btn_Select	 equ $20
Btn_B		 equ $40
Btn_A		 equ $80

; ---------------------------------------------------------------------------

; enum LEVEL_BLOCK (bitfield)
lbSpace	 equ 0
lbPlate	 equ 1
lbSpikesPlate	 equ 2
lbDoubleColumns equ 3
lbDoor		 equ 4
lbPressedButton equ 5
lbLowButton	 equ 6
lbCastleOverDoorWithPlate equ 7
lbBigColumnLowPart equ 8
lbBigColumnHighPart equ 9
lbHealthPotion	 equ $A
lbBrokenPlate	 equ $B
lbCastleOverDoor equ $C
lbLevel4MirrorPlate equ $D
lbPlateWithDebris equ $E
lbHighButton	 equ $F
lbExitDoorLeftPart equ $10
lbExitDoorRightPart equ $11
lbCutters	 equ $12
lbPlateWithTorch equ $13
lbBrickWall	 equ $14
lbPlateWithSkeleton equ $15
lbPlateWithSword equ $16
lbPlateWithLeftPartOfWindow equ $17
lbPlateWithWindow equ $18
lbCastleOneColumn equ $19
lbCastleArchColumnPart	equ $1A
lbCastleSmallArch equ $1B
lbCastleLeftPartBigArch equ $1C
lbCastleRightPartBigArch equ $1D
lbUnused_1E	 equ $1E
lbUnused_1F	 equ $1F
Modifier_01	 equ $20
Modifier_02	 equ $40
Modifier_03	 equ $60
Modifier_04	 equ $80
Modifier_05	 equ $A0
Modifier_06	 equ $C0
Modifier_07	 equ $E0

; ---------------------------------------------------------------------------

; enum OBJECT_ACTION
oaNone		 equ 0
oaRunning1	 equ 1
oaStaying	 equ 2
oaJumping1	 equ 3
oaRunningJump	 equ 4
oaTurnBack1	 equ 5
oaRunningTurnBack equ 6
oaBeginFalling	 equ 7
oaJumpUpAndSwing1 equ 8
oaSwinging	 equ 9
oaMoveUp	 equ $A
oaShortJumpUp1	 equ $B
oaFalling	 equ $C
oaStopping	 equ $D
oaJumpUpAndBump equ $E
oaSwingingBeforeFalling equ $F
oaSwingAndFall	 equ $10
oaSittingDown	 equ $11
oaStartFalling1 equ $12
oaStartFalling2 equ $13
oaInjureSitDown equ $14
oaStartFalling3 equ $15
oaDeadMan	 equ $16
oaStartFalling4 equ $17
oaJumpUpAndSwing2 equ $18
oaGrabLedge	 equ $19
oaSitDown1	 equ $1A
oaSitDown2	 equ $1B
oaShortJumpUp2	 equ $1C
oaStartSteal1	 equ $1D
oaStartSteal2	 equ $1E
oaStartSteal3	 equ $1F
oaStartSteal4	 equ $20
oaStartSteal5	 equ $21
oaStartSteal6	 equ $22
oaStartSteal7	 equ $23
oaStartSteal8	 equ $24
oaStartSteal9	 equ $25
oaStartSteal10	 equ $26
oaStartSteal11	 equ $27
oaStartSteal12	 equ $28
oaStartSteal13	 equ $29
oaStartSteal14	 equ $2A
oaRunning2	 equ $2B
oaStartSteal15	 equ $2C
oaStartFallingAndInjure equ $2D
oaStartSteal16	 equ $2E
oaBreakWall	 equ $2F
oaSwingingAndFall equ $30
oaGetUp	 equ $31
oaSitDown3	 equ $32
oaDeathFromSpike equ $33
oaDeadMan2	 equ $34
oaDeadMan3	 equ $35
oaDeathFromCutters equ $36
oaGetOutSword1	 equ $37
oaMovingForwardInFight1 equ $38
oaMovingBackwardInFight equ $39
oaAttack1	 equ $3A
oaMovingInFight1 equ $3B
oaJumping2	 equ $3C
oaReflectAttack1 equ $3D
oaReflectAttack2 equ $3E
oaJumping3	 equ $3F
oaJumping4	 equ $40
oaJumping5	 equ $41
oaReflectAttack3 equ $42
oaMoveSword1	 equ $43
oaSlipDown	 equ $44
oaMoveSword2	 equ $45
oaRunningOffLevel equ $46
oaHealthOffDeath1 equ $47
oaStartSteal17	 equ $48
oaClimbUpFailed equ $49
oaMovingInFight2 equ $4A
oaAttack2	 equ $4B
oaMoveSword3	 equ $4C
oaGetOutSword2	 equ $4D
oaDrinkPotion	 equ $4E
oaSitDown4	 equ $4F
oaJumping6	 equ $50
oaStartFalling5 equ $51
oaStartFalling6 equ $52
oaStartFalling7 equ $53
oaRunning3	 equ $54
oaHealthOffDeath2 equ $55
oaMovingForwardInFight2 equ $56
oaGetOutSword3	 equ $57
oaGetOutSword4	 equ $58
oaTurnBack2	 equ $59
oaGetOutSword5	 equ $5A
oaGrabTheSword	 equ $5B
oaSheatheSword	 equ $5C
oaSheatheSwordFast equ $5D

; ---------------------------------------------------------------------------

; enum SOUND_EFFECT
seNone0	 equ 0
seCuttersClap	 equ 4
seMetallClank	 equ 5
seStep		 equ 6
seWallBreak	 equ 7
seBrokenPlateWave equ 8
seOpeningDoor	 equ 9
seDoorMechanism equ $A
seUnused	 equ $B
sePrinceInjure	 equ $C
seGuardInjure	 equ $D
seBreakSound	 equ $E
seDrinkingPotion equ $F
seSpikesClank	 equ $10
seSpikes	 equ $11
seExitOpened	 equ $12

; ---------------------------------------------------------------------------

; enum MUSIC
mLevelRestart	 equ 0
mDeath		 equ 1
mMusicOff	 equ 2
mVictory	 equ 3
mGameEnd	 equ 4
mLevel		 equ 5
mGameBegin	 equ 6

; ---------------------------------------------------------------------------

; enum ACTION_PROC
apFinishLevel	 equ $F1
apPlaySound	 equ $F2
apPlayMusic	 equ $F3
apActionBrokenPlateHandle equ $F4
apResetFallingCounters	equ $F5
apRestartLevel	 equ $F6
apRepeat	 equ $F7
apSetFallingHorzSpeed equ $F8
apSetupUnknown1 equ $F9
apMoveVert	 equ $FA
apMoveHorz	 equ $FB
apAction04	 equ $FC
apAction03	 equ $FD
apTurnBack	 equ $FE
apSetNewActionPtr equ $FF

; ---------------------------------------------------------------------------

; enum ROOM_ID
roomLeft	 equ 0
roomRight	 equ 1
roomTop	 equ 2
roomBottom	 equ 3

; ---------------------------------------------------------------------------

; enum ROOM_PLACE (bitfield)
X_0_Y_0	 equ 0
X_1_Y_0	 equ 1
X_2_Y_0	 equ 2
X_3_Y_0	 equ 3
X_4_Y_0	 equ 4
X_5_Y_0	 equ 5
X_6_Y_0	 equ 6
X_7_Y_0	 equ 7
X_8_Y_0	 equ 8
X_9_Y_0	 equ 9
X_0_Y_1	 equ $A
X_1_Y_1	 equ $B
X_2_Y_1	 equ $C
X_3_Y_1	 equ $D
X_4_Y_1	 equ $E
X_5_Y_1	 equ $F
X_6_Y_1	 equ $10
X_7_Y_1	 equ $11
X_8_Y_1	 equ $12
X_9_Y_1	 equ $13
X_0_Y_2	 equ $14
X_1_Y_2	 equ $15
X_2_Y_2	 equ $16
X_3_Y_2	 equ $17
X_4_Y_2	 equ $18
X_5_Y_2	 equ $19
X_6_Y_2	 equ $1A
X_7_Y_2	 equ $1B
X_8_Y_2	 equ $1C
X_9_Y_2	 equ $1D
NO_PLACE	 equ $1E
UNUSED		 equ $1F
RESIDUAL_BIT	 equ $80

; ---------------------------------------------------------------------------

; enum DOOR_ACTION
ACTION_OPEN_DOOR equ 0
ACTION_CLOSE_DOOR equ 1

; ---------------------------------------------------------------------------

; enum PLAYER_DIRECTION
DIRECTION_RIGHT equ 0
DIRECTION_LEFT	 equ $FF

; ---------------------------------------------------------------------------

; enum ENC_PTR (bitfield)
PTR_8000	 equ 0
PTR_8010	 equ 1
PTR_8020	 equ 2
PTR_8030	 equ 3
PTR_8040	 equ 4
PTR_8050	 equ 5
PTR_8060	 equ 6
PTR_8070	 equ 7
PTR_8080	 equ 8
PTR_8090	 equ 9
PTR_80A0	 equ $A
PTR_80B0	 equ $B
PTR_80C0	 equ $C
PTR_80D0	 equ $D
PTR_80E0	 equ $E
PTR_80F0	 equ $F
PTR_8100	 equ $10
PTR_8110	 equ $11
PTR_8120	 equ $12
PTR_8130	 equ $13
PTR_8140	 equ $14
PTR_8150	 equ $15
PTR_8160	 equ $16
PTR_8170	 equ $17
PTR_8180	 equ $18
PTR_8190	 equ $19
PTR_81A0	 equ $1A
PTR_81B0	 equ $1B
PTR_81C0	 equ $1C
PTR_81D0	 equ $1D
PTR_81E0	 equ $1E
PTR_81F0	 equ $1F
PTR_8200	 equ $20
PTR_8210	 equ $21
PTR_8220	 equ $22
PTR_8230	 equ $23
PTR_8240	 equ $24
PTR_8250	 equ $25
PTR_8260	 equ $26
PTR_8270	 equ $27
PTR_8280	 equ $28
PTR_8290	 equ $29
PTR_82A0	 equ $2A
PTR_82B0	 equ $2B
PTR_82C0	 equ $2C
PTR_82D0	 equ $2D
PTR_82E0	 equ $2E
PTR_82F0	 equ $2F
PTR_8300	 equ $30
PTR_8310	 equ $31
PTR_8320	 equ $32
PTR_8330	 equ $33
PTR_8340	 equ $34
PTR_8350	 equ $35
PTR_8360	 equ $36
PTR_8370	 equ $37
PTR_8380	 equ $38
PTR_8390	 equ $39
PTR_83A0	 equ $3A
PTR_83B0	 equ $3B
PTR_83C0	 equ $3C
PTR_83D0	 equ $3D
PTR_83E0	 equ $3E
PTR_83F0	 equ $3F
PTR_8400	 equ $40
PTR_8410	 equ $41
PTR_8420	 equ $42
PTR_8430	 equ $43
PTR_8440	 equ $44
PTR_8450	 equ $45
PTR_8460	 equ $46
PTR_8470	 equ $47
PTR_8480	 equ $48
PTR_8490	 equ $49
PTR_84A0	 equ $4A
PTR_84B0	 equ $4B
PTR_84C0	 equ $4C
PTR_84D0	 equ $4D
PTR_84E0	 equ $4E
PTR_84F0	 equ $4F
PTR_8500	 equ $50
PTR_8510	 equ $51
PTR_8520	 equ $52
PTR_8530	 equ $53
PTR_8540	 equ $54
PTR_8550	 equ $55
PTR_8560	 equ $56
PTR_8570	 equ $57
PTR_8580	 equ $58
PTR_8590	 equ $59
PTR_85A0	 equ $5A
PTR_85B0	 equ $5B
PTR_85C0	 equ $5C
PTR_85D0	 equ $5D
PTR_85E0	 equ $5E
PTR_85F0	 equ $5F
PTR_8600	 equ $60
PTR_8610	 equ $61
PTR_8620	 equ $62
PTR_8630	 equ $63
PTR_8640	 equ $64
PTR_8650	 equ $65
PTR_8660	 equ $66
PTR_8670	 equ $67
PTR_8680	 equ $68
PTR_8690	 equ $69
PTR_86A0	 equ $6A
PTR_86B0	 equ $6B
PTR_86C0	 equ $6C
PTR_86D0	 equ $6D
PTR_86E0	 equ $6E
PTR_86F0	 equ $6F
PTR_8700	 equ $70
PTR_8710	 equ $71
PTR_8720	 equ $72
PTR_8730	 equ $73
PTR_8740	 equ $74
PTR_8750	 equ $75
PTR_8760	 equ $76
PTR_8770	 equ $77
PTR_8780	 equ $78
PTR_8790	 equ $79
PTR_87A0	 equ $7A
PTR_87B0	 equ $7B
PTR_87C0	 equ $7C
PTR_87D0	 equ $7D
PTR_87E0	 equ $7E
PTR_87F0	 equ $7F
PTR_8800	 equ $80
PTR_8810	 equ $81
PTR_8820	 equ $82
PTR_8830	 equ $83
PTR_8840	 equ $84
PTR_8850	 equ $85
PTR_8860	 equ $86
PTR_8870	 equ $87
PTR_8880	 equ $88
PTR_8890	 equ $89
PTR_88A0	 equ $8A
PTR_88B0	 equ $8B
PTR_88C0	 equ $8C
PTR_88D0	 equ $8D
PTR_88E0	 equ $8E
PTR_88F0	 equ $8F
PTR_8900	 equ $90
PTR_8910	 equ $91
PTR_8920	 equ $92
PTR_8930	 equ $93
PTR_8940	 equ $94
PTR_8950	 equ $95
PTR_8960	 equ $96
PTR_8970	 equ $97
PTR_8980	 equ $98
PTR_8990	 equ $99
PTR_89A0	 equ $9A
PTR_89B0	 equ $9B
PTR_89C0	 equ $9C
PTR_89D0	 equ $9D
PTR_89E0	 equ $9E
PTR_89F0	 equ $9F
PTR_8A00	 equ $A0
PTR_8A10	 equ $A1
PTR_8A20	 equ $A2
PTR_8A30	 equ $A3
PTR_8A40	 equ $A4
PTR_8A50	 equ $A5
PTR_8A60	 equ $A6
PTR_8A70	 equ $A7
PTR_8A80	 equ $A8
PTR_8A90	 equ $A9
PTR_8AA0	 equ $AA
PTR_8AB0	 equ $AB
PTR_8AC0	 equ $AC
PTR_8AD0	 equ $AD
PTR_8AE0	 equ $AE
PTR_8AF0	 equ $AF
PTR_8B00	 equ $B0
PTR_8B10	 equ $B1
PTR_8B20	 equ $B2
PTR_8B30	 equ $B3
PTR_8B40	 equ $B4
PTR_8B50	 equ $B5
PTR_8B60	 equ $B6
PTR_8B70	 equ $B7
PTR_8B80	 equ $B8
PTR_8B90	 equ $B9
PTR_8BA0	 equ $BA
PTR_8BB0	 equ $BB
PTR_8BC0	 equ $BC
PTR_8BD0	 equ $BD
PTR_8BE0	 equ $BE
PTR_8BF0	 equ $BF
PTR_8C00	 equ $C0
PTR_8C10	 equ $C1
PTR_8C20	 equ $C2
PTR_8C30	 equ $C3
PTR_8C40	 equ $C4
PTR_8C50	 equ $C5
PTR_8C60	 equ $C6
PTR_8C70	 equ $C7
PTR_8C80	 equ $C8
PTR_8C90	 equ $C9
PTR_8CA0	 equ $CA
PTR_8CB0	 equ $CB
PTR_8CC0	 equ $CC
PTR_8CD0	 equ $CD
PTR_8CE0	 equ $CE
PTR_8CF0	 equ $CF
PTR_8D00	 equ $D0
PTR_8D10	 equ $D1
PTR_8D20	 equ $D2
PTR_8D30	 equ $D3
PTR_8D40	 equ $D4
PTR_8D50	 equ $D5
PTR_8D60	 equ $D6
PTR_8D70	 equ $D7
PTR_8D80	 equ $D8
PTR_8D90	 equ $D9
PTR_8DA0	 equ $DA
PTR_8DB0	 equ $DB
PTR_8DC0	 equ $DC
PTR_8DD0	 equ $DD
PTR_8DE0	 equ $DE
PTR_8DF0	 equ $DF
PTR_8E00	 equ $E0
PTR_8E10	 equ $E1
PTR_8E20	 equ $E2
PTR_8E30	 equ $E3
PTR_8E40	 equ $E4
PTR_8E50	 equ $E5
PTR_8E60	 equ $E6
PTR_8E70	 equ $E7
PTR_8E80	 equ $E8
PTR_8E90	 equ $E9
PTR_8EA0	 equ $EA
PTR_8EB0	 equ $EB
PTR_8EC0	 equ $EC
PTR_8ED0	 equ $ED
PTR_8EE0	 equ $EE
PTR_8EF0	 equ $EF
PTR_8F00	 equ $F0
PTR_8F10	 equ $F1
PTR_8F20	 equ $F2
PTR_8F30	 equ $F3
PTR_8F40	 equ $F4
PTR_8F50	 equ $F5
PTR_8F60	 equ $F6
PTR_8F70	 equ $F7
PTR_8F80	 equ $F8
PTR_8F90	 equ $F9
PTR_8FA0	 equ $FA
PTR_8FB0	 equ $FB
PTR_8FC0	 equ $FC
PTR_8FD0	 equ $FD
PTR_8FE0	 equ $FE
PTR_8FF0	 equ $FF
PTR_9000	 equ $100
PTR_9010	 equ $101
PTR_9020	 equ $102
PTR_9030	 equ $103
PTR_9040	 equ $104
PTR_9050	 equ $105
PTR_9060	 equ $106
PTR_9070	 equ $107
PTR_9080	 equ $108
PTR_9090	 equ $109
PTR_90A0	 equ $10A
PTR_90B0	 equ $10B
PTR_90C0	 equ $10C
PTR_90D0	 equ $10D
PTR_90E0	 equ $10E
PTR_90F0	 equ $10F
PTR_9100	 equ $110
PTR_9110	 equ $111
PTR_9120	 equ $112
PTR_9130	 equ $113
PTR_9140	 equ $114
PTR_9150	 equ $115
PTR_9160	 equ $116
PTR_9170	 equ $117
PTR_9180	 equ $118
PTR_9190	 equ $119
PTR_91A0	 equ $11A
PTR_91B0	 equ $11B
PTR_91C0	 equ $11C
PTR_91D0	 equ $11D
PTR_91E0	 equ $11E
PTR_91F0	 equ $11F
PTR_9200	 equ $120
PTR_9210	 equ $121
PTR_9220	 equ $122
PTR_9230	 equ $123
PTR_9240	 equ $124
PTR_9250	 equ $125
PTR_9260	 equ $126
PTR_9270	 equ $127
PTR_9280	 equ $128
PTR_9290	 equ $129
PTR_92A0	 equ $12A
PTR_92B0	 equ $12B
PTR_92C0	 equ $12C
PTR_92D0	 equ $12D
PTR_92E0	 equ $12E
PTR_92F0	 equ $12F
PTR_9300	 equ $130
PTR_9310	 equ $131
PTR_9320	 equ $132
PTR_9330	 equ $133
PTR_9340	 equ $134
PTR_9350	 equ $135
PTR_9360	 equ $136
PTR_9370	 equ $137
PTR_9380	 equ $138
PTR_9390	 equ $139
PTR_93A0	 equ $13A
PTR_93B0	 equ $13B
PTR_93C0	 equ $13C
PTR_93D0	 equ $13D
PTR_93E0	 equ $13E
PTR_93F0	 equ $13F
PTR_9400	 equ $140
PTR_9410	 equ $141
PTR_9420	 equ $142
PTR_9430	 equ $143
PTR_9440	 equ $144
PTR_9450	 equ $145
PTR_9460	 equ $146
PTR_9470	 equ $147
PTR_9480	 equ $148
PTR_9490	 equ $149
PTR_94A0	 equ $14A
PTR_94B0	 equ $14B
PTR_94C0	 equ $14C
PTR_94D0	 equ $14D
PTR_94E0	 equ $14E
PTR_94F0	 equ $14F
PTR_9500	 equ $150
PTR_9510	 equ $151
PTR_9520	 equ $152
PTR_9530	 equ $153
PTR_9540	 equ $154
PTR_9550	 equ $155
PTR_9560	 equ $156
PTR_9570	 equ $157
PTR_9580	 equ $158
PTR_9590	 equ $159
PTR_95A0	 equ $15A
PTR_95B0	 equ $15B
PTR_95C0	 equ $15C
PTR_95D0	 equ $15D
PTR_95E0	 equ $15E
PTR_95F0	 equ $15F
PTR_9600	 equ $160
PTR_9610	 equ $161
PTR_9620	 equ $162
PTR_9630	 equ $163
PTR_9640	 equ $164
PTR_9650	 equ $165
PTR_9660	 equ $166
PTR_9670	 equ $167
PTR_9680	 equ $168
PTR_9690	 equ $169
PTR_96A0	 equ $16A
PTR_96B0	 equ $16B
PTR_96C0	 equ $16C
PTR_96D0	 equ $16D
PTR_96E0	 equ $16E
PTR_96F0	 equ $16F
PTR_9700	 equ $170
PTR_9710	 equ $171
PTR_9720	 equ $172
PTR_9730	 equ $173
PTR_9740	 equ $174
PTR_9750	 equ $175
PTR_9760	 equ $176
PTR_9770	 equ $177
PTR_9780	 equ $178
PTR_9790	 equ $179
PTR_97A0	 equ $17A
PTR_97B0	 equ $17B
PTR_97C0	 equ $17C
PTR_97D0	 equ $17D
PTR_97E0	 equ $17E
PTR_97F0	 equ $17F
PTR_9800	 equ $180
PTR_9810	 equ $181
PTR_9820	 equ $182
PTR_9830	 equ $183
PTR_9840	 equ $184
PTR_9850	 equ $185
PTR_9860	 equ $186
PTR_9870	 equ $187
PTR_9880	 equ $188
PTR_9890	 equ $189
PTR_98A0	 equ $18A
PTR_98B0	 equ $18B
PTR_98C0	 equ $18C
PTR_98D0	 equ $18D
PTR_98E0	 equ $18E
PTR_98F0	 equ $18F
PTR_9900	 equ $190
PTR_9910	 equ $191
PTR_9920	 equ $192
PTR_9930	 equ $193
PTR_9940	 equ $194
PTR_9950	 equ $195
PTR_9960	 equ $196
PTR_9970	 equ $197
PTR_9980	 equ $198
PTR_9990	 equ $199
PTR_99A0	 equ $19A
PTR_99B0	 equ $19B
PTR_99C0	 equ $19C
PTR_99D0	 equ $19D
PTR_99E0	 equ $19E
PTR_99F0	 equ $19F
PTR_9A00	 equ $1A0
PTR_9A10	 equ $1A1
PTR_9A20	 equ $1A2
PTR_9A30	 equ $1A3
PTR_9A40	 equ $1A4
PTR_9A50	 equ $1A5
PTR_9A60	 equ $1A6
PTR_9A70	 equ $1A7
PTR_9A80	 equ $1A8
PTR_9A90	 equ $1A9
PTR_9AA0	 equ $1AA
PTR_9AB0	 equ $1AB
PTR_9AC0	 equ $1AC
PTR_9AD0	 equ $1AD
PTR_9AE0	 equ $1AE
PTR_9AF0	 equ $1AF
PTR_9B00	 equ $1B0
PTR_9B10	 equ $1B1
PTR_9B20	 equ $1B2
PTR_9B30	 equ $1B3
PTR_9B40	 equ $1B4
PTR_9B50	 equ $1B5
PTR_9B60	 equ $1B6
PTR_9B70	 equ $1B7
PTR_9B80	 equ $1B8
PTR_9B90	 equ $1B9
PTR_9BA0	 equ $1BA
PTR_9BB0	 equ $1BB
PTR_9BC0	 equ $1BC
PTR_9BD0	 equ $1BD
PTR_9BE0	 equ $1BE
PTR_9BF0	 equ $1BF
PTR_9C00	 equ $1C0
PTR_9C10	 equ $1C1
PTR_9C20	 equ $1C2
PTR_9C30	 equ $1C3
PTR_9C40	 equ $1C4
PTR_9C50	 equ $1C5
PTR_9C60	 equ $1C6
PTR_9C70	 equ $1C7
PTR_9C80	 equ $1C8
PTR_9C90	 equ $1C9
PTR_9CA0	 equ $1CA
PTR_9CB0	 equ $1CB
PTR_9CC0	 equ $1CC
PTR_9CD0	 equ $1CD
PTR_9CE0	 equ $1CE
PTR_9CF0	 equ $1CF
PTR_9D00	 equ $1D0
PTR_9D10	 equ $1D1
PTR_9D20	 equ $1D2
PTR_9D30	 equ $1D3
PTR_9D40	 equ $1D4
PTR_9D50	 equ $1D5
PTR_9D60	 equ $1D6
PTR_9D70	 equ $1D7
PTR_9D80	 equ $1D8
PTR_9D90	 equ $1D9
PTR_9DA0	 equ $1DA
PTR_9DB0	 equ $1DB
PTR_9DC0	 equ $1DC
PTR_9DD0	 equ $1DD
PTR_9DE0	 equ $1DE
PTR_9DF0	 equ $1DF
PTR_9E00	 equ $1E0
PTR_9E10	 equ $1E1
PTR_9E20	 equ $1E2
PTR_9E30	 equ $1E3
PTR_9E40	 equ $1E4
PTR_9E50	 equ $1E5
PTR_9E60	 equ $1E6
PTR_9E70	 equ $1E7
PTR_9E80	 equ $1E8
PTR_9E90	 equ $1E9
PTR_9EA0	 equ $1EA
PTR_9EB0	 equ $1EB
PTR_9EC0	 equ $1EC
PTR_9ED0	 equ $1ED
PTR_9EE0	 equ $1EE
PTR_9EF0	 equ $1EF
PTR_9F00	 equ $1F0
PTR_9F10	 equ $1F1
PTR_9F20	 equ $1F2
PTR_9F30	 equ $1F3
PTR_9F40	 equ $1F4
PTR_9F50	 equ $1F5
PTR_9F60	 equ $1F6
PTR_9F70	 equ $1F7
PTR_9F80	 equ $1F8
PTR_9F90	 equ $1F9
PTR_9FA0	 equ $1FA
PTR_9FB0	 equ $1FB
PTR_9FC0	 equ $1FC
PTR_9FD0	 equ $1FD
PTR_9FE0	 equ $1FE
PTR_9FF0	 equ $1FF
PTR_A000	 equ $200
PTR_A010	 equ $201
PTR_A020	 equ $202
PTR_A030	 equ $203
PTR_A040	 equ $204
PTR_A050	 equ $205
PTR_A060	 equ $206
PTR_A070	 equ $207
PTR_A080	 equ $208
PTR_A090	 equ $209
PTR_A0A0	 equ $20A
PTR_A0B0	 equ $20B
PTR_A0C0	 equ $20C
PTR_A0D0	 equ $20D
PTR_A0E0	 equ $20E
PTR_A0F0	 equ $20F
PTR_A100	 equ $210
PTR_A110	 equ $211
PTR_A120	 equ $212
PTR_A130	 equ $213
PTR_A140	 equ $214
PTR_A150	 equ $215
PTR_A160	 equ $216
PTR_A170	 equ $217
PTR_A180	 equ $218
PTR_A190	 equ $219
PTR_A1A0	 equ $21A
PTR_A1B0	 equ $21B
PTR_A1C0	 equ $21C
PTR_A1D0	 equ $21D
PTR_A1E0	 equ $21E
PTR_A1F0	 equ $21F
PTR_A200	 equ $220
PTR_A210	 equ $221
PTR_A220	 equ $222
PTR_A230	 equ $223
PTR_A240	 equ $224
PTR_A250	 equ $225
PTR_A260	 equ $226
PTR_A270	 equ $227
PTR_A280	 equ $228
PTR_A290	 equ $229
PTR_A2A0	 equ $22A
PTR_A2B0	 equ $22B
PTR_A2C0	 equ $22C
PTR_A2D0	 equ $22D
PTR_A2E0	 equ $22E
PTR_A2F0	 equ $22F
PTR_A300	 equ $230
PTR_A310	 equ $231
PTR_A320	 equ $232
PTR_A330	 equ $233
PTR_A340	 equ $234
PTR_A350	 equ $235
PTR_A360	 equ $236
PTR_A370	 equ $237
PTR_A380	 equ $238
PTR_A390	 equ $239
PTR_A3A0	 equ $23A
PTR_A3B0	 equ $23B
PTR_A3C0	 equ $23C
PTR_A3D0	 equ $23D
PTR_A3E0	 equ $23E
PTR_A3F0	 equ $23F
PTR_A400	 equ $240
PTR_A410	 equ $241
PTR_A420	 equ $242
PTR_A430	 equ $243
PTR_A440	 equ $244
PTR_A450	 equ $245
PTR_A460	 equ $246
PTR_A470	 equ $247
PTR_A480	 equ $248
PTR_A490	 equ $249
PTR_A4A0	 equ $24A
PTR_A4B0	 equ $24B
PTR_A4C0	 equ $24C
PTR_A4D0	 equ $24D
PTR_A4E0	 equ $24E
PTR_A4F0	 equ $24F
PTR_A500	 equ $250
PTR_A510	 equ $251
PTR_A520	 equ $252
PTR_A530	 equ $253
PTR_A540	 equ $254
PTR_A550	 equ $255
PTR_A560	 equ $256
PTR_A570	 equ $257
PTR_A580	 equ $258
PTR_A590	 equ $259
PTR_A5A0	 equ $25A
PTR_A5B0	 equ $25B
PTR_A5C0	 equ $25C
PTR_A5D0	 equ $25D
PTR_A5E0	 equ $25E
PTR_A5F0	 equ $25F
PTR_A600	 equ $260
PTR_A610	 equ $261
PTR_A620	 equ $262
PTR_A630	 equ $263
PTR_A640	 equ $264
PTR_A650	 equ $265
PTR_A660	 equ $266
PTR_A670	 equ $267
PTR_A680	 equ $268
PTR_A690	 equ $269
PTR_A6A0	 equ $26A
PTR_A6B0	 equ $26B
PTR_A6C0	 equ $26C
PTR_A6D0	 equ $26D
PTR_A6E0	 equ $26E
PTR_A6F0	 equ $26F
PTR_A700	 equ $270
PTR_A710	 equ $271
PTR_A720	 equ $272
PTR_A730	 equ $273
PTR_A740	 equ $274
PTR_A750	 equ $275
PTR_A760	 equ $276
PTR_A770	 equ $277
PTR_A780	 equ $278
PTR_A790	 equ $279
PTR_A7A0	 equ $27A
PTR_A7B0	 equ $27B
PTR_A7C0	 equ $27C
PTR_A7D0	 equ $27D
PTR_A7E0	 equ $27E
PTR_A7F0	 equ $27F
PTR_A800	 equ $280
PTR_A810	 equ $281
PTR_A820	 equ $282
PTR_A830	 equ $283
PTR_A840	 equ $284
PTR_A850	 equ $285
PTR_A860	 equ $286
PTR_A870	 equ $287
PTR_A880	 equ $288
PTR_A890	 equ $289
PTR_A8A0	 equ $28A
PTR_A8B0	 equ $28B
PTR_A8C0	 equ $28C
PTR_A8D0	 equ $28D
PTR_A8E0	 equ $28E
PTR_A8F0	 equ $28F
PTR_A900	 equ $290
PTR_A910	 equ $291
PTR_A920	 equ $292
PTR_A930	 equ $293
PTR_A940	 equ $294
PTR_A950	 equ $295
PTR_A960	 equ $296
PTR_A970	 equ $297
PTR_A980	 equ $298
PTR_A990	 equ $299
PTR_A9A0	 equ $29A
PTR_A9B0	 equ $29B
PTR_A9C0	 equ $29C
PTR_A9D0	 equ $29D
PTR_A9E0	 equ $29E
PTR_A9F0	 equ $29F
PTR_AA00	 equ $2A0
PTR_AA10	 equ $2A1
PTR_AA20	 equ $2A2
PTR_AA30	 equ $2A3
PTR_AA40	 equ $2A4
PTR_AA50	 equ $2A5
PTR_AA60	 equ $2A6
PTR_AA70	 equ $2A7
PTR_AA80	 equ $2A8
PTR_AA90	 equ $2A9
PTR_AAA0	 equ $2AA
PTR_AAB0	 equ $2AB
PTR_AAC0	 equ $2AC
PTR_AAD0	 equ $2AD
PTR_AAE0	 equ $2AE
PTR_AAF0	 equ $2AF
PTR_AB00	 equ $2B0
PTR_AB10	 equ $2B1
PTR_AB20	 equ $2B2
PTR_AB30	 equ $2B3
PTR_AB40	 equ $2B4
PTR_AB50	 equ $2B5
PTR_AB60	 equ $2B6
PTR_AB70	 equ $2B7
PTR_AB80	 equ $2B8
PTR_AB90	 equ $2B9
PTR_ABA0	 equ $2BA
PTR_ABB0	 equ $2BB
PTR_ABC0	 equ $2BC
PTR_ABD0	 equ $2BD
PTR_ABE0	 equ $2BE
PTR_ABF0	 equ $2BF
PTR_AC00	 equ $2C0
PTR_AC10	 equ $2C1
PTR_AC20	 equ $2C2
PTR_AC30	 equ $2C3
PTR_AC40	 equ $2C4
PTR_AC50	 equ $2C5
PTR_AC60	 equ $2C6
PTR_AC70	 equ $2C7
PTR_AC80	 equ $2C8
PTR_AC90	 equ $2C9
PTR_ACA0	 equ $2CA
PTR_ACB0	 equ $2CB
PTR_ACC0	 equ $2CC
PTR_ACD0	 equ $2CD
PTR_ACE0	 equ $2CE
PTR_ACF0	 equ $2CF
PTR_AD00	 equ $2D0
PTR_AD10	 equ $2D1
PTR_AD20	 equ $2D2
PTR_AD30	 equ $2D3
PTR_AD40	 equ $2D4
PTR_AD50	 equ $2D5
PTR_AD60	 equ $2D6
PTR_AD70	 equ $2D7
PTR_AD80	 equ $2D8
PTR_AD90	 equ $2D9
PTR_ADA0	 equ $2DA
PTR_ADB0	 equ $2DB
PTR_ADC0	 equ $2DC
PTR_ADD0	 equ $2DD
PTR_ADE0	 equ $2DE
PTR_ADF0	 equ $2DF
PTR_AE00	 equ $2E0
PTR_AE10	 equ $2E1
PTR_AE20	 equ $2E2
PTR_AE30	 equ $2E3
PTR_AE40	 equ $2E4
PTR_AE50	 equ $2E5
PTR_AE60	 equ $2E6
PTR_AE70	 equ $2E7
PTR_AE80	 equ $2E8
PTR_AE90	 equ $2E9
PTR_AEA0	 equ $2EA
PTR_AEB0	 equ $2EB
PTR_AEC0	 equ $2EC
PTR_AED0	 equ $2ED
PTR_AEE0	 equ $2EE
PTR_AEF0	 equ $2EF
PTR_AF00	 equ $2F0
PTR_AF10	 equ $2F1
PTR_AF20	 equ $2F2
PTR_AF30	 equ $2F3
PTR_AF40	 equ $2F4
PTR_AF50	 equ $2F5
PTR_AF60	 equ $2F6
PTR_AF70	 equ $2F7
PTR_AF80	 equ $2F8
PTR_AF90	 equ $2F9
PTR_AFA0	 equ $2FA
PTR_AFB0	 equ $2FB
PTR_AFC0	 equ $2FC
PTR_AFD0	 equ $2FD
PTR_AFE0	 equ $2FE
PTR_AFF0	 equ $2FF
PTR_B000	 equ $300
PTR_B010	 equ $301
PTR_B020	 equ $302
PTR_B030	 equ $303
PTR_B040	 equ $304
PTR_B050	 equ $305
PTR_B060	 equ $306
PTR_B070	 equ $307
PTR_B080	 equ $308
PTR_B090	 equ $309
PTR_B0A0	 equ $30A
PTR_B0B0	 equ $30B
PTR_B0C0	 equ $30C
PTR_B0D0	 equ $30D
PTR_B0E0	 equ $30E
PTR_B0F0	 equ $30F
PTR_B100	 equ $310
PTR_B110	 equ $311
PTR_B120	 equ $312
PTR_B130	 equ $313
PTR_B140	 equ $314
PTR_B150	 equ $315
PTR_B160	 equ $316
PTR_B170	 equ $317
PTR_B180	 equ $318
PTR_B190	 equ $319
PTR_B1A0	 equ $31A
PTR_B1B0	 equ $31B
PTR_B1C0	 equ $31C
PTR_B1D0	 equ $31D
PTR_B1E0	 equ $31E
PTR_B1F0	 equ $31F
PTR_B200	 equ $320
PTR_B210	 equ $321
PTR_B220	 equ $322
PTR_B230	 equ $323
PTR_B240	 equ $324
PTR_B250	 equ $325
PTR_B260	 equ $326
PTR_B270	 equ $327
PTR_B280	 equ $328
PTR_B290	 equ $329
PTR_B2A0	 equ $32A
PTR_B2B0	 equ $32B
PTR_B2C0	 equ $32C
PTR_B2D0	 equ $32D
PTR_B2E0	 equ $32E
PTR_B2F0	 equ $32F
PTR_B300	 equ $330
PTR_B310	 equ $331
PTR_B320	 equ $332
PTR_B330	 equ $333
PTR_B340	 equ $334
PTR_B350	 equ $335
PTR_B360	 equ $336
PTR_B370	 equ $337
PTR_B380	 equ $338
PTR_B390	 equ $339
PTR_B3A0	 equ $33A
PTR_B3B0	 equ $33B
PTR_B3C0	 equ $33C
PTR_B3D0	 equ $33D
PTR_B3E0	 equ $33E
PTR_B3F0	 equ $33F
PTR_B400	 equ $340
PTR_B410	 equ $341
PTR_B420	 equ $342
PTR_B430	 equ $343
PTR_B440	 equ $344
PTR_B450	 equ $345
PTR_B460	 equ $346
PTR_B470	 equ $347
PTR_B480	 equ $348
PTR_B490	 equ $349
PTR_B4A0	 equ $34A
PTR_B4B0	 equ $34B
PTR_B4C0	 equ $34C
PTR_B4D0	 equ $34D
PTR_B4E0	 equ $34E
PTR_B4F0	 equ $34F
PTR_B500	 equ $350
PTR_B510	 equ $351
PTR_B520	 equ $352
PTR_B530	 equ $353
PTR_B540	 equ $354
PTR_B550	 equ $355
PTR_B560	 equ $356
PTR_B570	 equ $357
PTR_B580	 equ $358
PTR_B590	 equ $359
PTR_B5A0	 equ $35A
PTR_B5B0	 equ $35B
PTR_B5C0	 equ $35C
PTR_B5D0	 equ $35D
PTR_B5E0	 equ $35E
PTR_B5F0	 equ $35F
PTR_B600	 equ $360
PTR_B610	 equ $361
PTR_B620	 equ $362
PTR_B630	 equ $363
PTR_B640	 equ $364
PTR_B650	 equ $365
PTR_B660	 equ $366
PTR_B670	 equ $367
PTR_B680	 equ $368
PTR_B690	 equ $369
PTR_B6A0	 equ $36A
PTR_B6B0	 equ $36B
PTR_B6C0	 equ $36C
PTR_B6D0	 equ $36D
PTR_B6E0	 equ $36E
PTR_B6F0	 equ $36F
PTR_B700	 equ $370
PTR_B710	 equ $371
PTR_B720	 equ $372
PTR_B730	 equ $373
PTR_B740	 equ $374
PTR_B750	 equ $375
PTR_B760	 equ $376
PTR_B770	 equ $377
PTR_B780	 equ $378
PTR_B790	 equ $379
PTR_B7A0	 equ $37A
PTR_B7B0	 equ $37B
PTR_B7C0	 equ $37C
PTR_B7D0	 equ $37D
PTR_B7E0	 equ $37E
PTR_B7F0	 equ $37F
PTR_B800	 equ $380
PTR_B810	 equ $381
PTR_B820	 equ $382
PTR_B830	 equ $383
PTR_B840	 equ $384
PTR_B850	 equ $385
PTR_B860	 equ $386
PTR_B870	 equ $387
PTR_B880	 equ $388
PTR_B890	 equ $389
PTR_B8A0	 equ $38A
PTR_B8B0	 equ $38B
PTR_B8C0	 equ $38C
PTR_B8D0	 equ $38D
PTR_B8E0	 equ $38E
PTR_B8F0	 equ $38F
PTR_B900	 equ $390
PTR_B910	 equ $391
PTR_B920	 equ $392
PTR_B930	 equ $393
PTR_B940	 equ $394
PTR_B950	 equ $395
PTR_B960	 equ $396
PTR_B970	 equ $397
PTR_B980	 equ $398
PTR_B990	 equ $399
PTR_B9A0	 equ $39A
PTR_B9B0	 equ $39B
PTR_B9C0	 equ $39C
PTR_B9D0	 equ $39D
PTR_B9E0	 equ $39E
PTR_B9F0	 equ $39F
PTR_BA00	 equ $3A0
PTR_BA10	 equ $3A1
PTR_BA20	 equ $3A2
PTR_BA30	 equ $3A3
PTR_BA40	 equ $3A4
PTR_BA50	 equ $3A5
PTR_BA60	 equ $3A6
PTR_BA70	 equ $3A7
PTR_BA80	 equ $3A8
PTR_BA90	 equ $3A9
PTR_BAA0	 equ $3AA
PTR_BAB0	 equ $3AB
PTR_BAC0	 equ $3AC
PTR_BAD0	 equ $3AD
PTR_BAE0	 equ $3AE
PTR_BAF0	 equ $3AF
PTR_BB00	 equ $3B0
PTR_BB10	 equ $3B1
PTR_BB20	 equ $3B2
PTR_BB30	 equ $3B3
PTR_BB40	 equ $3B4
PTR_BB50	 equ $3B5
PTR_BB60	 equ $3B6
PTR_BB70	 equ $3B7
PTR_BB80	 equ $3B8
PTR_BB90	 equ $3B9
PTR_BBA0	 equ $3BA
PTR_BBB0	 equ $3BB
PTR_BBC0	 equ $3BC
PTR_BBD0	 equ $3BD
PTR_BBE0	 equ $3BE
PTR_BBF0	 equ $3BF
PTR_BC00	 equ $3C0
PTR_BC10	 equ $3C1
PTR_BC20	 equ $3C2
PTR_BC30	 equ $3C3
PTR_BC40	 equ $3C4
PTR_BC50	 equ $3C5
PTR_BC60	 equ $3C6
PTR_BC70	 equ $3C7
PTR_BC80	 equ $3C8
PTR_BC90	 equ $3C9
PTR_BCA0	 equ $3CA
PTR_BCB0	 equ $3CB
PTR_BCC0	 equ $3CC
PTR_BCD0	 equ $3CD
PTR_BCE0	 equ $3CE
PTR_BCF0	 equ $3CF
PTR_BD00	 equ $3D0
PTR_BD10	 equ $3D1
PTR_BD20	 equ $3D2
PTR_BD30	 equ $3D3
PTR_BD40	 equ $3D4
PTR_BD50	 equ $3D5
PTR_BD60	 equ $3D6
PTR_BD70	 equ $3D7
PTR_BD80	 equ $3D8
PTR_BD90	 equ $3D9
PTR_BDA0	 equ $3DA
PTR_BDB0	 equ $3DB
PTR_BDC0	 equ $3DC
PTR_BDD0	 equ $3DD
PTR_BDE0	 equ $3DE
PTR_BDF0	 equ $3DF
PTR_BE00	 equ $3E0
PTR_BE10	 equ $3E1
PTR_BE20	 equ $3E2
PTR_BE30	 equ $3E3
PTR_BE40	 equ $3E4
PTR_BE50	 equ $3E5
PTR_BE60	 equ $3E6
PTR_BE70	 equ $3E7
PTR_BE80	 equ $3E8
PTR_BE90	 equ $3E9
PTR_BEA0	 equ $3EA
PTR_BEB0	 equ $3EB
PTR_BEC0	 equ $3EC
PTR_BED0	 equ $3ED
PTR_BEE0	 equ $3EE
PTR_BEF0	 equ $3EF
PTR_BF00	 equ $3F0
PTR_BF10	 equ $3F1
PTR_BF20	 equ $3F2
PTR_BF30	 equ $3F3
PTR_BF40	 equ $3F4
PTR_BF50	 equ $3F5
PTR_BF60	 equ $3F6
PTR_BF70	 equ $3F7
PTR_BF80	 equ $3F8
PTR_BF90	 equ $3F9
PTR_BFA0	 equ $3FA
PTR_BFB0	 equ $3FB
PTR_BFC0	 equ $3FC
PTR_BFD0	 equ $3FD
PTR_BFE0	 equ $3FE
PTR_BFF0	 equ $3FF
BANK_0		 equ 0
BANK_1		 equ $400
BANK_2		 equ $800
BANK_3		 equ $C00
BANK_4		 equ $1000
BANK_5		 equ $1400
BANK_6		 equ $1800
BANK_7		 equ $1C00
BANK_8		 equ $2000
BANK_9		 equ $2400
BANK_A		 equ $2800
BANK_B		 equ $2C00
BANK_C		 equ $3000
BANK_D		 equ $3400
BANK_E		 equ $3800
BANK_F		 equ $3C00

; ---------------------------------------------------------------------------

; enum ANIM_BLOCK_TYPE
ANIM_DUNGEON_TORCH_BLOCK equ 0
ANIM_PALACE_CUTTERS_BLOCK equ 1
ANIM_PALACE_CUTTERS_DBL_CLMNS_BLOCK equ 2
ANIM_PALACE_DOOR_UP_BLOCK equ 3
ANIM_PALACE_SIDE_DOOR_UP_BLOCK	equ 4
ANIM_DUNGEON_DOOR_UP_BLOCK equ 5
ANIM_DUNGEON_SIDE_DOOR_UP_BLOCK equ 6
ANIM_DUNGEON_CUTTERS_BLOCK equ 7
ANIM_DUNGEON_CUTTERS_DBL_CLMNS_BLOCK equ	8
ANIM_DUNGEON_SPIKES_BLOCK equ 9
ANIM_PALACE_SPIKES_BLOCK equ $A
ANIM_PALACE_TORCH_BLOCK equ $B
ANIM_DUNGEON_DOOR_BLOCK equ $C
ANIM_DUNGEON_SIDE_DOOR_BLOCK equ	$D
ANIM_PALACE_DOOR_BLOCK	equ $E
ANIM_PALACE_SIDE_DOOR_BLOCK equ $F

; ---------------------------------------------------------------------------

; enum APU_SV_CSR (bitfield)
APU_PULSE_1	 equ 1
APU_PULSE_2	 equ 2
APU_TRIANGLE	 equ 4
APU_NOISE	 equ 8
APU_DELTA_MOD	 equ $10
APU_UNUSED	 equ $E0

; ---------------------------------------------------------------------------

; enum APU_RCR_1 (bitfield)
APU_RCR_1_SHIFT_0 equ 0
APU_RCR_1_SHIFT_1 equ 1
APU_RCR_1_SHIFT_2 equ 2
APU_RCR_1_SHIFT_3 equ 3
APU_RCR_1_SHIFT_4 equ 4
APU_RCR_1_SHIFT_5 equ 5
APU_RCR_1_SHIFT_6 equ 6
APU_RCR_1_SHIFT_7 equ 7
APU_RCR_1_NEGATIVE equ 8
APU_RCR_1_PERIOD_0 equ 0
APU_RCR_1_PERIOD_1 equ $10
APU_RCR_1_PERIOD_2 equ $20
APU_RCR_1_PERIOD_3 equ $30
APU_RCR_1_PERIOD_4 equ $40
APU_RCR_1_PERIOD_5 equ $50
APU_RCR_1_PERIOD_6 equ $60
APU_RCR_1_PERIOD_7 equ $70
APU_RCR_1_SWEEP equ $80

; ---------------------------------------------------------------------------

; CHANNEL #1 GENERATOR
; enum APU_RCR_2 (bitfield)
APU_RCR_2_SHIFT_0 equ 0
APU_RCR_2_SHIFT_1 equ 1
APU_RCR_2_SHIFT_2 equ 2
APU_RCR_2_SHIFT_3 equ 3
APU_RCR_2_SHIFT_4 equ 4
APU_RCR_2_SHIFT_5 equ 5
APU_RCR_2_SHIFT_6 equ 6
APU_RCR_2_SHIFT_7 equ 7
APU_RCR_2_NEGATIVE equ 8
APU_RCR_2_PERIOD_0 equ 0
APU_RCR_2_PERIOD_1 equ $10
APU_RCR_2_PERIOD_2 equ $20
APU_RCR_2_PERIOD_3 equ $30
APU_RCR_2_PERIOD_4 equ $40
APU_RCR_2_PERIOD_5 equ $50
APU_RCR_2_PERIOD_6 equ $60
APU_RCR_2_PERIOD_7 equ $70
APU_RCR_2_SWEEP equ $80

; ---------------------------------------------------------------------------

; SQUARE
; enum APU_CR_1	(bitfield)
APU_CR_1_VOLUME_0 equ 0
APU_CR_1_VOLUME_1 equ 1
APU_CR_1_VOLUME_2 equ 2
APU_CR_1_VOLUME_3 equ 3
APU_CR_1_VOLUME_4 equ 4
APU_CR_1_VOLUME_5 equ 5
APU_CR_1_VOLUME_6 equ 6
APU_CR_1_VOLUME_7 equ 7
APU_CR_1_VOLUME_8 equ 8
APU_CR_1_VOLUME_9 equ 9
APU_CR_1_VOLUME_A equ $A
APU_CR_1_VOLUME_B equ $B
APU_CR_1_VOLUME_C equ $C
APU_CR_1_VOLUME_D equ $D
APU_CR_1_VOLUME_E equ $E
APU_CR_1_VOLUME_F equ $F
APU_CR_1_ENV_DISABLED equ $10
APU_CR_1_ENV_LOOP equ $20
APU_CR_1_DUTY_00 equ 0
APU_CR_1_DUTY_01 equ $40
APU_CR_1_DUTY_02 equ $80
APU_CR_1_DUTY_03 equ $C0

; ---------------------------------------------------------------------------

; CHANNEL #1 PERIOD LO
; enum APU_FTR_1 (bitfield)

; ---------------------------------------------------------------------------

; CHANNEL #1 PERIOD HI
; enum APU_CTR_1 (bitfield)
APU_CTR_1_PERIOD_HI_0 equ 0
APU_CTR_1_PERIOD_HI_100 equ 1
APU_CTR_1_PERIOD_HI_200 equ 2
APU_CTR_1_PERIOD_HI_300 equ 3
APU_CTR_1_PERIOD_HI_400 equ 4
APU_CTR_1_PERIOD_HI_500 equ 5
APU_CTR_1_PERIOD_HI_600 equ 6
APU_CTR_1_PERIOD_HI_700 equ 7
APU_CTR_1_LENGTH_00 equ 0
APU_CTR_1_LENGTH_01 equ 8
APU_CTR_1_LENGTH_02 equ $10
APU_CTR_1_LENGTH_03 equ $18
APU_CTR_1_LENGTH_04 equ $20
APU_CTR_1_LENGTH_05 equ $28
APU_CTR_1_LENGTH_06 equ $30
APU_CTR_1_LENGTH_07 equ $38
APU_CTR_1_LENGTH_08 equ $40
APU_CTR_1_LENGTH_09 equ $48
APU_CTR_1_LENGTH_0A equ $50
APU_CTR_1_LENGTH_0B equ $58
APU_CTR_1_LENGTH_0C equ $60
APU_CTR_1_LENGTH_0D equ $68
APU_CTR_1_LENGTH_0E equ $70
APU_CTR_1_LENGTH_0F equ $78
APU_CTR_1_LENGTH_10 equ $80
APU_CTR_1_LENGTH_11 equ $88
APU_CTR_1_LENGTH_12 equ $90
APU_CTR_1_LENGTH_13 equ $98
APU_CTR_1_LENGTH_14 equ $A0
APU_CTR_1_LENGTH_15 equ $A8
APU_CTR_1_LENGTH_16 equ $B0
APU_CTR_1_LENGTH_17 equ $B8
APU_CTR_1_LENGTH_18 equ $C0
APU_CTR_1_LENGTH_19 equ $C8
APU_CTR_1_LENGTH_1A equ $D0
APU_CTR_1_LENGTH_1B equ $D8
APU_CTR_1_LENGTH_1C equ $E0
APU_CTR_1_LENGTH_1D equ $E8
APU_CTR_1_LENGTH_1E equ $F0
APU_CTR_1_LENGTH_1F equ $F8