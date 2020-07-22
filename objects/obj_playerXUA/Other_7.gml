/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (sprite_index)
{
	case spr_XCShotStand:
	{
		sprite_index = spr_XUAStand;
		image_index = 0;
		scr_playerXChangeShotSprite(object_index, false, true);
	}	break;
	
	case spr_XShotStand:
	{
		sprite_index = spr_XUAStand;
		image_index = 0;
		atkSpriteTime = 0;
		scr_playerXChangeShotSprite(object_index, false, false);
	}	break;

	case spr_XCShotDuck:
	{
		sprite_index = spr_XUADuck2;
		image_index = 0;
		scr_playerXChangeShotSprite(object_index, false, true);
	}	break;

	case spr_XShotClimb:
	{
		sprite_index = spr_XUAClimb;
		image_index = 4;
		scr_playerXChangeShotSprite(object_index, false, true);
	}	break;
	
	case spr_XUADashUp1:
	{
		dashPhase = 2;
		dashSpd = dashSpdPhase2;
		/*
			var dashEff = instance_create_depth(x + xPlaceDashEff * image_xscale, y + yPlaceDashEff, depth - 1, obj_PlayerDashEff);
			dashEff.image_xscale = self.image_xscale;
			dashEff.core = self;
			dashEff.xPlace = xPlaceDashEff;
			dashEff.yPlace = yPlaceDashEff;
		*/
	
		audio_play_sound_on(global.SFX_Emitter, sndDashEff, 0, 0);
		sprite_index = spr_XUADashUp2;
		image_index = 0;
	}	break;
	
	case spr_XUADashUp3:
	{
		sprite_index = sprJump3;
		image_index = 0;
	}	break;
}