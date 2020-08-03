/// @description Insert description here
// You can write your code in this editor
//Test
if (timeChangeHP <= 0)
{
	timeChangeHP--;
}
else
{
	if (indHP != core.hp)
	{
		if (sign(core.hp - indHP) > 0)
			audio_play_sound_on(global.SFX_Emitter, snd_gainHp, false, false);
		indHP += sign(core.hp - indHP);
	}
	timeChangeHP = timeChangeHPMax;
}