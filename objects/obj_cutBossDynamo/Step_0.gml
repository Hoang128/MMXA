/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
switch(phase)
{
	case 0:
	{
		var xPlace = X_VIEW + W_VIEW - (obj_gameManager.playerCore.x - X_VIEW);
		var yPlace = Y_VIEW;
		var fakeBoss = instance_create_layer(xPlace, yPlace, obj_gameManager.lEnemy, obj_dynamoCutscene);
		fakeBoss.sprite_index = spr_dynamoBeam;
		fakeBoss.phase = 0;
		phase = 1;
	}	break;
	
	case 1:
	{
		if (instance_exists(obj_dynamoCutscene))
		{
			if (obj_dynamoCutscene.phase == 3)
			{
				var boss = instance_create_depth(obj_dynamoCutscene.x, obj_dynamoCutscene.y, obj_gameManager.lEnemy, obj_dynamo);
				boss.image_xscale = obj_dynamoCutscene.image_xscale;
				instance_destroy(obj_dynamoCutscene);
				phase = 2;
			}
		}
	}	break;
}