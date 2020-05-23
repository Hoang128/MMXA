/// @description Handle

if visible==0 visible=1;
image_xscale=core.image_xscale;

switch (core.sprite_index)
{
	case spr_ZShotNorG: 
	case spr_ZShotHoldThunderBlaster: {
		xPlace=xPlaceNor*core.image_xscale;
		yPlace=yPlaceNor;
	}	break;

	case spr_ZShotNorA: {
		xPlace=xPlaceJmp*core.image_xscale;
		yPlace=yPlaceJmp;
	}	break;

	case spr_ZShotC1_G: {
	xPlace=xPlaceCharge1*core.hDir;
	yPlace=yPlaceCharge1;
	}	break;

	case spr_ZShotC2_G: {
		xPlace=xPlaceCharge2*core.hDir;
		yPlace=yPlaceCharge2;
	}	break;

	case spr_ZShotC1_A: {
		xPlace=xPlaceCharge1A*core.hDir;
		yPlace=yPlaceCharge1A;
	}	break;

	case spr_ZShotC2_A: {
		xPlace=xPlaceCharge2A*core.hDir;
		yPlace=yPlaceCharge2A;
	}	break;

	case spr_ZShotBarrage: {
		xPlace=xPlaceUltimate*core.hDir;
		yPlace=yPlaceUltimate;
	}	break;
}

self.x=core.x+xPlace;
self.y=core.y+yPlace;
