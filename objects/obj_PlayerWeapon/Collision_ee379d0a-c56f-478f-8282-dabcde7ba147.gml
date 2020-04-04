/// @description Caculate damage
if (timmer == -1)
{
	timmer = maxTimmer;
}
else
{
	if (createDamageTime > 0)
	{
		if (timmer <= 0)
		{
			audio_play_sound_on(global.SFX_Emitter, collisionSFX, 0, 0);
			other.hp -= self.damage;
			if (collisionEff != noone)
			{
				//Create collision effect
				#region
				
				var xPlace = x;
				var yPlace = y;
				var rBorderIsInEnemy = place_meeting(bbox_right, y, other);
				var lBorderIsInEnemy = place_meeting(bbox_left, y, other);
				var tBorderIsInEnemy = place_meeting(x, bbox_top, other);
				var bBorderIsInEnemy = place_meeting(x, bbox_bottom, other);
				
				if (rBorderIsInEnemy && !lBorderIsInEnemy)
				{
					xPlace = (bbox_right + other.bbox_left) / 2;
				}
				if (!rBorderIsInEnemy && lBorderIsInEnemy)
				{
					xPlace = (bbox_left + other.bbox_right) / 2;
				}
				if (!rBorderIsInEnemy && !lBorderIsInEnemy)
				{
					xPlace = (other.bbox_right + other.bbox_left) / 2;
				}
				if (rBorderIsInEnemy && lBorderIsInEnemy)
				{
					xPlace = (bbox_right + bbox_left) / 2;
				}
				
				if (tBorderIsInEnemy && !bBorderIsInEnemy)
				{
					yPlace = (bbox_top + other.bbox_bottom) / 2;
				}
				if (!tBorderIsInEnemy && bBorderIsInEnemy)
				{
					yPlace = (bbox_bottom + other.bbox_top) / 2;
				}
				if (!tBorderIsInEnemy && !bBorderIsInEnemy)
				{
					yPlace = (other.bbox_top + other.bbox_bottom) / 2;
				}
				if (tBorderIsInEnemy && bBorderIsInEnemy)
				{
					yPlace = (bbox_bottom + bbox_top) / 2;
				}
				
				var objColEff = instance_create_depth(xPlace, yPlace, depth - 1, collisionEff);
				objColEff.image_xscale = self.image_xscale;
				
				#endregion
			}
			
			timmer = maxTimmer;
			createDamageTime--;
		}
	}
}