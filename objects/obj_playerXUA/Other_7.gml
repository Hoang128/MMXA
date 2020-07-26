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
	
	case spr_XUANovaStrike1:
	{
		sprite_index = spr_XUANovaStrike2;
		image_index = 0;
		if (random(2) > 1)
			audio_play_sound_on(global.SFX_Emitter, snd_VXNovaStrike1, false, false);
		else
			audio_play_sound_on(global.SFX_Emitter, snd_VXNovaStrike2, false, false);
		var objNV = instance_create_depth(x, y, depth - 1, obj_XNovaStrike);
		objNV.image_xscale = image_xscale;
		objNV.core = self;
		
		hspd = hDir * novaStrikeSpd;
		vspd = 0;
		hState = HorizontalState.H_MOVE_FORWARD;
		vState = VerticalState.V_MOVE_NONE;
		
		novaTime = novaTimeMax;
	}	break;
	
	case spr_XUANovaStrikeEnd:
	{
		sprite_index = sprJump4;
		image_index = 0;
		
		canGetDamage = true;
		hspd = 0;
		vspd = novaStrikeEndVspd;
		hState = HorizontalState.H_MOVE_NONE;
		vState = VerticalState.V_MOVE_FALLING;
		aState = ActionState.IDLE;
		atkState = AttackState.A_NONE;
	}
}