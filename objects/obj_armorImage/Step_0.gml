/// @description Insert description here
// You can write your code in this editor

if (instance_exists(core))
{
	switch (Foot)
	{
		#region
		
		//No Armor
		case 0:	FootImg = noone; break;
	
		//Solar Foot
		case 1:
		{
			switch (core.sprite_index)
			{
				//Basic frames
				case spr_XStand:			FootImg = spr_FXSStand;				break;
				case spr_XDying:			FootImg = spr_FXSDying;				break;
				case spr_XShotRunStart:
				case spr_XRunStart:			FootImg = spr_FXSRunStart;			break;
				case spr_XShotRun:
				case spr_XRun:				FootImg = spr_FXSRun;				break;
				case spr_XShotRunEnd:
				case spr_XRunEnd:			FootImg = spr_FXSRunEnd;			break;
				case spr_XShotJump1:
				case spr_XJump1:			FootImg = spr_FXSJump1;				break;
				case spr_XShotJump2:
				case spr_XJump2:			FootImg = spr_FXSJump2;				break;
				case spr_XShotJump3:
				case spr_XJump3:			FootImg = spr_FXSJump3;				break;
				case spr_XShotJump4:
				case spr_XJump4:			FootImg = spr_FXSJump4;				break;
				case spr_XShotLand:
				case spr_XLand:				FootImg = spr_FXSLand;				break;
				case spr_XShotDash1:
				case spr_XDash1:			FootImg = spr_FXSDash1;				break;
				case spr_XShotDash2:
				case spr_XDash2:			FootImg = spr_FXSDash2;				break;
				case spr_XShotDash3:
				case spr_XDash3:			FootImg = spr_FXSDash3;				break;
				case spr_XShotSlide1:
				case spr_XSlide1:			FootImg = spr_FXSSlide1;			break;
				case spr_XShotSlide2:
				case spr_XSlide2:			FootImg = spr_FXSSlide2;			break;
				case spr_XShotWallKick:
				case spr_XWallKick:			FootImg = spr_FXSWallKick;			break;
				case spr_XDashKick1:		FootImg = spr_FXSDashKick1;			break;
				case spr_XDashKick2:		FootImg = spr_FXSDashKick2;			break;
				case spr_XDuck1:			FootImg = spr_FXSDuck1;				break;
				case spr_XShotDuck:
				case spr_XDuck2:			FootImg = spr_FXSDuck2;				break;
				case spr_XDuck3:			FootImg = spr_FXSDuck3;				break;
				case spr_XClimbStart:		FootImg = spr_FXSClimbStart;		break;
				case spr_XClimb:			FootImg = spr_FXSClimb;				break;
				case spr_XClimbEnd:			FootImg = spr_FXSClimbEnd;			break;
				//case spr_XStun0:			FootImg = spr_FXSStun0;				break;
				case spr_XStun1:			FootImg = spr_FXSStun1;				break;
				case spr_XStun2:			FootImg = spr_FXSStun2;				break;
				case spr_XStandUp:			FootImg = spr_FXSStandUp;			break;
				case spr_XStandDown:		FootImg = spr_FXSStandDown;			break;
				case spr_XTalk:				FootImg = spr_FXSTalk;				break;
				
				//Attack frames
				case spr_XShotStand:		FootImg = spr_FXSShotStand;			break;
				case spr_XCShotStand:		FootImg = spr_FXSCShotStand;		break;
				case spr_XCShotDuck:		FootImg = spr_FXSCShotDuck;			break;
				case spr_X2SideAtk:			FootImg = spr_FXS2SideAtk;			break;
				case spr_XUpAtk:			FootImg = spr_FXSUpAtk;				break;
				case spr_XShotClimb:		FootImg = spr_FXSShotClimb;			break;
				
				//Special move frames
				case spr_XDashCrossDown1:	FootImg = spr_FXSDashCrossDown1;	break;
				case spr_XDashCrossDown2:	FootImg = spr_FXSDashCrossDown2;	break;
				case spr_XESlamDown:		FootImg = spr_FXSSlamDown;			break;
				case spr_XEImpactDown:		FootImg = spr_FXSImpactDown;		break;
				
				//Wire frames
				case spr_XWiredForward:
				case spr_XWiredUp:
				case spr_XWiredDown:
				case spr_XWired:		
				case spr_XShotWired:	
											FootImg = spr_FXSWired;				break;
				case spr_XWiredStartHorizontal:
				case spr_XWiredStartVertical:
				case spr_XShotWiredStartHorizontal:
				case spr_XShotWiredStartVertical:
											FootImg = spr_FXSWiredStart;		break;
				default:					FootImg = noone;
			}
		}
	
		//Lunar Foot
		case 2:
		{
		
		}	break;
		
		#endregion
	}
	
	switch (Arms)
	{
		#region
		
		//No Armor
		case 0:	FootImg = noone; break;
	
		//Solar Foot
		case 1:
		{
			switch (core.sprite_index)
			{
				//Basic frames
				case spr_XStand:			ArmsImg = spr_AXSStand;				break;
				case spr_XDying:			ArmsImg = spr_AXSDying;				break;
				case spr_XRunStart:			ArmsImg = spr_AXSRunStart;			break;
				case spr_XRun:				ArmsImg = spr_AXSRun;				break;
				case spr_XRunEnd:			ArmsImg = spr_AXSRunEnd;			break;
				case spr_XJump1:			ArmsImg = spr_AXSJump1;				break;
				case spr_XJump2:			ArmsImg = spr_AXSJump2;				break;
				case spr_XJump3:			ArmsImg = spr_AXSJump3;				break;
				case spr_XJump4:			ArmsImg = spr_AXSJump4;				break;
				case spr_XLand:				ArmsImg = spr_AXSLand;				break;
				case spr_XDash1:			ArmsImg = spr_AXSDash1;				break;
				case spr_XDash2:			ArmsImg = spr_AXSDash2;				break;
				case spr_XDash3:			ArmsImg = spr_AXSDash3;				break;
				case spr_XSlide1:			ArmsImg = spr_AXSSlide1;			break;
				case spr_XSlide2:			ArmsImg = spr_AXSSlide2;			break;
				case spr_XWallKick:			ArmsImg = spr_AXSWallKick;			break;
				case spr_XDashKick1:		ArmsImg = spr_AXSDashKick1;			break;
				case spr_XDashKick2:		ArmsImg = spr_AXSDashKick2;			break;
				case spr_XDuck1:			ArmsImg = spr_AXSDuck1;				break;
				case spr_XDuck2:			ArmsImg = spr_AXSDuck2;				break;
				case spr_XDuck3:			ArmsImg = spr_AXSDuck3;				break;
				case spr_XClimbStart:		ArmsImg = spr_AXSClimbStart;		break;
				case spr_XClimb:			ArmsImg = spr_AXSClimb;				break;
				case spr_XClimbEnd:			ArmsImg = spr_AXSClimbEnd;			break;
				case spr_XStun1:			ArmsImg = spr_AXSStun1;				break;
				case spr_XStun2:			ArmsImg = spr_AXSStun2;				break;
				//case spr_XStun0:			FootImg = spr_AXSStun0;				break;
				
				//Attack frames
				case spr_XShotStand:		ArmsImg = spr_AXSShotStand;			break;
				case spr_XCShotStand:		ArmsImg = spr_AXSCShotStand;		break;
				case spr_XShotRun:			ArmsImg = spr_AXSShotRun;			break;
				case spr_XShotRunStart:		ArmsImg = spr_AXSShotRunStart;		break;
				case spr_XShotRunEnd:		ArmsImg = spr_AXSShotRunEnd;		break;
				case spr_XShotDuck:			ArmsImg = spr_AXSShotDuck;			break;
				case spr_XCShotDuck:		ArmsImg = spr_AXSCShotDuck;			break;
				case spr_XShotJump1:		ArmsImg = spr_AXSShotJump1;			break;
				case spr_XShotJump2:		ArmsImg = spr_AXSShotJump2;			break;
				case spr_XShotJump3:		ArmsImg = spr_AXSShotJump3;			break;
				case spr_XShotJump4:		ArmsImg = spr_AXSShotJump4;			break;
				case spr_XShotLand:			ArmsImg = spr_AXSShotLand;			break;
				
				//Special move frames
				case spr_XDashCrossDown1:	ArmsImg = spr_AXSDashCrossDown1;	break;
				case spr_XDashCrossDown2:	ArmsImg = spr_AXSDashCrossDown2;	break;
				case spr_XESlamDown:		ArmsImg = spr_AXSSlamDown;			break;
				case spr_XEImpactDown:		ArmsImg = spr_AXSImpactDown;		break;
				
				//Wire frames
				case spr_XWiredForward:
				case spr_XWiredUp:
				case spr_XWiredDown:
				case spr_XWired:		
											ArmsImg = spr_AXSWired;				break;
				case spr_XWiredStartHorizontal:
											ArmsImg = spr_AXSWiredStartHorizontal;		break;
				case spr_XWiredStartVertical:
											ArmsImg = spr_AXSWiredStartVertical;		break;
				default:					ArmsImg = noone;
			}
		}
	
		//Lunar Foot
		case 2:
		{
		
		}	break;
		
		#endregion
	}
	
	x = core.x;
	y = core.y;
	depth = core.depth - 1;
	image_speed = 0;
	image_index = core.image_index;
	image_xscale = core.image_xscale;
	image_yscale = core.image_yscale;
	image_alpha = core.image_alpha;
}
else instance_destroy();