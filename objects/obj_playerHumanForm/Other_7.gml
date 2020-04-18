/// @description Animated end stuff
if (weight != WeighType.MASSIVE)
{
	if (sprite_index == sprBeamDown)
	{
		aState = ActionState.IDLE;
		vState = VerticalState.V_ON_GROUND;
		activateState = ActivateState.ACTIVATE;
		vspd = 0;
		if (instance_exists(obj_cameraMan))
		{
			obj_cameraMan.state = CameraState.NORMAL;
			obj_cameraMan.playerCore = self;
			obj_gameManager.playerCore = self;
		}
		
		sprite_index = sprStand;
		image_index = 0;
	}
}

if (sprite_index == sprRunStart)
{
	sprite_index = sprRun;
	image_index = 0;
}

if (sprite_index == sprRunEnd)
{
	sprite_index = sprStand;
	image_index = 0;
}

if (sprite_index == sprJump1)
{
	sprite_index = sprJump2;
	image_index = 0;
}

if (sprite_index == sprJump3)
{
	sprite_index = sprJump4;
	image_index = 0;
}

if (sprite_index == sprLand)
{
	sprite_index = sprStand;
	image_index = 0;
}

if (sprite_index == sprDash1)
{
	dashPhase = 2;
	if (self.weight != WeighType.MASSIVE)
	{
		var dashEff = instance_create_depth(x + xPlaceDashEff * image_xscale, y + yPlaceDashEff, depth - 1, obj_PlayerDashEff);
		dashEff.image_xscale = self.image_xscale;
		dashEff.core = self;
		dashEff.xPlace = xPlaceDashEff;
		dashEff.yPlace = yPlaceDashEff;
		if (object_index == obj_playerX) dashEff.sprite_index = spr_XDashEff;
		else if (object_index == obj_playerZ) dashEff.sprite_index = spr_ZDashEff;
		
		if (vState == VerticalState.V_ON_GROUND)
		{
			var dashEff = instance_create_depth(x + 4 * image_xscale, y, depth - 2, obj_sideDust);
			dashEff.image_xscale = self.image_xscale;
		}
		
		scr_SetIceSlideSpd(dashSpdPhase2 * hDir, false);
	}
	
	audio_play_sound_on(global.SFX_Emitter, sndDashEff, 0, 0);
	sprite_index = sprDash2;
	image_index = 0;
}

if (sprite_index == sprDash3)
{
	sprite_index = sprStand;
	image_index = 0;
}

if (sprite_index == sprSlide1)
{
	sprite_index = sprSlide2;
	image_index = 0;
	
	var slideEff = instance_create_depth(x + 16 * image_xscale, y + 12, depth - 1, obj_vDust);
	slideEff.image_xscale = image_xscale;
	slideEff.xPlace = 16;
	slideEff.yPlace = 12;
	slideEff.core = self;
}

if (sprite_index == sprDuck1)
{
	sprite_index = sprDuck2;
}

if (sprite_index == sprDuck3)
{
	sprite_index = sprStand;
	image_index = 0;
}

if (sprite_index == sprWallKick)
{
	image_index = 2;
}

if (sprite_index == sprDashKick1)
{
	sprite_index = sprDashKick2;
	image_index = 0;
}

if (isClimbing == 1)
{
	if (sprite_index == sprClimb3)
	{	
		sprite_index = sprStand;
		image_index = 0;
	}

	if (sprite_index == sprClimb1)
	{
		isClimbing = 0;
		
		sprite_index = sprClimb2;
		image_index = 0;
	}
}

if (sprite_index == sprBeamUp)
{
	image_index --;
	if (vState != VerticalState.V_MOVE_UP)
	{
		vspd = -beamSpd;
		activateState = ActivateState.DEACTIVATE;
		vState = VerticalState.V_MOVE_UP;
	}
}

if (sprite_index == sprStun1)
{
	if (stunType == StunType.STUN_SOFT)
	{
		if (place_meeting(x, y + 1, obj_block))
		{
			vState = VerticalState.V_ON_GROUND;
			sprite_index = sprStand;
			image_index = 0;
		}
		else
		{
			vState = VerticalState.V_MOVE_FALLING;
			sprite_index = sprJump3;
			image_index = 0;
		}
		hspd = 0;
		activateState = ActivateState.ACTIVATE;
		aState = ActionState.IDLE;
		hState = HorizontalState.H_MOVE_NONE;
		stunType = StunType.STUN_NONE;
	}
}

if (sprite_index == sprStun2)
{
	if (stunSprLoop > 0) stunSprLoop--;
	else
	{
		if (stunType == StunType.STUN_NORMAL || stunType == StunType.STUN_SOFT)
		{
			if (place_meeting(x, y + 1, obj_block))
			{
				vState = VerticalState.V_ON_GROUND;
				sprite_index = sprStand;
				image_index = 0;
			}
			else
			{
				vState = VerticalState.V_MOVE_FALLING;
				sprite_index = sprJump3;
				image_index = 0;
			}
			if (chargeNormal > 0)
				if (!keyboard_check(global.keyAtk))
					chargeNormal = 0;
			hspd = 0;
			activateState = ActivateState.ACTIVATE;
			aState = ActionState.IDLE;
			hState = HorizontalState.H_MOVE_NONE;
			stunType = StunType.STUN_NONE;
		}
	}
}