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
		
	//Create Effect
	if (other.slowTime == true) 
		scr_setTimeSlowEff(2, 0.2);
	if (other.collisionEff != noone)
	{
		//Create collision effect
		#region
			
		if (other.type == WeaponType.SABER)
		{
			var xPlace = clamp(other.x + (abs(other.sprite_width) - abs(other.sprite_xoffset)) * 0.75 * other.image_xscale, bbox_left, bbox_right);
			var yPlace = clamp((other.core.bbox_top + other.core.bbox_bottom) / 2, bbox_top, bbox_bottom);
		}
		else
		{
			var xPlace = other.x + other.image_xscale * (other.bbox_right - other.bbox_left) / 2;
			var yPlace = (other.bbox_top + other.bbox_bottom) / 2;
		}
		
		randomize();
		var effAngle = random(60) * 3;
		
		var objColEff = instance_create_depth(xPlace, yPlace, other.depth - 1, other.collisionEff);
		objColEff.image_angle = effAngle;
		objColEff.image_xscale = other.image_xscale;
		
		if (other.object_index == obj_ZSaber)
		{
			var objZEff = instance_create_depth(xPlace, yPlace, other.depth - 2, obj_ZSaberSlashEff);
			objZEff.image_angle = effAngle;
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