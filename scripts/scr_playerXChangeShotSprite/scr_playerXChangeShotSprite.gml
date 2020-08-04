var obj = argument0;
var attackMode = argument1;
var charge = argument2;
switch (obj)
{
	case obj_playerX:
	case obj_playerEclipseX:
	{
		#region
		
		if (attackMode == true)
		{
			switch (sprite_index)
			{
				case sprStand:		
				{
					if (charge == false)
					{
						sprite_index = spr_XShotStand;
						image_index = 0;
					}
					else
					{
						sprite_index = spr_XCShotStand;
						image_index = 0;
					}
				}	break;
				case spr_XShotStand:
				{
					sprite_index = spr_XShotStand;
					image_index = 0;
				}	break;
				case sprDuck2:		
				{
					if (charge == false)
					{
						sprite_index = spr_XShotDuck;
						image_index = 0;
					}
					else
					{
						sprite_index = spr_XCShotDuck;
						image_index = 0;
					}
				}	break;
				case sprRunStart:		sprite_index = spr_XShotRunStart;				break;
				case sprRun:			sprite_index = spr_XShotRun;					break;
				case sprRunEnd:			sprite_index = spr_XShotRunEnd;					break;
				case sprJump1:			sprite_index = spr_XShotJump1;					break;
				case sprJump2:			sprite_index = spr_XShotJump2;					break;
				case sprJump3:			sprite_index = spr_XShotJump3;					break;
				case sprJump4:			sprite_index = spr_XShotJump4;					break;
				case sprDash1:			sprite_index = spr_XShotDash1;					break;
				case sprDash2:			sprite_index = spr_XShotDash2;					break;
				case sprDash3:			sprite_index = spr_XShotDash3;					break;
				case sprWallKick:		sprite_index = spr_XShotWallKick;				break;
				case sprLand:			sprite_index = spr_XShotLand;					break;
				case sprWired:
				case sprWiredForward:
				case sprWiredUp:
				case sprWiredDown:		sprite_index = spr_XShotWired;					break;
				case sprWiredStartH:	sprite_index = spr_XShotWiredStartHorizontal;	break;
				case sprWiredStartV:	sprite_index = spr_XShotWiredStartVertical;		break;
				case sprClimb2:		
				{
					vspd = 0;
					vState = VerticalState.V_MOVE_NONE;
					isClimbing = 0;
					sprite_index = spr_XShotClimb;		
					image_index = 0;
					image_speed = 0;
				}	break;
				case sprSlide1:			sprite_index = spr_XShotSlide1;					break;
				case sprSlide2:			sprite_index = spr_XShotSlide2;					break;
				case sprDashKick1:
				case sprDashKick2:		sprite_index = spr_XShotJump2;					break;
				case sprHover:			sprite_index = spr_XEHoverShot;					break;
			}
			sprStand = spr_XShotStand;
			sprDuck2 = spr_XShotDuck;
			sprRunStart = spr_XShotRunStart;
			sprRun = spr_XShotRun;
			sprRunEnd = spr_XShotRunEnd;
			sprJump1 = spr_XShotJump1;
			sprJump2 = spr_XShotJump2;
			sprJump3 = spr_XShotJump3;
			sprJump4 = spr_XShotJump4;
			sprDash1 = spr_XShotDash1;
			sprDash2 = spr_XShotDash2;
			sprDash3 = spr_XShotDash3;
			sprWallKick = spr_XShotWallKick;
			sprLand = spr_XShotLand;
			sprSlide1 = spr_XShotSlide1;
			sprSlide2 = spr_XShotSlide2;
			sprDashKick1 = spr_XShotJump2;
			sprDashKick2 = spr_XShotJump2;
			sprWired = spr_XShotWired;
			sprWiredForward = spr_XShotWired;
			sprWiredUp = spr_XShotWired;
			sprWiredDown = spr_XShotWired;
			sprWiredStartH = spr_XShotWiredStartHorizontal;
			sprWiredStartV = spr_XShotWiredStartVertical;
			sprHover = spr_XEHoverShot;
			
			inShotFrame = true;
		}
		
		if (attackMode == false)
		{
			switch (sprite_index)
			{
				case sprStand:			sprite_index = spr_XStand;					break;
				case sprRunStart:		sprite_index = spr_XRunStart;				break;
				case sprRun:			sprite_index = spr_XRun;					break;
				case sprRunEnd:			sprite_index = spr_XRunEnd;					break;
				case sprJump1:			sprite_index = spr_XJump1;					break;
				case sprJump2:			sprite_index = spr_XJump2;					break;
				case sprJump3:			sprite_index = spr_XJump3;					break;
				case sprJump4:			sprite_index = spr_XJump4;					break;
				case sprDash1:			sprite_index = spr_XDash1;					break;
				case sprDash2:			sprite_index = spr_XDash2;					break;
				case sprDash3:			sprite_index = spr_XDash3;					break;
				case sprDuck2:			sprite_index = spr_XDuck2;					break;
				case sprWallKick:		sprite_index = spr_XWallKick;				break;
				case sprLand:			sprite_index = spr_XLand;					break;
				case sprSlide1:			sprite_index = spr_XSlide1;					break;
				case sprSlide2:			sprite_index = spr_XSlide2;					break;
				case sprDashKick1:		sprite_index = spr_XDashKick1;				break;
				case sprDashKick2:		sprite_index = spr_XDashKick2;				break;
				case sprWired:			sprite_index = spr_XWired;					break;
				case sprWiredForward:	sprite_index = spr_XWiredForward;			break;
				case sprWiredUp:		sprite_index = spr_XWiredForward;			break;
				case sprWiredDown:		sprite_index = spr_XWiredDown;				break;
				case sprWiredStartH:	sprite_index = spr_XWiredStartHorizontal;	break;
				case sprWiredStartV:	sprite_index = spr_XWiredStartVertical;		break;
				case sprHover:			sprite_index = spr_XEHover;					break;
			}
			sprStand = spr_XStand;
			sprRunStart = spr_XRunStart;
			sprRun = spr_XRun;
			sprRunEnd = spr_XRunEnd;
			sprJump1 = spr_XJump1;
			sprJump2 = spr_XJump2;
			sprJump3 = spr_XJump3;
			sprJump4 = spr_XJump4;
			sprDash1 = spr_XDash1;
			sprDash2 = spr_XDash2;
			sprDash3 = spr_XDash3;
			sprDuck2 = spr_XDuck2;
			sprWallKick = spr_XWallKick;
			sprLand = spr_XLand;
			sprSlide1 = spr_XSlide1;
			sprSlide2 = spr_XSlide2;
			sprDashKick1 = spr_XDashKick1;
			sprDashKick2 = spr_XDashKick2;
			sprWired = spr_XWired;
			sprWiredForward = spr_XWiredForward;
			sprWiredUp = spr_XWiredUp;
			sprWiredDown = spr_XWiredDown;
			sprWiredStartH = spr_XWiredStartHorizontal;
			sprWiredStartV = spr_XWiredStartVertical;
			sprHover = spr_XEHover;
			
			atkState = AttackState.A_NONE;
			inShotFrame = false;
		}
		
		#endregion
	}	break;
	
	case obj_playerXUA:
	{
		#region
		
		if (attackMode == true)
		{
			switch (sprite_index)
			{
				case sprStand:		
				{
					if (charge == false)
					{
						sprite_index = spr_XUAStandShot;
						image_index = 0;
					}
					else
					{
						sprite_index = spr_XUAStandCShot;
						image_index = 0;
					}
				}	break;
				case spr_XUAStandShot:
				{
					sprite_index = spr_XUAStandShot;
					image_index = 0;
				}	break;
				case sprDuck2:		
				{
					if (charge == false)
					{
						sprite_index = spr_XUADuckShot;
						image_index = 0;
					}
					else
					{
						sprite_index = spr_XUADuckCShot;
						image_index = 0;
					}
				}	break;
				case sprRunStart:		sprite_index = spr_XUARunStartShot;				break;
				case sprRun:			sprite_index = spr_XUARunShot;					break;
				case sprRunEnd:			sprite_index = spr_XUARunEndShot;				break;
				case sprJump1:			sprite_index = spr_XUAJump1Shot;				break;
				case sprJump2:			sprite_index = spr_XUAJump2Shot;				break;
				case sprJump3:			sprite_index = spr_XUAJump3Shot;				break;
				case sprJump4:			sprite_index = spr_XUAJump4Shot;				break;
				case sprDash1:			sprite_index = spr_XUADash1Shot;				break;
				case sprDash2:			sprite_index = spr_XUADash2Shot;				break;
				case sprDash3:			sprite_index = spr_XUADash3Shot;				break;
				case sprWallKick:		sprite_index = spr_XUAWallKickShot;				break;
				case sprLand:			sprite_index = spr_XUALandShot;					break;
				case sprWired:
				case sprWiredForward:
				case sprWiredUp:
				case sprWiredDown:		sprite_index = spr_XUAWiredShot;				break;
				case sprWiredStartH:	sprite_index = spr_XUAWiredStartHorizontalShot;	break;
				case sprWiredStartV:	sprite_index = spr_XUAWiredStartVerticalShot;	break;
				case sprClimb2:		
				{
					vspd = 0;
					vState = VerticalState.V_MOVE_NONE;
					isClimbing = 0;
					sprite_index = spr_XUAClimbShot;		
					image_index = 0;
					image_speed = 0;
				}	break;
				case sprSlide1:			sprite_index = spr_XUASlide1Shot;				break;
				case sprSlide2:			sprite_index = spr_XUASlide2Shot;				break;
				case sprDashKick1:
				case sprDashKick2:		sprite_index = spr_XUAJump2Shot;				break;
				
				case sprDashUp1:		sprite_index = spr_XUADashUp1Shot;				break;
				case sprDashUp2:		sprite_index = spr_XUADashUp2Shot;				break;
				case sprDashUp3:		sprite_index = spr_XUADashUp3Shot;				break;
				case sprHover:			sprite_index = spr_XUAHoverShot;					break;
				case sprHoverFw:		sprite_index = spr_XUAHoverFWShot;					break;
				case sprHoverBw:		sprite_index = spr_XUAHoverBWShot;					break;
			}
			sprStand = spr_XUAStandShot;
			sprDuck2 = spr_XUADuckShot;
			sprRunStart = spr_XUARunStartShot;
			sprRun = spr_XUARunShot;
			sprRunEnd = spr_XUARunEndShot;
			sprJump1 = spr_XUAJump1Shot;
			sprJump2 = spr_XUAJump2Shot;
			sprJump3 = spr_XUAJump3Shot;
			sprJump4 = spr_XUAJump4Shot;
			sprDash1 = spr_XUADash1Shot;
			sprDash2 = spr_XUADash2Shot;
			sprDash3 = spr_XUADash3Shot;
			sprWallKick = spr_XUAWallKickShot;
			sprLand = spr_XUALandShot;
			sprSlide1 = spr_XUASlide1Shot;
			sprSlide2 = spr_XUASlide2Shot;
			sprDashKick1 = spr_XUAJump2Shot;
			sprDashKick2 = spr_XUAJump2Shot;
			sprWired = spr_XUAWiredShot;
			sprWiredForward = spr_XUAWiredShot;
			sprWiredUp = spr_XUAWiredShot;
			sprWiredDown = spr_XUAWiredShot;
			sprWiredStartH = spr_XUAWiredStartHorizontalShot;
			sprWiredStartV = spr_XUAWiredStartVerticalShot;
			
			sprDashUp1 = spr_XUADashUp1Shot;
			sprDashUp2 = spr_XUADashUp2Shot;
			sprDashUp3 = spr_XUADashUp3Shot;
			sprHover = spr_XUAHoverShot;
			sprHoverFw = spr_XUAHoverFWShot;
			sprHoverBw = spr_XUAHoverBWShot;
			
			inShotFrame = true;
		}
		
		if (attackMode == false)
		{
			switch (sprite_index)
			{
				case sprStand:			sprite_index = spr_XUAStand;				break;
				case sprRunStart:		sprite_index = spr_XUARunStart;				break;
				case sprRun:			sprite_index = spr_XUARun;					break;
				case sprRunEnd:			sprite_index = spr_XUARunEnd;				break;
				case sprJump1:			sprite_index = spr_XUAJump1;				break;
				case sprJump2:			sprite_index = spr_XUAJump2;				break;
				case sprJump3:			sprite_index = spr_XUAJump3;				break;
				case sprJump4:			sprite_index = spr_XUAJump4;				break;
				case sprDash1:			sprite_index = spr_XUADash1;				break;
				case sprDash2:			sprite_index = spr_XUADash2;				break;
				case sprDash3:			sprite_index = spr_XUADash3;				break;
				case sprDuck2:			sprite_index = spr_XUADuck2;				break;
				case sprWallKick:		sprite_index = spr_XUAWallKick;				break;
				case sprLand:			sprite_index = spr_XUALand;					break;
				case sprSlide1:			sprite_index = spr_XUASlide1;				break;
				case sprSlide2:			sprite_index = spr_XUASlide2;				break;
				case sprDashKick1:		sprite_index = spr_XUADashKick1;			break;
				case sprDashKick2:		sprite_index = spr_XUADashKick2;			break;
				case sprWired:			sprite_index = spr_XUAWired;				break;
				case sprWiredForward:	sprite_index = spr_XUAWiredForward;			break;
				case sprWiredUp:		sprite_index = spr_XUAWiredForward;			break;
				case sprWiredDown:		sprite_index = spr_XUAWiredDown;			break;
				case sprWiredStartH:	sprite_index = spr_XUAWiredStartHorizontal;	break;
				case sprWiredStartV:	sprite_index = spr_XUAWiredStartVertical;	break;
				
				case sprDashUp1:		sprite_index = spr_XUADashUp1;				break;
				case sprDashUp2:		sprite_index = spr_XUADashUp2;				break;
				case sprDashUp3:		sprite_index = spr_XUADashUp3;				break;
				case sprHover:			sprite_index = spr_XUAHover;				break;
				case sprHoverFw:		sprite_index = spr_XUAHoverFw;				break;
				case sprHoverBw:		sprite_index = spr_XUAHoverBw;				break;
			}
			sprStand = spr_XUAStand;
			sprRunStart = spr_XUARunStart;
			sprRun = spr_XUARun;
			sprRunEnd = spr_XUARunEnd;
			sprJump1 = spr_XUAJump1;
			sprJump2 = spr_XUAJump2;
			sprJump3 = spr_XUAJump3;
			sprJump4 = spr_XUAJump4;
			sprDash1 = spr_XUADash1;
			sprDash2 = spr_XUADash2;
			sprDash3 = spr_XUADash3;
			sprDuck2 = spr_XUADuck2;
			sprWallKick = spr_XUAWallKick;
			sprLand = spr_XUALand;
			sprSlide1 = spr_XUASlide1;
			sprSlide2 = spr_XUASlide2;
			sprDashKick1 = spr_XUADashKick1;
			sprDashKick2 = spr_XUADashKick2;
			sprWired = spr_XUAWired;
			sprWiredForward = spr_XUAWiredForward;
			sprWiredUp = spr_XUAWiredUp;
			sprWiredDown = spr_XUAWiredDown;
			sprWiredStartH = spr_XUAWiredStartHorizontal;
			sprWiredStartV = spr_XUAWiredStartVertical;
			
			sprDashUp1 = spr_XUADashUp1;
			sprDashUp2 = spr_XUADashUp2;
			sprDashUp3 = spr_XUADashUp3;
			sprHover = spr_XUAHover;
			sprHoverFw = spr_XUAHoverFw;
			sprHoverBw = spr_XUAHoverBw;
			
			atkState = AttackState.A_NONE;
			inShotFrame = false;
		}
		
		#endregion
	}	break;
}