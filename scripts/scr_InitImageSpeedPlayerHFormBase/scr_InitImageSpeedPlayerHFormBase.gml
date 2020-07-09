switch argument0
{
	case obj_playerX:
	{
		#region
		switch sprite_index
		{
			//General
			case sprStand:			image_speed = 0.1; break;
			case sprRunStart:
			case sprRun:
			case sprRunEnd:			image_speed = 0.5; break;
			case sprLand:			image_speed = 0.3; break;
			case sprDash1:			image_speed = 0.5; break;
			case sprDash2:			image_speed = 0.6; break;
			case sprDash3:			image_speed = 0.3; break;
			case sprJump1:			image_speed = 0.3; break;
			case sprJump3:			image_speed = 0.3; break;
			case sprJump2:
			case sprJump4:			image_speed = 1; break;
			case sprSlide1:			image_speed = 0.4; break;
			case sprWallKick:		image_speed = 0.5; break;
			case sprDashKick1:		image_speed = 0.6; break;
			case sprDashKick2:		image_speed = 0.6; break;
			case sprClimb1:			image_speed = isClimbing * 0.3; break;
			case sprClimb2:
			case sprClimb3:			image_speed = isClimbing * 0.3; break;
			case sprBeamDown:
			case sprBeamUp:			image_speed = 0.3; break;
			case sprStun1:			image_speed = 0.7; break;
			case sprStun2:			image_speed = 0.3; break;
			case sprWired:			image_speed = 0; break;
			
			default:				image_speed = 0.5; break;
		}
		#endregion
	}
	break;
	
	case obj_playerZ:
	{
		#region
		switch sprite_index
		{
			//General
			case sprStand:			image_speed = 0.1; break;
			case sprRunStart:
			case sprRun:
			case sprRunEnd:			image_speed = 0.5; break;
			case sprLand:			image_speed = 0.3; break;
			case sprDash1:			image_speed = 0.5; break;
			case sprDash2:			image_speed = 0.6; break;
			case sprDash3:			image_speed = 0.3; break;
			case sprJump1:			image_speed = 0.3; break;
			case sprJump3:			image_speed = 0.5; break;
			case sprJump2:			image_speed = 0.5; break;
			case sprJump4:			image_speed = 0.5; break;
			case sprSlide1:			image_speed = 0.4; break;
			case sprWallKick:		image_speed = 0.5; break;
			case sprDashKick1:		image_speed = 0.6; break;
			case sprDashKick2:		image_speed = 0.6; break;
			case sprClimb1:			image_speed = isClimbing * 0.3; break;
			case sprClimb2:
			case sprClimb3:			image_speed = isClimbing * 0.3; break;
			case sprBeamDown:
			case sprBeamUp:			image_speed = 0.3; break;
			case sprStun1:			image_speed = 0.7; break;
			case sprStun2:			image_speed = 0.3; break;
			case sprWired:			image_speed = 0; break;
			
			//Zero only
			case spr_ZDoubleJump:	image_speed = 0.35; break;
			case spr_ZSlashCombo1:	image_speed = 0.5; break;
			case spr_ZSlashCombo2:	image_speed = 0.5; break;
			case spr_ZSaberCombo3:	image_speed = 0.5; break;
			case spr_ZSlashJump:	image_speed = 1; break;
			case spr_ZSlashEnd_A:	image_speed = 1; break;
			case spr_ZSlashLand:	image_speed = 1; break;
			
			case spr_ZSlashWired:
			case spr_ZShotNorA:
			case spr_ZShotNorG:
			case spr_ZShotHoldThunderBlaster:
			case spr_ZShotC1_A:
			case spr_ZShotC1_G:
			case spr_ZShotC2_A:
			case spr_ZShotC2_G:
			case spr_ZShotC3_A:
			case spr_ZShotC3_G:		image_speed = 0.5; break;
			
			default:				image_speed = 0.5; break;
		}
		#endregion
	}
	break;
}