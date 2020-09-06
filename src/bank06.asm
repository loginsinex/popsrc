
.base $8000

pLevel1_Rooms:	.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbPlate, lbPlate|Modifier_01, lbPlate, lbPlate|Modifier_01, lbPlate, lbBrickWall, lbBrickWall; nRoomBlock ; ...
		.BYTE lbPlateWithTorch,	lbPlateWithTorch, lbPlate|Modifier_01, lbDoubleColumns,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbPlateWithDebris, lbDoubleColumns, lbBrokenPlate, lbPlate|Modifier_01, lbPlate, lbBrickWall;	nRoomBlock
pLevel1_Room2:	.BYTE lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlateWithTorch,	lbPlate, lbDoubleColumns, lbPlateWithTorch, lbPlate, lbDoubleColumns, lbPlate, lbPlate|Modifier_01, lbDoubleColumns, lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel1_Room3:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate, lbPlate|Modifier_01, lbPlate, lbPlateWithTorch, lbPlate|Modifier_01, lbPlateWithTorch, lbPlate, lbPlate|Modifier_01, lbPlate|Modifier_01, lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel1_Room4:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbSpace,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbDoubleColumns, lbPlateWithTorch, lbPlate|Modifier_01, lbDoubleColumns, lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall, lbBrickWall,	lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbPlate|Modifier_01, lbPlate,	lbPlateWithDebris, lbBrickWall,	lbBrickWall, lbBrickWall; nRoomBlock
pLevel1_Room5:	.BYTE lbDoubleColumns, lbPlateWithTorch, lbLowButton|Modifier_01, lbPlateWithTorch, lbHighButton|Modifier_01, lbDoor|Modifier_02, lbPlate, lbSpace|Modifier_01,	lbHighButton, lbDoor|Modifier_01; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbDoubleColumns, lbSpace, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbPlateWithTorch, lbHealthPotion|Modifier_01, lbPlate|Modifier_01, lbBrokenPlate, lbDoubleColumns, lbPlateWithDebris, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel1_Room6:	.BYTE lbPlateWithTorch,	lbPlate|Modifier_01, lbHighButton|Modifier_07, lbSpace,	lbDoubleColumns, lbPlate, lbPlate|Modifier_01, lbPlate,	lbPlate, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpikesPlate, lbSpikesPlate, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel1_Room7:	.BYTE lbSpace, lbSpace,	lbHighButton|Modifier_06, lbPlate|Modifier_01, lbDoubleColumns,	lbBrokenPlate, lbBrokenPlate, lbDoubleColumns, lbPlateWithTorch, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbPlateWithTorch,	lbPlate, lbDoubleColumns, lbPlate, lbDoubleColumns, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrokenPlate, lbDoubleColumns, lbPlate, lbPlate, lbDoubleColumns,	lbPlate, lbBrickWall; nRoomBlock
pLevel1_Room8:	.BYTE lbSpace|Modifier_01, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace|Modifier_01, lbHighButton|Modifier_05, lbPlate|Modifier_01, lbPlate, lbDoor|Modifier_02;	nRoomBlock
		.BYTE lbPlateWithTorch,	lbPlateWithTorch, lbPlate, lbBrokenPlate, lbSpace|Modifier_01, lbPlate|Modifier_07, lbDoubleColumns, lbHighButton|Modifier_02, lbPlate,	lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace|Modifier_01, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel1_Room9:	.BYTE lbHighButton|Modifier_03,	lbSpace, lbSpace|Modifier_07, lbSpace, lbSpace,	lbSpace|Modifier_02, lbSpace, lbSpace, lbSpace,	lbBrickWall; nRoomBlock
		.BYTE lbDoubleColumns, lbPlate|Modifier_01, lbPlateWithTorch, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart, lbPlateWithTorch, lbPlate, lbPlate|Modifier_01, lbPlate|Modifier_01,	lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel1_Room10:	.BYTE lbBrickWall, lbSpace|Modifier_01,	lbSpace, lbPlate, lbPlate|Modifier_01, lbDoubleColumns,	lbPlateWithDebris, lbDoubleColumns, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbSpace|Modifier_01,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbPlateWithDebris, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbSpikesPlate, lbSpikesPlate, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel1_Room11:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace|Modifier_01, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbDoubleColumns, lbPlateWithSkeleton, lbDoubleColumns, lbPlate, lbPlateWithDebris, lbPlate, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel1_Room12:	.BYTE lbPlate, lbBrokenPlate, lbBrokenPlate, lbHighButton|Modifier_02, lbSpace|Modifier_01, lbSpace, lbPlate|Modifier_01, lbDoubleColumns, lbPlate, lbDoor|Modifier_02;	nRoomBlock
		.BYTE lbDoubleColumns, lbPlate,	lbPlate, lbBrickWall, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbSpikesPlate, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel1_Room13:	.BYTE $FF
pLevel1_Room14:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbPlate|Modifier_07, lbDoubleColumns, lbHealthPotion|Modifier_01, lbPlateWithTorch, lbSpace|Modifier_01, lbSpace|Modifier_07, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbDoubleColumns, lbSpace|Modifier_01, lbSpace|Modifier_07, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpikesPlate,	lbSpikesPlate, lbDoubleColumns;	nRoomBlock
pLevel1_Room15:	.BYTE lbDoubleColumns, lbSpace,	lbSpace|Modifier_02, lbSpace, lbSpace, lbDoubleColumns,	lbPlate, lbPlate, lbPlate|Modifier_01, lbPlate;	nRoomBlock
		.BYTE lbDoubleColumns, lbSpace,	lbSpace|Modifier_01, lbSpace, lbSpace, lbDoubleColumns,	lbPlateWithTorch, lbPlateWithTorch, lbPlate, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbPlate, lbPlateWithSword, lbPlateWithSkeleton, lbPlateWithDebris, lbDoubleColumns, lbSpace,	lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel1_Room16:	.BYTE lbDoubleColumns, lbSpace,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbPlateWithDebris, lbDoubleColumns, lbSpace,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01,	lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbPlate, lbDoubleColumns, lbSpikesPlate, lbPlateWithTorch,	lbPlate|Modifier_01, lbBrokenPlate, lbPlate; nRoomBlock
pLevel1_Room17:	.BYTE lbBrickWall, lbSpace|Modifier_01,	lbSpace, lbSpace, lbPlate, lbPlate, lbPlate, lbPlate|Modifier_01, lbPlate, lbDoubleColumns; nRoomBlock
		.BYTE lbDoubleColumns, lbPlateWithTorch, lbPlateWithTorch, lbPlate, lbDoubleColumns, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbDoubleColumns, lbHealthPotion|Modifier_01, lbDoubleColumns, lbPlateWithDebris, lbPlateWithDebris, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel1_Room18:	.BYTE $FF
pLevel1_Room19:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbSpace,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbDoubleColumns, lbPlateWithTorch, lbPlateWithTorch, lbPlate|Modifier_01,	lbDoubleColumns, lbSpikesPlate,	lbDoubleColumns, lbPlateWithTorch, lbPlate, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel1_Room20:	.BYTE lbSpace|Modifier_07, lbSpace|Modifier_01,	lbSpace|Modifier_07, lbSpace, lbSpace|Modifier_07, lbSpace, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace|Modifier_07;	nRoomBlock
		.BYTE lbPlateWithTorch,	lbPlate|Modifier_01, lbPlateWithTorch, lbPlate,	lbLowButton|Modifier_01, lbBrokenPlate,	lbPlate|Modifier_07, lbHighButton, lbPlate|Modifier_01,	lbPlate|Modifier_01; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbSpace,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel1_Room21:	.BYTE lbPlate, lbPlate|Modifier_01, lbPlate, lbPlateWithTorch, lbPlate|Modifier_01, lbPlateWithTorch, lbPlate|Modifier_01, lbPlate, lbPlate|Modifier_01, lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel1_Room22:	.BYTE lbBrickWall, lbSpace|Modifier_07,	lbSpace, lbSpace, lbSpace|Modifier_07, lbDoubleColumns,	lbHealthPotion|Modifier_01, lbPlateWithTorch, lbPlate|Modifier_01, lbPlate; nRoomBlock
		.BYTE lbDoubleColumns, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbDoubleColumns, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel1_Room23:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbSpace|Modifier_01, lbSpace,	lbDoubleColumns, lbPlateWithTorch, lbPlate|Modifier_01,	lbDoubleColumns; nRoomBlock
		.BYTE lbDoubleColumns, lbPlateWithTorch, lbPlate|Modifier_01, lbDoubleColumns, lbPlateWithDebris, lbPlateWithDebris, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel1_Room24:	.BYTE $FF
pLevel1_Geom:	ROOM_NEIGHBORS 5, 0, 0, 2 ; ...
		ROOM_NEIGHBORS 6, 3, 1, 0
		ROOM_NEIGHBORS 2, 9, 0, 0
		ROOM_NEIGHBORS 19, 14,	20, 0
		ROOM_NEIGHBORS 21, 1, 0, 6
		ROOM_NEIGHBORS 8, 2, 5, 0
		ROOM_NEIGHBORS 20, 8, 17, 14
		ROOM_NEIGHBORS 7, 6, 21, 11
		ROOM_NEIGHBORS 3, 0, 0, 0
		ROOM_NEIGHBORS 0, 19, 15, 0
		ROOM_NEIGHBORS 14, 0, 8, 0
		ROOM_NEIGHBORS 15, 20,	16, 19
		ROOM_NEIGHBORS 22, 16,	0, 18
		ROOM_NEIGHBORS 4, 11, 7, 0
		ROOM_NEIGHBORS 0, 12, 22, 10
		ROOM_NEIGHBORS 22, 23,	0, 12
		ROOM_NEIGHBORS 23, 21,	0, 7
		ROOM_NEIGHBORS 15, 12,	13, 19
		ROOM_NEIGHBORS 10, 4, 12, 0
		ROOM_NEIGHBORS 12, 7, 23, 4
		ROOM_NEIGHBORS 17, 5, 0, 8
		ROOM_NEIGHBORS 0, 16, 0, 15
		ROOM_NEIGHBORS 16, 17,	0, 20
		ROOM_NEIGHBORS 9, 0, 0, 0
pLevel1_Header:	LEVEL_HEADER 1, X_0_Y_0, DIRECTION_RIGHT ; ...
pLevel1_Guards:	.BYTE NO_PLACE|RESIDUAL_BIT, NO_PLACE, X_7_Y_1,	NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE; nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT; nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT,	X_6_Y_0|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT; nGuardPlace
pLevel1_DoorLinks:DOOR_LINK 5,	X_2_Y_0, ACTION_CLOSE_DOOR, 5, X_9_Y_0
		DOOR_LINK 5, X_4_Y_0, ACTION_OPEN_DOOR, 5, X_9_Y_0
		DOOR_LINK 5, X_4_Y_0, ACTION_OPEN_DOOR, 5, X_5_Y_0
		DOOR_LINK 5, X_8_Y_0, ACTION_OPEN_DOOR, 5, X_9_Y_0
		DOOR_LINK 6, X_2_Y_0, ACTION_OPEN_DOOR, 8, X_9_Y_0
		DOOR_LINK 7, X_2_Y_0, ACTION_OPEN_DOOR, 7, X_9_Y_0
		DOOR_LINK 8, X_6_Y_0, ACTION_OPEN_DOOR, 8, X_9_Y_0
		DOOR_LINK 8, X_7_Y_1, ACTION_OPEN_DOOR, 7, X_9_Y_0
		DOOR_LINK 9, X_0_Y_0, ACTION_OPEN_DOOR, 9, X_3_Y_1
		DOOR_LINK 12, X_3_Y_0,	ACTION_OPEN_DOOR, 12, X_9_Y_0
		DOOR_LINK 20, X_4_Y_1,	ACTION_CLOSE_DOOR, 12, X_9_Y_0
		DOOR_LINK 20, X_7_Y_1,	ACTION_OPEN_DOOR, 12, X_9_Y_0
		.BYTE $FF
pLevel2_Rooms:	.BYTE lbBrickWall, lbDoubleColumns, lbSpace|Modifier_01, lbSpace, lbSpace, lbDoubleColumns, lbPlate|Modifier_01, lbPlate, lbPlate, lbPlate|Modifier_01;	nRoomBlock ; ...
		.BYTE lbBrickWall, lbBrickWall,	lbSpace, lbSpace, lbPlate|Modifier_01, lbDoubleColumns,	lbPlateWithTorch, lbPlate|Modifier_01, lbPlateWithTorch, lbPlate|Modifier_01; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbPlateWithDebris, lbPlateWithDebris, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel2_Room2:	.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall, lbPlate, lbDoubleColumns, lbPlate|Modifier_01, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbPlateWithDebris, lbPlateWithDebris, lbSpikesPlate, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel2_Room3:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbDoubleColumns, lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbPlate|Modifier_01,	lbBrokenPlate, lbPlate|Modifier_01, lbDoubleColumns, lbHealthPotion|Modifier_01, lbPlate, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel2_Room4:	.BYTE lbBrickWall, lbSpace, lbSpace, lbSpace, lbSpace|Modifier_01, lbSpace, lbSpace, lbSpace, lbSpace|Modifier_07, lbSpace|Modifier_07;	nRoomBlock
		.BYTE lbPlate, lbPlate,	lbPlate, lbPlateWithTorch, lbPlate|Modifier_01,	lbPlateWithTorch, lbPlate|Modifier_01, lbBrokenPlate, lbBrokenPlate, lbPlate|Modifier_01; nRoomBlock
		.BYTE lbBrickWall, lbSpace|Modifier_01,	lbPlate, lbPlate, lbPlate|Modifier_01, lbPlate,	lbDoubleColumns, lbPlate, lbPlate, lbBrickWall;	nRoomBlock
pLevel2_Room5:	.BYTE lbBigColumnHighPart, lbSpace|Modifier_07,	lbSpace|Modifier_01, lbSpace, lbSpace, lbSpace,	lbBigColumnHighPart, lbSpace, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbBigColumnLowPart, lbPlateWithTorch, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart, lbPlateWithTorch, lbPlate, lbBigColumnLowPart,	lbSpace, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbPlateWithDebris, lbPlateWithDebris, lbBrickWall; nRoomBlock
pLevel2_Room6:	.BYTE lbPlate, lbDoubleColumns,	lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate|Modifier_01, lbDoubleColumns, lbPlate, lbSpikesPlate, lbDoubleColumns, lbBrokenPlate, lbPlate|Modifier_01, lbPlateWithTorch, lbPlate|Modifier_01,	lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbPlate,	lbDoubleColumns, lbHealthPotion|Modifier_01, lbPlate, lbBrickWall; nRoomBlock
pLevel2_Room7:	.BYTE lbBrickWall, lbSpace, lbSpace, lbSpace|Modifier_01, lbSpace, lbSpace, lbSpace, lbSpace, lbPlate, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbPlate, lbPlate,	lbPlate, lbPlate|Modifier_01, lbPlate, lbPlate,	lbPlate, lbSpace|Modifier_01, lbBrickWall, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpikesPlate,	lbPlate, lbDoubleColumns; nRoomBlock
pLevel2_Room8:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate, lbDoubleColumns,	lbHealthPotion|Modifier_01, lbPlateWithDebris, lbPlateWithDebris, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel2_Room9:	.BYTE lbBrickWall, lbSpace, lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbHighButton|Modifier_03, lbSpace|Modifier_01, lbSpace, lbSpace, lbDoubleColumns, lbPlateWithTorch, lbPlate|Modifier_01, lbPlate|Modifier_01, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_01, lbSpace, lbSpace, lbDoubleColumns,	lbBrokenPlate, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01; nRoomBlock
pLevel2_Room10:	.BYTE lbBrickWall, lbSpace|Modifier_01,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbSpace|Modifier_01,	lbSpace, lbDoubleColumns, lbPlate|Modifier_01, lbPlate,	lbDoubleColumns, lbSpace|Modifier_01, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbSpikesPlate, lbPlate, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbPlateWithDebris, lbPlateWithDebris, lbBrickWall; nRoomBlock
pLevel2_Room11:	.BYTE lbSpace, lbSpace,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate|Modifier_01, lbPlate, lbDoubleColumns, lbHighButton|Modifier_01, lbPlate,	lbPlate|Modifier_01, lbPlate, lbPlate, lbPlate,	lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel2_Room12:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbPlate, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbPlateWithTorch, lbHealthPotion|Modifier_01, lbDoubleColumns, lbBrokenPlate, lbPlate; nRoomBlock
pLevel2_Room13:	.BYTE lbPlate, lbDoubleColumns,	lbSpace|Modifier_01, lbSpace, lbSpace, lbCastleOverDoor, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbPlate|Modifier_01, lbHealthPotion|Modifier_05, lbLowButton, lbDoor|Modifier_01, lbPlate, lbPlate, lbDoubleColumns, lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel2_Room14:	.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_01, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbPlateWithDebris, lbPlateWithDebris, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel2_Room15:	.BYTE lbSpace, lbSpace,	lbSpace, lbSpace, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace, lbDoubleColumns, lbPlate, lbPlate;	nRoomBlock
		.BYTE lbPlate|Modifier_01, lbPlateWithTorch, lbPlateWithTorch, lbPlate,	lbPlate, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel2_Room16:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbPlate|Modifier_01, lbPlate, lbDoubleColumns, lbSpace, lbSpace|Modifier_01, lbSpace, lbSpace; nRoomBlock
		.BYTE lbPlateWithTorch,	lbPlate, lbDoubleColumns, lbPlate|Modifier_01, lbPlate,	lbDoubleColumns, lbPlateWithTorch, lbPlate|Modifier_01,	lbPlateWithTorch, lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel2_Room17:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbPlateWithDebris, lbPlateWithDebris, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel2_Room18:	.BYTE lbDoubleColumns, lbPlate|Modifier_01, lbLowButton|Modifier_02, lbPlateWithTorch, lbBrokenPlate, lbPlateWithTorch,	lbPlate|Modifier_01, lbHighButton, lbPlate, lbDoor|Modifier_02;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbDoubleColumns, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbDoubleColumns, lbPlate|Modifier_01, lbPlate, lbDoubleColumns, lbPlate, lbDoubleColumns,	lbHealthPotion|Modifier_01, lbPlate, lbBrickWall, lbBrickWall; nRoomBlock
pLevel2_Room19:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbDoubleColumns, lbPlate,	lbPlate|Modifier_01, lbPlateWithTorch, lbSpikesPlate, lbPlateWithTorch,	lbPlate|Modifier_01, lbPlate, lbPlate, lbDoubleColumns;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel2_Room20:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbPlateWithTorch, lbHealthPotion|Modifier_02, lbPlate|Modifier_01, lbPlate, lbPlate,	lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace|Modifier_01, lbSpace, lbDoubleColumns, lbSpikesPlate, lbSpikesPlate, lbPlateWithDebris, lbDoubleColumns; nRoomBlock
pLevel2_Room21:	.BYTE lbPlate, lbDoubleColumns,	lbSpace|Modifier_01, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbDoubleColumns, lbSpace|Modifier_01, lbSpace|Modifier_07, lbDoubleColumns, lbPlateWithTorch, lbPlate|Modifier_01, lbPlateWithTorch,	lbPlate|Modifier_07, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace, lbSpace|Modifier_07, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel2_Room22:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate, lbDoubleColumns,	lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbPlate|Modifier_01, lbPlate;	nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbDoubleColumns,	lbSpace|Modifier_01, lbSpace, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01,	lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel2_Room23:	.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_01, lbSpace, lbSpace, lbSpace,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate|Modifier_01, lbDoubleColumns, lbPlateWithTorch, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart, lbPlateWithTorch, lbPlate, lbDoubleColumns, lbPlate,	lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbDoubleColumns, lbSpace|Modifier_01, lbSpace, lbDoubleColumns, lbPlate|Modifier_01,	lbPlate, lbDoubleColumns, lbPlate|Modifier_01, lbPlate;	nRoomBlock
pLevel2_Room24:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpace, lbSpace|Modifier_01, lbSpace|Modifier_01, lbBrickWall; nRoomBlock
		.BYTE lbPlate, lbPlate|Modifier_01, lbPlateWithTorch, lbPlateWithTorch,	lbPlate, lbPlate, lbSpace, lbSpace|Modifier_01,	lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbPlate, lbPlate,	lbPlate|Modifier_01, lbPlate, lbPlate, lbDoubleColumns,	lbPlateWithDebris, lbPlateWithDebris, lbPlateWithDebris, lbBrickWall; nRoomBlock
pLevel2_Geom:	ROOM_NEIGHBORS 0, 6, 22, 0 ; ...
		ROOM_NEIGHBORS 0, 21, 9, 0
		ROOM_NEIGHBORS 22, 0, 0, 6
		ROOM_NEIGHBORS 6, 5, 0, 10
		ROOM_NEIGHBORS 4, 0, 0, 0
		ROOM_NEIGHBORS 1, 4, 3, 0
		ROOM_NEIGHBORS 13, 18,	0, 0
		ROOM_NEIGHBORS 12, 0, 0, 13
		ROOM_NEIGHBORS 0, 23, 0, 2
		ROOM_NEIGHBORS 0, 0, 4, 0
		ROOM_NEIGHBORS 18, 22,	0, 0
		ROOM_NEIGHBORS 20, 8, 0, 15
		ROOM_NEIGHBORS 15, 7, 8, 0
		ROOM_NEIGHBORS 0, 0, 21, 0
		ROOM_NEIGHBORS 16, 13,	12, 17
		ROOM_NEIGHBORS 19, 15,	20, 0
		ROOM_NEIGHBORS 0, 0, 15, 0
		ROOM_NEIGHBORS 7, 11, 0, 0
		ROOM_NEIGHBORS 21, 16,	24, 0
		ROOM_NEIGHBORS 24, 12,	0, 16
		ROOM_NEIGHBORS 2, 19, 23, 14
		ROOM_NEIGHBORS 11, 3, 0, 1
		ROOM_NEIGHBORS 9, 24, 0, 21
		ROOM_NEIGHBORS 23, 20,	0, 19
pLevel2_Header:	LEVEL_HEADER 5, X_3_Y_1, DIRECTION_LEFT ; ...
pLevel2_Guards:	.BYTE NO_PLACE,	NO_PLACE|RESIDUAL_BIT, NO_PLACE, X_0_Y_1, NO_PLACE, NO_PLACE|RESIDUAL_BIT, X_0_Y_1|RESIDUAL_BIT, NO_PLACE; nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE, X_5_Y_1, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE, X_0_Y_1|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT; nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT,	X_2_Y_1|RESIDUAL_BIT; nGuardPlace
pLevel2_DoorLinks:DOOR_LINK 9,	X_1_Y_1, ACTION_OPEN_DOOR, 23, X_3_Y_1
		DOOR_LINK 11, X_3_Y_1,	ACTION_OPEN_DOOR, 18, X_9_Y_0
		DOOR_LINK 13, X_4_Y_1,	ACTION_CLOSE_DOOR, 13, X_5_Y_1
		DOOR_LINK 18, X_2_Y_0,	ACTION_CLOSE_DOOR, 7, X_9_Y_0
		DOOR_LINK 18, X_7_Y_0,	ACTION_OPEN_DOOR, 7, X_9_Y_0
		DOOR_LINK 18, X_7_Y_0,	ACTION_OPEN_DOOR, 18, X_9_Y_0
		.BYTE $FF
pLevel3_Rooms:	.BYTE lbPlate|Modifier_01, lbHighButton|Modifier_01, lbPlate, lbPlateWithTorch,	lbPlate, lbPlateWithTorch, lbPlate, lbPlate, lbBrokenPlate, lbPlate; nRoomBlock	; ...
		.BYTE lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbDoubleColumns, lbSpace|Modifier_01, lbSpace|Modifier_01;	nRoomBlock
		.BYTE lbSpace, lbBrickWall|Modifier_01,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01,	lbBrickWall, lbDoubleColumns, lbSpace|Modifier_01, lbSpace|Modifier_01;	nRoomBlock
pLevel3_Room2:	.BYTE lbPlate, lbDoubleColumns,	lbPlateWithTorch, lbPlate, lbPlate|Modifier_01,	lbPlate, lbPlateWithTorch, lbHealthPotion|Modifier_01, lbPlate,	lbDoor|Modifier_02; nRoomBlock
		.BYTE lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbSpace, lbBrickWall, lbBrickWall, lbDoubleColumns, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01; nRoomBlock
pLevel3_Room3:	.BYTE lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall, lbSpace|Modifier_01, lbSpace|Modifier_01; nRoomBlock
		.BYTE lbSpace, lbDoubleColumns,	lbBrokenPlate, lbPlateWithTorch, lbPlateWithTorch, lbPlate|Modifier_01,	lbPlate, lbDoubleColumns, lbPlate, lbPlateWithDebris; nRoomBlock
		.BYTE lbPlateWithDebris, lbBrickWall|Modifier_01, lbSpace, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel3_Room4:	.BYTE lbSpace|Modifier_07, lbBrickWall,	lbSpace, lbDoubleColumns, lbPlate, lbPlate, lbPlate, lbDoubleColumns, lbPlate|Modifier_07, lbPlate|Modifier_07;	nRoomBlock
		.BYTE lbPlate|Modifier_07, lbDoubleColumns, lbPlate, lbDoubleColumns, lbSpace|Modifier_01, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace, lbDoubleColumns, lbPlateWithDebris, lbPlateWithDebris,	lbPlateWithDebris, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall; nRoomBlock
pLevel3_Room5:	.BYTE lbSpace|Modifier_01, lbHighButton|Modifier_02, lbPlate|Modifier_01, lbPlate, lbCutters, lbPlate|Modifier_01, lbPlateWithTorch, lbPlateWithTorch, lbPlate|Modifier_01, lbDoor|Modifier_02;	nRoomBlock
		.BYTE lbPlate, lbDoubleColumns,	lbSpace, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01;	nRoomBlock
		.BYTE lbSpace, lbDoubleColumns,	lbPlateWithDebris, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01,	lbBrickWall|Modifier_01, lbBrickWall; nRoomBlock
pLevel3_Room6:	.BYTE lbPlateWithDebris, lbDoubleColumns, lbPlateWithTorch, lbPlate, lbPlate|Modifier_01, lbPlateWithTorch, lbPlate, lbDoubleColumns, lbHighButton|Modifier_03,	lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbPlateWithTorch, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart, lbPlateWithTorch, lbPlate, lbDoubleColumns, lbPlate, lbDoubleColumns; nRoomBlock
pLevel3_Room7:	.BYTE lbSpace, lbSpace|Modifier_01, lbSpace|Modifier_07, lbBrokenPlate,	lbPlate|Modifier_01, lbPlate|Modifier_01, lbPlateWithTorch, lbPlate|Modifier_01, lbPlateWithTorch, lbPlate|Modifier_01;	nRoomBlock
		.BYTE lbSpace|Modifier_07, lbSpace|Modifier_01,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall, lbBrickWall|Modifier_01,	lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbSpikesPlate, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01; nRoomBlock
pLevel3_Room8:	.BYTE lbBrickWall|Modifier_01, lbSpace,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbPlate, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel3_Room9:	.BYTE lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall|Modifier_01, lbSpace, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbDoubleColumns, lbPlate,	lbDoubleColumns, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart, lbPlateWithDebris, lbDoubleColumns, lbPlateWithTorch, lbPlate|Modifier_01, lbDoubleColumns; nRoomBlock
pLevel3_Room10:	.BYTE lbPlateWithTorch,	lbPlateWithTorch, lbPlate|Modifier_07, lbSpace,	lbSpace, lbSpace|Modifier_01, lbPlate|Modifier_01, lbPlate, lbPlate|Modifier_01, lbPlate|Modifier_01; nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall|Modifier_01, lbSpace, lbSpace, lbSpace,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01;	nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall|Modifier_01, lbSpace, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01; nRoomBlock
pLevel3_Room11:	.BYTE lbPlate, lbPlateWithTorch, lbPlateWithTorch, lbPlate, lbPlate|Modifier_01, lbPlateWithTorch, lbPlate, lbSpace, lbSpace|Modifier_01, lbPlate; nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall|Modifier_01,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbDoubleColumns, lbSpace, lbSpace|Modifier_01, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbDoubleColumns,	lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall,	lbDoubleColumns, lbSpace, lbSpace|Modifier_01, lbBrickWall; nRoomBlock
pLevel3_Room12:	.BYTE lbBrickWall, lbDoubleColumns, lbSpace|Modifier_01, lbSpace, lbDoubleColumns, lbPlate, lbDoubleColumns, lbSpace, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbDoubleColumns, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbDoubleColumns, lbSpace, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbPlate, lbDoubleColumns,	lbPlateWithDebris, lbPlateWithDebris, lbBrickWall, lbBrickWall,	lbBrickWall, lbPlateWithDebris,	lbPlateWithDebris, lbDoubleColumns; nRoomBlock
pLevel3_Room13:	.BYTE lbBrickWall|Modifier_01, lbBrickWall|Modifier_01,	lbBrickWall|Modifier_01, lbSpace|Modifier_01, lbSpace, lbBrickWall|Modifier_01,	lbSpace|Modifier_01, lbSpace, lbBrickWall|Modifier_01, lbSpace;	nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall|Modifier_01,	lbBrickWall|Modifier_01, lbSpace|Modifier_01, lbSpace, lbBrickWall|Modifier_01,	lbSpace, lbSpace, lbBrickWall|Modifier_01, lbSpace; nRoomBlock
		.BYTE lbDoubleColumns, lbPlate|Modifier_01, lbDoubleColumns, lbPlateWithTorch, lbPlateWithDebris, lbDoubleColumns, lbPlateWithTorch, lbPlateWithDebris,	lbDoubleColumns, lbPlateWithDebris; nRoomBlock
pLevel3_Room14:	.BYTE lbPlate|Modifier_07, lbPlate|Modifier_07,	lbPlate, lbSpace|Modifier_01, lbSpace, lbPlate,	lbSpace|Modifier_01, lbSpace, lbHighButton, lbSpace; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall, lbSpace, lbSpace, lbBrickWall,	lbSpace|Modifier_01, lbSpace, lbBrickWall, lbSpace; nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall|Modifier_01,	lbBrickWall, lbSpace|Modifier_01, lbSpace, lbBrickWall,	lbSpace|Modifier_01, lbSpace, lbBrickWall|Modifier_01, lbSpace;	nRoomBlock
pLevel3_Room15:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrokenPlate, lbDoubleColumns, lbPlate|Modifier_01, lbPlateWithTorch, lbPlate|Modifier_01, lbPlate; nRoomBlock
pLevel3_Room16:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbPlateWithTorch, lbPlateWithTorch, lbHealthPotion|Modifier_02, lbPlate|Modifier_01, lbSpace, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbDoubleColumns, lbSpace|Modifier_01, lbSpace, lbBrickWall;	nRoomBlock
		.BYTE lbDoubleColumns, lbPlate,	lbDoubleColumns, lbCutters, lbCutters, lbPlate,	lbDoubleColumns, lbPlate, lbPlate, lbBrickWall;	nRoomBlock
pLevel3_Room17:	.BYTE lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbSpace, lbBrickWall, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall;	nRoomBlock
		.BYTE lbPlateWithDebris, lbDoubleColumns, lbPlate, lbHealthPotion|Modifier_01, lbPlateWithDebris, lbBrickWall, lbPlateWithDebris, lbPlateWithSkeleton, lbPlateWithDebris, lbBrickWall; nRoomBlock
pLevel3_Room18:	.BYTE lbSpace|Modifier_01, lbPlateWithTorch, lbPlateWithTorch, lbPlate,	lbPlate, lbDoubleColumns, lbSpace|Modifier_01, lbSpace,	lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall; nRoomBlock
pLevel3_Room19:	.BYTE lbBrickWall|Modifier_01, lbBrickWall|Modifier_01,	lbSpace, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall|Modifier_01,	lbSpikesPlate, lbBrickWall|Modifier_01,	lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall|Modifier_01,	lbBrickWall|Modifier_01, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall|Modifier_01,	lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01;	nRoomBlock
pLevel3_Room20:	.BYTE lbBrickWall|Modifier_01, lbBrickWall, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01;	nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01;	nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01,	lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01; nRoomBlock
pLevel3_Room21:	.BYTE lbBrickWall, lbBrickWall,	lbSpace, lbDoubleColumns, lbHealthPotion|Modifier_01, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall; nRoomBlock
pLevel3_Room22:	.BYTE lbDoubleColumns, lbSpace,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall, lbBrickWall|Modifier_01,	lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbDoubleColumns, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01;	nRoomBlock
		.BYTE lbBrickWall, lbPlateWithDebris, lbPlateWithDebris, lbPlateWithDebris, lbPlate, lbDoubleColumns, lbCutters, lbPlateWithTorch, lbPlate|Modifier_01,	lbDoubleColumns; nRoomBlock
pLevel3_Room23:	.BYTE $FF
pLevel3_Room24:	.BYTE $FF
pLevel3_Geom:	ROOM_NEIGHBORS 5, 2, 0, 3 ; ...
		ROOM_NEIGHBORS 1, 7, 0, 4
		ROOM_NEIGHBORS 6, 4, 1, 20
		ROOM_NEIGHBORS 3, 22, 2, 21
		ROOM_NEIGHBORS 0, 1, 0, 6
		ROOM_NEIGHBORS 0, 3, 5, 0
		ROOM_NEIGHBORS 2, 10, 0, 22
		ROOM_NEIGHBORS 0, 19, 20, 0
		ROOM_NEIGHBORS 22, 12,	10, 0
		ROOM_NEIGHBORS 7, 11, 0, 9
		ROOM_NEIGHBORS 10, 14,	0, 12
		ROOM_NEIGHBORS 9, 13, 11, 0
		ROOM_NEIGHBORS 12, 17,	14, 0
		ROOM_NEIGHBORS 11, 18,	0, 13
		ROOM_NEIGHBORS 0, 16, 0, 18
		ROOM_NEIGHBORS 15, 0, 0, 0
		ROOM_NEIGHBORS 13, 0, 18, 0
		ROOM_NEIGHBORS 14, 0, 15, 17
		ROOM_NEIGHBORS 8, 0, 21, 0
		ROOM_NEIGHBORS 0, 21, 3, 8
		ROOM_NEIGHBORS 20, 0, 4, 19
		ROOM_NEIGHBORS 4, 9, 7, 0
		ROOM_NEIGHBORS 4, 22, 24, 0
		ROOM_NEIGHBORS 2, 7, 16, 23
pLevel3_Header:	LEVEL_HEADER 9, X_4_Y_2, DIRECTION_RIGHT ; ...
pLevel3_Guards:	.BYTE X_3_Y_0, NO_PLACE, NO_PLACE, NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE,	NO_PLACE; nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT; nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT,	NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT; nGuardPlace
pLevel3_DoorLinks:DOOR_LINK 1,	X_1_Y_0, ACTION_OPEN_DOOR, 5, X_9_Y_0
		DOOR_LINK 5, X_1_Y_0, ACTION_OPEN_DOOR, 5, X_9_Y_0
		DOOR_LINK 6, X_8_Y_0, ACTION_OPEN_DOOR, 6, X_3_Y_2
		DOOR_LINK 14, X_8_Y_0,	ACTION_OPEN_DOOR, 2, X_9_Y_0
		.BYTE $FF
pLevel4_Rooms:	.BYTE lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbCastleOverDoor; nRoomBlock ; ...
		.BYTE lbPlate, lbPlate,	lbPlate|Modifier_02, lbPlate, lbPlateWithTorch,	lbExitDoorLeftPart|Modifier_02,	lbExitDoorRightPart, lbPlateWithTorch, lbHighButton|Modifier_01, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel4_Room2:	.BYTE lbSpace|Modifier_07, lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart, lbCastleLeftPartBigArch, lbCastleRightPartBigArch, lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart, lbCastleSmallArch; nRoomBlock
		.BYTE lbPlate, lbCastleOneColumn, lbHighButton,	lbCastleOneColumn, lbPlateWithTorch, lbPlate, lbCastleOneColumn, lbPlate|Modifier_07, lbCastleOneColumn, lbPlate|Modifier_07; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel4_Room3:	.BYTE lbPlate|Modifier_07, lbPlate|Modifier_07,	lbHighButton|Modifier_07, lbDoubleColumns, lbSpace|Modifier_01,	lbSpace|Modifier_01, lbPlate, lbPlate, lbPlate,	lbPlate|Modifier_07; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbPlateWithDebris, lbPlateWithDebris,	lbDoubleColumns, lbHealthPotion|Modifier_01, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel4_Room4:	.BYTE lbSpace, lbSpace,	lbSpace, lbSpace, lbLevel4MirrorPlate|Modifier_05, lbPlate|Modifier_05,	lbPlate|Modifier_05, lbPlate|Modifier_05, lbPlate|Modifier_05, lbPlate|Modifier_05; nRoomBlock
		.BYTE lbPlateWithTorch,	lbPlate|Modifier_02, lbPlate, lbPlate, lbBrickWall, lbPlate, lbDoubleColumns, lbHighButton|Modifier_06,	lbPlate, lbPlate|Modifier_07; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel4_Room5:	.BYTE lbCastleArchColumnPart, lbCastleLeftPartBigArch, lbCastleRightPartBigArch, lbCastleArchColumnPart, lbCastleLeftPartBigArch, lbCastleRightPartBigArch, lbCastleArchColumnPart, lbCastleLeftPartBigArch, lbCastleRightPartBigArch, lbCastleArchColumnPart; nRoomBlock
		.BYTE lbCastleOneColumn, lbPlateWithTorch, lbPlate|Modifier_07,	lbCastleOneColumn, lbSpace|Modifier_02,	lbSpace|Modifier_01, lbCastleOneColumn,	lbPlateWithTorch, lbPlate|Modifier_07, lbCastleOneColumn; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbDoubleColumns, lbSpace|Modifier_01, lbSpace|Modifier_01,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel4_Room6:	.BYTE lbCastleSmallArch, lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart, lbCastleLeftPartBigArch,	lbCastleRightPartBigArch, lbCastleArchColumnPart, lbCastleOverDoor|Modifier_02;	nRoomBlock
		.BYTE lbPlate|Modifier_07, lbCastleOneColumn, lbPlate|Modifier_07, lbCastleOneColumn, lbPlate, lbCastleOneColumn, lbPlate, lbSpikesPlate, lbPlate, lbDoor|Modifier_01; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel4_Room7:	.BYTE lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbCastleOverDoor|Modifier_02; nRoomBlock
		.BYTE lbPlateWithTorch,	lbPlate|Modifier_07, lbPlate|Modifier_02, lbPlate, lbPlateWithTorch, lbBrokenPlate, lbPlate|Modifier_02, lbPlate|Modifier_07, lbPlateWithTorch,	lbDoor|Modifier_01; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbPlate,	lbDoubleColumns, lbHealthPotion|Modifier_01, lbBrickWall, lbBrickWall; nRoomBlock
pLevel4_Room8:	.BYTE lbPlate|Modifier_01, lbPlate|Modifier_01,	lbPlate|Modifier_01, lbPlate|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_03, lbSpace|Modifier_01, lbSpace|Modifier_03, lbSpace|Modifier_01, lbCastleOverDoor|Modifier_02; nRoomBlock
		.BYTE lbSpace|Modifier_01, lbSpace|Modifier_02,	lbSpace|Modifier_01, lbDoubleColumns, lbPlateWithTorch,	lbPlate, lbPlate|Modifier_02, lbHighButton|Modifier_05,	lbPlateWithTorch, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbPlate, lbHighButton, lbPlate|Modifier_02, lbDoubleColumns, lbSpace|Modifier_01,	lbSpace|Modifier_01, lbCastleOverDoor|Modifier_02, lbBrickWall,	lbBrickWall, lbBrickWall; nRoomBlock
pLevel4_Room9:	.BYTE lbSpace, lbSpace,	lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbCastleOverDoor|Modifier_02; nRoomBlock
		.BYTE lbPlate, lbBrokenPlate, lbPlateWithTorch,	lbLowButton|Modifier_02, lbPlate|Modifier_02, lbPlateWithTorch,	lbPlate, lbHighButton, lbPlate,	lbDoor|Modifier_02; nRoomBlock
		.BYTE lbSpace|Modifier_01, lbSpace|Modifier_01,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel4_Room10:	.BYTE lbPlate, lbPlate,	lbPlate, lbDoubleColumns, lbPlate|Modifier_02, lbPlate,	lbDoor|Modifier_02, lbPlate, lbPlate, lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel4_Room11:	.BYTE lbPlate|Modifier_05, lbPlate|Modifier_05,	lbPlate|Modifier_05, lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace, lbBrickWall;	nRoomBlock
		.BYTE lbPlateWithTorch,	lbCutters, lbDoubleColumns, lbPlate, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbDoubleColumns, lbSpace|Modifier_01, lbSpace|Modifier_01,	lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace, lbBrickWall;	nRoomBlock
pLevel4_Room12:	.BYTE lbPlate, lbPlate,	lbPlate|Modifier_07, lbCutters,	lbDoubleColumns, lbSpace|Modifier_01, lbPlate, lbHighButton|Modifier_07, lbDoubleColumns, lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbPlate,	lbDoubleColumns, lbHealthPotion|Modifier_01, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel4_Room13:	.BYTE lbDoubleColumns, lbPlateWithTorch, lbPlate, lbDoubleColumns, lbPlate, lbSpace|Modifier_01, lbSpace|Modifier_02, lbSpace|Modifier_01, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbSpace, lbSpace, lbSpace, lbSpace, lbBrickWall; nRoomBlock
pLevel4_Room14:	.BYTE lbPlate|Modifier_02, lbDoubleColumns, lbPlate, lbPlateWithTorch, lbPlate|Modifier_02, lbPlateWithTorch, lbHighButton, lbDoubleColumns, lbPlate|Modifier_02, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel4_Room15:	.BYTE lbBrickWall, lbPlateWithDebris, lbDoubleColumns, lbSpace|Modifier_01, lbSpace|Modifier_01, lbPlateWithTorch, lbPlateWithTorch, lbPlate, lbDoubleColumns, lbPlate;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpikesPlate, lbSpikesPlate, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel4_Room16:	.BYTE lbSpace|Modifier_01, lbSpace|Modifier_01,	lbSpace|Modifier_03, lbSpace|Modifier_01, lbSpace|Modifier_03, lbSpace|Modifier_01, lbSpace|Modifier_03, lbSpace|Modifier_01, lbSpace|Modifier_01, lbCastleOverDoor|Modifier_02; nRoomBlock
		.BYTE lbPlate, lbBrokenPlate, lbPlate, lbPlateWithTorch, lbPlate|Modifier_02, lbPlateWithTorch,	lbPlate, lbPlate, lbPlate, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbSpace|Modifier_01,	lbDoubleColumns, lbPlate, lbPlate|Modifier_02, lbPlate,	lbPlate, lbDoubleColumns, lbSpace|Modifier_01, lbBrickWall; nRoomBlock
pLevel4_Room17:	.BYTE lbBrickWall, lbHighButton|Modifier_04, lbDoubleColumns, lbSpace|Modifier_01, lbSpace|Modifier_02,	lbSpace|Modifier_01, lbSpace|Modifier_01, lbDoubleColumns, lbPlate|Modifier_07,	lbDoubleColumns|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbSpace, lbSpace|Modifier_03, lbSpace,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace|Modifier_01, lbSpace|Modifier_02, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel4_Room18:	.BYTE lbPlate|Modifier_01, lbPlate|Modifier_01,	lbPlate|Modifier_01, lbPlate|Modifier_02, lbPlate|Modifier_01, lbPlate,	lbPlate, lbPlate, lbHighButton|Modifier_01, lbDoor|Modifier_02;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel4_Room19:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbSpace, lbSpace|Modifier_03, lbSpace,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbSpace, lbSpace, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpikesPlate, lbSpikesPlate, lbSpikesPlate, lbSpikesPlate, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel4_Room20:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace|Modifier_07, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbSpace, lbSpace, lbSpace, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbSpikesPlate, lbSpikesPlate, lbSpikesPlate, lbSpikesPlate, lbBrickWall;	nRoomBlock
pLevel4_Room21:	.BYTE lbPlateWithTorch,	lbPlateWithTorch, lbPlate, lbDoubleColumns, lbPlate, lbPlate|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel4_Room22:	.BYTE lbPlate, lbDoubleColumns,	lbSpace|Modifier_01, lbPlate, lbCutters, lbPlateWithTorch, lbPlateWithTorch, lbPlate, lbPlate, lbPlate;	nRoomBlock
		.BYTE lbHealthPotion|Modifier_01, lbDoubleColumns, lbPlateWithDebris, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel4_Room23:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbPlate, lbHealthPotion|Modifier_02, lbPlateWithTorch, lbCutters, lbPlate, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel4_Room24:	.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace, lbSpace|Modifier_03,	lbSpace, lbSpace|Modifier_03, lbSpace|Modifier_07, lbCastleOverDoor|Modifier_02; nRoomBlock
		.BYTE lbPlate, lbPlateWithTorch, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart, lbPlateWithTorch,	lbPlate, lbPlate|Modifier_02, lbLowButton, lbPlateWithTorch, lbDoor|Modifier_01; nRoomBlock
		.BYTE lbBrickWall, lbSpace|Modifier_01,	lbDoubleColumns, lbPlate, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel4_Geom:	ROOM_NEIGHBORS 8, 2, 0, 3 ; ...
		ROOM_NEIGHBORS 1, 5, 0, 22
		ROOM_NEIGHBORS 10, 22,	1, 0
		ROOM_NEIGHBORS 7, 11, 0, 12
		ROOM_NEIGHBORS 2, 6, 0, 21
		ROOM_NEIGHBORS 5, 24, 0, 0
		ROOM_NEIGHBORS 24, 4, 0, 14
		ROOM_NEIGHBORS 9, 1, 0, 10
		ROOM_NEIGHBORS 16, 8, 0, 18
		ROOM_NEIGHBORS 18, 3, 8, 0
		ROOM_NEIGHBORS 4, 0, 0, 13
		ROOM_NEIGHBORS 14, 13,	4, 0
		ROOM_NEIGHBORS 12, 0, 11, 20
		ROOM_NEIGHBORS 15, 12,	7, 0
		ROOM_NEIGHBORS 0, 14, 24, 0
		ROOM_NEIGHBORS 23, 9, 0, 17
		ROOM_NEIGHBORS 0, 18, 16, 19
		ROOM_NEIGHBORS 17, 10,	9, 0
		ROOM_NEIGHBORS 0, 0, 17, 0
		ROOM_NEIGHBORS 0, 0, 13, 0
		ROOM_NEIGHBORS 22, 0, 5, 0
		ROOM_NEIGHBORS 3, 21, 2, 0
		ROOM_NEIGHBORS 0, 16, 0, 0
		ROOM_NEIGHBORS 6, 7, 0, 15
pLevel4_Header:	LEVEL_HEADER 1, X_6_Y_1, DIRECTION_RIGHT ; ...
pLevel4_Guards:	.BYTE NO_PLACE,	NO_PLACE, NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE|RESIDUAL_BIT; nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT,	NO_PLACE|RESIDUAL_BIT; nGuardPlace
		.BYTE NO_PLACE|RESIDUAL_BIT, X_7_Y_0|RESIDUAL_BIT, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, X_9_Y_0|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT,	X_5_Y_1|RESIDUAL_BIT; nGuardPlace
pLevel4_DoorLinks:DOOR_LINK 1,	X_8_Y_1, ACTION_OPEN_DOOR, 8, X_9_Y_1
		DOOR_LINK 2, X_2_Y_1, ACTION_OPEN_DOOR, 1, X_9_Y_1
		DOOR_LINK 3, X_2_Y_0, ACTION_OPEN_DOOR, 10, X_6_Y_0
		DOOR_LINK 4, X_7_Y_1, ACTION_OPEN_DOOR, 24, X_2_Y_1
		DOOR_LINK 8, X_7_Y_1, ACTION_OPEN_DOOR, 8, X_9_Y_1
		DOOR_LINK 8, X_1_Y_2, ACTION_OPEN_DOOR, 8, X_9_Y_1
		DOOR_LINK 8, X_1_Y_2, ACTION_OPEN_DOOR, 9, X_9_Y_1
		DOOR_LINK 9, X_3_Y_1, ACTION_CLOSE_DOOR, 16, X_9_Y_1
		DOOR_LINK 9, X_7_Y_1, ACTION_OPEN_DOOR, 9, X_9_Y_1
		DOOR_LINK 9, X_7_Y_1, ACTION_OPEN_DOOR, 16, X_9_Y_1
		DOOR_LINK 12, X_7_Y_0,	ACTION_OPEN_DOOR, 14, X_9_Y_0
		DOOR_LINK 14, X_6_Y_0,	ACTION_OPEN_DOOR, 14, X_9_Y_0
		DOOR_LINK 17, X_1_Y_0,	ACTION_OPEN_DOOR, 16, X_9_Y_1
		DOOR_LINK 17, X_1_Y_0,	ACTION_OPEN_DOOR, 23, X_9_Y_0
		DOOR_LINK 18, X_8_Y_0,	ACTION_OPEN_DOOR, 10, X_6_Y_0
		DOOR_LINK 18, X_8_Y_0,	ACTION_OPEN_DOOR, 18, X_9_Y_0
		DOOR_LINK 24, X_7_Y_1,	ACTION_CLOSE_DOOR, 6, X_9_Y_1
		.BYTE $FF
		DOOR_LINK 18, X_7_Y_0,	ACTION_OPEN_DOOR, 18, X_1_Y_0
pLevel5_Rooms:	.BYTE $FF		; ...
pLevel5_Room2:	.BYTE lbCastleSmallArch, lbCastleArchColumnPart, lbCastleLeftPartBigArch, lbCastleRightPartBigArch, lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart, lbCastleOverDoor|Modifier_01;	nRoomBlock
		.BYTE lbPlate|Modifier_02, lbCastleOneColumn, lbSpace|Modifier_02, lbSpace|Modifier_01,	lbCastleOneColumn, lbPlate|Modifier_02,	lbCastleOneColumn, lbHighButton, lbPlate, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_02, lbSpace|Modifier_01, lbDoubleColumns, lbHealthPotion|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel5_Room3:	.BYTE $FF
pLevel5_Room4:	.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_02, lbSpace|Modifier_01, lbDoubleColumns, lbPlate, lbHealthPotion|Modifier_01,	lbPlate, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall|Modifier_01, lbSpace, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpikesPlate, lbSpikesPlate, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel5_Room5:	.BYTE $FF
pLevel5_Room6:	.BYTE $FF
pLevel5_Room7:	.BYTE lbPlate, lbBigColumnLowPart, lbPlate, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbPlate, lbBigColumnLowPart,	lbHealthPotion|Modifier_01, lbDoor; nRoomBlock
		.BYTE lbSpace, lbBigColumnHighPart, lbSpace, lbSpace, lbSpace, lbSpace,	lbSpace, lbBigColumnHighPart, lbSpace, lbSpace;	nRoomBlock
		.BYTE lbHighButton|Modifier_06,	lbBigColumnLowPart, lbPlate, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart, lbPlate, lbPlate, lbBigColumnLowPart,	lbHighButton|Modifier_05, lbPlate; nRoomBlock
pLevel5_Room8:	.BYTE lbSpace|Modifier_02, lbSpace|Modifier_01,	lbSpace|Modifier_01, lbSpace|Modifier_02, lbDoubleColumns, lbPlate, lbPlate|Modifier_02, lbPlate, lbPlate, lbDoor; nRoomBlock
		.BYTE lbPlate, lbPlate,	lbPlate, lbPlate, lbDoubleColumns, lbSpace|Modifier_01,	lbCastleOverDoor|Modifier_02, lbSpace, lbSpace,	lbSpace; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbHighButton|Modifier_01, lbDoor|Modifier_02, lbPlate, lbHighButton|Modifier_02,	lbPlate; nRoomBlock
pLevel5_Room9:	.BYTE lbPlate, lbDoubleColumns,	lbSpace|Modifier_02, lbSpace|Modifier_03, lbSpace|Modifier_02, lbSpace|Modifier_01, lbDoubleColumns, lbPlate, lbPlate, lbBrickWall; nRoomBlock
		.BYTE lbSpace, lbPlate,	lbPlateWithTorch, lbPlate|Modifier_02, lbPlateWithTorch, lbPlate, lbDoubleColumns, lbSpace|Modifier_01,	lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbPlate, lbDoubleColumns,	lbPlate, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall|Modifier_01, lbSpace, lbSpace, lbBrickWall; nRoomBlock
pLevel5_Room10:	.BYTE lbSpace, lbBigColumnHighPart, lbSpace, lbSpace, lbSpace, lbSpace,	lbSpace, lbBigColumnHighPart, lbSpace, lbSpace;	nRoomBlock
		.BYTE lbPlate, lbBigColumnLowPart, lbPlate, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbPlate, lbBigColumnLowPart,	lbPlate, lbPlate; nRoomBlock
		.BYTE lbSpace, lbBigColumnHighPart, lbSpace, lbSpace, lbSpace, lbSpace,	lbSpace, lbBigColumnHighPart, lbSpace, lbSpace;	nRoomBlock
pLevel5_Room11:	.BYTE lbSpace|Modifier_03, lbSpace|Modifier_03,	lbSpace, lbSpace, lbPlate|Modifier_05, lbPlate|Modifier_05, lbDoor|Modifier_03,	lbPlate, lbPlate, lbPlate; nRoomBlock
		.BYTE lbPlateWithTorch,	lbPlateWithTorch, lbPlate|Modifier_02, lbPlate,	lbDoubleColumns, lbSpace|Modifier_01, lbDoubleColumns, lbPlate,	lbPlate|Modifier_01, lbPlate|Modifier_01; nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbPlate, lbDoubleColumns, lbSpace|Modifier_01, lbSpace, lbBrickWall;	nRoomBlock
pLevel5_Room12:	.BYTE lbSpace|Modifier_01, lbSpace|Modifier_01,	lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01;	nRoomBlock
		.BYTE lbPlate, lbHighButton|Modifier_01, lbPlate, lbPlateWithLeftPartOfWindow, lbPlateWithWindow, lbPlate, lbPlate, lbPlateWithTorch, lbPlate, lbPlate|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel5_Room13:	.BYTE lbHighButton|Modifier_07,	lbPlate, lbSpace|Modifier_01, lbPlate, lbDoubleColumns,	lbSpace|Modifier_02, lbSpace|Modifier_03, lbSpace|Modifier_02, lbSpace|Modifier_01, lbCastleOverDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbDoubleColumns, lbSpace|Modifier_01, lbCastleOverDoor|Modifier_01, lbDoubleColumns,	lbPlateWithTorch, lbPlate|Modifier_02, lbPlateWithTorch, lbPlate, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbPlate, lbLowButton|Modifier_06, lbDoor|Modifier_01, lbPlate, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbCastleOverDoor|Modifier_02; nRoomBlock
pLevel5_Room14:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbDoubleColumns, lbSpace|Modifier_01, lbPlate, lbPlate, lbHealthPotion|Modifier_01, lbPlate, lbPlate, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel5_Room15:	.BYTE lbSpace|Modifier_07, lbCastleArchColumnPart, lbCastleLeftPartBigArch, lbCastleRightPartBigArch, lbCastleArchColumnPart, lbCastleLeftPartBigArch, lbCastleRightPartBigArch, lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart; nRoomBlock
		.BYTE lbPlate|Modifier_07, lbCastleOneColumn, lbSpace|Modifier_02, lbSpace|Modifier_01,	lbCastleOneColumn, lbSpikesPlate, lbSpikesPlate, lbCastleOneColumn, lbPlate|Modifier_07, lbCastleOneColumn; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_02, lbSpace|Modifier_01, lbDoubleColumns, lbPlate, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel5_Room16:	.BYTE lbCastleSmallArch, lbCastleArchColumnPart, lbCastleLeftPartBigArch, lbCastleRightPartBigArch, lbCastleArchColumnPart, lbCastleLeftPartBigArch, lbCastleRightPartBigArch, lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart; nRoomBlock
		.BYTE lbPlate|Modifier_02, lbCastleOneColumn, lbPlateWithTorch,	lbHighButton|Modifier_05, lbCastleOneColumn, lbPlateWithTorch, lbBrokenPlate, lbCastleOneColumn, lbPlate|Modifier_02, lbCastleOneColumn; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01,	lbSpace|Modifier_02, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel5_Room17:	.BYTE lbBrickWall, lbBrickWall|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_02, lbDoubleColumns, lbPlate,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_02, lbSpace|Modifier_01, lbDoubleColumns, lbPlate, lbPlateWithTorch, lbPlateWithTorch,	lbPlate, lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpikesPlate, lbPlate,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel5_Room18:	.BYTE lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace, lbSpace, lbSpace,	lbSpace|Modifier_03, lbSpace, lbSpace, lbCastleOverDoor; nRoomBlock
		.BYTE lbPlate, lbPlate|Modifier_02, lbPlateWithTorch, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart, lbPlateWithTorch, lbPlate|Modifier_02, lbPlate, lbHighButton|Modifier_01, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel5_Room19:	.BYTE $FF
pLevel5_Room20:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01,	lbSpace, lbSpace, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbDoubleColumns, lbCutters, lbSpace|Modifier_02, lbPlate,	lbCutters, lbDoubleColumns, lbPlate, lbPlate, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel5_Room21:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace|Modifier_01, lbSpace|Modifier_01, lbBrickWall, lbBrickWall, lbSpace|Modifier_01, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall|Modifier_01, lbSpace, lbSpace, lbSpace, lbBrickWall, lbBrickWall|Modifier_01, lbSpace, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpikesPlate, lbSpikesPlate, lbPlateWithDebris, lbBrickWall, lbBrickWall, lbSpikesPlate, lbSpikesPlate, lbBrickWall; nRoomBlock
pLevel5_Room22:	.BYTE lbBrickWall, lbBrickWall|Modifier_01, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbSpikesPlate, lbSpikesPlate, lbSpikesPlate,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel5_Room23:	.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall, lbSpace|Modifier_07, lbCastleOverDoor|Modifier_02; nRoomBlock
		.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall, lbPlate|Modifier_07, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel5_Room24:	.BYTE lbPlate, lbPlate,	lbPlate, lbHealthPotion|Modifier_02, lbPlate, lbPlate, lbPlate,	lbPlate, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbSpace|Modifier_01, lbCastleOverDoor|Modifier_01, lbSpace|Modifier_01, lbDoubleColumns, lbCutters, lbCutters, lbHighButton|Modifier_03, lbDoubleColumns,	lbHighButton|Modifier_02, lbBrickWall; nRoomBlock
		.BYTE lbPlate, lbDoor|Modifier_01, lbPlate, lbDoubleColumns, lbPlate, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel5_Geom:	ROOM_NEIGHBORS 3, 0, 0, 24 ; ...
		ROOM_NEIGHBORS 16, 12,	0, 4
		ROOM_NEIGHBORS 0, 1, 0, 11
		ROOM_NEIGHBORS 20, 0, 2, 0
		ROOM_NEIGHBORS 0, 1, 0, 0
		ROOM_NEIGHBORS 0, 0, 0, 0
		ROOM_NEIGHBORS 8, 9, 10, 0
		ROOM_NEIGHBORS 12, 7, 13, 0
		ROOM_NEIGHBORS 7, 0, 11, 21
		ROOM_NEIGHBORS 13, 11,	0, 7
		ROOM_NEIGHBORS 10, 24,	0, 9
		ROOM_NEIGHBORS 2, 8, 0, 0
		ROOM_NEIGHBORS 0, 10, 14, 8
		ROOM_NEIGHBORS 0, 0, 0, 13
		ROOM_NEIGHBORS 18, 16,	0, 17
		ROOM_NEIGHBORS 15, 2, 0, 20
		ROOM_NEIGHBORS 0, 20, 15, 0
		ROOM_NEIGHBORS 23, 15,	0, 0
		ROOM_NEIGHBORS 9, 1, 0, 13
		ROOM_NEIGHBORS 17, 4, 16, 22
		ROOM_NEIGHBORS 0, 0, 9, 0
		ROOM_NEIGHBORS 0, 0, 20, 0
		ROOM_NEIGHBORS 0, 18, 0, 0
		ROOM_NEIGHBORS 11, 0, 0, 0
pLevel5_Header:	LEVEL_HEADER 7, X_4_Y_2, DIRECTION_LEFT ; ...
pLevel5_Guards:	.BYTE NO_PLACE,	NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE, NO_PLACE, NO_PLACE, X_5_Y_0; nGuardPlace
		.BYTE X_5_Y_1, NO_PLACE, NO_PLACE, X_4_Y_1, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE; nGuardPlace
		.BYTE NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT; nGuardPlace
pLevel5_DoorLinks:DOOR_LINK 7,	X_8_Y_2, ACTION_OPEN_DOOR, 8, X_9_Y_0
		DOOR_LINK 6, X_3_Y_2, ACTION_CLOSE_DOOR, 6, X_1_Y_2
		DOOR_LINK 7, X_0_Y_2, ACTION_OPEN_DOOR, 7, X_9_Y_0
		DOOR_LINK 12, X_1_Y_1,	ACTION_OPEN_DOOR, 2, X_9_Y_1
		DOOR_LINK 8, X_5_Y_2, ACTION_OPEN_DOOR, 8, X_6_Y_2
		DOOR_LINK 8, X_8_Y_2, ACTION_OPEN_DOOR, 2, X_9_Y_1
		DOOR_LINK 11, X_8_Y_1,	ACTION_OPEN_DOOR, 24, X_1_Y_2
		DOOR_LINK 2, X_7_Y_1, ACTION_OPEN_DOOR, 2, X_9_Y_1
		DOOR_LINK 13, X_0_Y_0,	ACTION_OPEN_DOOR, 13, X_9_Y_1
		DOOR_LINK 13, X_2_Y_2,	ACTION_CLOSE_DOOR, 13, X_3_Y_2
		DOOR_LINK 16, X_3_Y_1,	ACTION_OPEN_DOOR, 18, X_9_Y_1
		DOOR_LINK 18, X_8_Y_1,	ACTION_OPEN_DOOR, 18, X_3_Y_1
		DOOR_LINK 24, X_6_Y_1,	ACTION_OPEN_DOOR, 11, X_6_Y_0
		DOOR_LINK 24, X_8_Y_1,	ACTION_OPEN_DOOR, 11, X_6_Y_0
		DOOR_LINK 24, X_3_Y_2,	ACTION_CLOSE_DOOR, 24, X_1_Y_2
		DOOR_LINK 24, X_3_Y_2,	ACTION_CLOSE_DOOR, 24, X_1_Y_0
		.BYTE $FF
		DOOR_LINK 7, X_9_Y_2, ACTION_OPEN_DOOR, 7, X_8_Y_2
pLevel6_Rooms:	.BYTE lbSpace|Modifier_01, lbSpace|Modifier_01,	lbCastleOverDoor|Modifier_02, lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace; nRoomBlock	; ...
		.BYTE lbPlate, lbLowButton|Modifier_03,	lbDoor|Modifier_02, lbSpace|Modifier_02, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01,	lbHighButton|Modifier_02, lbPlate|Modifier_02, lbPlate;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbSpace, lbSpace, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel6_Room2:	.BYTE lbCastleArchColumnPart, lbCastleLeftPartBigArch, lbCastleRightPartBigArch, lbCastleArchColumnPart, lbCastleLeftPartBigArch, lbCastleRightPartBigArch, lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart, lbCastleOverDoor|Modifier_01; nRoomBlock
		.BYTE lbCastleOneColumn, lbSpikesPlate,	lbPlate, lbCastleOneColumn, lbPlate, lbSpikesPlate, lbCastleOneColumn, lbHighButton|Modifier_01, lbPlate, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel6_Room3:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbSpace, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbSpace, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbSpace, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel6_Room4:	.BYTE $FF
pLevel6_Room5:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbDoubleColumns, lbPlate,	lbPlate, lbPlateWithTorch, lbExitDoorLeftPart, lbExitDoorRightPart, lbPlateWithTorch, lbPlate, lbDoubleColumns,	lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel6_Room6:	.BYTE lbSpace, lbSpace|Modifier_03, lbSpace|Modifier_03, lbSpace, lbSpace, lbSpace, lbSpace|Modifier_03, lbSpace|Modifier_03, lbSpace, lbCastleOverDoor; nRoomBlock
		.BYTE lbPlate|Modifier_02, lbPlate, lbPlate, lbPlateWithTorch, lbPlate|Modifier_02, lbPlateWithTorch, lbPlate, lbBrokenPlate, lbPlate|Modifier_02, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbSpace, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel6_Room7:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpace, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpace, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpace, lbBrickWall, lbBrickWall; nRoomBlock
pLevel6_Room8:	.BYTE $FF
pLevel6_Room9:	.BYTE lbBrickWall|Modifier_01, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbPlateWithTorch, lbPlate, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel6_Room10:	.BYTE lbPlate|Modifier_07, lbPlate|Modifier_07,	lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01;	nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall|Modifier_01,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_03, lbSpace|Modifier_07, lbSpace|Modifier_03, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07;	nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall|Modifier_01,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07;	nRoomBlock
pLevel6_Room11:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01,	lbBrickWall, lbSpace, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpace|Modifier_02, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbHighButton|Modifier_06, lbBrickWall|Modifier_01, lbBrickWall; nRoomBlock
pLevel6_Room12:	.BYTE lbBrickWall, lbBrickWall|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_03, lbSpace|Modifier_07,	lbSpace|Modifier_03, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbPlateWithDebris, lbPlateWithDebris, lbPlateWithTorch,	lbPlate|Modifier_02, lbPlateWithTorch, lbPlateWithDebris, lbPlate, lbPlate; nRoomBlock
pLevel6_Room13:	.BYTE $FF
pLevel6_Room14:	.BYTE $FF
pLevel6_Room15:	.BYTE lbSpace|Modifier_07, lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart, lbCastleLeftPartBigArch, lbCastleRightPartBigArch, lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart, lbCastleSmallArch; nRoomBlock
		.BYTE lbPlate|Modifier_07, lbCastleOneColumn, lbPlate, lbCastleOneColumn, lbSpace|Modifier_01, lbSpace|Modifier_01, lbCastleOneColumn, lbHighButton|Modifier_02, lbCastleOneColumn, lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall|Modifier_01, lbSpace, lbSpace,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel6_Room16:	.BYTE $FF
pLevel6_Room17:	.BYTE $FF
pLevel6_Room18:	.BYTE lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbCastleOverDoor|Modifier_02; nRoomBlock
		.BYTE lbPlateWithTorch,	lbSpace|Modifier_01, lbPlate|Modifier_02, lbPlate, lbPlateWithTorch, lbPlateWithLeftPartOfWindow, lbPlateWithWindow, lbPlateWithTorch, lbPlate,	lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbSpace,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01; nRoomBlock
pLevel6_Room19:	.BYTE $FF
pLevel6_Room20:	.BYTE $FF
pLevel6_Room21:	.BYTE $FF
pLevel6_Room22:	.BYTE $FF
pLevel6_Room23:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbSpace|Modifier_01, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07,	lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbSpikesPlate, lbSpikesPlate,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel6_Room24:	.BYTE lbSpace|Modifier_01, lbSpace|Modifier_01,	lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbPlate,	lbPlate, lbPlate, lbPlate, lbPlate; nRoomBlock
		.BYTE lbPlateWithTorch,	lbExitDoorLeftPart|Modifier_02,	lbExitDoorRightPart, lbPlateWithTorch, lbHighButton, lbDoubleColumns, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbPlate, lbPlate, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel6_Geom:	ROOM_NEIGHBORS 0, 18, 0, 3 ; ...
		ROOM_NEIGHBORS 15, 24,	0, 0
		ROOM_NEIGHBORS 0, 9, 1, 0
		ROOM_NEIGHBORS 6, 15, 0, 8
		ROOM_NEIGHBORS 0, 1, 0, 0
		ROOM_NEIGHBORS 18, 15,	0, 7
		ROOM_NEIGHBORS 9, 23, 6, 11
		ROOM_NEIGHBORS 7, 23, 4, 0
		ROOM_NEIGHBORS 3, 7, 18, 0
		ROOM_NEIGHBORS 24, 0, 0, 12
		ROOM_NEIGHBORS 0, 0, 7, 0
		ROOM_NEIGHBORS 0, 0, 10, 0
		ROOM_NEIGHBORS 0, 10, 14, 8
		ROOM_NEIGHBORS 0, 0, 0, 13
		ROOM_NEIGHBORS 6, 2, 0, 23
		ROOM_NEIGHBORS 15, 2, 0, 0
		ROOM_NEIGHBORS 0, 20, 15, 0
		ROOM_NEIGHBORS 1, 6, 0, 9
		ROOM_NEIGHBORS 9, 1, 0, 13
		ROOM_NEIGHBORS 17, 4, 16, 22
		ROOM_NEIGHBORS 0, 0, 9, 0
		ROOM_NEIGHBORS 2, 24, 0, 0
		ROOM_NEIGHBORS 7, 0, 15, 0
		ROOM_NEIGHBORS 2, 10, 0, 0
pLevel6_Header:	LEVEL_HEADER 24, X_2_Y_1, DIRECTION_RIGHT ; ...
pLevel6_Guards:	.BYTE NO_PLACE,	NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE, X_2_Y_1, NO_PLACE,	NO_PLACE; nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT,	NO_PLACE|RESIDUAL_BIT; nGuardPlace
		.BYTE NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT; nGuardPlace
pLevel6_DoorLinks:DOOR_LINK 1,	X_1_Y_1, ACTION_CLOSE_DOOR, 1, X_2_Y_1
		DOOR_LINK 1, X_7_Y_1, ACTION_OPEN_DOOR, 1, X_2_Y_1
		DOOR_LINK 2, X_7_Y_1, ACTION_OPEN_DOOR, 2, X_9_Y_1
		DOOR_LINK 4, X_8_Y_1, ACTION_OPEN_DOOR, 6, X_9_Y_1
		DOOR_LINK 4, X_8_Y_1, ACTION_OPEN_DOOR, 4, X_9_Y_1
		DOOR_LINK 11, X_7_Y_2,	ACTION_OPEN_DOOR, 18, X_9_Y_1
		DOOR_LINK 13, X_0_Y_0,	ACTION_OPEN_DOOR, 13, X_9_Y_1
		DOOR_LINK 13, X_2_Y_2,	ACTION_CLOSE_DOOR, 13, X_3_Y_2
		DOOR_LINK 15, X_7_Y_1,	ACTION_OPEN_DOOR, 6, X_9_Y_1
		DOOR_LINK 15, X_7_Y_1,	ACTION_OPEN_DOOR, 4, X_9_Y_1
		DOOR_LINK 22, X_8_Y_1,	ACTION_OPEN_DOOR, 2, X_9_Y_1
		DOOR_LINK 24, X_4_Y_1,	ACTION_OPEN_DOOR, 2, X_9_Y_1
		.BYTE $FF
pLevel7_Rooms:	.BYTE lbPlate|Modifier_07, lbPlate, lbSpace|Modifier_01, lbSpace, lbSpace, lbPlate|Modifier_07,	lbPlate, lbPlate|Modifier_01, lbPlate|Modifier_01, lbDoubleColumns; nRoomBlock ; ...
		.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbSpace,	lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace,	lbDoubleColumns, lbPlateWithTorch, lbHealthPotion|Modifier_03, lbDoubleColumns;	nRoomBlock
pLevel7_Room2:	.BYTE lbPlate, lbPlate|Modifier_01, lbPlate, lbPlate|Modifier_01, lbPlate, lbPlate, lbDoubleColumns, lbCutters,	lbPlate|Modifier_01, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbDoubleColumns, lbPlate,	lbPlate, lbPlate|Modifier_01, lbPlate, lbPlate,	lbDoubleColumns, lbPlate|Modifier_01, lbPlate|Modifier_01, lbDoubleColumns; nRoomBlock
pLevel7_Room3:	.BYTE lbBrickWall, lbSpace, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbSpace, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace, lbCastleOverDoor|Modifier_02, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbHighButton|Modifier_04, lbPlateWithTorch, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart, lbPlateWithTorch, lbDoor|Modifier_02, lbPlate, lbHighButton|Modifier_03, lbDoubleColumns; nRoomBlock
pLevel7_Room4:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbSpace|Modifier_01, lbSpace,	lbDoubleColumns, lbPlate|Modifier_01, lbPlate|Modifier_07, lbDoubleColumns; nRoomBlock
		.BYTE lbDoubleColumns, lbPlateWithTorch, lbPlate, lbDoubleColumns, lbPlateWithTorch, lbPlate, lbDoubleColumns, lbPlateWithTorch, lbPlate, lbDoubleColumns; nRoomBlock
pLevel7_Room5:	.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbSpace;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpikesPlate, lbSpace,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpace; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpikesPlate, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbPlate; nRoomBlock
pLevel7_Room6:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate, lbDoubleColumns,	lbSpace, lbDoubleColumns, lbPlate|Modifier_01, lbPlate,	lbDoubleColumns, lbPlate|Modifier_01, lbPlate|Modifier_07, lbDoubleColumns; nRoomBlock
		.BYTE lbPlate, lbDoubleColumns,	lbHighButton, lbDoubleColumns, lbPlateWithTorch, lbHealthPotion|Modifier_02, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel7_Room7:	.BYTE lbDoubleColumns, lbPlate,	lbPlate|Modifier_01, lbPlate, lbSpace, lbPlate|Modifier_01, lbPlate, lbPlate, lbPlate, lbDoubleColumns;	nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall|Modifier_01,	lbBrickWall|Modifier_01, lbDoubleColumns, lbSpace|Modifier_01, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbDoubleColumns|Modifier_01, lbPlate, lbDoor|Modifier_02,	lbPlate, lbLowButton|Modifier_07, lbDoor|Modifier_02, lbPlate, lbHighButton|Modifier_05, lbPlate, lbDoubleColumns; nRoomBlock
pLevel7_Room8:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate, lbDoor|Modifier_01, lbSpace|Modifier_01,	lbSpace, lbSpace, lbSpace, lbDoubleColumns, lbPlate, lbDoubleColumns, lbSpace; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_01, lbPlate, lbPlate, lbLowButton|Modifier_04,	lbBrickWall, lbBrickWall, lbBrickWall, lbSpace;	nRoomBlock
pLevel7_Room9:	.BYTE lbPlate, lbPlateWithDebris, lbPlate, lbPlate, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbDoubleColumns, lbCutters, lbDoubleColumns, lbCutters, lbPlate, lbPlate,	lbPlate, lbPlate, lbPlate, lbPlate; nRoomBlock
pLevel7_Room10:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbSpace,	lbDoubleColumns, lbPlate, lbPlate, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbDoubleColumns, lbSpace,	lbPlate, lbDoubleColumns, lbPlate, lbPlate, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01;	nRoomBlock
pLevel7_Room11:	.BYTE lbBrickWall, lbSpace, lbDoubleColumns, lbSpace, lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbSpace|Modifier_01, lbSpace, lbDoubleColumns, lbPlateWithDebris,	lbDoubleColumns, lbPlateWithTorch, lbPlate|Modifier_01,	lbPlateWithTorch, lbPlate|Modifier_07, lbDoubleColumns;	nRoomBlock
		.BYTE lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel7_Room12:	.BYTE lbBrickWall, lbPlate, lbPlate, lbDoubleColumns, lbPlateWithTorch,	lbPlateWithTorch, lbHighButton|Modifier_02, lbDoubleColumns, lbPlate|Modifier_07, lbDoubleColumns; nRoomBlock
		.BYTE lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbPlate, lbHighButton|Modifier_01, lbDoubleColumns, lbSpace, lbSpace|Modifier_01,	lbSpace, lbSpace, lbDoubleColumns, lbHighButton, lbDoubleColumns; nRoomBlock
pLevel7_Room13:	.BYTE lbBrickWall|Modifier_01, lbBrickWall|Modifier_01,	lbBrickWall, lbSpace, lbSpace|Modifier_01, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01;	nRoomBlock
		.BYTE lbPlate, lbPlate|Modifier_01, lbDoubleColumns, lbSpikesPlate, lbPlate|Modifier_01, lbPlate, lbSpikesPlate, lbDoubleColumns, lbPlate|Modifier_07, lbDoubleColumns;	nRoomBlock
		.BYTE lbBrickWall, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel7_Room14:	.BYTE lbPlate, lbPlate|Modifier_01, lbHighButton|Modifier_04, lbSpace, lbSpace|Modifier_01, lbSpace, lbSpace, lbSpace, lbPlate,	lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace, lbSpace|Modifier_01, lbSpace, lbSpace, lbSpace, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate|Modifier_01, lbPlate, lbDoubleColumns, lbSpace, lbSpace|Modifier_01, lbSpace, lbSpace, lbSpace, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel7_Room15:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace, lbSpace|Modifier_01, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate|Modifier_01, lbPlate|Modifier_07,	lbDoubleColumns, lbSpace, lbSpace|Modifier_01, lbSpace,	lbSpace|Modifier_07, lbSpace, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace, lbSpace|Modifier_01, lbSpace, lbSpace|Modifier_07, lbSpace, lbBrickWall, lbBrickWall; nRoomBlock
pLevel7_Room16:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace, lbSpace|Modifier_01, lbSpace, lbPlate, lbPlate, lbPlate, lbPlate;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall, lbPlateWithDebris, lbPlateWithDebris, lbPlateWithDebris, lbDoubleColumns, lbPlateWithSkeleton,	lbBrickWall, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel7_Room17:	.BYTE lbSpace, lbSpace,	lbSpace, lbSpace, lbSpace, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall; nRoomBlock
		.BYTE lbSpace, lbSpace,	lbSpace, lbSpace, lbSpace, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall; nRoomBlock
		.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall; nRoomBlock
pLevel7_Room18:	.BYTE lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbPlate|Modifier_01, lbPlateWithDebris, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel7_Room19:	.BYTE lbPlate, lbDoor|Modifier_02, lbPlateWithTorch, lbPlate, lbPlate|Modifier_01, lbPlate|Modifier_02,	lbPlate, lbPlate, lbDoubleColumns, lbPlate; nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall|Modifier_01,	lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01;	nRoomBlock
		.BYTE lbDoubleColumns, lbPlate,	lbPlate, lbHighButton|Modifier_01, lbPlate, lbPlate|Modifier_01, lbDoor|Modifier_02, lbPlate, lbPlate, lbDoubleColumns;	nRoomBlock
pLevel7_Room20:	.BYTE lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbDoubleColumns, lbPlateWithTorch, lbPlate|Modifier_01, lbSpace, lbPlate,	lbSpace|Modifier_01, lbPlateWithTorch, lbPlate|Modifier_01, lbPlate|Modifier_07, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpikesPlate, lbBrickWall|Modifier_01, lbSpikesPlate, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel7_Room21:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpikesPlate, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbPlateWithDebris, lbPlateWithDebris,	lbPlateWithDebris, lbPlateWithDebris, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel7_Room22:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate, lbPlate|Modifier_01, lbPlate, lbPlateWithTorch, lbPlate|Modifier_01, lbPlateWithTorch, lbPlate|Modifier_01, lbPlate, lbPlate, lbPlate; nRoomBlock
pLevel7_Room23:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbDoubleColumns, lbSpace,	lbPlate|Modifier_01, lbPlate|Modifier_07, lbDoubleColumns, lbPlate, lbCutters, lbPlate,	lbPlate|Modifier_07, lbDoubleColumns; nRoomBlock
pLevel7_Room24:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate, lbSpace,	lbSpace, lbDoubleColumns, lbPlate, lbHealthPotion|Modifier_01, lbPlate,	lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel7_Geom:	ROOM_NEIGHBORS 16, 2, 17, 3 ;	...
		ROOM_NEIGHBORS 1, 7, 0, 4
		ROOM_NEIGHBORS 0, 4, 1, 0
		ROOM_NEIGHBORS 3, 6, 2, 0
		ROOM_NEIGHBORS 0, 18, 8, 0
		ROOM_NEIGHBORS 4, 8, 7, 0
		ROOM_NEIGHBORS 2, 9, 0, 6
		ROOM_NEIGHBORS 6, 11, 9, 5
		ROOM_NEIGHBORS 7, 10, 23, 8
		ROOM_NEIGHBORS 9, 12, 22, 11
		ROOM_NEIGHBORS 8, 13, 10, 18
		ROOM_NEIGHBORS 10, 19,	24, 13
		ROOM_NEIGHBORS 11, 20,	12, 0
		ROOM_NEIGHBORS 19, 0, 0, 15
		ROOM_NEIGHBORS 20, 0, 14, 21
		ROOM_NEIGHBORS 0, 1, 0, 0
		ROOM_NEIGHBORS 0, 0, 0, 1
		ROOM_NEIGHBORS 5, 0, 11, 0
		ROOM_NEIGHBORS 12, 14,	0, 20
		ROOM_NEIGHBORS 13, 15,	19, 0
		ROOM_NEIGHBORS 0, 0, 15, 0
		ROOM_NEIGHBORS 23, 24,	0, 10
		ROOM_NEIGHBORS 0, 22, 0, 9
		ROOM_NEIGHBORS 22, 0, 0, 12
pLevel7_Header:	LEVEL_HEADER 17, X_2_Y_2, DIRECTION_LEFT ; ...
pLevel7_Guards:	.BYTE NO_PLACE,	X_4_Y_0, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE|RESIDUAL_BIT; nGuardPlace
		.BYTE X_6_Y_2, NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE|RESIDUAL_BIT; nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, X_6_Y_2, NO_PLACE|RESIDUAL_BIT, NO_PLACE; nGuardPlace
pLevel7_DoorLinks:DOOR_LINK 3,	X_1_Y_2, ACTION_OPEN_DOOR, 3, X_6_Y_2
		DOOR_LINK 3, X_8_Y_2, ACTION_OPEN_DOOR, 3, X_3_Y_2
		DOOR_LINK 6, X_2_Y_2, ACTION_OPEN_DOOR, 8, X_1_Y_1
		DOOR_LINK 7, X_4_Y_2, ACTION_CLOSE_DOOR, 7, X_2_Y_2
		DOOR_LINK 7, X_4_Y_2, ACTION_CLOSE_DOOR, 7, X_5_Y_2
		DOOR_LINK 7, X_7_Y_2, ACTION_OPEN_DOOR, 7, X_2_Y_2
		DOOR_LINK 7, X_7_Y_2, ACTION_OPEN_DOOR, 7, X_5_Y_2
		DOOR_LINK 8, X_5_Y_2, ACTION_CLOSE_DOOR, 8, X_1_Y_1
		DOOR_LINK 12, X_6_Y_0,	ACTION_OPEN_DOOR, 19, X_1_Y_0
		DOOR_LINK 12, X_1_Y_2,	ACTION_OPEN_DOOR, 10, X_9_Y_1
		DOOR_LINK 14, X_0_Y_0,	ACTION_CLOSE_DOOR, 19, X_1_Y_0
		DOOR_LINK 14, X_2_Y_0,	ACTION_OPEN_DOOR, 19, X_6_Y_2
		DOOR_LINK 19, X_3_Y_2,	ACTION_OPEN_DOOR, 19, X_6_Y_2
		.BYTE $FF
		DOOR_LINK 19, X_4_Y_2,	ACTION_CLOSE_DOOR, 19, X_1_Y_2
		DOOR_LINK 19, X_3_Y_0,	ACTION_OPEN_DOOR, 19, X_7_Y_0
		DOOR_LINK 19, X_5_Y_0,	ACTION_CLOSE_DOOR, 19, X_7_Y_0
		DOOR_LINK 14, X_2_Y_0,	ACTION_OPEN_DOOR, 19, X_1_Y_2
		DOOR_LINK 10, X_7_Y_1,	ACTION_CLOSE_DOOR, 10, X_8_Y_1
		DOOR_LINK 14, X_0_Y_0,	ACTION_CLOSE_DOOR, 19, X_7_Y_0
pLevel8_Rooms:	.BYTE lbPlate, lbPlate,	lbPlate, lbPlate, lbBrokenPlate, lbDoubleColumns, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace, lbSpace; nRoomBlock ; ...
		.BYTE lbSpace, lbSpace,	lbSpace, lbSpace|Modifier_07, lbSpace, lbDoubleColumns,	lbPlate|Modifier_01, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart, lbPlate|Modifier_01; nRoomBlock
		.BYTE lbSpace|Modifier_01, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace, lbBrickWall,	lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01;	nRoomBlock
pLevel8_Room2:	.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlateWithTorch,	lbPlate|Modifier_01, lbPlateWithTorch, lbPlate|Modifier_07, lbDoubleColumns, lbHealthPotion|Modifier_05, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel8_Room3:	.BYTE lbSpace|Modifier_01, lbSpace, lbSpace, lbSpace, lbSpace|Modifier_07, lbSpace, lbBrickWall, lbHighButton|Modifier_03, lbPlate, lbPlate; nRoomBlock
		.BYTE lbSpace|Modifier_01, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace, lbSpace|Modifier_01,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbPlateWithTorch,	lbExitDoorLeftPart|Modifier_02,	lbExitDoorRightPart, lbPlateWithTorch, lbPlate|Modifier_01, lbPlate, lbDoubleColumns, lbPlateWithTorch,	lbPlate|Modifier_02, lbPlate; nRoomBlock
pLevel8_Room4:	.BYTE lbPlate, lbPlate,	lbCutters, lbPlate|Modifier_01,	lbPlate, lbPlate|Modifier_01, lbDoubleColumns, lbPlate,	lbPlate|Modifier_01, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbDoubleColumns, lbPlate,	lbPlate|Modifier_01, lbSpikesPlate, lbPlate, lbPlate, lbDoubleColumns, lbPlate|Modifier_01, lbPlate, lbDoubleColumns; nRoomBlock
pLevel8_Room5:	.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_01, lbHighButton|Modifier_04, lbPlate,	lbPlate|Modifier_07, lbPlate, lbPlate|Modifier_07, lbPlate|Modifier_07,	lbPlate; nRoomBlock
		.BYTE lbSpace, lbSpace|Modifier_07, lbSpace|Modifier_01, lbDoubleColumns, lbPlate, lbPlate, lbPlate, lbPlate, lbPlate, lbDoubleColumns;	nRoomBlock
		.BYTE lbSpikesPlate, lbSpikesPlate, lbPlate, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel8_Room6:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbDoubleColumns, lbPlate|Modifier_01, lbPlateWithTorch, lbPlate|Modifier_01, lbSpikesPlate, lbPlate, lbPlateWithTorch, lbPlate|Modifier_01, lbPlate, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel8_Room7:	.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace,	lbPlate, lbPlate, lbPlate|Modifier_01, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbDoubleColumns, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace|Modifier_07, lbPlate|Modifier_07,	lbDoubleColumns, lbHealthPotion|Modifier_01, lbHighButton|Modifier_01, lbBrickWall|Modifier_01;	nRoomBlock
		.BYTE lbBrickWall, lbDoubleColumns, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace|Modifier_07, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01;	nRoomBlock
pLevel8_Room8:	.BYTE lbBrickWall, lbDoubleColumns, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace|Modifier_07, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbDoubleColumns,	lbPlateWithDebris, lbPlateWithDebris, lbPlateWithDebris, lbDoubleColumns, lbCutters, lbPlateWithTorch, lbPlate|Modifier_01, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel8_Room9:	.BYTE lbBrickWall|Modifier_01, lbBrickWall|Modifier_01,	lbBrickWall, lbSpace, lbSpace, lbSpace|Modifier_01, lbSpace|Modifier_07, lbDoubleColumns, lbPlate, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbSpikesPlate,	lbSpace, lbSpace|Modifier_01, lbSpace|Modifier_07, lbBrickWall,	lbBrickWall, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall|Modifier_01,	lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbSpace, lbSpace|Modifier_01,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01; nRoomBlock
pLevel8_Room10:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbPlateWithDebris, lbPlateWithSkeleton, lbPlateWithDebris, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel8_Room11:	.BYTE $FF
pLevel8_Room12:	.BYTE lbPlate, lbPlate|Modifier_02, lbPlate|Modifier_01, lbPlate, lbPlate, lbPlate, lbPlate, lbCutters,	lbHighButton|Modifier_01, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbDoubleColumns, lbPlate|Modifier_01, lbPlate, lbPlate, lbPlate|Modifier_01, lbPlate, lbDoubleColumns, lbPlate, lbPlate|Modifier_01, lbDoubleColumns; nRoomBlock
pLevel8_Room13:	.BYTE lbPlate, lbPlate,	lbDoubleColumns, lbSpace, lbSpace, lbSpace, lbDoubleColumns, lbPlate, lbLowButton|Modifier_06, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall, lbSpace, lbSpace, lbSpace|Modifier_01,	lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbPlate, lbPlate|Modifier_01, lbDoubleColumns, lbSpikesPlate, lbPlateWithDebris, lbPlateWithDebris, lbDoubleColumns, lbPlate, lbPlate, lbDoubleColumns; nRoomBlock
pLevel8_Room14:	.BYTE lbSpace, lbSpace,	lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace|Modifier_01, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbPlate, lbPlate,	lbPlate, lbSpace|Modifier_01, lbSpace, lbSpace,	lbSpace, lbSpace|Modifier_01, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall|Modifier_01,	lbBrickWall, lbSpace|Modifier_01, lbSpace, lbSpace, lbPlate, lbHealthPotion|Modifier_01, lbBrickWall, lbBrickWall|Modifier_01; nRoomBlock
pLevel8_Room15:	.BYTE $FF
pLevel8_Room16:	.BYTE lbPlate|Modifier_01, lbPlateWithTorch, lbPlate, lbDoor|Modifier_02, lbSpace, lbSpace|Modifier_01,	lbSpace, lbHighButton|Modifier_02, lbPlate|Modifier_01,	lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbSpace, lbSpace|Modifier_01,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate|Modifier_01, lbPlateWithTorch, lbPlate|Modifier_01, lbDoubleColumns, lbPlateWithDebris, lbPlateWithDebris, lbPlateWithDebris, lbDoubleColumns, lbPlate|Modifier_01, lbDoubleColumns; nRoomBlock
pLevel8_Room17:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace, lbSpace|Modifier_01, lbSpace|Modifier_01,	lbSpace, lbSpace, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace, lbSpace, lbSpace,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall, lbBrickWall|Modifier_01;	nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbHealthPotion|Modifier_01, lbDoubleColumns, lbSpace, lbSpace, lbSpace|Modifier_01, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbBrickWall, lbBrickWall|Modifier_01; nRoomBlock
pLevel8_Room18:	.BYTE lbPlate|Modifier_07, lbPlate|Modifier_01,	lbDoubleColumns, lbPlate, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbPlate, lbPlate, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall|Modifier_01,	lbBrickWall|Modifier_01, lbBrickWall, lbSpace, lbSpace|Modifier_01, lbSpace, lbDoubleColumns, lbPlate, lbBrickWall|Modifier_01;	nRoomBlock
		.BYTE lbPlateWithTorch,	lbPlate, lbDoubleColumns, lbSpace, lbSpace, lbSpace|Modifier_01, lbSpace, lbDoubleColumns, lbPlate, lbBrickWall|Modifier_01; nRoomBlock
pLevel8_Room19:	.BYTE $FF
pLevel8_Room20:	.BYTE lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpace, lbSpace|Modifier_01, lbCastleOverDoor|Modifier_02; nRoomBlock
		.BYTE lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpace, lbSpace, lbCastleOverDoor|Modifier_01; nRoomBlock
		.BYTE lbSpace, lbSpace,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbSpace, lbSpace, lbCastleOverDoor|Modifier_02; nRoomBlock
pLevel8_Room21:	.BYTE lbSpace, lbSpace|Modifier_02, lbSpace|Modifier_01, lbSpace, lbSpace|Modifier_01, lbSpace,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbSpace, lbSpace,	lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbSpace, lbSpace|Modifier_02, lbSpace, lbSpace, lbSpace, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel8_Room22:	.BYTE lbSpace, lbSpace|Modifier_02, lbSpace, lbBrokenPlate, lbPlate|Modifier_07, lbPlate, lbPlate, lbDoubleColumns, lbPlate|Modifier_02, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbSpace, lbSpace|Modifier_02, lbSpace, lbSpace, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01,	lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbPlateWithDebris, lbPlateWithDebris, lbPlateWithDebris, lbPlate,	lbPlate, lbPlateWithTorch, lbPlate|Modifier_01,	lbPlateWithTorch, lbPlate|Modifier_02, lbPlate;	nRoomBlock
pLevel8_Room23:	.BYTE lbPlate, lbPlate,	lbPlate, lbDoubleColumns, lbCutters, lbPlate|Modifier_01, lbDoubleColumns, lbPlateWithDebris, lbPlateWithDebris, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbPlate|Modifier_01, lbHealthPotion|Modifier_01,	lbDoubleColumns, lbSpace, lbSpace, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbDoubleColumns, lbPlate,	lbPlate|Modifier_02, lbDoubleColumns, lbPlate, lbPlate,	lbDoubleColumns, lbPlate|Modifier_01, lbPlate|Modifier_01, lbDoubleColumns; nRoomBlock
pLevel8_Room24:	.BYTE lbPlateWithTorch,	lbSpace|Modifier_01, lbSpace, lbSpace, lbHighButton|Modifier_04, lbPlate|Modifier_07, lbPlate|Modifier_07, lbPlate|Modifier_07,	lbPlate|Modifier_01, lbPlate; nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbSpace,	lbSpace, lbSpace, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01;	nRoomBlock
		.BYTE lbDoubleColumns, lbPlateWithDebris, lbPlateWithDebris, lbPlateWithDebris,	lbDoubleColumns, lbPlate, lbPlate|Modifier_01, lbPlate,	lbPlate|Modifier_01, lbPlate|Modifier_01; nRoomBlock
pLevel8_Geom:	ROOM_NEIGHBORS 5, 2, 0, 3 ; ...
		ROOM_NEIGHBORS 1, 0, 0, 4
		ROOM_NEIGHBORS 6, 4, 1, 0
		ROOM_NEIGHBORS 3, 16, 2, 0
		ROOM_NEIGHBORS 7, 1, 0, 6
		ROOM_NEIGHBORS 8, 3, 5, 0
		ROOM_NEIGHBORS 0, 5, 0, 8
		ROOM_NEIGHBORS 0, 6, 7, 0
		ROOM_NEIGHBORS 0, 0, 18, 10
		ROOM_NEIGHBORS 0, 0, 9, 0
		ROOM_NEIGHBORS 0, 14, 0, 12
		ROOM_NEIGHBORS 16, 13,	0, 0
		ROOM_NEIGHBORS 12, 22,	14, 0
		ROOM_NEIGHBORS 0, 21, 0, 13
		ROOM_NEIGHBORS 1, 2, 0, 4
		ROOM_NEIGHBORS 4, 12, 0, 0
		ROOM_NEIGHBORS 0, 0, 0, 18
		ROOM_NEIGHBORS 24, 0, 17, 9
		ROOM_NEIGHBORS 20, 17,	0, 24
		ROOM_NEIGHBORS 21, 0, 0, 23
		ROOM_NEIGHBORS 14, 20,	0, 22
		ROOM_NEIGHBORS 13, 23,	21, 0
		ROOM_NEIGHBORS 22, 24,	20, 0
		ROOM_NEIGHBORS 23, 18,	0, 0
pLevel8_Header:	LEVEL_HEADER 1, X_8_Y_1, DIRECTION_LEFT ; ...
pLevel8_Guards:	.BYTE NO_PLACE,	NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE|RESIDUAL_BIT,	X_5_Y_0, NO_PLACE|RESIDUAL_BIT,	NO_PLACE, NO_PLACE; nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE, NO_PLACE, X_1_Y_0|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT,	NO_PLACE, NO_PLACE|RESIDUAL_BIT; nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, X_7_Y_2, NO_PLACE|RESIDUAL_BIT, X_6_Y_0; nGuardPlace
pLevel8_DoorLinks:DOOR_LINK 3,	X_7_Y_0, ACTION_OPEN_DOOR, 3, X_1_Y_2
		DOOR_LINK 5, X_3_Y_0, ACTION_OPEN_DOOR, 7, X_9_Y_0
		DOOR_LINK 7, X_8_Y_1, ACTION_OPEN_DOOR, 7, X_9_Y_0
		DOOR_LINK 12, X_1_Y_0,	ACTION_CLOSE_DOOR, 16, X_9_Y_0
		DOOR_LINK 12, X_8_Y_0,	ACTION_OPEN_DOOR, 16, X_9_Y_0
		DOOR_LINK 13, X_8_Y_0,	ACTION_CLOSE_DOOR, 23, X_9_Y_0
		DOOR_LINK 13, X_8_Y_0,	ACTION_CLOSE_DOOR, 22, X_9_Y_0
		DOOR_LINK 13, X_8_Y_0,	ACTION_CLOSE_DOOR, 13, X_9_Y_0
		DOOR_LINK 15, X_6_Y_1,	ACTION_OPEN_DOOR, 15, X_5_Y_1
		DOOR_LINK 16, X_7_Y_0,	ACTION_OPEN_DOOR, 16, X_3_Y_0
		DOOR_LINK 20, X_7_Y_2,	ACTION_OPEN_DOOR, 23, X_9_Y_0
		DOOR_LINK 24, X_4_Y_0,	ACTION_OPEN_DOOR, 23, X_9_Y_0
		DOOR_LINK 24, X_4_Y_0,	ACTION_OPEN_DOOR, 22, X_9_Y_0
		DOOR_LINK 24, X_4_Y_0,	ACTION_OPEN_DOOR, 13, X_9_Y_0
		.BYTE $FF
pLevel9_Rooms:	.BYTE lbBrickWall|Modifier_01, lbBrickWall, lbDoubleColumns, lbSpace, lbSpace, lbPlate|Modifier_01, lbPlate, lbPlate, lbPlate, lbDoubleColumns;	nRoomBlock ; ...
		.BYTE lbPlate, lbPlate,	lbDoubleColumns, lbPlate|Modifier_01, lbPlate|Modifier_07, lbDoubleColumns, lbCutters, lbHighButton|Modifier_03, lbPlate, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel9_Room2:	.BYTE lbPlateWithTorch,	lbPlate|Modifier_01, lbPlate, lbPlate, lbPlateWithDebris, lbPlateWithDebris, lbPlate, lbPlateWithTorch,	lbPlate|Modifier_01, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbPlate, lbSpace|Modifier_01, lbSpace, lbPlate, lbPlateWithTorch, lbPlate,	lbPlate; nRoomBlock
pLevel9_Room3:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbDoubleColumns; nRoomBlock
		.BYTE lbPlate|Modifier_01, lbHealthPotion|Modifier_01, lbBrickWall, lbBrickWall, lbSpace, lbSpace, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel9_Room4:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbDoubleColumns, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbDoubleColumns, lbPlate|Modifier_01, lbPlate, lbDoubleColumns, lbPlateWithTorch, lbPlate|Modifier_01, lbDoor|Modifier_02;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel9_Room5:	.BYTE lbPlateWithTorch,	lbPlate|Modifier_05, lbSpace, lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace, lbSpace|Modifier_01, lbPlateWithTorch,	lbBrokenPlate, lbDoubleColumns;	nRoomBlock
		.BYTE lbSpace, lbBigColumnHighPart, lbSpace, lbSpace|Modifier_01, lbSpace, lbSpace, lbSpace|Modifier_01, lbBigColumnHighPart, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbPlate, lbBigColumnLowPart, lbPlateWithTorch, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart, lbPlateWithTorch, lbPlate, lbBigColumnLowPart, lbHighButton|Modifier_04, lbDoubleColumns; nRoomBlock
pLevel9_Room6:	.BYTE lbSpace|Modifier_01, lbSpace, lbPlate, lbHealthPotion|Modifier_02, lbPlateWithTorch, lbPlate|Modifier_01,	lbPlateWithTorch, lbPlate|Modifier_01, lbPlate|Modifier_07, lbDoubleColumns; nRoomBlock
		.BYTE lbPlate|Modifier_07, lbPlate, lbDoubleColumns, lbSpace|Modifier_01, lbSpace, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrokenPlate, lbDoubleColumns, lbPlate|Modifier_01,	lbPlate, lbPlate, lbDoubleColumns, lbSpace, lbSpace, lbBrickWall|Modifier_01; nRoomBlock
pLevel9_Room7:	.BYTE lbBrickWall, lbSpace, lbDoubleColumns, lbPlate|Modifier_01, lbPlate, lbPlate, lbDoubleColumns, lbPlate|Modifier_01, lbPlate, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbBrickWall, lbPlate, lbDoubleColumns, lbSpace|Modifier_01, lbSpace|Modifier_07, lbDoubleColumns,	lbPlate, lbHealthPotion|Modifier_01, lbPlate, lbBrickWall|Modifier_01; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbPlateWithDebris, lbPlateWithDebris, lbBrickWall|Modifier_01,	lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01, lbBrickWall|Modifier_01; nRoomBlock
pLevel9_Room8:	.BYTE lbSpace|Modifier_01, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace|Modifier_01, lbSpace, lbSpace, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbSpace|Modifier_01, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace|Modifier_01, lbSpace, lbSpace, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbSpace|Modifier_01, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace, lbSpace, lbSpace, lbBrickWall; nRoomBlock
pLevel9_Room9:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate, lbDoubleColumns,	lbCutters, lbPlate|Modifier_01,	lbLowButton|Modifier_01, lbPlate|Modifier_01, lbPlate, lbPlate|Modifier_01, lbHighButton|Modifier_02, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel9_Room10:	.BYTE lbSpace, lbSpace,	lbPlateWithTorch, lbPlate|Modifier_01, lbHealthPotion|Modifier_01, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbPlate, lbSpace,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbPlate, lbDoubleColumns, lbSpace, lbSpace, lbDoubleColumns,	lbPlate|Modifier_01, lbPlateWithTorch, lbHighButton, lbDoor|Modifier_02; nRoomBlock
pLevel9_Room11:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbSpace, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall; nRoomBlock
		.BYTE lbDoubleColumns, lbPlate|Modifier_01, lbPlate, lbDoubleColumns, lbPlate, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart, lbPlate|Modifier_01, lbPlate|Modifier_07, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel9_Room12:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbDoubleColumns, lbSpace, lbSpace,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbDoubleColumns, lbSpace|Modifier_01, lbSpace|Modifier_07,	lbDoubleColumns, lbPlate|Modifier_01, lbHighButton|Modifier_07,	lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbDoubleColumns, lbSpace, lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01; nRoomBlock
pLevel9_Room13:	.BYTE lbPlateWithTorch,	lbPlate, lbPlate, lbDoubleColumns, lbPlateWithDebris, lbPlateWithDebris, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate|Modifier_01, lbPlate, lbPlate, lbCutters,	lbPlate, lbPlate|Modifier_01, lbPlate|Modifier_01, lbPlate, lbPlate, lbPlate; nRoomBlock
pLevel9_Room14:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbSpace|Modifier_01, lbSpace,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbDoubleColumns, lbPlate|Modifier_01, lbPlate|Modifier_07, lbDoubleColumns, lbPlateWithDebris, lbPlateWithDebris,	lbPlateWithDebris, lbBrickWall,	lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel9_Room15:	.BYTE lbBrickWall, lbBrickWall,	lbHealthPotion|Modifier_01, lbDoubleColumns, lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbDoubleColumns, lbSpace, lbSpace,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbDoubleColumns, lbPlateWithTorch, lbPlate, lbDoubleColumns, lbSpace|Modifier_01,	lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel9_Room16:	.BYTE lbBrickWall, lbSpace|Modifier_01,	lbSpace|Modifier_07, lbPlate, lbBrokenPlate, lbBrokenPlate, lbBrokenPlate, lbPlate, lbPlate|Modifier_01, lbPlate; nRoomBlock
		.BYTE lbPlateWithTorch,	lbLowButton|Modifier_06, lbPlate, lbDoubleColumns, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbDoubleColumns, lbPlate, lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbDoubleColumns, lbSpace|Modifier_01, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel9_Room17:	.BYTE lbSpace|Modifier_01, lbSpace, lbSpace, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbPlate|Modifier_01, lbPlate, lbPlate, lbPlate, lbPlate, lbPlate|Modifier_01, lbPlate|Modifier_01, lbPlate, lbPlate, lbDoubleColumns; nRoomBlock
		.BYTE lbSpace|Modifier_01, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace, lbSpace|Modifier_07, lbSpace, lbBrickWall;	nRoomBlock
pLevel9_Room18:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate, lbHighButton|Modifier_05, lbDoor|Modifier_02, lbPlate, lbSpace|Modifier_01, lbSpace, lbHighButton|Modifier_04, lbSpace|Modifier_01, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbDoubleColumns, lbSpace, lbSpace,	lbBrickWall, lbSpikesPlate, lbSpikesPlate, lbBrickWall;	nRoomBlock
pLevel9_Room19:	.BYTE lbPlate, lbSpace|Modifier_01, lbSpace, lbSpace, lbSpace, lbSpace,	lbSpace, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace; nRoomBlock
		.BYTE lbDoubleColumns, lbSpace,	lbSpace, lbPlate, lbPlate|Modifier_01, lbPlateWithTorch, lbPlate|Modifier_01, lbPlateWithTorch,	lbPlate|Modifier_01, lbPlate; nRoomBlock
		.BYTE lbDoubleColumns, lbSpikesPlate, lbPlate, lbDoubleColumns,	lbSpace, lbSpace, lbDoubleColumns, lbPlate|Modifier_01,	lbHealthPotion|Modifier_01, lbBrickWall; nRoomBlock
pLevel9_Room20:	.BYTE lbPlate|Modifier_01, lbPlateWithTorch, lbPlateWithTorch, lbPlate,	lbPlate, lbPlate, lbPlate|Modifier_01, lbSpace,	lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbPlate, lbDoubleColumns,	lbCutters, lbPlate|Modifier_01,	lbDoubleColumns, lbPlate, lbDoubleColumns, lbPlate, lbHighButton|Modifier_01, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel9_Room21:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbDoubleColumns, lbPlate|Modifier_01, lbPlate|Modifier_07, lbDoubleColumns, lbCutters, lbPlate|Modifier_01, lbDoubleColumns, lbCutters, lbPlate|Modifier_01, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel9_Room22:	.BYTE lbHighButton|Modifier_02,	lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace,	lbPlate|Modifier_07, lbPlate|Modifier_07, lbPlate|Modifier_07, lbPlate|Modifier_07, lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbSpace|Modifier_01,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace, lbCastleOverDoor, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbDoubleColumns, lbPlateWithTorch, lbSpikesPlate,	lbPlate, lbPlate|Modifier_01, lbDoor|Modifier_01, lbPlate|Modifier_01, lbLowButton|Modifier_01,	lbPlate, lbDoubleColumns; nRoomBlock
pLevel9_Room23:	.BYTE lbPlate, lbPlate|Modifier_01, lbPlate, lbPlate|Modifier_01, lbDoubleColumns, lbCutters, lbPlate|Modifier_01, lbPlate, lbPlate|Modifier_01, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel9_Room24:	.BYTE lbSpace|Modifier_01, lbSpace, lbDoubleColumns, lbPlate, lbPlate, lbDoubleColumns,	lbPlate, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlateWithDebris, lbPlateWithDebris, lbDoubleColumns, lbSpace|Modifier_01, lbSpace|Modifier_07, lbDoubleColumns,	lbPlateWithTorch, lbPlateWithTorch, lbPlate|Modifier_01, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbDoubleColumns, lbSpace|Modifier_01, lbSpace|Modifier_07, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel9_Geom:	ROOM_NEIGHBORS 0, 23, 24, 0 ;	...
		ROOM_NEIGHBORS 23, 5, 3, 4
		ROOM_NEIGHBORS 21, 8, 19, 2
		ROOM_NEIGHBORS 0, 9, 2, 0
		ROOM_NEIGHBORS 2, 13, 8, 9
		ROOM_NEIGHBORS 0, 10, 0, 7
		ROOM_NEIGHBORS 0, 24, 6, 0
		ROOM_NEIGHBORS 3, 12, 17, 5
		ROOM_NEIGHBORS 4, 11, 5, 0
		ROOM_NEIGHBORS 6, 22, 0, 24
		ROOM_NEIGHBORS 9, 14, 13, 0
		ROOM_NEIGHBORS 8, 16, 18, 13
		ROOM_NEIGHBORS 5, 15, 12, 11
		ROOM_NEIGHBORS 11, 0, 15, 0
		ROOM_NEIGHBORS 13, 0, 16, 14
		ROOM_NEIGHBORS 12, 20,	0, 15
		ROOM_NEIGHBORS 19, 18,	0, 8
		ROOM_NEIGHBORS 17, 0, 0, 12
		ROOM_NEIGHBORS 22, 17,	0, 3
		ROOM_NEIGHBORS 16, 0, 0, 0
		ROOM_NEIGHBORS 24, 3, 22, 23
		ROOM_NEIGHBORS 10, 19,	0, 21
		ROOM_NEIGHBORS 1, 2, 21, 0
		ROOM_NEIGHBORS 7, 21, 10, 1
pLevel9_Header:	LEVEL_HEADER 11, X_6_Y_1, DIRECTION_LEFT ; ...
pLevel9_Guards:	.BYTE NO_PLACE,	X_7_Y_0, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT,	NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT; nGuardPlace
		.BYTE NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT,	X_7_Y_2|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT; nGuardPlace
		.BYTE X_0_Y_1|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE, X_2_Y_0|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT,	NO_PLACE|RESIDUAL_BIT; nGuardPlace
pLevel9_DoorLinks:DOOR_LINK 5,	X_1_Y_0, ACTION_OPEN_DOOR, 5, X_3_Y_2
		DOOR_LINK 5, X_8_Y_2, ACTION_OPEN_DOOR, 2, X_9_Y_0
		DOOR_LINK 9, X_4_Y_1, ACTION_CLOSE_DOOR, 4, X_9_Y_1
		DOOR_LINK 9, X_8_Y_1, ACTION_OPEN_DOOR, 4, X_9_Y_1
		DOOR_LINK 10, X_8_Y_2,	ACTION_OPEN_DOOR, 10, X_9_Y_2
		DOOR_LINK 10, X_8_Y_2,	ACTION_OPEN_DOOR, 22, X_5_Y_2
		DOOR_LINK 12, X_8_Y_1,	ACTION_OPEN_DOOR, 12, X_9_Y_1
		DOOR_LINK 16, X_1_Y_1,	ACTION_CLOSE_DOOR, 12, X_9_Y_1
		DOOR_LINK 18, X_1_Y_1,	ACTION_OPEN_DOOR, 18, X_2_Y_1
		DOOR_LINK 18, X_6_Y_1,	ACTION_OPEN_DOOR, 18, X_2_Y_1
		DOOR_LINK 20, X_8_Y_1,	ACTION_OPEN_DOOR, 12, X_9_Y_1
		DOOR_LINK 22, X_0_Y_0,	ACTION_OPEN_DOOR, 10, X_9_Y_2
		DOOR_LINK 22, X_7_Y_2,	ACTION_CLOSE_DOOR, 22, X_5_Y_2
		DOOR_LINK 23, X_0_Y_0,	ACTION_OPEN_DOOR, 1, X_6_Y_0
		.BYTE $FF
		DOOR_LINK 1, X_7_Y_1, ACTION_OPEN_DOOR, 1, X_6_Y_0
		DOOR_LINK 1, X_0_Y_1, ACTION_OPEN_DOOR, 1, X_1_Y_1
pLevel10_Rooms:	.BYTE lbPlate, lbPlate,	lbSpace|Modifier_02, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_02, lbSpace|Modifier_01, lbPlate|Modifier_02, lbPlate, lbPlate|Modifier_02; nRoomBlock ; ...
		.BYTE lbSpace|Modifier_01, lbDoubleColumns, lbPlateWithTorch, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart, lbPlateWithTorch, lbPlate, lbDoubleColumns, lbPlate,	lbCastleOverDoorWithPlate; nRoomBlock
		.BYTE lbPlate, lbDoubleColumns,	lbPlate|Modifier_02, lbPlate, lbHighButton|Modifier_01,	lbPlate|Modifier_02, lbPlate, lbDoubleColumns, lbPlate,	lbDoor|Modifier_01; nRoomBlock
pLevel10_Room2:	.BYTE lbHighButton|Modifier_04,	lbDoubleColumns, lbPlate, lbPlate, lbPlate, lbPlate, lbPlateWithTorch, lbPlate,	lbDoubleColumns, lbPlate; nRoomBlock
		.BYTE lbSpace, lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart, lbCastleLeftPartBigArch, lbCastleRightPartBigArch, lbCastleArchColumnPart, lbCastleSmallArch,	lbCastleArchColumnPart,	lbCastleSmallArch; nRoomBlock
		.BYTE lbPlate, lbCastleOneColumn, lbBrokenPlate, lbCastleOneColumn, lbPlateWithTorch, lbHealthPotion|Modifier_01, lbCastleOneColumn, lbPlate, lbCastleOneColumn, lbPlate; nRoomBlock
pLevel10_Room3:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbDoubleColumns, lbPlate,	lbPlateWithTorch, lbExitDoorLeftPart, lbExitDoorRightPart, lbPlateWithTorch, lbPlate, lbPlate, lbDoubleColumns,	lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel10_Room4:	.BYTE lbBrickWall, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpace|Modifier_01;	nRoomBlock
		.BYTE lbBrickWall, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbSpace|Modifier_07; nRoomBlock
		.BYTE lbBrickWall, lbSpikesPlate, lbSpikesPlate, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbPlate;	nRoomBlock
pLevel10_Room5:	.BYTE lbPlate, lbPlateWithDebris, lbPlate, lbPlate, lbPlate, lbPlate, lbPlate, lbDoubleColumns,	lbPlate, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbSpace|Modifier_07, lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart, lbCastleLeftPartBigArch, lbCastleRightPartBigArch, lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart, lbCastleOverDoor|Modifier_02; nRoomBlock
		.BYTE lbPlate, lbCastleOneColumn, lbPlate, lbCastleOneColumn, lbPlate, lbPlate,	lbCastleOneColumn, lbHighButton|Modifier_04, lbPlate, lbDoor|Modifier_02; nRoomBlock
pLevel10_Room6:	.BYTE $FF
pLevel10_Room7:	.BYTE lbDoubleColumns, lbPlate,	lbPlate, lbPlate, lbPlate, lbPlate, lbPlate, lbPlate, lbPlate, lbPlate;	nRoomBlock
		.BYTE lbCastleSmallArch, lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart, lbCastleLeftPartBigArch, lbCastleRightPartBigArch, lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart, lbCastleOverDoor|Modifier_01;	nRoomBlock
		.BYTE lbPlate, lbCastleOneColumn, lbHighButton|Modifier_04, lbCastleOneColumn, lbPlateWithTorch, lbPlate, lbCastleOneColumn, lbPlate|Modifier_02, lbPlate, lbDoor|Modifier_02; nRoomBlock
pLevel10_Room8:	.BYTE lbSpace|Modifier_01, lbPlate, lbHighButton|Modifier_03, lbPlate, lbPlate,	lbPlate|Modifier_02, lbPlate, lbPlate, lbPlate,	lbDoor|Modifier_04; nRoomBlock
		.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbBigColumnHighPart, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBigColumnHighPart, lbSpace|Modifier_07, lbCastleOverDoor; nRoomBlock
		.BYTE lbPlate, lbPlate,	lbBigColumnLowPart, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart, lbPlateWithTorch, lbPlate, lbBigColumnLowPart,	lbPlate, lbDoor|Modifier_01; nRoomBlock
pLevel10_Room9:	.BYTE $FF
pLevel10_Room10:.BYTE lbSpace|Modifier_01, lbSpace|Modifier_01,	lbDoubleColumns, lbPlate|Modifier_02, lbPlate, lbPlate,	lbCastleOverDoorWithPlate, lbSpace|Modifier_01,	lbSpace|Modifier_01, lbSpace|Modifier_01; nRoomBlock
		.BYTE lbSpace|Modifier_01, lbSpace|Modifier_01,	lbDoubleColumns, lbPlate|Modifier_02, lbPlate, lbLowButton|Modifier_01,	lbDoor|Modifier_02, lbPlate, lbPlate, lbPlate; nRoomBlock
		.BYTE lbPlate, lbPlate,	lbDoubleColumns, lbHighButton|Modifier_04, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel10_Room11:.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate, lbSpace|Modifier_01, lbHighButton|Modifier_04, lbPlate, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall; nRoomBlock
pLevel10_Room12:.BYTE lbBrickWall, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbPlateWithTorch, lbExitDoorLeftPart, lbExitDoorRightPart, lbPlateWithTorch,	lbLowButton|Modifier_03, lbPlate, lbHealthPotion|Modifier_01, lbPlate, lbPlate;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel10_Room13:.BYTE $FF
pLevel10_Room14:.BYTE lbSpace|Modifier_01, lbSpace|Modifier_01,	lbPlate, lbPlate, lbPlateWithTorch, lbPlateWithTorch, lbPlate, lbDoubleColumns,	lbPlateWithDebris, lbPlate; nRoomBlock
		.BYTE lbPlate, lbPlate,	lbDoubleColumns, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpikesPlate, lbSpikesPlate, lbSpikesPlate, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel10_Room15:.BYTE lbPlateWithTorch,	lbPlateWithTorch, lbPlate, lbPlate|Modifier_02,	lbPlate, lbPlateWithTorch, lbPlateWithTorch, lbPlate, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel10_Room16:.BYTE lbSpace|Modifier_03, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbSpace, lbSpace,	lbSpace, lbSpace, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate, lbPlate,	lbPlate, lbBrokenPlate,	lbPlate, lbPlate, lbBrickWall, lbPlate,	lbSpace|Modifier_01, lbPlate; nRoomBlock
pLevel10_Room17:.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlateWithTorch,	lbPlateWithTorch, lbPlate, lbPlate|Modifier_02,	lbHealthPotion|Modifier_01, lbPlateWithTorch, lbPlateWithTorch,	lbPlate, lbBrickWall, lbBrickWall; nRoomBlock
pLevel10_Room18:.BYTE lbBrickWall|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_03, lbSpace|Modifier_03, lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_03, lbSpace|Modifier_03, lbSpace|Modifier_07, lbSpace|Modifier_07; nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07; nRoomBlock
		.BYTE lbBrickWall, lbPlate, lbPlate, lbPlate, lbBrokenPlate, lbPlate, lbPlate, lbPlate,	lbPlate, lbPlate; nRoomBlock
pLevel10_Room19:.BYTE lbSpace|Modifier_03, lbSpace|Modifier_03,	lbSpace, lbSpace, lbSpace, lbSpace, lbSpace|Modifier_03, lbSpace|Modifier_03, lbSpace, lbSpace;	nRoomBlock
		.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace; nRoomBlock
		.BYTE lbPlate, lbPlate,	lbPlateWithTorch, lbPlate, lbBrokenPlate, lbPlateWithTorch, lbPlate, lbPlate, lbPlate, lbPlate;	nRoomBlock
pLevel10_Room20:.BYTE lbSpace|Modifier_07, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbSpace|Modifier_07, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel10_Room21:.BYTE $FF
pLevel10_Room22:.BYTE $FF
pLevel10_Room23:.BYTE $FF
pLevel10_Room24:.BYTE $FF
pLevel10_Geom:	ROOM_NEIGHBORS 5, 2, 0, 3 ; ...
		ROOM_NEIGHBORS 1, 7, 0, 4
		ROOM_NEIGHBORS 12, 1, 0, 8
		ROOM_NEIGHBORS 3, 20, 2, 0
		ROOM_NEIGHBORS 8, 1, 11, 0
		ROOM_NEIGHBORS 11, 13,	0, 1
		ROOM_NEIGHBORS 2, 10, 18, 20
		ROOM_NEIGHBORS 0, 5, 12, 0
		ROOM_NEIGHBORS 0, 8, 0, 0
		ROOM_NEIGHBORS 7, 14, 19, 0
		ROOM_NEIGHBORS 12, 0, 0, 5
		ROOM_NEIGHBORS 0, 3, 0, 8
		ROOM_NEIGHBORS 0, 18, 0, 2
		ROOM_NEIGHBORS 10, 15,	16, 0
		ROOM_NEIGHBORS 14, 0, 17, 0
		ROOM_NEIGHBORS 19, 17,	0, 14
		ROOM_NEIGHBORS 16, 0, 0, 15
		ROOM_NEIGHBORS 0, 19, 0, 7
		ROOM_NEIGHBORS 18, 16,	0, 10
		ROOM_NEIGHBORS 4, 0, 7, 0
		ROOM_NEIGHBORS 3, 5, 0, 0
		ROOM_NEIGHBORS 18, 19,	0, 14
		ROOM_NEIGHBORS 20, 24,	0, 12
		ROOM_NEIGHBORS 23, 4, 0, 10
pLevel10_Header:LEVEL_HEADER 1, X_4_Y_1, DIRECTION_LEFT ; ...
pLevel10_Guards:.BYTE NO_PLACE,	NO_PLACE, NO_PLACE, NO_PLACE, X_2_Y_0, NO_PLACE|RESIDUAL_BIT, X_6_Y_0, X_4_Y_0;	nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, X_6_Y_0, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT; nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT,	NO_PLACE|RESIDUAL_BIT; nGuardPlace
pLevel10_DoorLinks:DOOR_LINK 1, X_8_Y_1, ACTION_OPEN_DOOR, 1, X_9_Y_2
		DOOR_LINK 1, X_4_Y_2, ACTION_OPEN_DOOR, 5, X_9_Y_2
		DOOR_LINK 5, X_7_Y_2, ACTION_OPEN_DOOR, 8, X_9_Y_2
		DOOR_LINK 1, X_4_Y_2, ACTION_OPEN_DOOR, 1, X_9_Y_2
		DOOR_LINK 2, X_0_Y_0, ACTION_OPEN_DOOR, 5, X_9_Y_0
		DOOR_LINK 4, X_2_Y_2, ACTION_CLOSE_DOOR, 1, X_9_Y_2
		DOOR_LINK 5, X_7_Y_2, ACTION_OPEN_DOOR, 5, X_9_Y_2
		DOOR_LINK 7, X_2_Y_2, ACTION_OPEN_DOOR, 1, X_9_Y_2
		DOOR_LINK 7, X_2_Y_2, ACTION_OPEN_DOOR, 7, X_9_Y_2
		DOOR_LINK 10, X_3_Y_2,	ACTION_OPEN_DOOR, 7, X_6_Y_2
		DOOR_LINK 10, X_3_Y_2,	ACTION_OPEN_DOOR, 10, X_6_Y_1
		DOOR_LINK 10, X_5_Y_1,	ACTION_CLOSE_DOOR, 10, X_6_Y_1
		DOOR_LINK 11, X_2_Y_2,	ACTION_OPEN_DOOR, 8, X_9_Y_0
		DOOR_LINK 23, X_1_Y_0,	ACTION_OPEN_DOOR, 8, X_9_Y_0
		.BYTE $FF
		DOOR_LINK 10, X_6_Y_1,	ACTION_CLOSE_DOOR, 10, X_7_Y_1
		DOOR_LINK 8, X_8_Y_2, ACTION_OPEN_DOOR, 8, X_9_Y_2
		DOOR_LINK 2, X_7_Y_0, ACTION_OPEN_DOOR, 1, X_9_Y_0
		DOOR_LINK 2, X_7_Y_0, ACTION_OPEN_DOOR, 1, X_7_Y_0
		DOOR_LINK 4, X_0_Y_2, ACTION_CLOSE_DOOR, 1, X_7_Y_2
		DOOR_LINK 1, X_8_Y_1, ACTION_OPEN_DOOR, 1, X_7_Y_2
		DOOR_LINK 1, X_4_Y_2, ACTION_OPEN_DOOR, 1, X_7_Y_2
		DOOR_LINK 7, X_2_Y_2, ACTION_OPEN_DOOR, 1, X_7_Y_2
		DOOR_LINK 8, X_1_Y_0, ACTION_OPEN_DOOR, 8, X_9_Y_2
pLevel11_Rooms:	.BYTE lbPlate, lbPlateWithDebris, lbPlate|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_02, lbPlate, lbPlate, lbPlate|Modifier_07; nRoomBlock ; ...
		.BYTE lbBrickWall, lbBrickWall,	lbDoubleColumns|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbPlate, lbBrokenPlate, lbPlate|Modifier_01, lbBrokenPlate, lbDoubleColumns, lbHealthPotion|Modifier_01, lbBrickWall; nRoomBlock
pLevel11_Room2:	.BYTE lbPlate, lbPlateWithDebris, lbDoubleColumns, lbSpace|Modifier_01,	lbSpace|Modifier_02, lbSpace|Modifier_01, lbCastleOverDoor|Modifier_02,	lbSpace|Modifier_02, lbSpace|Modifier_01, lbSpace|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbHighButton|Modifier_05, lbDoubleColumns, lbSpace|Modifier_02, lbPlateWithTorch, lbLowButton|Modifier_02, lbDoor|Modifier_02, lbPlate, lbPlate, lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel11_Room3:	.BYTE lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall, lbSpace|Modifier_01, lbSpace|Modifier_03, lbBrickWall,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbSpace, lbSpace, lbBrickWall,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace|Modifier_01, lbSpace|Modifier_01, lbBrickWall, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel11_Room4:	.BYTE lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall, lbSpace, lbSpace, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpikesPlate, lbSpikesPlate, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel11_Room5:	.BYTE lbBrickWall, lbBrickWall|Modifier_01, lbSpace|Modifier_03, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_01, lbSpace|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbPlate, lbSpikesPlate,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel11_Room6:	.BYTE lbBrickWall, lbPlate, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01,	lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbPlate|Modifier_07; nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart,	lbPlateWithTorch, lbPlate|Modifier_01, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall|Modifier_01, lbSpace, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel11_Room7:	.BYTE lbSpace|Modifier_03, lbSpace|Modifier_03,	lbSpace, lbSpace, lbSpace|Modifier_03, lbSpace|Modifier_03, lbSpace, lbSpace, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbPlate, lbSpace|Modifier_02, lbPlate, lbPlate, lbPlate, lbSpace,	lbPlate, lbPlate, lbBrickWall, lbBrickWall; nRoomBlock
pLevel11_Room8:	.BYTE lbSpace, lbSpace|Modifier_03, lbSpace|Modifier_03, lbSpace, lbSpace, lbSpace|Modifier_03,	lbSpace|Modifier_03, lbSpace, lbSpace, lbSpace;	nRoomBlock
		.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07;	nRoomBlock
		.BYTE lbPlate, lbSpace|Modifier_01, lbPlate, lbPlate, lbPlate, lbPlate,	lbPlate, lbPlate, lbPlate, lbPlate; nRoomBlock
pLevel11_Room9:	.BYTE lbBrickWall, lbSpace, lbSpace|Modifier_03, lbSpace|Modifier_03, lbSpace, lbSpace|Modifier_03, lbSpace|Modifier_03, lbSpace, lbSpace, lbSpace; nRoomBlock
		.BYTE lbBrickWall, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07;	nRoomBlock
		.BYTE lbBrickWall, lbSpace|Modifier_01,	lbPlate, lbHealthPotion|Modifier_01, lbPlate, lbPlate, lbPlate,	lbPlate, lbPlate, lbPlate; nRoomBlock
pLevel11_Room10:.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbPlate, lbPlateWithDebris, lbPlate, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel11_Room11:.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbSpace,	lbSpace, lbSpace, lbSpace, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbSpace,	lbSpace, lbSpace, lbSpace, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbPlate,	lbPlate, lbPlate, lbPlate, lbBrickWall;	nRoomBlock
pLevel11_Room12:.BYTE $FF
pLevel11_Room13:.BYTE lbPlate, lbPlate,	lbPlate, lbBrokenPlate,	lbPlate, lbPlate, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbHighButton|Modifier_03, lbPlate, lbPlate, lbDoubleColumns,	lbPlate, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall; nRoomBlock
pLevel11_Room14:.BYTE lbSpace|Modifier_07, lbSpace|Modifier_03,	lbSpace|Modifier_03, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_03, lbSpace|Modifier_03, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07;	nRoomBlock
		.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07;	nRoomBlock
		.BYTE lbPlate, lbSpace|Modifier_01, lbPlate, lbHealthPotion|Modifier_01, lbPlate, lbPlate, lbPlate, lbPlate, lbPlate, lbPlate; nRoomBlock
pLevel11_Room15:.BYTE lbPlate, lbPlateWithDebris, lbPlateWithTorch, lbCutters, lbPlate|Modifier_02, lbPlate, lbPlateWithTorch, lbPlate|Modifier_02, lbPlate, lbPlate; nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel11_Room16:.BYTE lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace, lbPlate, lbPlate,	lbPlate, lbPlate, lbPlate, lbPlate; nRoomBlock
		.BYTE lbPlateWithTorch,	lbPlate|Modifier_02, lbPlateWithTorch, lbPlate,	lbDoubleColumns, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01,	lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace, lbBrickWall; nRoomBlock
pLevel11_Room17:.BYTE $FF
pLevel11_Room18:.BYTE $FF
pLevel11_Room19:.BYTE lbSpace|Modifier_01, lbSpace|Modifier_01,	lbSpace|Modifier_03, lbSpace|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_03, lbSpace|Modifier_01, lbCastleOverDoor|Modifier_01, lbSpace|Modifier_01, lbSpace|Modifier_01; nRoomBlock
		.BYTE lbPlateWithTorch,	lbPlateWithTorch, lbPlate, lbBrokenPlate, lbBrokenPlate, lbBrokenPlate,	lbPlate, lbDoor|Modifier_02, lbPlate|Modifier_07, lbPlate|Modifier_07; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall|Modifier_01, lbSpace, lbSpace, lbSpace, lbSpace,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel11_Room20:.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbPlate, lbHealthPotion|Modifier_01,	lbPlate, lbBrokenPlate,	lbPlate, lbPlate, lbPlate, lbBrickWall,	lbBrickWall; nRoomBlock
pLevel11_Room21:.BYTE lbBrickWall, lbBrickWall|Modifier_01, lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace|Modifier_03,	lbSpace, lbSpace|Modifier_07, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbPlate, lbPlate, lbPlate, lbPlate, lbPlate, lbPlate, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel11_Room22:.BYTE lbSpace|Modifier_01, lbPlate, lbPlate, lbPlateWithTorch, lbPlate,	lbPlate, lbPlateWithTorch, lbPlate, lbPlate, lbSpace; nRoomBlock
		.BYTE lbPlate, lbDoubleColumns,	lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbSpace|Modifier_01; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpikesPlate, lbSpikesPlate, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbPlate;	nRoomBlock
pLevel11_Room23:.BYTE lbBrickWall, lbBrickWall,	lbBrickWall|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbPlate, lbPlate, lbDoubleColumns,	lbPlate, lbPlate, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel11_Room24:.BYTE lbSpace|Modifier_03, lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace;	nRoomBlock
		.BYTE lbSpace|Modifier_01, lbSpace|Modifier_02,	lbSpace|Modifier_01, lbPlate, lbPlate, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart, lbPlateWithTorch, lbPlate, lbPlate;	nRoomBlock
		.BYTE lbSpikesPlate, lbSpikesPlate, lbSpace|Modifier_01, lbDoubleColumns, lbPlate, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel11_Geom:	ROOM_NEIGHBORS 6, 15, 8, 3 ; ...
		ROOM_NEIGHBORS 15, 19,	7, 4
		ROOM_NEIGHBORS 10, 0, 1, 23
		ROOM_NEIGHBORS 0, 21, 2, 0
		ROOM_NEIGHBORS 0, 11, 24, 0
		ROOM_NEIGHBORS 0, 1, 9, 10
		ROOM_NEIGHBORS 14, 0, 0, 2
		ROOM_NEIGHBORS 9, 14, 0, 1
		ROOM_NEIGHBORS 0, 8, 0, 6
		ROOM_NEIGHBORS 0, 3, 6, 0
		ROOM_NEIGHBORS 5, 0, 16, 0
		ROOM_NEIGHBORS 0, 9, 0, 0
		ROOM_NEIGHBORS 16, 0, 0, 0
		ROOM_NEIGHBORS 8, 7, 0, 15
		ROOM_NEIGHBORS 1, 2, 14, 0
		ROOM_NEIGHBORS 24, 13,	0, 11
		ROOM_NEIGHBORS 0, 6, 0, 0
		ROOM_NEIGHBORS 16, 0, 0, 0
		ROOM_NEIGHBORS 2, 22, 0, 21
		ROOM_NEIGHBORS 0, 0, 0, 22
		ROOM_NEIGHBORS 4, 0, 19, 0
		ROOM_NEIGHBORS 19, 24,	20, 0
		ROOM_NEIGHBORS 0, 0, 3, 0
		ROOM_NEIGHBORS 22, 16,	0, 5
pLevel11_Header:LEVEL_HEADER 6, X_6_Y_1, DIRECTION_RIGHT ; ...
pLevel11_Guards:.BYTE NO_PLACE,	NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE; nGuardPlace
		.BYTE NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE, X_7_Y_0|RESIDUAL_BIT, X_8_Y_0;	nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, X_8_Y_0|RESIDUAL_BIT,	NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT; nGuardPlace
pLevel11_DoorLinks:DOOR_LINK 2, X_1_Y_1, ACTION_OPEN_DOOR, 19,	X_7_Y_1
		DOOR_LINK 2, X_1_Y_1, ACTION_OPEN_DOOR, 2, X_6_Y_1
		DOOR_LINK 2, X_3_Y_1, ACTION_CLOSE_DOOR, 2, X_6_Y_1
		DOOR_LINK 2, X_4_Y_1, ACTION_CLOSE_DOOR, 2, X_6_Y_1
		DOOR_LINK 2, X_5_Y_1, ACTION_CLOSE_DOOR, 2, X_6_Y_1
		DOOR_LINK 2, X_6_Y_1, ACTION_CLOSE_DOOR, 2, X_6_Y_1
		.BYTE $FF
		DOOR_LINK 13, X_1_Y_1,	ACTION_OPEN_DOOR, 24, X_6_Y_1
pLevel12_Rooms:	.BYTE lbBrickWall, lbPlate|Modifier_01,	lbDoubleColumns, lbPlate, lbSpace|Modifier_03, lbSpace|Modifier_01, lbSpace, lbPlate, lbDoubleColumns, lbPlate;	nRoomBlock ; ...
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace, lbSpace, lbSpace,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbDoubleColumns, lbSpace, lbSpace, lbSpace|Modifier_01, lbSpace, lbSpace, lbDoubleColumns, lbPlate, lbBrickWall; nRoomBlock
pLevel12_Room2:	.BYTE lbPlate, lbPlate,	lbPlate, lbPlate, lbPlate, lbPlate, lbPlate, lbPlate|Modifier_01, lbPlateWithTorch, lbPlate; nRoomBlock
		.BYTE lbSpace|Modifier_07, lbSpace|Modifier_03,	lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace|Modifier_03, lbSpace,	lbSpace|Modifier_07, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbSpace, lbSpace,	lbSpace|Modifier_07, lbSpace, lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel12_Room3:	.BYTE lbBrickWall, lbDoubleColumns, lbSpace|Modifier_01, lbSpace|Modifier_03, lbSpace|Modifier_03, lbSpace, lbSpace, lbDoubleColumns, lbPlate, lbDoubleColumns;	nRoomBlock
		.BYTE lbBrickWall, lbDoubleColumns, lbSpace, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbDoubleColumns, lbPlateWithTorch, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart, lbPlateWithTorch, lbPlate, lbDoubleColumns, lbPlate,	lbDoubleColumns; nRoomBlock
pLevel12_Room4:	.BYTE lbSpace|Modifier_03, lbSpace, lbDoubleColumns, lbPlate, lbDoubleColumns, lbSpace|Modifier_03, lbSpace|Modifier_03, lbSpace, lbSpace, lbBrickWall;	nRoomBlock
		.BYTE lbSpace, lbSpace,	lbDoubleColumns, lbPlate, lbDoubleColumns, lbSpace, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall;	nRoomBlock
		.BYTE lbPlate|Modifier_01, lbPlate, lbBrickWall, lbBrickWall, lbBrickWall, lbPlate, lbPlateWithTorch, lbPlateWithDebris, lbPlateWithDebris, lbBrickWall; nRoomBlock
pLevel12_Room5:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall;	nRoomBlock
		.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall;	nRoomBlock
pLevel12_Room6:	.BYTE lbBrickWall, lbBrickWall,	lbDoubleColumns, lbSpace, lbSpace, lbSpace, lbPlate, lbPlate, lbDoubleColumns, lbPlate;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace, lbSpace|Modifier_03, lbSpace|Modifier_07,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace, lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel12_Room7:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace|Modifier_01, lbSpace|Modifier_03, lbSpace,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbPlate|Modifier_01,	lbDoubleColumns, lbSpace, lbSpace, lbSpace|Modifier_01,	lbPlate, lbPlate, lbDoubleColumns, lbSpace; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbDoubleColumns, lbSpace, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall, lbSpace;	nRoomBlock
pLevel12_Room8:	.BYTE lbSpace|Modifier_03, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbSpace|Modifier_03, lbSpace|Modifier_03, lbSpace|Modifier_07, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbSpace, lbSpace,	lbPlate, lbDoubleColumns, lbPlate, lbBrokenPlate, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace, lbDoubleColumns; nRoomBlock
		.BYTE lbSpace, lbSpace,	lbBrickWall, lbBrickWall, lbDoubleColumns, lbSpace, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall;	nRoomBlock
pLevel12_Room9:	.BYTE lbBrokenPlate, lbBrokenPlate, lbSpikesPlate, lbPlate, lbDoubleColumns, lbSpace|Modifier_03, lbSpace|Modifier_03, lbSpace,	lbSpace|Modifier_07, lbBrickWall; nRoomBlock
		.BYTE lbSpace, lbSpace,	lbBrickWall, lbBrickWall, lbDoubleColumns, lbSpace, lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall;	nRoomBlock
		.BYTE lbSpace, lbSpace,	lbDoubleColumns, lbPlate|Modifier_01, lbDoubleColumns, lbSpace,	lbSpace, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall;	nRoomBlock
pLevel12_Room10:.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbSpace, lbSpace,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace, lbSpace, lbSpace|Modifier_07, lbSpace, lbSpace, lbSpace; nRoomBlock
		.BYTE lbSpace, lbSpace,	lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace;	nRoomBlock
pLevel12_Room11:.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpace, lbSpace, lbSpace, lbSpace;	nRoomBlock
pLevel12_Room12:.BYTE lbPlate, lbBrokenPlate, lbBrokenPlate, lbDoubleColumns, lbPlate, lbSpace|Modifier_03, lbSpace|Modifier_03, lbSpace|Modifier_07, lbSpace, lbBrickWall; nRoomBlock
		.BYTE lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall, lbDoubleColumns, lbSpace, lbSpace|Modifier_01, lbSpace, lbPlate, lbDoubleColumns; nRoomBlock
		.BYTE lbSpace, lbSpace,	lbSpace, lbBrickWall, lbBrickWall, lbSpace, lbSpace|Modifier_01, lbSpace|Modifier_07, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel12_Room13:.BYTE lbSpace, lbBigColumnHighPart, lbSpace, lbSpace, lbPlate, lbPlate,	lbPlate, lbPlate, lbPlate, lbPlate; nRoomBlock
		.BYTE lbPlate, lbBigColumnLowPart, lbSpace|Modifier_01,	lbSpace, lbBrickWall, lbBrickWall, lbSpace, lbSpace|Modifier_01, lbSpace, lbSpace; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbPlateWithDebris, lbPlateWithDebris, lbBrickWall, lbBrickWall,	lbSpace, lbSpace, lbSpace, lbSpace; nRoomBlock
pLevel12_Room14:.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate|Modifier_01, lbDoubleColumns, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbDoubleColumns, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel12_Room15:.BYTE lbPlate, lbPlate,	lbPlate|Modifier_01, lbPlateWithTorch, lbPlateWithTorch, lbPlate, lbBrokenPlate, lbPlate, lbSpace, lbSpace; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbSpace, lbSpace, lbSpace,	lbSpace, lbBrickWall, lbPlate|Modifier_01, lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbHighButton|Modifier_04, lbPlate, lbSpace, lbSpace|Modifier_03, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbDoubleColumns,	lbSpace; nRoomBlock
pLevel12_Room16:.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07;	nRoomBlock
		.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07;	nRoomBlock
		.BYTE lbPlate, lbPlate,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07;	nRoomBlock
pLevel12_Room17:.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07;	nRoomBlock
		.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07;	nRoomBlock
		.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07;	nRoomBlock
pLevel12_Room18:.BYTE lbPlate, lbDoor|Modifier_02, lbPlate, lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace, lbPlate, lbDoubleColumns, lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbDoubleColumns, lbSpace, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbDoubleColumns, lbSpace, lbSpace, lbSpace|Modifier_07,	lbSpace, lbDoubleColumns, lbPlate, lbSpace; nRoomBlock
pLevel12_Room19:.BYTE lbPlate, lbBrokenPlate, lbBrokenPlate, lbPlate, lbDoubleColumns, lbSpace|Modifier_03, lbSpace|Modifier_03, lbSpace, lbSpace, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbSpace,	lbSpace, lbSpace, lbSpace, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbSpace, lbSpace, lbDoubleColumns, lbPlate, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace, lbBrickWall; nRoomBlock
pLevel12_Room20:.BYTE lbSpace|Modifier_03, lbSpace|Modifier_03,	lbSpace, lbSpace, lbSpace, lbSpace|Modifier_03,	lbSpace|Modifier_03, lbSpace|Modifier_02, lbSpace, lbBrickWall;	nRoomBlock
		.BYTE lbPlate|Modifier_01, lbPlate, lbBrokenPlate, lbPlate, lbBrokenPlate, lbPlateWithTorch, lbPlate, lbPlateWithTorch,	lbPlate, lbBrickWall; nRoomBlock
		.BYTE lbSpace|Modifier_01, lbSpace, lbSpace, lbDoubleColumns, lbPlate, lbSpace,	lbSpace|Modifier_01, lbSpace, lbSpace, lbBrickWall; nRoomBlock
pLevel12_Room21:.BYTE lbSpace|Modifier_01, lbSpace|Modifier_03,	lbSpace, lbSpace, lbSpace|Modifier_03, lbSpace,	lbSpace|Modifier_01, lbBrickWall, lbDoubleColumns, lbPlate; nRoomBlock
		.BYTE lbSpace, lbSpace,	lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbSpace|Modifier_01, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace,	lbSpace, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel12_Room22:.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbSpace, lbSpace,	lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace;	nRoomBlock
		.BYTE lbSpace, lbSpace,	lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace;	nRoomBlock
pLevel12_Room23:.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace, lbSpace, lbSpace, lbSpace;	nRoomBlock
		.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbPlate, lbPlate, lbPlate, lbPlate;	nRoomBlock
		.BYTE lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel12_Room24:.BYTE lbBrickWall, lbDoubleColumns, lbSpace, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbPlate, lbDoubleColumns,	lbPlateWithDebris, lbDoubleColumns, lbPlate|Modifier_01, lbPlateWithTorch, lbPlate, lbPlate, lbPlate, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel12_Geom:	ROOM_NEIGHBORS 0, 9, 7, 3 ; ...
		ROOM_NEIGHBORS 13, 15,	10, 21
		ROOM_NEIGHBORS 0, 4, 1, 0
		ROOM_NEIGHBORS 3, 0, 9, 0
		ROOM_NEIGHBORS 22, 0, 0, 20
		ROOM_NEIGHBORS 0, 12, 18, 7
		ROOM_NEIGHBORS 0, 8, 6, 1
		ROOM_NEIGHBORS 7, 24, 12, 9
		ROOM_NEIGHBORS 1, 0, 8, 4
		ROOM_NEIGHBORS 16, 22,	0, 2
		ROOM_NEIGHBORS 0, 21, 13, 17
		ROOM_NEIGHBORS 6, 14, 19, 8
		ROOM_NEIGHBORS 23, 2, 16, 11
		ROOM_NEIGHBORS 12, 0, 0, 24
		ROOM_NEIGHBORS 2, 20, 22, 18
		ROOM_NEIGHBORS 0, 10, 0, 13
		ROOM_NEIGHBORS 0, 0, 11, 0
		ROOM_NEIGHBORS 21, 19,	15, 6
		ROOM_NEIGHBORS 18, 0, 20, 12
		ROOM_NEIGHBORS 15, 0, 5, 19
		ROOM_NEIGHBORS 11, 18,	2, 0
		ROOM_NEIGHBORS 10, 5, 0, 15
		ROOM_NEIGHBORS 0, 13, 0, 0
		ROOM_NEIGHBORS 8, 0, 14, 0
pLevel12_Header:LEVEL_HEADER 3, X_4_Y_2, DIRECTION_RIGHT ; ...
pLevel12_Guards:.BYTE NO_PLACE,	NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE|RESIDUAL_BIT; nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT,	NO_PLACE, NO_PLACE, X_1_Y_0|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT; nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE; nGuardPlace
pLevel12_DoorLinks:DOOR_LINK 15, X_1_Y_2, ACTION_OPEN_DOOR, 18, X_1_Y_0
		DOOR_LINK 21, X_9_Y_0,	ACTION_OPEN_DOOR, 18, X_1_Y_0
		.BYTE $FF
pLevel13_Rooms:	.BYTE lbPlateWithTorch,	lbPlate, lbBrokenPlate,	lbPlate, lbPlate, lbPlate|Modifier_01, lbPlate,	lbPlate, lbPlateWithTorch, lbPlate|Modifier_01;	nRoomBlock ; ...
		.BYTE lbBrickWall, lbBrickWall,	lbSpace, lbSpace, lbSpace, lbSpace|Modifier_01,	lbSpace, lbSpace, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace, lbSpace, lbSpace|Modifier_03, lbSpace,	lbSpace, lbSpace, lbBrickWall, lbBrickWall; nRoomBlock
pLevel13_Room2:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_07;	nRoomBlock
pLevel13_Room3:	.BYTE lbBrickWall, lbBrickWall,	lbSpace, lbSpace|Modifier_01, lbSpace, lbSpace,	lbSpace|Modifier_01, lbPlate, lbSpace, lbPlate|Modifier_01; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbPlateWithTorch, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart, lbPlateWithTorch, lbPlateWithDebris, lbDoubleColumns, lbSpace|Modifier_07, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbDoubleColumns, lbSpace|Modifier_07, lbBrickWall; nRoomBlock
pLevel13_Room4:	.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbDoubleColumns, lbSpace, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbDoubleColumns, lbPlateWithDebris, lbDoubleColumns; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel13_Room5:	.BYTE $FF
pLevel13_Room6:	.BYTE $FF
pLevel13_Room7:	.BYTE $FF
pLevel13_Room8:	.BYTE $FF
pLevel13_Room9:	.BYTE $FF
pLevel13_Room10:.BYTE lbPlate, lbPlate,	lbSpace, lbSpace, lbSpace|Modifier_01, lbSpace,	lbSpace, lbSpace, lbSpace, lbSpace; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_01, lbSpace,	lbSpace|Modifier_07, lbSpace, lbSpace, lbSpace;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace;	nRoomBlock
pLevel13_Room11:.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpace, lbSpace, lbBrickWall, lbBrickWall;	nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbPlate, lbPlate, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel13_Room12:.BYTE $FF
pLevel13_Room13:.BYTE lbSpace, lbBigColumnHighPart, lbSpace, lbSpace, lbPlate, lbPlate,	lbPlate, lbPlate, lbPlate, lbPlate; nRoomBlock
		.BYTE lbPlate, lbBigColumnLowPart, lbSpace|Modifier_01,	lbSpace, lbBrickWall, lbBrickWall, lbSpace, lbSpace|Modifier_01, lbSpace, lbSpace|Modifier_01; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbPlateWithDebris, lbPlateWithDebris, lbBrickWall, lbBrickWall,	lbSpace, lbSpace, lbSpace, lbSpace; nRoomBlock
pLevel13_Room14:.BYTE $FF
pLevel13_Room15:.BYTE $FF
pLevel13_Room16:.BYTE lbBrickWall, lbBrickWall,	lbSpace|Modifier_01, lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace, lbSpace, lbBigColumnHighPart, lbSpace|Modifier_01;	nRoomBlock
		.BYTE lbPlate|Modifier_01, lbDoubleColumns, lbPlateWithDebris, lbPlateWithDebris, lbPlateWithDebris, lbPlate, lbBrokenPlate, lbBrokenPlate, lbBigColumnLowPart,	lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbSpace|Modifier_01, lbSpace, lbBrickWall, lbBrickWall; nRoomBlock
pLevel13_Room17:.BYTE lbPlateWithTorch,	lbPlate|Modifier_01, lbSpace, lbSpace, lbSpace,	lbSpace, lbSpace, lbSpace, lbPlateWithTorch, lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace, lbSpace, lbSpace, lbSpace|Modifier_01,	lbSpace, lbSpace, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbSpace, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel13_Room18:.BYTE $FF
pLevel13_Room19:.BYTE $FF
pLevel13_Room20:.BYTE $FF
pLevel13_Room21:.BYTE $FF
pLevel13_Room22:.BYTE $FF
pLevel13_Room23:.BYTE lbSpace, lbBigColumnHighPart, lbSpace, lbSpace|Modifier_03, lbSpace|Modifier_01, lbSpace|Modifier_03, lbSpace, lbSpace|Modifier_01, lbBigColumnHighPart, lbSpace;	nRoomBlock
		.BYTE lbPlate, lbBigColumnLowPart, lbPlate, lbPlateWithDebris, lbPlateWithDebris, lbPlateWithDebris, lbPlateWithDebris,	lbPlate, lbBigColumnLowPart, lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel13_Room24:.BYTE $FF
pLevel13_Geom:	ROOM_NEIGHBORS 3, 17, 0, 16 ;	...
		ROOM_NEIGHBORS 0, 0, 13, 0
		ROOM_NEIGHBORS 0, 1, 0, 4
		ROOM_NEIGHBORS 24, 16,	3, 0
		ROOM_NEIGHBORS 24, 16,	0, 0
		ROOM_NEIGHBORS 0, 12, 18, 7
		ROOM_NEIGHBORS 0, 8, 6, 1
		ROOM_NEIGHBORS 7, 24, 12, 9
		ROOM_NEIGHBORS 1, 0, 8, 4
		ROOM_NEIGHBORS 17, 0, 0, 13
		ROOM_NEIGHBORS 0, 0, 16, 0
		ROOM_NEIGHBORS 6, 14, 19, 8
		ROOM_NEIGHBORS 23, 0, 10, 2
		ROOM_NEIGHBORS 12, 0, 0, 24
		ROOM_NEIGHBORS 13, 20,	22, 18
		ROOM_NEIGHBORS 4, 23, 1, 11
		ROOM_NEIGHBORS 1, 10, 0, 23
		ROOM_NEIGHBORS 21, 19,	15, 6
		ROOM_NEIGHBORS 18, 0, 20, 12
		ROOM_NEIGHBORS 15, 0, 0, 19
		ROOM_NEIGHBORS 2, 0, 13, 0
		ROOM_NEIGHBORS 10, 0, 0, 15
		ROOM_NEIGHBORS 16, 13,	17, 0
		ROOM_NEIGHBORS 0, 4, 0, 0
pLevel13_Header:LEVEL_HEADER 13, X_0_Y_1, DIRECTION_RIGHT ; ...
pLevel13_Guards:.BYTE X_7_Y_0, NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE|RESIDUAL_BIT; nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT,	NO_PLACE, NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT; nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE; nGuardPlace
pLevel13_DoorLinks:DOOR_LINK 15, X_1_Y_2, ACTION_OPEN_DOOR, 5,	X_4_Y_2
		DOOR_LINK 15, X_1_Y_2,	ACTION_OPEN_DOOR, 3, X_3_Y_1
		DOOR_LINK 24, X_0_Y_0,	ACTION_OPEN_DOOR, 3, X_3_Y_1
		.BYTE $FF
pLevel14_Rooms:	.BYTE lbSpace, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbCastleOverDoor; nRoomBlock ; ...
		.BYTE lbPlate, lbPlate,	lbPlateWithLeftPartOfWindow, lbPlateWithWindow,	lbPlate, lbPlateWithLeftPartOfWindow, lbPlateWithWindow, lbPlateWithTorch, lbHighButton|Modifier_04, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel14_Room2:	.BYTE lbSpace|Modifier_07, lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart, lbCastleLeftPartBigArch, lbCastleRightPartBigArch, lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart, lbCastleSmallArch; nRoomBlock
		.BYTE lbPlate|Modifier_07, lbCastleOneColumn, lbPlate|Modifier_02, lbCastleOneColumn, lbPlateWithTorch,	lbPlate|Modifier_07, lbCastleOneColumn,	lbHighButton|Modifier_02, lbCastleOneColumn, lbPlate; nRoomBlock
		.BYTE lbBrickWall|Modifier_01, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
pLevel14_Room3:	.BYTE lbCastleArchColumnPart, lbCastleSmallArch, lbCastleArchColumnPart, lbCastleLeftPartBigArch, lbCastleRightPartBigArch, lbCastleArchColumnPart, lbCastleLeftPartBigArch, lbCastleRightPartBigArch, lbCastleArchColumnPart, lbCastleOverDoor|Modifier_02; nRoomBlock
		.BYTE lbCastleOneColumn, lbPlate|Modifier_02, lbCastleOneColumn, lbPlateWithTorch, lbPlate|Modifier_07,	lbCastleOneColumn, lbPlateWithTorch, lbHighButton|Modifier_01, lbPlate,	lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel14_Room4:	.BYTE lbSpace|Modifier_07, lbSpace|Modifier_03,	lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_03, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace; nRoomBlock
		.BYTE lbPlate, lbPlate|Modifier_02, lbPlateWithTorch, lbExitDoorLeftPart|Modifier_02, lbExitDoorRightPart, lbPlateWithTorch, lbPlate|Modifier_02, lbPlate, lbHighButton, lbPlate; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel14_Room5:	.BYTE lbBrickWall|Modifier_01, lbSpace|Modifier_07, lbSpace|Modifier_03, lbSpace|Modifier_07, lbSpace|Modifier_07, lbSpace|Modifier_07,	lbSpace|Modifier_03, lbSpace|Modifier_07, lbSpace|Modifier_07, lbCastleOverDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbPlate|Modifier_07,	lbPlate|Modifier_07, lbPlateWithTorch, lbPlate|Modifier_07, lbPlateWithTorch, lbPlate|Modifier_07, lbPlate|Modifier_07,	lbPlate|Modifier_07, lbDoor|Modifier_02; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel14_Room6:	.BYTE lbSpace, lbSpace|Modifier_03, lbSpace, lbSpace, lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbPlateWithTorch,	lbPlate|Modifier_02, lbPlateWithTorch, lbPlate,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall; nRoomBlock
		.BYTE lbBrickWall, lbBrickWall,	lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall, lbBrickWall;	nRoomBlock
pLevel14_Room7:	.BYTE $FF
pLevel14_Room8:	.BYTE $FF
pLevel14_Room9:	.BYTE $FF
pLevel14_Room10:.BYTE $FF
pLevel14_Room11:.BYTE $FF
pLevel14_Room12:.BYTE $FF
pLevel14_Room13:.BYTE $FF
pLevel14_Room14:.BYTE $FF
pLevel14_Room15:.BYTE $FF
pLevel14_Room16:.BYTE $FF
pLevel14_Room17:.BYTE $FF
pLevel14_Room18:.BYTE $FF
pLevel14_Room19:.BYTE $FF
pLevel14_Room20:.BYTE $FF
pLevel14_Room21:.BYTE $FF
pLevel14_Room22:.BYTE $FF
pLevel14_Room23:.BYTE $FF
pLevel14_Room24:.BYTE $FF
pLevel14_Geom:	ROOM_NEIGHBORS 5, 2, 0, 0 ; ...
		ROOM_NEIGHBORS 1, 3, 0, 0
		ROOM_NEIGHBORS 2, 4, 0, 0
		ROOM_NEIGHBORS 3, 6, 0, 0
		ROOM_NEIGHBORS 0, 1, 0, 0
		ROOM_NEIGHBORS 4, 0, 0, 0
		ROOM_NEIGHBORS 13, 18,	0, 0
		ROOM_NEIGHBORS 12, 0, 0, 13
		ROOM_NEIGHBORS 0, 23, 0, 2
		ROOM_NEIGHBORS 0, 0, 4, 0
		ROOM_NEIGHBORS 18, 22,	0, 0
		ROOM_NEIGHBORS 20, 8, 0, 15
		ROOM_NEIGHBORS 15, 7, 8, 0
		ROOM_NEIGHBORS 0, 0, 21, 0
		ROOM_NEIGHBORS 16, 13,	12, 17
		ROOM_NEIGHBORS 19, 15,	20, 0
		ROOM_NEIGHBORS 0, 0, 15, 0
		ROOM_NEIGHBORS 7, 11, 0, 0
		ROOM_NEIGHBORS 21, 16,	24, 0
		ROOM_NEIGHBORS 24, 12,	0, 16
		ROOM_NEIGHBORS 2, 19, 23, 14
		ROOM_NEIGHBORS 11, 3, 0, 1
		ROOM_NEIGHBORS 9, 24, 0, 21
		ROOM_NEIGHBORS 23, 20,	0, 19
pLevel14_Header:LEVEL_HEADER 4, X_4_Y_1, DIRECTION_LEFT ; ...
pLevel14_Guards:.BYTE NO_PLACE,	NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE; nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE, X_3_Y_1, NO_PLACE|RESIDUAL_BIT, NO_PLACE, NO_PLACE, X_0_Y_1|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT; nGuardPlace
		.BYTE NO_PLACE,	NO_PLACE, NO_PLACE, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT, NO_PLACE|RESIDUAL_BIT,	X_0_Y_1|RESIDUAL_BIT; nGuardPlace
pLevel14_DoorLinks:DOOR_LINK 1, X_8_Y_1, ACTION_OPEN_DOOR, 5, X_9_Y_1
		DOOR_LINK 1, X_8_Y_1, ACTION_OPEN_DOOR, 1, X_9_Y_1
		DOOR_LINK 2, X_7_Y_1, ACTION_OPEN_DOOR, 5, X_9_Y_1
		DOOR_LINK 2, X_7_Y_1, ACTION_OPEN_DOOR, 1, X_9_Y_1
		DOOR_LINK 3, X_7_Y_1, ACTION_OPEN_DOOR, 3, X_9_Y_1
		DOOR_LINK 4, X_8_Y_1, ACTION_OPEN_DOOR, 3, X_9_Y_1
		DOOR_LINK 9, X_1_Y_1, ACTION_OPEN_DOOR, 1, X_9_Y_1
		DOOR_LINK 11, X_1_Y_1,	ACTION_OPEN_DOOR, 5, X_9_Y_1
		DOOR_LINK 11, X_1_Y_1,	ACTION_OPEN_DOOR, 1, X_9_Y_1
		DOOR_LINK 13, X_4_Y_1,	ACTION_CLOSE_DOOR, 1, X_9_Y_1
		DOOR_LINK 18, X_2_Y_0,	ACTION_CLOSE_DOOR, 5, X_9_Y_1
		DOOR_LINK 18, X_2_Y_0,	ACTION_CLOSE_DOOR, 1, X_9_Y_1
		DOOR_LINK 18, X_7_Y_0,	ACTION_OPEN_DOOR, 3, X_9_Y_1
		.BYTE $FF
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
		.BYTE	0
; ---------------------------------------------------------------------------

j_ClearSoundEngineVars:			; ...
		JMP	ClearSoundEngineVars
; ---------------------------------------------------------------------------

j__PlaySound:				; ...
		JMP	_PlaySound
; ---------------------------------------------------------------------------

SoundEffectEngine:			; ...
		JMP	_SoundEffectEngine

; =============== S U B	R O U T	I N E =======================================


PlayMusic:				; ...
		JMP	_PlayMusic
; ---------------------------------------------------------------------------

SoundEngine:				; ...
		JMP	loc_6AADF
; ---------------------------------------------------------------------------

_PlayMusic:				; ...
		CMP	#$80 ; '€'
		BCC	loc_6AA46
		LDA	#0
		STA	byte_7C8
		STA	byte_7EB
		STA	byte_7C9
		STA	byte_7EC
		STA	byte_7CA
		STA	byte_7ED
		STA	byte_7CB
		STA	byte_7EE
		LDA	#$E0 ; 'à'
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
		STA	byte_7E0
		RTS
; ---------------------------------------------------------------------------

loc_6AA46:				; ...
		STA	vSoundEngineMultiplierFor5
		ASL	A
		ASL	A
		ADC	vSoundEngineMultiplierFor5
		TAX
		LDA	pGameMusicLibLo,X
		STA	vGameMusic00_Lo
		LDA	pGameMusicLibHi,X
		STA	vGameMusic00_Hi
		INX
		LDA	pGameMusicLibLo,X
		STA	vGameMusic01_Lo
		LDA	pGameMusicLibHi,X
		STA	vGameMusic01_Hi
		INX
		LDA	pGameMusicLibLo,X
		STA	vGameMusic02_Lo
		LDA	pGameMusicLibHi,X
		STA	vGameMusic02_Hi
		INX
		LDA	pGameMusicLibLo,X
		STA	vGameMusic03_Lo
		LDA	pGameMusicLibHi,X
		STA	vGameMusic03_Hi
		INX
		LDA	pGameMusicLibLo,X
		STA	vGameMusic04_Lo
		LDA	pGameMusicLibHi,X
		STA	vGameMusic04_Hi
		LDA	#1
		STA	byte_78B
		STA	byte_78C
		LDA	#2
		STA	byte_78D
		STA	byte_78E
		LDA	#0
		STA	byte_7B4
		STA	byte_7B5
		STA	byte_7B6
		STA	byte_7B7
		STA	byte_7C4
		STA	byte_7C5
		STA	byte_7C6
		STA	byte_7C7
		LDA	#$F
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
		LDA	#APU_RCR_1_SHIFT_0|APU_RCR_1_NEGATIVE|APU_RCR_1_PERIOD_0
		STA	pAPU_P_1_RCR	; pAPU Pulse #1	Ramp Control Register (W)
		STA	pAPU_P_2_RCR	; pAPU Pulse #2	Ramp Control Register (W)
		LDA	#3
		STA	byte_7C8
		STA	byte_7EB
		STA	byte_7C9
		STA	byte_7EC
		STA	byte_7CA
		STA	byte_7ED
		STA	byte_7CB
		STA	byte_7EE
		RTS
; ---------------------------------------------------------------------------

loc_6AADF:				; ...
		LDY	#0
		LDX	#0
		JSR	sub_6AAFC
		LDY	#1
		LDX	#4
		JSR	sub_6AAFC
		LDY	#2
		LDX	#8
		JSR	sub_6AAFC
		LDY	#3
		LDX	#$C
		JSR	sub_6AAFC
		RTS
; End of function PlayMusic


; =============== S U B	R O U T	I N E =======================================


sub_6AAFC:				; ...
		STY	v4
		STX	v5
		LDA	byte_7C8,Y
		AND	#1
		BNE	loc_6AB08
		RTS
; ---------------------------------------------------------------------------

loc_6AB08:				; ...
		LDA	byte_78B,Y
		SEC
		SBC	#1
		BEQ	loc_6AB16
		STA	byte_78B,Y
		JMP	loc_6AC5E
; ---------------------------------------------------------------------------

loc_6AB16:				; ...
		LDA	vGameMusic00_Lo,Y
		STA	v0
		LDA	vGameMusic00_Hi,Y
		STA	v1
		LDA	vGameMusic04_Lo
		STA	v2
		LDA	vGameMusic04_Hi
		STA	v3
		LDY	#0
		LDA	(v0),Y
		PHA
		AND	#$80 ; '€'
		LSR	A
		LSR	A
		LSR	A
		STA	byte_7B3
		PLA
		AND	#$7F ; ''
		CMP	#$60 ; '`'
		BCC	loc_6AB41
		JMP	lbCallAPUInstr
; ---------------------------------------------------------------------------

loc_6AB41:				; ...
		LDX	v4
		ADC	byte_7B4,X
		STA	byte_7CC+4,X
		TAY
		LDA	byte_7C8,X
		AND	#2
		BEQ	loc_6AB6B
		LDA	byte_6AE6E,Y
		CPY	#$21 ; '!'
		BCC	loc_6AB5A
		LDA	#0

loc_6AB5A:				; ...
		STA	byte_7CC+8,X
		LDA	pNoteTable,Y
		STA	byte_7CC+$C,X
		LDA	byte_7CC,X
		ORA	#3
		STA	byte_7CC,X

loc_6AB6B:				; ...
		LDY	#1
		LDA	(v0),Y
		PHA
		AND	#$F
		TAY
		LDA	(v2),Y
		LDY	v4
		STA	byte_78B,Y
		LDX	v4
		LDA	vGameMusic00_Lo,X
		CLC
		ADC	#2
		STA	vGameMusic00_Lo,X
		LDA	vGameMusic00_Hi,X
		ADC	#0
		STA	vGameMusic00_Hi,X
		PLA
		LSR	A
		LSR	A
		LSR	A
		LSR	A
		ORA	byte_7B3
		STA	byte_7B3
		TAY
		LDA	psSoundsLibLo,Y
		STA	v0
		LDA	psSoundsLibHi,Y
		STA	v1
		LDA	#0
		STA	byte_7B3
		LDX	v4
		LDA	byte_7E0
		ORA	pAPU_SV_CSR_Bits,X
		STA	byte_7E0
		ORA	pAPU_SV_CSR	; pAPU Sound/Vertical Clock Signal Register (R)
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
		LDY	#0
		LDA	(v0),Y
		STA	byte_7B3
		CMP	#2
		BCS	loc_6ABC4
		JMP	loc_6AC0C
; ---------------------------------------------------------------------------

loc_6ABC4:				; ...
		LDX	v4
		INY
		INY
		INY
		LDA	#0
		STA	byte_7CC+$10,X
		LDA	(v0),Y
		STA	byte_78F+$14,X
		INY
		LDA	(v0),Y
		STA	byte_78F+$10,X
		LDA	#1
		STA	byte_78F+$C,X
		INY
		LDA	(v0),Y
		ORA	byte_7CC+$10,X
		STA	byte_7CC+$10,X
		INY
		LDA	(v0),Y
		ORA	byte_7CC+8,X
		STA	byte_7CC+8,X
		LDA	byte_7CC,X
		ORA	#5
		STA	byte_7CC,X
		INY
		LDA	(v0),Y
		STA	byte_78F+$20,X
		INY
		LDA	(v0),Y
		STA	byte_78F+$1C,X
		LDA	#1
		STA	byte_78F+$18,X
		JMP	loc_6AC5E
; ---------------------------------------------------------------------------

loc_6AC0C:				; ...
		INY
		LDA	(v0),Y
		STA	byte_78F+8,X
		INY
		LDA	(v0),Y
		STA	byte_78F+4,X
		LDA	#1
		STA	byte_78F,X
		LDA	#0
		STA	byte_7CC+$10,X
		INY
		LDA	(v0),Y
		STA	byte_78F+$14,X
		INY
		LDA	(v0),Y
		STA	byte_78F+$10,X
		LDA	#1
		STA	byte_78F+$C,X
		INY
		LDA	(v0),Y
		ORA	byte_7CC+$10,X
		STA	byte_7CC+$10,X
		INY
		LDA	(v0),Y
		ORA	byte_7CC+8,X
		STA	byte_7CC+8,X
		LDA	byte_7CC,X
		ORA	#5
		STA	byte_7CC,X
		INY
		LDA	(v0),Y
		STA	byte_78F+$20,X
		INY
		LDA	(v0),Y
		STA	byte_78F+$1C,X
		LDA	#1
		STA	byte_78F+$18,X

loc_6AC5E:				; ...
		LDX	v4
		DEC	byte_78F,X
		BNE	loc_6ACA2
		LDA	byte_78F+8,X
		STA	v0
		LDA	byte_78F+4,X
		BEQ	loc_6ACA2
		STA	v1
		LDY	#0
		LDA	(v0),Y
		CMP	#$80 ; '€'
		BEQ	loc_6ACA2
		LDA	byte_7CC+$10,X
		AND	#$F0 ; 'ð'
		ORA	(v0),Y
		STA	byte_7CC+$10,X
		LDA	byte_7CC,X
		ORA	#4
		STA	byte_7CC,X
		INY
		LDA	(v0),Y
		STA	byte_78F,X
		LDA	byte_78F+8,X
		CLC
		ADC	#2
		STA	byte_78F+8,X
		LDA	byte_78F+4,X
		ADC	#0
		STA	byte_78F+4,X

loc_6ACA2:				; ...
		LDX	v4
		LDY	v5
		LDA	byte_7C8,X
		AND	#2
		BNE	loc_6ACAE
		RTS
; ---------------------------------------------------------------------------

loc_6ACAE:				; ...
		LDA	byte_7CC,X
		AND	#1
		BEQ	loc_6ACC3
		LDA	byte_7CC+8,X
		STA	pAPU_P_1_CTR,Y	; pAPU Pulse #1	Coarse Tune (CT) Register (W)
		LDA	byte_7CC,X
		AND	#$FE ; 'þ'
		STA	byte_7CC,X

loc_6ACC3:				; ...
		LDA	byte_7CC,X
		AND	#2
		BEQ	loc_6ACD8
		LDA	byte_7CC+$C,X
		STA	pAPU_P_1_FTR,Y	; pAPU Pulse #1	Fine Tune (FT) Register	(W)
		LDA	byte_7CC,X
		AND	#$FD ; 'ý'
		STA	byte_7CC,X

loc_6ACD8:				; ...
		LDA	byte_7CC,X
		AND	#4
		BEQ	locret_6ACED
		LDA	byte_7CC+$10,X
		STA	pAPU_P_1_CR,Y	; pAPU Pulse #1	Control	Register (W)
		LDA	byte_7CC,X
		AND	#$FB ; 'û'
		STA	byte_7CC,X

locret_6ACED:				; ...
		RTS
; ---------------------------------------------------------------------------
pAPU_INSTR_HI:				; ...
		.BYTE >(sbr_APU_0)
		.BYTE >(sbr_APU_1)
		.BYTE >(sbr_APU_2)
		.BYTE >(sbr_APU_3)
		.BYTE >(sbr_APU_4)
pAPU_INSTR_LO:				; ...
		.BYTE <(sbr_APU_0)
		.BYTE <(sbr_APU_1)
		.BYTE <(sbr_APU_2)
		.BYTE <(sbr_APU_3)
		.BYTE <(sbr_APU_4)
; ---------------------------------------------------------------------------

lbCallAPUInstr:				; ...
		LDX	v4
		SBC	#$60 ; '`'
		TAY
		LDA	pAPU_INSTR_LO,Y
		STA	word_7E1
		LDA	pAPU_INSTR_HI,Y
		STA	word_7E1+1
		JMP	(word_7E1)
; End of function sub_6AAFC

; ---------------------------------------------------------------------------

sbr_APU_0:				; ...
		LDA	byte_7CC+$10,X
		AND	#$10
		BEQ	loc_6AD23
		LDA	byte_7CC+$10,X
		AND	#$F0 ; 'ð'
		STA	byte_7CC+$10,X
		LDA	byte_7CC,X
		ORA	#4
		STA	byte_7CC,X

loc_6AD23:				; ...
		LDY	#1
		LDA	(v0),Y
		AND	#$F
		TAY
		LDA	(v2),Y
		STA	byte_78B,X
		LDY	#1
		JSR	sub_6ADDF
		JMP	loc_6ACA2
; ---------------------------------------------------------------------------

sbr_APU_1:				; ...
		LDA	byte_7C8,X
		AND	#2
		STA	byte_7C8,X
		STA	byte_7EB,X
		JSR	sub_6ADF5
		JMP	loc_6ACA2
; ---------------------------------------------------------------------------

sbr_APU_2:				; ...
		LDY	#1
		LDA	(v0),Y
		TAY
		LDA	pmAdditionalLib_Lo,Y
		STA	vGameMusic00_Lo,X
		LDA	pmAdditionalLib_Hi,Y
		STA	vGameMusic00_Hi,X
		LDY	#2
		LDA	(v0),Y
		STA	byte_7B4,X
		LDA	byte_7C4,X
		BNE	loc_6AD6C
		LDY	#3
		LDA	(v0),Y
		STA	byte_7B8+8,X

loc_6AD6C:				; ...
		LDA	v0
		CLC
		ADC	#4
		STA	byte_7B8,X
		LDA	v1
		ADC	#0
		STA	byte_7B8+4,X
		JMP	loc_6ADB3
; ---------------------------------------------------------------------------

sbr_APU_3:				; ...
		LDA	byte_7B8,X
		PHA
		LDY	byte_7B8+4,X
		PLA
		STA	vGameMusic00_Lo,X
		TYA
		STA	vGameMusic00_Hi,X
		DEC	byte_7B8+8,X
		BEQ	loc_6ADAB
		LDA	#1
		STA	byte_7C4,X
		LDA	vGameMusic00_Lo,X
		SEC
		SBC	#4
		STA	vGameMusic00_Lo,X
		LDA	vGameMusic00_Hi,X
		SBC	#0
		STA	vGameMusic00_Hi,X
		JMP	loc_6ADB3
; ---------------------------------------------------------------------------

loc_6ADAB:				; ...
		LDA	#0
		STA	byte_7C4,X
		STA	byte_7B4,X

loc_6ADB3:				; ...
		LDA	#1
		LDY	v4
		STA	byte_78B,Y
		LDX	v5
		JMP	sub_6AAFC
; ---------------------------------------------------------------------------

sbr_APU_4:				; ...
		LDY	#1
		LDA	(v0),Y
		STA	vGameMusic00_Lo,X
		INY
		LDA	(v0),Y
		STA	vGameMusic00_Hi,X
		LDA	#1
		STA	byte_78B,X
		LDY	v4
		LDX	v5
		JMP	sub_6AAFC
; ---------------------------------------------------------------------------
		LDX	v4
		LDA	#1
		STA	byte_78B,X

; =============== S U B	R O U T	I N E =======================================


sub_6ADDF:				; ...
		INY
		TYA
		CLC
		ADC	vGameMusic00_Lo,X
		STA	vGameMusic00_Lo,X
		LDA	vGameMusic00_Hi,X
		ADC	#0
		STA	vGameMusic00_Hi,X
		LDY	v4
		LDX	v5
		RTS
; End of function sub_6ADDF


; =============== S U B	R O U T	I N E =======================================


sub_6ADF5:				; ...
		LDA	#0
		STA	byte_7CC+$C,X
		STA	byte_7CC+$10,X
		LDA	byte_7CC+8,X
		AND	#$F8 ; 'ø'
		STA	byte_7CC+8,X
		LDA	byte_7CC,X
		ORA	#7
		STA	byte_7CC,X
		RTS
; End of function sub_6ADF5

; ---------------------------------------------------------------------------
pNoteTable:	.BYTE  $AE, $4E, $F3, $9E, $4D,	  1, $B9, $75, $35, $F8, $BF, $89, $57,	$27, $F9, $CF ;	...
		.BYTE  $A6, $80, $5C, $3A, $1A,	$FC, $DF, $C4, $AB, $93, $7C, $67, $53,	$40, $2E, $1D
		.BYTE	$D, $FE, $EF, $E2, $D5,	$C9, $BE, $B3, $A9, $A0, $97, $8E, $86,	$7F, $77, $71
		.BYTE  $6A, $64, $5F, $59, $54,	$50, $4B, $47, $43, $3F, $3B, $38, $35,	$32, $2F, $2C
		.BYTE  $2A, $28, $25, $23, $21,	$1F, $1D, $1C, $1A, $19, $17, $16, $15,	$14, $12, $11
		.BYTE  $10,  $F,  $E,  $E,  $D,	 $C,  $B,  $B,	$A,  $A,   9,	8,   8,	  7,   7,   7
byte_6AE6E:	.BYTE	 6,   6,   5,	5,   5,	  5,   4,   4,	 4,   3,   3 ; ...
		.BYTE	 3,   3,   3,	2,   2,	  2,   2,   2,	 2,   2,   1
		.BYTE	 1,   1,   1,	1,   1,	  1,   1,   1,	 1,   1,   1
psSoundsLibLo:	.BYTE <(psNone)	; ...
		.BYTE <(psNone1)
		.BYTE <(psNone2)
		.BYTE <(psNone3)
		.BYTE <(psCuttersClap)
		.BYTE <(psMetallClank)
		.BYTE <(psStep)
		.BYTE <(psWallBreak)
		.BYTE <(psBrokenPlateWave)
		.BYTE <(psOpeningDoor)
		.BYTE <(psDoorMechanism)
		.BYTE <(psUnused)
		.BYTE <(psPrinceInjure)
		.BYTE <(psGuardInjure)
		.BYTE <(psDrinkPotion)
		.BYTE <(psSpikesClank)
		.BYTE <(psSpikes)
		.BYTE <(psExitOpened)
psSoundsLibHi:	.BYTE >(psNone)	; ...
		.BYTE >(psNone1)
		.BYTE >(psNone2)
		.BYTE >(psNone3)
		.BYTE >(psCuttersClap)
		.BYTE >(psMetallClank)
		.BYTE >(psStep)
		.BYTE >(psWallBreak)
		.BYTE >(psBrokenPlateWave)
		.BYTE >(psOpeningDoor)
		.BYTE >(psDoorMechanism)
		.BYTE >(psUnused)
		.BYTE >(psPrinceInjure)
		.BYTE >(psGuardInjure)
		.BYTE >(psDrinkPotion)
		.BYTE >(psSpikesClank)
		.BYTE >(psSpikes)
		.BYTE >(psExitOpened)
psNone:		.BYTE 0			; ...
		.WORD psNone_Data
		.BYTE	 0,   0, $B0,	0,   0,	  0
psNone1:	.BYTE 0			; ...
		.WORD psNone1_Data
		.BYTE	 0,   0, $B0,	0,   0,	  0
psNone2:	.BYTE 2			; ...
		.WORD 0
		.BYTE	 0,   0, $B0,	0,   0,	  0
psNone3:	.BYTE 0			; ...
		.WORD psNone3_Data
		.BYTE  $A0, $AF, $B0,	0,   0,	  0
psCuttersClap:	.BYTE 0			; ...
		.WORD psNone3_Data
		.BYTE  $A0, $AF, $F0,	0,   0,	  0
psMetallClank:	.BYTE 0			; ...
		.WORD psMetallClank_Data
		.BYTE	 0,   0, $70,	0,   0,	  0
psStep:		.BYTE 0			; ...
		.WORD psStep_Data
		.BYTE  $A0, $AF, $F0,	0,   0,	  0
psWallBreak:	.BYTE 0			; ...
		.WORD $AFA0
		.BYTE  $A0, $AF, $B0,	0,   0,	  0
psBrokenPlateWave:.BYTE	2		; ...
		.WORD 0
		.BYTE	 0,   0, $48,	8,   0,	  0
psOpeningDoor:	.BYTE 0			; ...
		.WORD $AFA0
		.BYTE	 0,   0, $B0,	0, $A0,	$AF
psDoorMechanism:.BYTE 0			; ...
		.WORD $AFA0
		.BYTE	 0,   0, $B0,	0, $A0,	$AF
psUnused:	.BYTE 0			; ...
		.WORD $AFA0
		.BYTE	 0,   0, $B0,	0, $A0,	$AF
psPrinceInjure:	.BYTE 0			; ...
		.WORD $AFA0
		.BYTE	 0,   0, $B0,	0,   0,	  0
psGuardInjure:	.BYTE 2			; ...
		.WORD 0
		.BYTE	 0,   0, $1F,	8,   0,	  0
psDrinkPotion:	.BYTE 0			; ...
		.WORD $AFA0
		.BYTE	 0,   0, $B0,	0, $A0,	$AF
psSpikesClank:	.BYTE 0			; ...
		.WORD $AFA0
		.BYTE	 0,   0, $B0,	0, $A0,	$AF
psSpikes:	.BYTE 0			; ...
		.WORD $AFA0
		.BYTE	 0,   0, $B0,	0,   0,	  0
psExitOpened:	.BYTE 0			; ...
		.WORD $AFA0
		.BYTE	 0,   0, $B0,	0, $A0,	$AF
psNone_Data:	.BYTE	 5,   2,   4,	3,   3,	$14,   2,  $A,	 1, $1E,   0,	1, $80 ; ...
psNone1_Data:	.BYTE	 4,   3,   3, $14,   2,	 $A,   1, $23,	 0,   1, $80 ; ...
psNone3_Data:	.BYTE	 8,   2,   7,	3,   6,	 $A,   5, $14,	 4, $1E,   3, $28,   2,	$32,   1, $3C,	 0,   1, $80 ; ...
psMetallClank_Data:.BYTE   $F,	 1,  $C,   1,  $A,   1,	  9,   1,   8,	 2,   7,   3,	6,   4,	  5,   3,   4,	 2,   3,   2,	2,   4,	  1,   8,   0,	 1, $80	; ...
psStep_Data:	.BYTE	 3,   1,   0,	1, $80 ; ...
pGameMusicLibHi:.BYTE >(pmLevelStart_00) ; ...
		.BYTE >(pmLevelStart_01)
		.BYTE >(pmLevelStart_02)
		.BYTE >(pmLevelStart_03)
		.BYTE >(pGameMusicData)
		.BYTE >(pmDeath_00)
		.BYTE >(pmDeath_01)
		.BYTE >(pmDeath_02)
		.BYTE >(pmDeath_03)
		.BYTE >(pGameMusicData)
		.BYTE >(pmMusicOff_00)
		.BYTE >(pmMusicOff_01)
		.BYTE >(pmMusicOff_02)
		.BYTE >(pmMusicOff_03)
		.BYTE >(pGameMusicData)
		.BYTE >(pmVictory_00)
		.BYTE >(pmVictory_01)
		.BYTE >(pmVictory_02)
		.BYTE >(pmVictory_03)
		.BYTE >(pGameMusicData)
		.BYTE >(pmGameEnd_00)
		.BYTE >(pmGameEnd_01)
		.BYTE >(pmGameEnd_02)
		.BYTE >(pmGameEnd_03)
		.BYTE >(pGameMusicData)
		.BYTE >(pmLevel_00)
		.BYTE >(pmLevel_01)
		.BYTE >(pmLevel_02)
		.BYTE >(pmLevel_03)
		.BYTE >(pGameMusicData)
		.BYTE >(pmGameBegin_00)
		.BYTE >(pmGameBegin_01)
		.BYTE >(pmGameBegin_02)
		.BYTE >(pmGameBegin_03)
		.BYTE >(pGameMusicData)
pGameMusicLibLo:.BYTE <(pmLevelStart_00) ; ...
		.BYTE <(pmLevelStart_01)
		.BYTE <(pmLevelStart_02)
		.BYTE <(pmLevelStart_03)
		.BYTE <(pGameMusicData)
		.BYTE <(pmDeath_00)
		.BYTE <(pmDeath_01)
		.BYTE <(pmDeath_02)
		.BYTE <(pmDeath_03)
		.BYTE <(pGameMusicData)
		.BYTE <(pmMusicOff_00)
		.BYTE <(pmMusicOff_01)
		.BYTE <(pmMusicOff_02)
		.BYTE <(pmMusicOff_03)
		.BYTE <(pGameMusicData)
		.BYTE <(pmVictory_00)
		.BYTE <(pmVictory_01)
		.BYTE <(pmVictory_02)
		.BYTE <(pmVictory_03)
		.BYTE <(pGameMusicData)
		.BYTE <(pmGameEnd_00)
		.BYTE <(pmGameEnd_01)
		.BYTE <(pmGameEnd_02)
		.BYTE <(pmGameEnd_03)
		.BYTE <(pGameMusicData)
		.BYTE <(pmLevel_00)
		.BYTE <(pmLevel_01)
		.BYTE <(pmLevel_02)
		.BYTE <(pmLevel_03)
		.BYTE <(pGameMusicData)
		.BYTE <(pmGameBegin_00)
		.BYTE <(pmGameBegin_01)
		.BYTE <(pmGameBegin_02)
		.BYTE <(pmGameBegin_03)
		.BYTE <(pGameMusicData)
pGameMusicData:	.BYTE	 3,   4,   6,	9,  $C,	$12, $18, $24, $30, $48, $60, $90, $C0,	  8, $10, $3C ;	...
pmLevelStart_00:.BYTE  $62,   0, $F4,	1, $64 ; ...
		.WORD pmLevel_00
pmLevelStart_01:.BYTE  $62,   1, $F4,	1, $64 ; ...
		.WORD pmLevel_01
pmLevelStart_02:.BYTE  $62,   2,   0,	1, $64 ; ...
		.WORD pmLevel_02
pmLevelStart_03:.BYTE  $34, $62, $34, $62, $34,	$62, $34, $62, $34, $62, $34, $62, $34,	$62, $34, $62 ;	...
		.BYTE  $34, $62, $34, $62, $34,	$62, $34, $62, $34, $62, $34, $62, $34,	$62, $34, $62
		.BYTE  $34, $64, $34, $62, $34,	$62, $34, $64, $34, $64, $34, $62, $34,	$62, $34, $64
		.BYTE  $64
		.WORD pmLevel_03
pmAdditional_00:.BYTE  $38,   2, $3A,	4, $38,	  2, $37,   6, $32,   6, $2F,	6, $2B,	 $A, $63 ; ...
pmAdditional_01:.BYTE  $32, $16, $32, $16, $2F,	$16, $2B, $16, $26, $1A, $63 ; ...
pmAdditional_02:.BYTE  $20, $26, $1F, $29, $13,	$2A, $63 ; ...
pmDeath_00:	.BYTE  $62,   3, $E8,	1, $61 ; ...
pmDeath_01:	.BYTE  $62,   4, $E8,	1, $61 ; ...
pmDeath_02:	.BYTE  $62,   5, $F4,	1, $61 ; ...
pmDeath_03:	.BYTE  $60, $6A, $61	; ...
pmAdditional_03:.BYTE  $32,   6, $32,  $D, $33,	 $D, $34,  $D, $35,   6, $35,  $D, $36,	 $D, $37,  $D ;	...
		.BYTE  $39,   6, $3E,	6, $3D,	 $A, $63
pmAdditional_04:.BYTE  $2D, $18, $32, $18, $35,	$16, $39, $16, $35, $1A, $63 ; ...
pmAdditional_05:.BYTE  $1A, $28, $1A, $28, $1A,	$28, $16, $28, $63 ; ...
pmMusicOff_00:	.BYTE  $60,   4, $61	; ...
pmMusicOff_01:	.BYTE  $60,   4, $61	; ...
pmMusicOff_02:	.BYTE  $60,   4, $61	; ...
pmMusicOff_03:	.BYTE  $60,   4, $61	; ...
pmVictory_00:	.BYTE  $62,   9, $E8,	1, $61 ; ...
pmVictory_01:	.BYTE  $62,  $A, $E8,	1, $61 ; ...
pmVictory_02:	.BYTE  $62,  $B, $F4,	1, $61 ; ...
pmVictory_03:	.BYTE  $60,  $A, $61	; ...
pmAdditional_09:.BYTE  $39,   6, $3E,	2, $3E,	  4, $3E,   2, $3E,   6, $3C,	2, $3A,	  4, $3C,   2 ;	...
		.BYTE  $3E,   6, $39,	2, $39,	  4, $39,   2, $39,   6, $37,	2, $35,	  4, $37,   2
		.BYTE  $39,  $A, $63
pmAdditional_0A:.BYTE  $35, $16, $39, $16, $39,	$16, $37, $16, $39, $16, $35, $16, $35,	$16, $34, $16 ;	...
		.BYTE  $36, $1A, $63
pmAdditional_0B:.BYTE  $1A, $26, $1A, $26, $1A,	$26, $18, $26, $1A, $26, $1A, $26, $1A,	$26, $18, $26 ;	...
		.BYTE  $1A, $28, $63
pmGameEnd_00:	.BYTE  $62,  $C, $D0,	1, $62,	$10, $D0,   1, $64 ; ...
		.WORD pmGameEnd_00
pmGameEnd_01:	.BYTE  $62,  $D, $D0,	1, $62,	$11, $D0,   1, $64 ; ...
		.WORD pmGameEnd_01
pmGameEnd_02:	.BYTE  $62,  $E, $F4,	1, $62,	$12, $F4,   1, $64 ; ...
		.WORD pmGameEnd_02
pmGameEnd_03:	.BYTE  $62,  $F,   0,	3, $62,	$13,   0,   1, $64 ; ...
		.WORD pmGameEnd_03
pmAdditional_0C:.BYTE  $4C,   2, $4A,	2, $4C,	  2, $4D,   2, $4C,   8, $60,	4, $4D,	  4, $4F,   5 ;	...
		.BYTE  $51,   2, $4F,	4, $4D,	  4, $4C,   4, $4A,   4, $4C,	4, $4D,	  4, $4C,   2
		.BYTE  $4A,   2, $4C,	2, $4D,	  2, $4C,   8, $60,   4, $4A,	4, $48,	  5, $4A,   2
		.BYTE  $48,   4, $47,	6, $45,	  6, $43,   4, $45,   5, $47,	2, $48,	  4, $4A,   4
		.BYTE  $4C,   5, $4D,	2, $4C,	  4, $4A,   4, $48,   7, $4A,	2, $48,	  2, $47,   4
		.BYTE  $45,   6, $43,	4, $45,	 $C, $63
pmAdditional_10:.BYTE  $4C,   5, $4D,	2, $4F,	  7, $4D,   6, $4C,   4, $4D,	5, $4F,	  2, $51,   7 ;	...
		.BYTE  $4F,   6, $4D,	4, $4F,	  2, $51,   2, $53,   8, $51,	6, $4F,	  4, $51,   2
		.BYTE  $53,   2, $51,	2, $4F,	  2, $4D,   7, $4F,   6, $51,	4, $4C,	  5, $4D,   2
		.BYTE  $4F,   5, $51,	2, $4F,	  4, $4D,   6, $4C,   4, $4D,	5, $4F,	  2, $51,   4
		.BYTE  $53,   6, $51,	4, $4F,	  4, $4D,   4, $4F,   5, $51,	2, $53,	  4, $51,   6
		.BYTE  $4F,   6, $51,	2, $53,	  2, $4D,   7, $4F,   2, $4D,	2, $4C,	  8, $63
pmAdditional_0D:.BYTE  $48, $12, $47, $12, $48,	$12, $4A, $12, $48, $18, $60, $14, $4A,	$14, $4C, $15 ;	...
		.BYTE  $4D, $12, $4C, $14, $4A,	$14, $48, $14, $47, $14, $48, $14, $4A,	$14, $48, $12
		.BYTE  $47, $12, $48, $12, $4A,	$12, $48, $18, $60, $14, $47, $14, $45,	$15, $47, $12
		.BYTE  $45, $14, $43, $16, $41,	$16, $40, $14, $40, $15, $43, $12, $45,	$14, $47, $14
		.BYTE  $48, $15, $4A, $12, $48,	$14, $47, $14, $45, $17, $47, $12, $45,	$12, $43, $14
		.BYTE  $41, $16, $40, $14, $3C,	$1C, $63
pmAdditional_11:.BYTE  $48, $15, $4A, $12, $4C,	$17, $4A, $16, $48, $14, $4A, $15, $4C,	$12, $4D, $17 ;	...
		.BYTE  $4C, $16, $4A, $14, $4C,	$12, $4D, $12, $4F, $18, $4D, $16, $4C,	$14, $4D, $12
		.BYTE  $4F, $12, $4D, $12, $4C,	$12, $48, $17, $48, $16, $4D, $14, $48,	$15, $4A, $12
		.BYTE  $4C, $15, $4D, $12, $4C,	$14, $4A, $16, $48, $14, $4A, $15, $4C,	$12, $4D, $14
		.BYTE  $4F, $16, $4D, $14, $4C,	$14, $4A, $14, $4C, $15, $4D, $12, $4F,	$14, $4D, $16
		.BYTE  $4C, $16, $4D, $12, $4F,	$12, $48, $17, $4C, $12, $4A, $12, $44,	$18, $63
pmAdditional_0E:.BYTE  $21, $24, $21, $22, $21,	$22, $21, $24, $24, $26, $21, $24, $24,	$24, $21, $24 ;	...
		.BYTE  $1D, $24, $1D, $22, $1D,	$22, $1D, $24, $1C, $26, $1C, $24, $1F,	$24, $23, $24
		.BYTE  $21, $24, $21, $22, $21,	$22, $21, $24, $24, $26, $21, $24, $24,	$24, $21, $24
		.BYTE  $1D, $24, $1D, $22, $1D,	$22, $1D, $24, $1C, $26, $1C, $24, $1F,	$24, $23, $24
		.BYTE  $21, $24, $21, $22, $21,	$22, $21, $24, $24, $26, $21, $24, $24,	$24, $21, $24
		.BYTE  $1D, $24, $1D, $22, $1D,	$22, $1D, $24, $1C, $26, $1C, $24, $1F,	$24, $23, $24
		.BYTE  $21, $24, $21, $22, $21,	$22, $21, $24, $24, $26, $21, $24, $24,	$24, $21, $24
		.BYTE  $1D, $24, $1D, $22, $1D,	$22, $1D, $24, $1C, $26, $1C, $24, $1F,	$24, $23, $24
		.BYTE  $63
pmAdditional_12:.BYTE  $24, $24, $24, $22, $24,	$22, $24, $24, $28, $26, $24, $24, $28,	$24, $24, $24 ;	...
		.BYTE  $26, $24, $26, $22, $26,	$22, $26, $24, $21, $26, $24, $24, $26,	$24, $21, $24
		.BYTE  $28, $24, $28, $22, $28,	$22, $28, $24, $23, $26, $26, $24, $28,	$24, $23, $24
		.BYTE  $1D, $24, $1D, $22, $1D,	$22, $1D, $24, $21, $26, $1D, $24, $21,	$24, $23, $24
		.BYTE  $24, $24, $24, $22, $24,	$22, $24, $24, $28, $26, $24, $24, $28,	$24, $24, $24
		.BYTE  $26, $24, $26, $22, $26,	$22, $26, $24, $21, $26, $24, $24, $26,	$24, $21, $24
		.BYTE  $28, $24, $28, $22, $28,	$22, $28, $24, $23, $26, $26, $24, $28,	$24, $23, $24
		.BYTE  $1D, $24, $1D, $22, $1D,	$22, $1D, $24, $1C, $26, $1C, $24, $20,	$24, $23, $24
		.BYTE  $63
pmAdditional_0F:.BYTE  $34, $64, $34, $62, $34,	$62, $34, $64, $34, $65, $34, $62, $34,	$64, $34, $64 ;	...
		.BYTE  $34, $62, $34, $62, $63
pmAdditional_13:.BYTE  $34, $64, $34, $62, $34,	$62, $34, $64, $34, $62, $34, $65, $34,	$62, $34, $62 ;	...
		.BYTE  $34, $64, $34, $64, $63
pmLevel_00:	.BYTE  $62, $14, $E8,	1, $62,	$18, $E8,   1, $64 ; ...
		.WORD pmLevel_00
pmLevel_01:	.BYTE  $62, $15, $E8,	1, $62,	$19, $E8,   1, $64 ; ...
		.WORD pmLevel_01
pmLevel_02:	.BYTE  $62, $16, $F4,	1, $62,	$1A, $F4,   1, $64 ; ...
		.WORD pmLevel_02
pmLevel_03:	.BYTE  $62, $17,   0,	1, $62,	$1B,   0,   1, $64 ; ...
		.WORD pmLevel_03
pmAdditional_14:.BYTE  $32,   6, $39,	2, $39,	  4, $39,   2, $39,   6, $39,	6, $3E,	  6, $39,   2 ;	...
		.BYTE  $39,   4, $39,	2, $3E,	  6, $3F,   2, $41,   4, $3F,	2, $3E,	  6, $39,   2
		.BYTE  $39,   4, $39,	2, $39,	  6, $39,   6, $43,   6, $3E,	2, $3E,	  4, $3E,   2
		.BYTE  $43,   6, $44,	2, $46,	  4, $44,   2, $43,   6, $3E,	2, $3E,	  4, $3E,   2
		.BYTE  $3E,   6, $3E,	6, $37,	  6, $33,   2, $35,   4, $33,	2, $32,	  6, $32,   6
		.BYTE  $32,  $A, $34,	6, $35,	  2, $37,   4, $35,   2, $34,	6, $35,	  2, $37,   4
		.BYTE  $35,   2, $34,  $A, $39,	  6, $3A,   2, $3C,   4, $3A,	2, $39,	  6, $2D,   6
		.BYTE  $2D,   6, $2E,	2, $30,	  4, $2E,   2, $2D,   8, $32,	6, $33,	  2, $35,   4
		.BYTE  $33,   2, $32,	6, $2D,	  6, $32,   6, $33,   2, $35,	4, $33,	  2, $32,   6
		.BYTE  $39,   6, $37,	6, $38,	  2, $3A,   4, $38,   2, $37,	6, $37,	  2, $37,   4
		.BYTE  $37,   2, $37,	6, $35,	  2, $33,   4, $35,   2, $37,	6, $37,	  2, $37,   4
		.BYTE  $37,   2, $37,  $A, $63
pmAdditional_18:.BYTE  $3C,  $A, $3C,  $A, $37,	  2, $3C,   4, $37,   2, $3C,	6, $3D,	  2, $3F,   4 ;	...
		.BYTE  $3D,   2, $3C,	6, $3A,	  2, $38,   4, $3A,   2, $3C,	6, $37,	  8, $30,  $A
		.BYTE  $37,   2, $3C,	4, $37,	  2, $3F,   6, $3D,   2, $3F,	4, $3D,	  2, $3C,   6
		.BYTE  $3A,   2, $38,	4, $3A,	  2, $3C,   6, $43,   8, $3C,  $A, $3D,	  2, $3F,   4
		.BYTE  $3D,   2, $41,	6, $3F,	  6, $3D,   6, $3C,   6, $37,	9, $3D,	  2, $3F,   4
		.BYTE  $3D,   2, $41,	6, $43,	  6, $44,   6, $43,   6, $3C,	9, $38,	  2, $37,   4
		.BYTE  $38,   2, $37,	6, $32,	  6, $37,   6, $38,   2, $37,	4, $38,	  2, $37,   6
		.BYTE  $3B,   6, $38,	2, $37,	  4, $38,   2, $37,   8, $32,	8, $30,	 $A, $35,   2
		.BYTE  $34,   4, $35,	2, $34,	  6, $2F,   6, $35,   2, $34,	4, $35,	  2, $34,   8
		.BYTE  $3B,  $A, $60,	8, $35,	  2, $34,   4, $35,   2, $34,	6, $2F,	  6, $35,   2
		.BYTE  $34,   4, $35,	2, $34,	  8, $38,  $A, $60,   8, $39,	2, $3A,	  4, $39,   2
		.BYTE  $3C,   6, $3A,	6, $39,	  2, $37,   4, $39,   2, $34,  $A, $32,	 $A, $32,  $A
		.BYTE  $63
pmAdditional_15:.BYTE  $2D, $16, $29, $12, $29,	$14, $29, $12, $35, $16, $29, $16, $39,	$16, $35, $12 ;	...
		.BYTE  $35, $14, $35, $12, $39,	$16, $37, $16, $39, $16, $35, $12, $35,	$14, $35, $12
		.BYTE  $35, $16, $35, $16, $3E,	$16, $3A, $12, $3A, $14, $3A, $12, $3E,	$16, $3C, $12
		.BYTE  $3E, $14, $3C, $12, $3E,	$16, $3A, $12, $3A, $14, $3A, $12, $3A,	$16, $3A, $16
		.BYTE  $32, $16, $30, $12, $32,	$14, $30, $12, $2E, $16, $2E, $16, $2E,	$1A, $2F, $16
		.BYTE  $30, $16, $2F, $16, $30,	$16, $2F, $1A, $34, $16, $35, $16, $34,	$16, $28, $16
		.BYTE  $28, $16, $29, $16, $28,	$18, $2D, $16, $2E, $16, $2D, $16, $29,	$16, $2D, $16
		.BYTE  $2E, $16, $2D, $16, $35,	$16, $2F, $16, $30, $12, $32, $14, $30,	$12, $2F, $16
		.BYTE  $2F, $16, $2F, $16, $2D,	$12, $2B, $14, $2D, $12, $2F, $16, $2F,	$16, $2F, $1A
		.BYTE  $63
pmAdditional_19:.BYTE  $33, $1A, $33, $1A, $33,	$12, $37, $14, $33, $12, $37, $16, $38,	$12, $3A, $14 ;	...
		.BYTE  $38, $12, $37, $16, $37,	$12, $35, $14, $37, $12, $37, $16, $33,	$18, $2B, $1A
		.BYTE  $33, $12, $37, $14, $33,	$12, $3C, $16, $38, $12, $3C, $14, $38,	$12, $37, $16
		.BYTE  $37, $12, $35, $14, $37,	$12, $37, $16, $3C, $18, $37, $1A, $38,	$12, $3A, $14
		.BYTE  $38, $12, $38, $16, $37,	$16, $35, $16, $37, $16, $33, $19, $38,	$12, $3A, $14
		.BYTE  $38, $12, $38, $16, $3A,	$16, $3C, $16, $3F, $16, $37, $19, $30,	$12, $2F, $14
		.BYTE  $30, $12, $2F, $16, $2F,	$16, $32, $16, $30, $12, $2F, $14, $30,	$12, $2F, $16
		.BYTE  $32, $16, $30, $12, $2F,	$14, $30, $12, $32, $18, $2F, $18, $2B,	$1A, $32, $12
		.BYTE  $30, $14, $32, $12, $2F,	$16, $2C, $16, $32, $12, $30, $14, $32,	$12, $2F, $18
		.BYTE  $38, $1A, $60, $18, $32,	$12, $30, $14, $32, $12, $2F, $16, $2C,	$16, $32, $12
		.BYTE  $30, $14, $32, $12, $2F,	$18, $34, $1A, $60, $18, $30, $12, $32,	$14, $30, $12
		.BYTE  $39, $16, $34, $16, $34,	$16, $31, $1A, $2D, $1A, $2D, $1A, $63
pmAdditional_16:.BYTE  $1A, $26, $26, $D2, $26,	$D4, $26, $D2, $1A, $26, $26, $26, $1A,	$26, $1A, $26 ;	...
		.BYTE  $1A, $26, $1B, $26, $1A,	$26, $21, $D2, $21, $D4, $21, $D2, $1A,	$26, $1A, $26
		.BYTE  $1F, $26, $1A, $D2, $1A,	$D4, $1A, $D2, $1F, $26, $20, $D2, $20,	$D4, $20, $D2
		.BYTE  $1F, $26, $1A, $D2, $1A,	$D4, $1A, $D2, $1F, $26, $1F, $26, $1F,	$26, $1F, $D2
		.BYTE  $1F, $D4, $1F, $D2, $1F,	$26, $1F, $26, $1F, $26, $1A, $D2, $1A,	$D4, $1A, $D2
		.BYTE  $1F, $26, $1F, $D2, $1F,	$D4, $1F, $D2, $1C, $26, $1D, $26, $1C,	$26, $1D, $D2
		.BYTE  $1D, $D4, $1D, $D2, $1C,	$26, $1C, $D2, $1C, $D4, $1C, $D2, $1C,	$26, $1C, $26
		.BYTE  $21, $26, $22, $26, $21,	$26, $15, $26, $15, $26, $16, $26, $15,	$28, $1A, $26
		.BYTE  $1B, $D2, $1B, $D4, $1B,	$D2, $1A, $26, $1A, $26, $1A, $26, $1B,	$D2, $1B, $D4
		.BYTE  $1B, $D2, $1A, $26, $1A,	$26, $1F, $26, $1A, $D2, $1A, $D4, $1A,	$D2, $1F, $26
		.BYTE  $1F, $26, $1F, $26, $1D,	$26, $1F, $26, $1D, $26, $1F, $26, $1F,	$D2, $1F, $D4
		.BYTE  $1F, $D2, $1F, $26, $1F,	$26, $63
pmAdditional_1A:.BYTE  $18, $86, $24, $D2, $24,	$D4, $24, $D2, $18, $86, $18, $86, $18,	$86, $24, $D2 ;	...
		.BYTE  $24, $D4, $24, $D2, $18,	$86, $18, $86, $18, $86, $24, $D2, $24,	$D4, $24, $D2
		.BYTE  $18, $86, $18, $86, $18,	$86, $24, $D2, $24, $D4, $24, $D2, $18,	$86, $18, $86
		.BYTE  $18, $86, $24, $D2, $24,	$D4, $24, $D2, $18, $86, $18, $86, $18,	$86, $24, $D2
		.BYTE  $24, $D4, $24, $D2, $18,	$86, $18, $86, $18, $86, $24, $D2, $24,	$D4, $24, $D2
		.BYTE  $18, $86, $18, $86, $18,	$86, $24, $D2, $24, $D4, $24, $D2, $18,	$86, $18, $86
		.BYTE  $19, $86, $25, $D2, $25,	$D4, $25, $D2, $19, $86, $25, $D2, $25,	$D4, $25, $D2
		.BYTE  $18, $86, $24, $D2, $24,	$D4, $24, $D2, $18, $86, $24, $D2, $24,	$D4, $24, $D2
		.BYTE  $19, $86, $25, $D2, $25,	$D4, $25, $D2, $19, $86, $25, $D2, $25,	$D4, $25, $D2
		.BYTE  $18, $86, $24, $D2, $24,	$D4, $24, $D2, $18, $86, $24, $D2, $24,	$D4, $24, $D2
		.BYTE  $13, $86, $1F, $D2, $1F,	$D4, $1F, $D2, $13, $86, $13, $86, $13,	$86, $1F, $D2
		.BYTE  $1F, $D4, $1F, $D2, $13,	$86, $13, $86, $13, $86, $1F, $D2, $1F,	$D4, $1F, $D2
		.BYTE  $13, $86, $13, $86, $18,	$86, $24, $D2, $24, $D4, $24, $D2, $18,	$86, $18, $86
		.BYTE  $1C, $86, $28, $D2, $28,	$D4, $28, $D2, $1C, $86, $28, $D2, $28,	$D4, $28, $D2
		.BYTE  $1C, $86, $28, $D2, $28,	$D4, $28, $D2, $1C, $86, $28, $D2, $28,	$D4, $28, $D2
		.BYTE  $1C, $86, $28, $D2, $28,	$D4, $28, $D2, $1C, $86, $28, $D2, $28,	$D4, $28, $D2
		.BYTE  $1C, $86, $28, $D2, $28,	$D4, $28, $D2, $1C, $86, $28, $D2, $28,	$D4, $28, $D2
		.BYTE  $1C, $86, $28, $D2, $28,	$D4, $28, $D2, $1C, $86, $28, $D2, $28,	$D4, $28, $D2
		.BYTE  $1C, $86, $28, $D2, $28,	$D4, $28, $D2, $1C, $86, $28, $D2, $28,	$D4, $28, $D2
		.BYTE  $21, $86, $21, $86, $21,	$86, $2D, $D2, $2D, $D4, $2D, $D2, $21,	$86, $21, $86
		.BYTE  $2D, $D2, $2D, $D4, $2D,	$D2, $21, $86, $1A, $86, $26, $D2, $26,	$D4, $26, $D2
		.BYTE  $1A, $86, $1A, $86, $1A,	$86, $26, $D2, $26, $D4, $26, $D2, $1A,	$86, $1A, $86
		.BYTE  $63
pmAdditional_17:.BYTE  $60,  $A, $63	; ...
pmAdditional_1B:.BYTE  $60,  $A, $63	; ...
pmGameBegin_00:	.BYTE  $62, $1C, $DC,	1, $62,	$20, $E8,   1, $60,  $C, $60,  $C, $60,	 $C, $60,  $C ;	...
		.BYTE  $60,  $C, $60,  $C, $60,	 $C, $60,  $C, $64
		.WORD pmGameBegin_00
pmGameBegin_01:	.BYTE  $62, $1D, $E8,	8, $62,	$21, $E8,   1, $60,  $C, $60,  $C, $60,	 $C, $60,  $C ;	...
		.BYTE  $60,  $C, $60,  $C, $60,	 $C, $60,  $C, $64
		.WORD pmGameBegin_01
pmGameBegin_02:	.BYTE  $62, $1E, $F4,	8, $62,	$22, $F4,   1,	 0, $DC, $60,  $C, $60,	 $C, $60,  $C ;	...
		.BYTE  $60,  $C, $60,  $C, $60,	 $C, $60,  $C, $64
		.WORD pmGameBegin_02
pmGameBegin_03:	.BYTE  $62, $1F,   0,	1, $62,	$23,   0,   1, $64 ; ...
		.WORD pmGameBegin_03
pmAdditional_1C:.BYTE  $18,  $A, $60,  $A, $60,	  6, $40,   4, $41,   4, $44,	4, $45,	  4, $47,   4 ;	...
		.BYTE  $45,   2, $44,	2, $45,	  4, $41,   4, $3E,   4, $40,	4, $41,	  4, $43,   2
		.BYTE  $41,   2, $40,	4, $3E,	  4, $40,   4, $3B,   8, $3B,	2, $3C,	  2, $3E,   4
		.BYTE  $3C,   2, $3B,	2, $3C,	  4, $39,   6, $3B,   4, $3C,	4, $3E,	  2, $3C,   2
		.BYTE  $3B,   4, $39,	4, $3B,	  6, $40,   4, $42,   4, $44,	4, $45,	  4, $47,   4
		.BYTE  $48,   2, $47,	2, $48,	  4, $45,   4, $41,   5, $43,	2, $45,	  4, $43,   4
		.BYTE  $41,   4, $40,	2, $3E,	  2, $40,   4, $3B,   8, $3B,	2, $3C,	  2, $3E,   4
		.BYTE  $40,   2, $3E,	2, $3C,	  4, $3B,   4, $39,   4, $3B,	4, $3C,	  4, $3B,   4
		.BYTE  $39,   4, $35,	4, $34,	 $A, $60,   4, $32,   2, $34,	2, $35,	  4, $37,   2
		.BYTE  $35,   2, $34,	4, $32,	  4, $34,   4, $35,   4, $34,	2, $35,	  2, $34,  $A
		.BYTE  $32,   2, $34,	2, $35,	  4, $37,   4, $39,   4, $3B,	4, $39,	  4, $35,   4
		.BYTE  $34,  $C, $63
pmAdditional_20:.BYTE  $39,   2, $3A,	2, $39,	  2, $37,   2, $39,   6, $34,	6, $39,	  6, $3A,   2 ;	...
		.BYTE  $3C,   2, $3A,	2, $39,	  2, $3A,   6, $3E,   6, $40,	2, $41,	  2, $40,   2
		.BYTE  $3E,   2, $40,	8, $3C,	  6, $39,   6, $34,   2, $35,	2, $34,	  2, $32,   2
		.BYTE  $34,   9, $2D,	2, $2F,	  2, $30,   2, $32,   2, $34,	2, $35,	  2, $34,   2
		.BYTE  $32,   2, $34,	2, $35,	  2, $34,   2, $32,   2, $34,	6, $35,	  2, $37,   2
		.BYTE  $35,   2, $34,	2, $35,	  6, $3A,   6, $3E,   6, $40,	2, $3B,	  2, $39,   2
		.BYTE  $3B,   2, $40,	6, $3B,	  6, $3C,   6, $3B,  $A, $63
pmAdditional_24:.BYTE  $39,   2, $3A,	2, $39,	  2, $37,   2, $39,   6, $3C,	6, $39,	  6, $3A,   2 ;	...
		.BYTE  $3C,   2, $3A,	2, $39,	  2, $3A,   6, $3E,   6, $3C,	2, $3E,	  2, $3C,   2
		.BYTE  $3B,   2, $3C,	8, $39,	  6, $34,   6, $34,   2, $35,	2, $34,	  2, $32,   2
		.BYTE  $34,   9, $37,	2, $35,	  2, $34,   2, $32,   2, $34,	2, $35,	  2, $34,   2
		.BYTE  $32,   2, $34,	2, $35,	  2, $34,   2, $32,   2, $34,	6, $35,	  2, $37,   2
		.BYTE  $35,   2, $34,	2, $35,	  6, $3A,   6, $35,   6, $34,	2, $35,	  2, $34,   2
		.BYTE  $32,   2, $34,	6, $2F,	  6, $2C,   6, $2F,  $A, $63
pmAdditional_1D:.BYTE  $28, $14, $2C, $16, $2C,	$14, $28, $14, $2C, $14, $28, $14, $2C,	$14, $26, $14 ;	...
		.BYTE  $29, $16, $29, $14, $26,	$14, $29, $14, $26, $14, $29, $14, $63
pmAdditional_21:.BYTE  $21, $14, $24, $16, $24,	$14, $21, $14, $24, $14, $21, $14, $24,	$14, $22, $14 ;	...
		.BYTE  $26, $16, $26, $14, $22,	$14, $26, $14, $22, $14, $26, $14, $21,	$14, $24, $16
		.BYTE  $24, $14, $21, $14, $24,	$14, $21, $14, $24, $14, $28, $14, $2C,	$16, $2C, $14
		.BYTE  $28, $14, $2C, $14, $28,	$14, $2C, $14, $21, $14, $24, $16, $24,	$14, $21, $14
		.BYTE  $24, $14, $21, $14, $24,	$14, $22, $14, $26, $16, $26, $14, $22,	$14, $26, $14
		.BYTE  $22, $14, $26, $14, $28,	$14, $2F, $16, $2F, $14, $28, $14, $2F,	$14, $28, $14
		.BYTE  $2F, $14, $28, $14, $2F,	$16, $2F, $14, $28, $14, $2F, $14, $28,	$14, $2F, $14
		.BYTE  $63
pmAdditional_29:.BYTE  $63		; ...
pmAdditional_1E:.BYTE  $1C, $24, $28, $26, $28,	$24, $1C, $24, $28, $24, $1C, $24, $28,	$24, $1A, $24 ;	...
		.BYTE  $26, $26, $26, $24, $1A,	$24, $26, $24, $1A, $24, $26, $24, $63
pmAdditional_22:.BYTE  $15, $24, $21, $26, $21,	$24, $15, $24, $21, $24, $15, $24, $21,	$24, $16, $24 ;	...
		.BYTE  $22, $26, $22, $24, $16,	$24, $22, $24, $16, $24, $22, $24, $15,	$24, $21, $26
		.BYTE  $21, $24, $15, $24, $21,	$24, $15, $24, $21, $24, $1C, $24, $28,	$26, $28, $24
		.BYTE  $1C, $24, $28, $24, $1C,	$24, $28, $24, $15, $24, $21, $26, $21,	$24, $15, $24
		.BYTE  $21, $24, $15, $24, $21,	$24, $16, $24, $22, $26, $22, $24, $16,	$24, $22, $24
		.BYTE  $16, $24, $22, $24, $1C,	$24, $2D, $26, $2D, $24, $1C, $24, $2D,	$24, $1C, $24
		.BYTE  $2D, $24, $1C, $24, $2C,	$26, $2C, $24, $1C, $24, $2C, $24, $1C,	$24, $2C, $24
		.BYTE  $63
pmAdditional_1F:.BYTE  $60,  $A, $63	; ...
pmAdditionalLib_Lo:.BYTE <(pmAdditional_00) ; ...
		.BYTE <(pmAdditional_01)
		.BYTE <(pmAdditional_02)
		.BYTE <(pmAdditional_03)
		.BYTE <(pmAdditional_04)
		.BYTE <(pmAdditional_05)
		.BYTE <(pmVictory_00)
		.BYTE <(pmVictory_00)
		.BYTE <(pmVictory_00)
		.BYTE <(pmAdditional_09)
		.BYTE <(pmAdditional_0A)
		.BYTE <(pmAdditional_0B)
		.BYTE <(pmAdditional_0C)
		.BYTE <(pmAdditional_0D)
		.BYTE <(pmAdditional_0E)
		.BYTE <(pmAdditional_0F)
		.BYTE <(pmAdditional_10)
		.BYTE <(pmAdditional_11)
		.BYTE <(pmAdditional_12)
		.BYTE <(pmAdditional_13)
		.BYTE <(pmAdditional_14)
		.BYTE <(pmAdditional_15)
		.BYTE <(pmAdditional_16)
		.BYTE <(pmAdditional_17)
		.BYTE <(pmAdditional_18)
		.BYTE <(pmAdditional_19)
		.BYTE <(pmAdditional_1A)
		.BYTE <(pmAdditional_1B)
		.BYTE <(pmAdditional_1C)
		.BYTE <(pmAdditional_1D)
		.BYTE <(pmAdditional_1E)
		.BYTE <(pmAdditional_1F)
		.BYTE <(pmAdditional_20)
		.BYTE <(pmAdditional_21)
		.BYTE <(pmAdditional_22)
		.BYTE <(pmAdditional_1F)
		.BYTE <(pmAdditional_24)
		.BYTE <(pmAdditional_21)
		.BYTE <(pmAdditional_22)
		.BYTE <(pmAdditional_1F)
		.BYTE <(pmAdditional_1D)
		.BYTE <(pmAdditional_29)
		.BYTE <(pmAdditional_1F)
		.BYTE <(pmAdditional_1F)
		.BYTE <(pmAdditional_1D)
		.BYTE <(pmAdditional_1E)
		.BYTE <(pmAdditional_1F)
		.BYTE <(pmAdditional_1F)
pmAdditionalLib_Hi:.BYTE >(pmAdditional_00)	; ...
		.BYTE >(pmAdditional_01)
		.BYTE >(pmAdditional_02)
		.BYTE >(pmAdditional_03)
		.BYTE >(pmAdditional_04)
		.BYTE >(pmAdditional_05)
		.BYTE >(pmVictory_00)
		.BYTE >(pmVictory_00)
		.BYTE >(pmVictory_00)
		.BYTE >(pmAdditional_09)
		.BYTE >(pmAdditional_0A)
		.BYTE >(pmAdditional_0B)
		.BYTE >(pmAdditional_0C)
		.BYTE >(pmAdditional_0D)
		.BYTE >(pmAdditional_0E)
		.BYTE >(pmAdditional_0F)
		.BYTE >(pmAdditional_10)
		.BYTE >(pmAdditional_11)
		.BYTE >(pmAdditional_12)
		.BYTE >(pmAdditional_13)
		.BYTE >(pmAdditional_14)
		.BYTE >(pmAdditional_15)
		.BYTE >(pmAdditional_16)
		.BYTE >(pmAdditional_17)
		.BYTE >(pmAdditional_18)
		.BYTE >(pmAdditional_19)
		.BYTE >(pmAdditional_1A)
		.BYTE >(pmAdditional_1B)
		.BYTE >(pmAdditional_1C)
		.BYTE >(pmAdditional_1D)
		.BYTE >(pmAdditional_1E)
		.BYTE >(pmAdditional_1F)
		.BYTE >(pmAdditional_20)
		.BYTE >(pmAdditional_21)
		.BYTE >(pmAdditional_22)
		.BYTE >(pmAdditional_1F)
		.BYTE >(pmAdditional_24)
		.BYTE >(pmAdditional_21)
		.BYTE >(pmAdditional_22)
		.BYTE >(pmAdditional_1F)
		.BYTE >(pmAdditional_1D)
		.BYTE >(pmAdditional_29)
		.BYTE >(pmAdditional_1F)
		.BYTE >(pmAdditional_1F)
		.BYTE >(pmAdditional_1D)
		.BYTE >(pmAdditional_1E)
		.BYTE >(pmAdditional_1F)
		.BYTE >(pmAdditional_1F)
pAPU_P_1_Data:	.BYTE	 0,   4,   8,  $C ; ...
pAPU_SV_CSR_Bits:.BYTE APU_PULSE_1,APU_PULSE_2,APU_TRIANGLE,APU_NOISE,APU_DELTA_MOD ; ...
pAPU_SV_CSR_Mask:.BYTE APU_PULSE_2|APU_TRIANGLE|APU_NOISE|APU_DELTA_MOD|APU_UNUSED ; ...
		.BYTE APU_PULSE_1|APU_TRIANGLE|APU_NOISE|APU_DELTA_MOD|APU_UNUSED
		.BYTE APU_PULSE_1|APU_PULSE_2|APU_NOISE|APU_DELTA_MOD|APU_UNUSED
		.BYTE APU_PULSE_1|APU_PULSE_2|APU_TRIANGLE|APU_DELTA_MOD|APU_UNUSED
		.BYTE APU_PULSE_1|APU_PULSE_2|APU_TRIANGLE|APU_NOISE|APU_UNUSED
; ---------------------------------------------------------------------------

ClearSoundEngineVars:			; ...
		LDA	#0
		STA	byte_7E3
		STA	byte_7E7
		STA	byte_7E4
		STA	byte_7E8
		STA	byte_7E5
		STA	byte_7E9
		STA	byte_7E6
		STA	byte_7EA
		STA	byte_7FC
		STA	byte_7FD
		STA	byte_7FE
		STA	byte_7FF
		STA	byte_7E0
		RTS
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_6BD09

_PlaySound:				; ...
		STA	byte_7FB
		TXA
		PHA
		LDA	#8
		STA	pAPU_P_1_RCR	; pAPU Pulse #1	Ramp Control Register (W)
		STA	pAPU_P_2_RCR	; pAPU Pulse #2	Ramp Control Register (W)
		LDA	psInstrLib_Lo,X
		STA	v0
		LDA	psInstrLib_Hi,X
		STA	v1
		LDY	#0
		LDA	(v0),Y
		CMP	#4
		BCS	locret_6BCF3
		TAX
		LDA	byte_7FB
		CMP	byte_7FC,X
		BCS	loc_6BC9C
		PLA
		RTS
; ---------------------------------------------------------------------------

loc_6BC9C:				; ...
		STA	byte_7FC,X
		PLA
		STA	byte_7EF+8,X
		LDA	byte_7E0
		ORA	pAPU_SV_CSR_Bits,X
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
		STA	byte_7E0
		LDA	byte_7C8,X
		AND	#$FD ; 'ý'
		STA	byte_7C8,X
		INY
		LDA	(v0),Y
		STA	byte_7EF+4,X
		STA	byte_7EF,X
		INY
		LDA	(v0),Y
		LDY	pAPU_P_1_Data,X
		STA	pAPU_P_1_CR,Y	; pAPU Pulse #1	Control	Register (W)
		LDY	#3
		LDA	(v0),Y
		STA	byte_7CC+8,X
		INY
		LDA	(v0),Y
		STA	byte_7CC+$C,X
		LDA	#3
		STA	byte_7CC,X
		LDY	pAPU_P_1_Data,X
		JSR	loc_6ACAE
		LDY	#4
; END OF FUNCTION CHUNK	FOR sub_6BD09

; =============== S U B	R O U T	I N E =======================================


sub_6BCE3:				; ...
		INY
		TYA
		CLC
		ADC	v0
		STA	byte_7E7,X
		LDA	v1
		ADC	#0
		STA	byte_7E3,X
		RTS
; End of function sub_6BCE3

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_6BD09

locret_6BCF3:				; ...
		RTS
; END OF FUNCTION CHUNK	FOR sub_6BD09
; ---------------------------------------------------------------------------

_SoundEffectEngine:			; ...
		LDX	#0
		JSR	sub_6BD09
		LDX	#1
		JSR	sub_6BD09
		LDX	#2
		JSR	sub_6BD09
		LDX	#3
		JSR	sub_6BD09
		RTS

; =============== S U B	R O U T	I N E =======================================


sub_6BD09:				; ...

; FUNCTION CHUNK AT BC72 SIZE 00000071 BYTES
; FUNCTION CHUNK AT BCF3 SIZE 00000001 BYTES

		LDA	byte_7EF,X
		BEQ	loc_6BD12
		DEC	byte_7EF,X
		RTS
; ---------------------------------------------------------------------------

loc_6BD12:				; ...
		LDA	byte_7EF+4,X
		STA	byte_7EF,X
		LDA	byte_7E3,X
		BNE	loc_6BD1E
		RTS
; ---------------------------------------------------------------------------

loc_6BD1E:				; ...
		STA	v1
		LDA	byte_7E7,X
		STA	v0
		LDY	#0
		TYA
		STA	byte_7CC,X
		LDA	(v0),Y
		LDY	pAPU_P_1_Data,X
		STA	pAPU_P_1_CR,Y	; pAPU Pulse #1	Control	Register (W)
		LDY	#1
		LDA	(v0),Y
		CMP	#$FF
		BNE	loc_6BD46
		LDY	byte_7FC,X
		LDA	byte_7EF+8,X
		TAX
		TYA
		JMP	_PlaySound
; ---------------------------------------------------------------------------

loc_6BD46:				; ...
		CPX	#3
		BNE	loc_6BD62
		CMP	byte_7CC+$C,X
		BEQ	loc_6BD85
		STA	byte_7CC+$C,X
		LDA	#0
		STA	byte_7CC+8,X
		LDA	byte_7CC,X
		ORA	#3
		STA	byte_7CC,X
		JMP	loc_6BD85
; ---------------------------------------------------------------------------

loc_6BD62:				; ...
		CMP	byte_7CC+8,X
		BEQ	loc_6BD72
		STA	byte_7CC+8,X
		LDA	byte_7CC,X
		ORA	#1
		STA	byte_7CC,X

loc_6BD72:				; ...
		INY
		LDA	(v0),Y
		CMP	byte_7CC+$C,X
		BEQ	loc_6BD85
		STA	byte_7CC+$C,X
		LDA	byte_7CC,X
		ORA	#2
		STA	byte_7CC,X

loc_6BD85:				; ...
		JSR	sub_6BCE3
		LDA	byte_7CC+8,X
		ORA	byte_7CC+$C,X
		BEQ	loc_6BD96
		LDY	pAPU_P_1_Data,X
		JMP	loc_6ACAE
; ---------------------------------------------------------------------------

loc_6BD96:				; ...
		LDA	byte_7EB,X
		STA	byte_7C8,X
		LDA	byte_7E0
		AND	pAPU_SV_CSR_Mask,X
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
		LDA	#0
		STA	byte_7E3,X
		STA	byte_7E7,X
		STA	byte_7FC,X
		LDY	pAPU_P_1_Data,X
		LDA	byte_7CC+$10,X
		STA	pAPU_P_1_CR,Y	; pAPU Pulse #1	Control	Register (W)
		LDA	byte_7E0
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
		RTS
; End of function sub_6BD09

; ---------------------------------------------------------------------------
psInstrLib_Hi:	.BYTE >(psInstrSound_00) ; ...
		.BYTE >(psInstrSound_01)
		.BYTE >(psInstrSound_02)
		.BYTE >(psInstrSound_03)
		.BYTE >(psInstrSound_04)
		.BYTE >(psInstrSound_05)
		.BYTE >(psInstrSound_06)
		.BYTE >(psInstrSound_07)
		.BYTE >(psInstrSound_08)
		.BYTE >(psInstrSound_09)
		.BYTE >(psInstrSound_0A)
		.BYTE >(psInstrSound_0B)
		.BYTE >(psInstrSound_0C)
		.BYTE >(psInstrSound_0D)
		.BYTE >(psInstrSound_0E)
		.BYTE >(psInstrSound_0F)
		.BYTE >(psInstrSound_10)
		.BYTE >(psInstrSound_11)
		.BYTE >(psInstrSound_12)
psInstrLib_Lo:	.BYTE <(psInstrSound_00) ; ...
		.BYTE <(psInstrSound_01)
		.BYTE <(psInstrSound_02)
		.BYTE <(psInstrSound_03)
		.BYTE <(psInstrSound_04)
		.BYTE <(psInstrSound_05)
		.BYTE <(psInstrSound_06)
		.BYTE <(psInstrSound_07)
		.BYTE <(psInstrSound_08)
		.BYTE <(psInstrSound_09)
		.BYTE <(psInstrSound_0A)
		.BYTE <(psInstrSound_0B)
		.BYTE <(psInstrSound_0C)
		.BYTE <(psInstrSound_0D)
		.BYTE <(psInstrSound_0E)
		.BYTE <(psInstrSound_0F)
		.BYTE <(psInstrSound_10)
		.BYTE <(psInstrSound_11)
		.BYTE <(psInstrSound_12)
psInstrSound_00:.BYTE	 0,   0,   0,	0,   1,	  0,   0,   0 ;	...
psInstrSound_01:.BYTE	 1,   0,   0,	0,   1,	  0,   0,   0 ;	...
psInstrSound_02:.BYTE	 2,   0,   0,	0,   1,	  0,   0,   0 ;	...
psInstrSound_03:.BYTE	 3,   0, $10,	0,   1,	  0,   0,   0 ;	...
psInstrSound_04:.BYTE	 3,   7, $21,  $A,  $A,	  0,   0,   0 ;	...
psInstrSound_05:.BYTE	 1,   7, $A1,	0, $15,	  0,   0,   0 ;	...
psInstrSound_06:.BYTE	 3,   0, $3F,  $C,  $D,	  1,   0,   0,	 0,   0,   0,	0 ; ...
psInstrSound_07:.BYTE	 3,  $A, $25,  $C,  $E,	  0,   0,   0 ;	...
psInstrSound_08:.BYTE	 3,   2, $35,  $C,   9,	$37,   8, $3B,	 7, $3F,   6, $3F,   5,	$3E,   4, $3D ;	...
		.BYTE	 2, $3C,   1, $3B,   0,	  0,   0,   0
psInstrSound_09:.BYTE	 3,   0, $3A,	0,  $A,	$3A,  $F, $3A,	$C, $3A,  $F, $3A,  $C,	  0,   0,   0 ;	...
psInstrSound_0A:.BYTE	 1,   0, $B3,	0, $45,	$B2,   0, $B2, $B2,   0, $45, $B2,   0,	$45, $B2,   0 ;	...
		.BYTE  $45, $B2,   0, $45,   0,	  0,   0
psInstrSound_0B:.BYTE	 1,   1, $3F,	1, $F0,	$3F,   1, $E0, $3F,   1, $C0, $3F,   1,	$A0, $3F,   1 ;	...
		.BYTE  $80, $3F,   1, $60, $3F,	  1, $40, $3F,	 1, $20, $3F,	1,   0,	$3F,   3, $FF
		.BYTE  $3F,   3, $FF,	0,   0,	  0
psInstrSound_0C:.BYTE	 1,   0, $BF,	3,   0,	$BF,   3, $20, $BF,   3, $40, $BF,   3,	$60, $BF,   3 ;	...
		.BYTE  $80, $BF,   3, $A0, $BF,	  3, $C0, $BF,	 3, $E0, $BF,	4,   0,	$BF,   4, $20
		.BYTE  $BF,   3, $40, $BF,   4,	$60, $BF,   4, $80, $BF,   3, $A0, $BF,	  4, $C0, $BF
		.BYTE	 4, $E0, $BF,	5,   0,	  0,   0,   0
psInstrSound_0D:.BYTE	 1,   0, $3F,	3,   0,	$3F,   3, $20, $3F,   3, $40, $3F,   3,	$60, $3F,   3 ;	...
		.BYTE  $80, $3F,   3, $A0, $3F,	  3, $C0, $3F,	 3, $E0, $3F,	4,   0,	$3F,   4, $20
		.BYTE  $3F,   3, $40, $3F,   4,	$60, $3F,   4, $80, $3F,   3, $A0, $3F,	  4, $C0, $3F
		.BYTE	 4, $E0, $3F,	5,   0,	  0,   0,   0
psInstrSound_0E:.BYTE	 3, $32, $2C,  $C,  $E,	  0,   0,   0 ;	...
psInstrSound_0F:.BYTE	 1,   0, $BF,	3, $F0,	$BF,   3, $D0, $BC,   3, $B0, $BB,   3,	$90, $BA,   3 ;	...
		.BYTE  $70,   0,   5, $D0,   0,	  5, $D0,   0,	 5, $D0,   0,	5, $D0,	  0,   5, $D0
		.BYTE  $BF,   3, $20, $BC,   3,	  0, $BB,   2, $F0, $BA,   2, $D0,   0,	  5, $D0,   0
		.BYTE	 5, $D0, $BF,	2, $80,	$BC,   2, $70, $BB,   2, $60, $BA,   2,	$50,   0,   5
		.BYTE  $D0,   0,   5, $D0, $BF,	  2, $20, $BC,	 2, $10, $BB,	2,   0,	$BA,   1, $F0
		.BYTE	 0,   0,   0
psInstrSound_10:.BYTE	 1, $14, $30,	0, $10,	$27,   0, $18,	 0,   0,   0 ; ...
psInstrSound_11:.BYTE	 3,   0, $3F,	0,  $F,	$3C,  $E, $3C,	$D, $3C,  $C, $3C,  $B,	$3C,  $A, $3C ;	...
		.BYTE	 9, $3C,   8, $3C,   7,	$30,   1, $30,	 1, $30,   1, $30,   1,	$30,   1, $30
		.BYTE	 4, $30,   1, $30,   1,	$30,   1, $30,	 1, $3C,   7, $3C,   7,	$3C,   7, $3C
		.BYTE	 7, $3C,   7, $3C,   7,	  0,   0,   0
psInstrSound_12:.BYTE	 1,   1, $BF,	4,   0,	$BF,   4, $10, $BE,   4, $20, $BD,   4,	  0, $BC,   4 ;	...
		.BYTE  $10, $BB,   4, $20, $BA,	  4,   0, $B9,	 4, $10, $B8,	4, $10,	$B7,   4, $20
		.BYTE  $B6,   4,   0, $B5,   4,	$10, $B4,   4, $20, $B3,   4,	0, $B2,	  4, $10, $B1
		.BYTE	 4, $20,   0,	0,   0,	$3D,   3, $FF, $3C,   3, $FF, $3B,   3,	$FF,   0,   0
		.BYTE	 0,   3, $19, $30,  $C,	 $C, $30,  $C, $A9,  $C,  $C,	0,   0,	  0,   0,   0
pResidualData_02:.BYTE	  0,   6,   9,	$C, $12, $18, $24, $30,	$48, $60, $90, $C0,   8, $10, $3C, $62
		.BYTE	 0, $F4,   1


.PAD $C000,$FF
