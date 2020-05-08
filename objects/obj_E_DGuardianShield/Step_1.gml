/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
imgSpd = 0;

if (instance_exists(core))
{
	image_xscale = core.image_xscale;
	switch (core.sprite_index)
	{
		case spr_DGuardian:				
		{ 
			sprite_index = spr_DGuardian_Shield;				
			direction = 90 - image_xscale*90;
		}	break;
		case spr_DGuardianShot:			
		{ 
			sprite_index = spr_DGuardianShot_Shield;		
			direction = 90;
		}	break;
		case spr_DGuardianOpenGuard:		
		{ 
			sprite_index = spr_DGuardianOpenGuard_Shield;	
			direction = 90 - image_xscale*90;
		}	break;
		case spr_DGuardianCloseGuard:	
		{ 
			sprite_index = spr_DGuardianCloseGuard_Shield;
			direction = 90 - image_xscale*90;
		}	break;
		case spr_DGuardianTurnBack:		{ 
			sprite_index = spr_DGuardianTurnBack_Shield;
			if (image_index < 2)
				direction = 90 - image_xscale*90;
			else
				direction = 90 + image_xscale*90;
		}	break;
	}

	if (sprite_index == spr_DGuardianShot_Shield)	image_index = 0;
	else	image_index = core.image_index;
}