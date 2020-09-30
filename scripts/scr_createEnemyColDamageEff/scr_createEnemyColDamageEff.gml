function scr_createEnemyColDamageEff() {
	if (other.collisionEff != noone)
	{
		if (other.slowTime == true) 
			scr_setTimeSlowEff(2, 0.2);
	
		//Create collision effect
	#region
			
		var xPlace = clamp(other.x + (abs(other.sprite_width) - abs(other.sprite_xoffset)) * 0.75 * other.image_xscale, bbox_left, bbox_right);
		if (other.wpType == WeaponType.SABER)
			var yPlace = clamp((other.core.bbox_top + other.core.bbox_bottom) / 2, bbox_top, bbox_bottom);
		else
			var yPlace = clamp((other.bbox_top + other.bbox_bottom) / 2, bbox_top, bbox_bottom);
	
		switch (other.object_index)
		{
			case obj_ZSaber:
			case obj_ZCrescent:
			case obj_ZIceSpyke:
			case obj_ZIceSaber:
			case obj_ZFlameSaber:
			{
				randomize();
				var effAngle = random(60) * 3;
		
				var objColEff = instance_create_depth(xPlace, yPlace, -10, other.collisionEff);
				objColEff.image_angle = effAngle;
				objColEff.image_xscale = other.image_xscale;
			
				var objZEff = instance_create_depth(xPlace, yPlace, -10, obj_ZSaberSlashEff);
				objZEff.image_angle = effAngle;
			}	break;
			
			case obj_ZThunderSaber:
			{
				var effAngle = 270;
				
				var objColEff = instance_create_depth(xPlace, yPlace, -10, other.collisionEff);
				objColEff.image_angle = effAngle;
				
				var objZEff = instance_create_depth(xPlace, yPlace, -10, obj_ZSaberSlashEff);
				objZEff.image_angle = effAngle;
			}	break;
		
			default:
			{
				var objColEff = instance_create_depth(xPlace, yPlace, other.depth - 1, other.collisionEff);
				objColEff.image_xscale = other.image_xscale;
				objColEff.from = other.object_index;
			}	break;
		}
	#endregion
	}
	audio_play_sound_on(global.SFX_Emitter, other.collisionSFX, 0, 0);


}
