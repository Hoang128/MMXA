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
		
			timmer = maxTimmer;
			createDamageTime--;
		}
	}
}