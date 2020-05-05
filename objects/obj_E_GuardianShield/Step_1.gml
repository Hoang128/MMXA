/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
imgSpd = 0;

if (instance_exists(core))
{
	image_xscale = core.image_xscale;
	switch (core.sprite_index)
	{
		case spr_Guardian:				
		{ 
			sprite_index = spr_Guardian_Shield;				
			direction = 90 - image_xscale*90;
		}	break;
		case spr_GuardianShot:			
		{ 
			sprite_index = spr_GuardianShot_Shield;		
			direction = 90;
		}	break;
		case spr_GuardianOpenGuard:		
		{ 
			sprite_index = spr_GuardianOpenGuard_Shield;	
			direction = 90 - image_xscale*90;
		}	break;
		case spr_GuardianCloseGuard:	
		{ 
			sprite_index = spr_GuardianCloseGuard_Shield;
			direction = 90 - image_xscale*90;
		}	break;
		case spr_GuardianTurnBack:		{ 
			sprite_index = spr_GuardianTurnBack_Shield;
			if (image_index < 2)
				direction = 90 - image_xscale*90;
			else
				direction = 90 + image_xscale*90;
		}	break;
	}

	if (sprite_index == spr_GuardianShot_Shield)	image_index = 0;
	else	image_index = core.image_index;
}