/// @description Animated end stuff
switch (sprite_index)
{
	case sprStand:
	{
		if (aState == ActionState.STARTDOWN)
		{
			if (!instance_exists(obj_effOpening_Black))
			{
				obj_view.state = CameraState.NORMAL;
				obj_gameManager.playerCore = self;
				activateState = ActivateState.ACTIVATE;
				aState = ActionState.IDLE;
			}
		}
	}
	break;
	
	case sprRunStart:
	{
		sprite_index = sprRun;
		image_index = 0;
	}	
	break;

	case sprRunEnd:
	{
		sprite_index = sprStand;
		image_index = 0;
	}
	break;

	case sprJump1:
	{
		sprite_index = sprJump2;
		image_index = 0;
	}
	break;

	case sprJump3:
	{
		sprite_index = sprJump4;
		image_index = 0;
	}
	break;

	case sprLand:
	{
		sprite_index = sprStand;
		image_index = 0;
	}
	break;

	case sprDash1:
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
	break;

	case sprDash3:
	{
		hspd = 0;
		dashTime = 0;
		
		sprite_index = sprStand;
		image_index = 0;
	}
	break;

	case sprSlide1:
	{
		sprite_index = sprSlide2;
		image_index = 0;
	
		var slideEff = instance_create_depth(x + 16 * image_xscale, y + 12, depth - 1, obj_vDust);
		slideEff.image_xscale = image_xscale;
		slideEff.xPlace = 16;
		slideEff.yPlace = 12;
		slideEff.core = self;
	}
	break;

	case sprDuck1:
	{
		sprite_index = sprDuck2;
	}
	break;

	case sprDuck3:
	{
		sprite_index = sprStand;
		image_index = 0;
	}
	break;

	case sprWallKick:
	{
		image_index = 2;
	}
	break;

	case sprDashKick1:
	{
		sprite_index = sprDashKick2;
		image_index = 0;
	}
	break;
	
	case sprClimb3:
	{
		if (isClimbing == 1)
		{
			sprite_index = sprStand;
			image_index = 0;
		}
	}
	break;
	
	case sprClimb1:
	{
		if (isClimbing == 1)
		{
			isClimbing = 0;
		
			sprite_index = sprClimb2;
			image_index = 0;
		}
	}
	break;

	case sprStun1:
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
	break;

	case sprStun2:
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
	break;
	
	case sprWiredStartH:
	case sprWiredStartV:
	{
		sprite_index = sprWired;
		image_index = 0;
	}
	break;
	
	case sprBeamUp:
	{
		image_index --;
		if (vState != VerticalState.V_MOVE_UP)
		{
			vspd = -beamSpd;
			activateState = ActivateState.DEACTIVATE;
			vState = VerticalState.V_MOVE_UP;
		}
	}
	break;
	
	case sprBeamDown:
	{
		aState = ActionState.IDLE;
		vState = VerticalState.V_ON_GROUND;
		activateState = ActivateState.ACTIVATE;
		vspd = 0;
		if (instance_exists(obj_view))
		{
			obj_view.state = CameraState.NORMAL;
			obj_gameManager.playerCore = self;
		}
		
		sprite_index = sprStand;
		image_index = 0;
	}
	break;
}