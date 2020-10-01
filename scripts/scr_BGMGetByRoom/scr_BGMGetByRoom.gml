// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_BGMGetByRoom(roomGet){
	switch (roomGet)
	{
		case room_JunkYard:
			return noone;	break;
		case room_PowerPlant:
		case room_PowerPlantElf:
			return bgm_PowerPlantMain;	break;
		default:
			return noone;
	}
}