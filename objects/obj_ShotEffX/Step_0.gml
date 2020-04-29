/// @description Place
if instance_exists(core) && (core.sprite_index==spr_XStun1 || core.sprite_index==spr_XStun2) instance_destroy();

if (xPlace == 0 && yPlace == 0)	visible = 0;
else visible = 1;

switch (core.sprite_index)
{
	case spr_XShotStand:
	case spr_XCShotStand: 
	{
		xPlace=20*core.hDir;
		yPlace=-27;
	}	break;
	case spr_XShotDuck: 
	case spr_XCShotDuck: {
		xPlace=26*core.hDir;
		yPlace=-14;
	}	break;
	case spr_XShotDash2: 
	{
		xPlace=30*core.hDir;
		yPlace=-14;
    }	break;
	case spr_XShotDash1: 
	case spr_XShotDash3:
	{
		xPlace=28*core.hDir;
		yPlace=-20;
	}	break;
	case spr_XShotJump1: 
	case spr_XShotJump2:
	case spr_XShotJump3:
	case spr_XShotJump4:
	case spr_XShotLand:
	{
		xPlace=22*core.hDir;
		yPlace=-24;
	}	break;
	case spr_XShotRunStart:
	case spr_XShotRun:
	case spr_XShotRunEnd:
	{
		xPlace=22*core.hDir;
		yPlace=-28;
	}	break;
	case spr_XShotWallKick: 
	{
		xPlace=24*core.hDir;
		yPlace=-25;
	}	break;
	case spr_XShotSlide1: 
	case spr_XShotSlide2:
	{
		xPlace=-24*core.hDir;
		yPlace=-25;
	}	break;
	case spr_XShotClimb:
	{
		xPlace=23*core.hDir;
		yPlace=-31;
	}	break;
//if core.sprite_index=spr_x_ua_dash_up_shot {
//   xPlace=22*core.hDir;
//   yPlace=-24;
//}
//if core.sprite_index=core.sHoverSh {
//	xPlace=19*core.hDir;
//    yPlace=-29;
//}
//if core.sprite_index=core.sHoverFwSh {
//	xPlace=26*core.hDir;
//    yPlace=-23;
//}
//if core.sprite_index=core.sHoverBwSh {
//	xPlace=17*core.hDir;
//    yPlace=-24;
//}
}

if (core.sprite_index == spr_XShotSlide1 || core.sprite_index == spr_XShotSlide2)
   self.image_xscale = -core.hDir;
else
   self.image_xscale = core.hDir;
  
self.x=core.x+xPlace;
self.y=core.y+yPlace;

if ((image_index > frameShot - 1) && (image_index < frameShot))
{
	if (!bulletCreate)
	{
		if (busterObject != noone)
		{
			var buster = instance_create_depth(x, y, depth - 1, busterObject);
			buster.image_xscale = image_xscale;
			bulletCreate = true;
		}
	}
}