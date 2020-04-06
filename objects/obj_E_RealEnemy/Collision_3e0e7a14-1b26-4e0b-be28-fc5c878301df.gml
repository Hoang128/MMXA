/// @description Insert description here
// You can write your code in this editor

if (damageTimmer == -1) 
	damageTimmer = 0;
if (damageTimmer <= 0)
{
	var realDamage = 0;
	switch (other.element)
	{
		case Element.NEUTRAL:	realDamage = other.damage - neutralArmor;	break;
		case Element.FIRE:		realDamage = other.damage - fireArmor;		break;
		case Element.ICE:		realDamage = other.damage - iceArmor;		break;
		case Element.ELECT:		realDamage = other.damage - electArmor;		break;
	}
	if (realDamage > 0)
		hp -= realDamage;
	if (other.collisionEff != noone)
	{
		//Create collision effect
		#region
			
		with (other)
		{
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
		}
		#endregion
	}
	audio_play_sound_on(global.SFX_Emitter, other.collisionSFX, 0, 0);
	
	if (other.type == WeaponType.BUSTER)
	{
		if (hp > 0) 
			instance_destroy(other);
	}
	damageTimmer = other.maxTimmer;
}