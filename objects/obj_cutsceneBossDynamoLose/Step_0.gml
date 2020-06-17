/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(phase)
{
	case 0:
	{
		var objBoss = instance_create_depth(x, y, depth, obj_dynamoCutscene);
		objBoss.phase = 3;
		objBoss.image_xscale = obj_dynamoLose.image_xscale;
		objBoss.sprite_index = spr_dynamoStand;
		with(objBoss)
			move_contact_solid(270,0);
		phase = 1;
	}	break;
	case 1:
	{
		if (obj_bossManager.phase == 7)
		{
			phase = 2;
		}
	}	break;
	case 2:
	{
		if (instance_exists(obj_dynamoCutscene))
		{
			obj_dynamoCutscene.phase = 4;
			phase = 3;
		}
	}	break;
	case 3:
	{
		if (!instance_exists(obj_dynamoCutscene))
		{
			instance_destroy();
		}
	}	break;
}