/// @description Handle

if visible==0 visible=1;
image_xscale=core.image_xscale;

if core.sprite_index==spr_ZShotNorG{
	xPlace=xPlaceNor*core.image_xscale;
    yPlace=yPlaceNor;
}

if core.sprite_index==spr_ZShotNorA{
	xPlace=xPlaceJmp*core.image_xscale;
    yPlace=yPlaceJmp;
}

if core.sprite_index==spr_ZShotC1_G{
	xPlace=xPlaceCharge1*core.hDir;
	yPlace=yPlaceCharge1;
}

if core.sprite_index==spr_ZShotC2_G{
	xPlace=xPlaceCharge2*core.hDir;
	yPlace=yPlaceCharge2;
}

if core.sprite_index==spr_ZShotC1_A{
	xPlace=xPlaceCharge1A*core.hDir;
	yPlace=yPlaceCharge1A;
}

if core.sprite_index==spr_ZShotC2_A{
	xPlace=xPlaceCharge2A*core.hDir;
	yPlace=yPlaceCharge2A;
}

if core.sprite_index==spr_ZShotBarrage{
	xPlace=xPlaceUltimate*core.hDir;
	yPlace=yPlaceUltimate;
}

self.x=core.x+xPlace;
self.y=core.y+yPlace;
