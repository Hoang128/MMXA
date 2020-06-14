/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var bossZone = collision_rectangle(obj_gameManager.playerCore.bbox_left, obj_gameManager.playerCore.bbox_top, obj_gameManager.playerCore.bbox_right, obj_gameManager.playerCore.bbox_bottom, obj_limitZoneBoss, false, false);
bossZone.phase = 2;
with(obj_gateBoss)
{
	if(place_meeting(x, y + 1, bossZone) 
	|| place_meeting(x, y - 1, bossZone) 
	|| place_meeting(x + 1, y, bossZone)
	|| place_meeting(x - 1, y, bossZone))
	{
		phase = 0;
	}
}

scr_BGMSet(global.BGM_stage, true);