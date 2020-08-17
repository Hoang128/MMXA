/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*
state 0:	Init
state 1:	Idle
state 2:	Open top hatch
state 3:	Open bottom hatch
*/

switch(state)
{
	case 0:
	{
		sprite_index = spr_GunvoltIdle;
		image_index = 0;
		
		if (instance_exists(obj_gameManager.playerCore))
		{
			if (self.x = obj_gameManager.playerCore.x)	image_xscale = 1;
			else
			{
				image_xscale = sign(obj_gameManager.playerCore.x - self.x);
			}
		}
		
		state = 1;
	}	break;
	
	case 1:
	{
		if (instance_exists(obj_gameManager.playerCore))
		{
			if (self.x = obj_gameManager.playerCore.x)	image_xscale = 1;
			else
			{
				image_xscale = sign(obj_gameManager.playerCore.x - self.x);
			}
		}
		
		if (waitTime < waitTimeMax)
			waitTime += DELTA_TIME;
		else
		{
			if (instance_exists(obj_gameManager.playerCore))
			{
				audio_play_sound_on(global.SFX_Emitter, snd_GVOpen, false, false);
				
				var r;
				randomize();
				r = random(4);
				if ((self.y - obj_gameManager.playerCore.y) < 0)
				{
					if (r > 1)
					{
						sprite_index = spr_GunvoltOpenHatchDown;
						image_index = 0;
					
						state = 3;
					}
					else
					{
						sprite_index = spr_GunvoltOpenHatchUp;
						image_index = 0;
					
						state = 2;
					}
				}
				else
				{
					if (r > 1)
					{
						sprite_index = spr_GunvoltOpenHatchUp;
						image_index = 0;
					
						state = 2;
					}
					else
					{
						sprite_index = spr_GunvoltOpenHatchDown;
						image_index = 0;
					
						state = 3;
					}
				}
			}
		}
	}	break;
	
	case 2:
	{
		if (((image_index >= 10) && (image_index <= 11))
		||	((image_index >= 15) && (image_index <= 16)))
		{
			if (shot == false)
			{
				audio_play_sound_on(global.SFX_Emitter, snd_GVShot, false, false);
				
				if ((image_index >= 10) && (image_index <= 11))
				{
					var yPlace = -41;
					var xPlace1 = -9;
					var xPlace2 = 31;
				}
				else
				{
					var yPlace = -51;
					var xPlace1 = -11;
					var xPlace2 = 27;
				}
				var objMissle1 = instance_create_depth(x + xPlace1 * image_xscale, y + yPlace, depth - 1, obj_E_GVMissle);
				objMissle1.image_xscale = image_xscale;
				var objMissle2 = instance_create_depth(x + xPlace2 * image_xscale, y + yPlace, depth - 1, obj_E_GVMissle);
				objMissle2.image_xscale = image_xscale;
				shot = true;
			}
		}
		
		if (((image_index >= 12) && (image_index <= 13))
		||	((image_index >= 17) && (image_index <= 18)))
		{
			if (shot == true)
			{
				shot = false;
			}
		}
	}	break;
	
	case 3:
	{
		if ((image_index >= 7) && (image_index <= 8))
		{
			if (shot == false)
			{
				xPlace1 = -15;
				xPlace2 = 23;
				yPlace = -16;
				var obj1 = instance_create_depth(x + xPlace1, y + yPlace, depth - 1, obj_E_GVSpark);
				obj1.image_xscale = image_xscale;
				var obj2 = instance_create_depth(x + xPlace2, y + yPlace, depth - 1, obj_E_GVSpark);
				obj2.image_xscale = image_xscale;
				shot = true;
			}
		}
		if ((image_index >= 9) && (image_index <= 10))
		{
			if (shot == true)
			{
				shot = false;
			}
		}
	}	break;
}