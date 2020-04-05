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

//if core.sprite_index==core.sZShotC1{
//	xPlace=xPlaceCharge1*core.charDir;
//	yPlace=yPlaceCharge1;
//}

//if core.sprite_index==core.sZShotC2{
//	xPlace=xPlaceCharge2*core.charDir;
//	yPlace=yPlaceCharge2;
//}

//if core.sprite_index==core.sZShotC1A{
//	xPlace=xPlaceCharge1A*core.charDir;
//	yPlace=yPlaceCharge1A;
//}

//if core.sprite_index==core.sZShotC2A{
//	xPlace=xPlaceCharge2A*core.charDir;
//	yPlace=yPlaceCharge2A;
//}

//if core.sprite_index==core.sZBusterBarrage{
//	xPlace=xPlaceUltimate*core.charDir;
//	yPlace=yPlaceUltimate;
//}

self.x=core.x+xPlace;
self.y=core.y+yPlace;
