var obj = argument0;
var attackMode = argument1;
var charge = argument2;
switch (obj)
{
	case obj_playerX:
	{
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
				case sprRunStart:	sprite_index = spr_XShotRunStart;	break;
				case sprRun:		sprite_index = spr_XShotRun;		break;
				case sprRunEnd:		sprite_index = spr_XShotRunEnd;		break;
				case sprJump1:		sprite_index = spr_XShotJump1;		break;
				case sprJump2:		sprite_index = spr_XShotJump2;		break;
				case sprJump3:		sprite_index = spr_XShotJump3;		break;
				case sprJump4:		sprite_index = spr_XShotJump4;		break;
				case sprDash1:		sprite_index = spr_XShotDash1;		break;
				case sprDash2:		sprite_index = spr_XShotDash2;		break;
				case sprDash3:		sprite_index = spr_XShotDash3;		break;
				case sprWallKick:	sprite_index = spr_XShotWallKick;	break;
				case sprLand:		sprite_index = spr_XShotLand;		break;
				case sprClimb2:		
				{
					sprite_index = spr_XShotClimb;		
					image_index = 0;
					image_speed = 0;
				}	break;
				case sprSlide1:		sprite_index = spr_XShotSlide1;		break;
				case sprSlide2:		sprite_index = spr_XShotSlide2;		break;
				case sprDashKick1:
				case sprDashKick2:	sprite_index = spr_XShotJump2;		break;
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
			
			inShotFrame = true;
		}
		
		if (attackMode == false)
		{
			switch (sprite_index)
			{
				case sprStand:		sprite_index = spr_XStand;		break;
				case sprRunStart:	sprite_index = spr_XRunStart;	break;
				case sprRun:		sprite_index = spr_XRun;		break;
				case sprRunEnd:		sprite_index = spr_XRunEnd;		break;
				case sprJump1:		sprite_index = spr_XJump1;		break;
				case sprJump2:		sprite_index = spr_XJump2;		break;
				case sprJump3:		sprite_index = spr_XJump3;		break;
				case sprJump4:		sprite_index = spr_XJump4;		break;
				case sprDash1:		sprite_index = spr_XDash1;		break;
				case sprDash2:		sprite_index = spr_XDash2;		break;
				case sprDash3:		sprite_index = spr_XDash3;		break;
				case sprDuck2:		sprite_index = spr_XDuck2;		break;
				case sprWallKick:	sprite_index = spr_XWallKick;	break;
				case sprLand:		sprite_index = spr_XLand;		break;
				case sprSlide1:		sprite_index = spr_XSlide1;		break;
				case sprSlide2:		sprite_index = spr_XSlide2;		break;
				case sprDashKick1:	sprite_index = spr_XDashKick1;	break;
				case sprDashKick2:	sprite_index = spr_XDashKick2;	break;
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
			
			atkState = AttackState.A_NONE;
			inShotFrame = false;
		}
	}	break;
}