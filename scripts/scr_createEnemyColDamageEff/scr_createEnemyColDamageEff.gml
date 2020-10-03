function scr_createEnemyColDamageEff(playerDamageSource) {
	if (playerDamageSource.collisionEff != noone)
	{
		if (playerDamageSource.slowTime == true) 
			scr_setTimeSlowEff(2, 0.2);
	
		//Create collision effect
	#region
			
		var xPlace = clamp(playerDamageSource.x + (abs(playerDamageSource.sprite_width) - abs(playerDamageSource.sprite_xoffset)) * 0.75 * playerDamageSource.image_xscale, bbox_left, bbox_right);
		if (playerDamageSource.wpType == WeaponType.SABER)
			var yPlace = clamp((playerDamageSource.core.bbox_top + playerDamageSource.core.bbox_bottom) / 2, bbox_top, bbox_bottom);
		else
			var yPlace = clamp((playerDamageSource.bbox_top + playerDamageSource.bbox_bottom) / 2, bbox_top, bbox_bottom);
	
		switch (playerDamageSource.object_index)
		{
			case obj_ZSaber:
			case obj_ZCrescent:
			case obj_ZIceSpyke:
			case obj_ZIceSaber:
			case obj_ZFlameSaber:
			{
				randomize();
				var effAngle = random(60) * 3;
		
				var objColEff = instance_create_depth(xPlace, yPlace, playerDamageSource.depth - 10, playerDamageSource.collisionEff);
				objColEff.image_angle = effAngle;
				objColEff.image_xscale = playerDamageSource.image_xscale;
			
				var objZEff = instance_create_depth(xPlace, yPlace, playerDamageSource.depth - 10, obj_ZSaberSlashEff);
				objZEff.image_angle = effAngle;
			}	break;
			
			case obj_ZThunderSaber:
			{
				var effAngle = 270;
				
				var objColEff = instance_create_depth(xPlace, yPlace, playerDamageSource.depth - 10, playerDamageSource.collisionEff);
				objColEff.image_angle = effAngle;
				
				var objZEff = instance_create_depth(xPlace, yPlace, playerDamageSource.depth - 10, obj_ZSaberSlashEff);
				objZEff.image_angle = effAngle;
			}	break;
		
			default:
			{
				var objColEff = instance_create_depth(xPlace, yPlace, playerDamageSource.depth - 10, playerDamageSource.collisionEff);
				objColEff.image_xscale = playerDamageSource.image_xscale;
				objColEff.from = playerDamageSource.object_index;
			}	break;
		}
	#endregion
	}
	audio_play_sound_on(global.SFX_Emitter, playerDamageSource.collisionSFX, 0, 0);


}
