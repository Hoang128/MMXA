/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (sprite_index)
{
	case spr_XUAStandCShot:
	{
		sprite_index = spr_XUAStand;
		image_index = 0;
		scr_playerXChangeShotSprite(object_index, false, true);
	}	break;
	
	case spr_XUAStandShot:
	{
		sprite_index = spr_XUAStand;
		image_index = 0;
		atkSpriteTime = 0;
		scr_playerXChangeShotSprite(object_index, false, false);
	}	break;

	case spr_XUADuckCShot:
	{
		sprite_index = spr_XUADuck2;
		image_index = 0;
		scr_playerXChangeShotSprite(object_index, false, true);
	}	break;

	case spr_XUAClimbShot:
	{
		sprite_index = spr_XUAClimb;
		image_index = 4;
		scr_playerXChangeShotSprite(object_index, false, true);
	}	break;
	
	case sprDashUp1:
	{
		dashPhase = 2;
		dashSpd = dashUpSpdPhase2;
		var dashEff = instance_create_depth(x, bbox_bottom + 4, depth - 1, obj_XUADashUpEff);
		dashEff.image_xscale = self.image_xscale;
		dashEff.core = self;
	
		audio_play_sound_on(global.SFX_Emitter, sndDashEff, 0, 0);
		sprite_index = sprDashUp2;
		image_index = 0;
	}	break;
	
	case sprDashUp3:
	{
		sprite_index = sprJump3;
		image_index = 0;
	}	break;
	
	case sprHoverFw:
	case sprHoverBw:
	{
		image_index = 1;
	}	break;
}