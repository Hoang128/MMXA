/// @description Hurt
if ((activateState == ActivateState.ACTIVATE && stunType == StunType.STUN_NONE) || (activateState == ActivateState.HALF_ACTIVATE && stunType == StunType.CAPTURED))
{
	if (stunTime <= 0)
	{
		aState = ActionState.STUNNING;
		dashPhase = 0;
		dashSpd = 0;
		stunType = other.stunType;
		switch(stunType)
		{
			case StunType.STUN_SOFT:
			case StunType.CAPTURED:		{	sprite_index = sprStun1; stunSprLoop = stunSprLoop1; break;	}
			case StunType.STUN_NORMAL:
			case StunType.STUN_HARD:	{	sprite_index = sprStun2; stunSprLoop = stunSprLoop2; break; }
		}
		image_index = 0;
		if (random(2) > 1)
			audio_play_sound_on(global.SFX_Emitter, sndVoiceHurt1, 0, 0);
		else
			audio_play_sound_on(global.SFX_Emitter, sndVoiceHurt2, 0, 0);
		if (other.bullet == 1)
		{
			if (other.createBulletEff == false)	createBulletEff = true;
			other.touchPlayer = true;
		}
		if (instance_exists(obj_PlayerShotEff)) instance_destroy(obj_PlayerShotEff);
		if (instance_exists(obj_PlayerWeaponMeeleImage)) instance_destroy(obj_PlayerWeaponMeeleImage);
		if (instance_exists(obj_PlayerWeaponMeele)) instance_destroy(obj_PlayerWeaponMeele);
		hp -= other.damage;
		hpRed +=other.damageRed;
		stunTime = stunTimeMax;
		blink = blinkMax;
		hspd = -hDir * stunHspd;
		vspd = -stunVspd;
		activateState = ActivateState.HALF_ACTIVATE;
		atkState = AttackState.A_NONE;
		hState = HorizontalState.H_MOVE_PASSIVE;
		vState = VerticalState.V_MOVE_FALLING;
	}
	
}