/// @description Place
if instance_exists(core) && (core.sprite_index==spr_XStun1 || core.sprite_index==spr_XStun2) instance_destroy();

if (xPlace == 0 && yPlace == 0)	visible = 0;
else visible = 1;
if (init == false)
{
	switch (core.sprite_index)
	{
		case spr_XShotStand:
		case spr_XCShotStand: 
		case spr_XUAStandShot:
		case spr_XUAStandCShot:
		{
			xPlace=20*core.hDir;
			yPlace=-27;
		}	break;
		case spr_XShotDuck: 
		case spr_XCShotDuck:
		case spr_XUADuckShot:
		case spr_XUADuckCShot: 
		{
			xPlace=26*core.hDir;
			yPlace=-14;
		}	break;
		case spr_XShotDash2:
		case spr_XUADash2Shot:
		{
			xPlace=30*core.hDir;
			yPlace=-14;
	    }	break;
		case spr_XShotDash1: 
		case spr_XShotDash3:
		case spr_XUADash1Shot:
		case spr_XUADash3Shot:
		{
			xPlace=28*core.hDir;
			yPlace=-20;
		}	break;
		case spr_XShotJump1: 
		case spr_XShotJump2:
		case spr_XShotJump3:
		case spr_XShotJump4:
		case spr_XShotLand:
		case spr_XUAJump1Shot: 
		case spr_XUAJump2Shot:
		case spr_XUAJump3Shot:
		case spr_XUAJump4Shot:
		case spr_XUALandShot:
		{
			xPlace=22*core.hDir;
			yPlace=-24;
		}	break;
		case spr_XShotRunStart:
		case spr_XShotRun:
		case spr_XShotRunEnd:
		case spr_XUARunStartShot:
		case spr_XUARunShot:
		case spr_XUARunEndShot:
		{
			xPlace=22*core.hDir;
			yPlace=-30;
		}	break;
		case spr_XShotWallKick: 
		case spr_XUAWallKickShot:
		{
			xPlace=24*core.hDir;
			yPlace=-25;
		}	break;
		case spr_XShotSlide1: 
		case spr_XShotSlide2:
		case spr_XUASlide1Shot: 
		case spr_XUASlide2Shot:
		{
			xPlace=-24*core.hDir;
			yPlace=-25;
		}	break;
		case spr_XShotClimb:
		case spr_XUAClimbShot:
		{
			xPlace=23*core.hDir;
			yPlace=-31;
		}	break;
		case spr_XShotWired:
		case spr_XUAWiredShot:
		{
			xPlace=21*core.hDir;
			yPlace=-23;
		}	break;
		case spr_XShotWiredStartHorizontal:
		case spr_XUAWiredStartHorizontalShot:
		{
			xPlace=22*core.hDir;
			yPlace=-22;
		}	break;
		case spr_XShotWiredStartVertical:
		case spr_XUAWiredStartVerticalShot:
		{
			xPlace=22*core.hDir;
			yPlace=-20;
		}	break;
		case spr_XUADashUp1Shot:
		case spr_XUADashUp2Shot:
		case spr_XUADashUp3Shot:
		{
			xPlace=22*core.hDir;
			yPlace=-24;
		}	break;
		case spr_XUAHoverShot:
		{
			xPlace=19*core.hDir;
			yPlace=-29;
		}	break;
		case spr_XUAHoverFWShot: 
		{
			xPlace=26*core.hDir;
			yPlace=-23;
		}	break;
		case spr_XUAHoverBWShot: 
		{
			xPlace=17*core.hDir;
			yPlace=-24;
		}	break;
		case spr_XEDoubleShot1_G:
		{
			xPlace = 21*core.hDir;
			yPlace = -24;
		}	break;
		case spr_XEDoubleShot2_G:
		{
			xPlace = 21*core.hDir;
			yPlace = -24;
		}	break;
		case spr_XEDoubleShot1_A:
		{
			xPlace = 21*core.hDir;
			yPlace = -24;
		}	break;
		case spr_XEDoubleShot2_A:
		{
			xPlace = 21*core.hDir;
			yPlace = -24;
		}	break;
	}
	
	if(core.sprite_index == spr_XShotSlide1 
	|| core.sprite_index == spr_XShotSlide2
	|| core.sprite_index == spr_XUASlide1Shot
	|| core.sprite_index == spr_XUASlide2Shot)
	   self.image_xscale = -core.hDir;
	else
	   self.image_xscale = core.hDir;
	
	self.x=core.x+xPlace;
	self.y=core.y+yPlace;
	
	if (followPlayer == false)
		init = true;
}

if ((image_index > frameShot - 1) && (image_index < frameShot))
{
	if (!bulletCreate)
	{
		if (busterObject != noone)
		{
			audio_play_sound_on(global.SFX_Emitter, shotSFX, false, false);
			var buster = instance_create_depth(x, y, depth - 1, busterObject);
			buster.image_xscale = image_xscale;
			bulletCreate = true;
		}
	}
}