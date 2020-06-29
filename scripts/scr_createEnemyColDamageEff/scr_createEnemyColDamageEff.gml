if (other.collisionEff != noone)
{
	//Create collision effect
	#region
			
	var xPlace = clamp(other.x + (abs(other.sprite_width) - abs(other.sprite_xoffset)) * 0.75 * other.image_xscale, bbox_left, bbox_right);
	if (other.type == WeaponType.SABER)
		var yPlace = clamp((other.core.bbox_top + other.core.bbox_bottom) / 2, bbox_top, bbox_bottom);
	else
		var yPlace = clamp((other.bbox_top + other.bbox_bottom) / 2, bbox_top, bbox_bottom);
			
	if (other.object_index == obj_ZSaber)
	{
		randomize();
		var effAngle = random(60) * 3;
		
		var objColEff = instance_create_depth(xPlace, yPlace, other.depth - 1, other.collisionEff);
		objColEff.image_angle = effAngle;
		objColEff.image_xscale = other.image_xscale;
			
		var objZEff = instance_create_depth(xPlace, yPlace, other.depth - 2, obj_ZSaberSlashEff);
		objZEff.image_angle = effAngle;
	}
	else
	{
		var objColEff = instance_create_depth(xPlace, yPlace, other.depth - 1, other.collisionEff);
		objColEff.image_xscale = other.image_xscale;
		objColEff.from = other.object_index;
		switch(other.object_index)
		{
			case	obj_XBusterC1:
			case	obj_XBusterC2:
			case	obj_XBusterNormal:	
			{
				objColEff.myPalette = spr_PalXBuster;
			}	break;
			case	obj_ZBusterCharge:
			case	obj_ZThunderBlaster:
			case	obj_ZBusterNor:		
			{
				objColEff.myPalette = spr_PalZBuster;
			}	break;
		}
	}
	#endregion
}
audio_play_sound_on(global.SFX_Emitter, other.collisionSFX, 0, 0);
	
if (other.type == WeaponType.BUSTER)
{
	if (other.object_index == obj_XBusterNormal)
		instance_destroy(other);
	else
	{
		if (hp > 0)
			instance_destroy(other);
	}
}