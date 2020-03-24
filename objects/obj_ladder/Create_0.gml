/// @description Init

event_inherited();

topLadder = 0;

if (!place_meeting(x, y-1, obj_ladder))
	topLadder = 1;
	
