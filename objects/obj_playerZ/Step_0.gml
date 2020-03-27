/// @description Insert description here
// You can write your code in this editor

//Inherit the parent event
event_inherited();

if (activateState != ActivateState.DEACTIVATE)
{
	//Passive******************************************************************************************************
	if (atkSpriteTime > 0) atkSpriteTime--;
	else atkState = AttackState.A_NONE;
	
	if ((vState == VerticalState.V_ON_GROUND) || (aState == ActionState.SLIDING))
	{
		airHikeTime = airHikeTimeMax;
	}
	
	//Active*******************************************************************************************************
	if (activateState == ActivateState.ACTIVATE)
	{
		if (atkState == AttackState.A_NONE)
		{
			if (keyboard_check_pressed(global.keyAtk))
			{
				atkSpriteTime = atkSpriteTimeMax;
				atkState = AttackState.A_NORMAL_ATTACK;
			}
		}
		
		//Double Jump
		if (keyboard_check_pressed(global.keyJump))
		{
			if (aState == ActionState.IDLE)
			{
				if ((vState == VerticalState.V_MOVE_FALLING) && (vspd >= 0))
				{
					if (airHikeTime > 0)
					{
						sprite_index = sprDoubleJump;
						image_index = 0;
						audio_play_sound_on(global.SFX_Emitter, sndJumpEff, 0, 0);
						var randVoiceJump = random(4);
						if (randVoiceJump <= 3)
						{
							if (randVoiceJump > 2) audio_play_sound_on(global.SFX_Emitter, sndVoiceJump1, 0, 0);
							else if (randVoiceJump >1) audio_play_sound_on(global.SFX_Emitter, sndVoiceJump2, 0, 0);
							else audio_play_sound_on(global.SFX_Emitter, sndVoiceJump3, 0, 0);
						}
				
				
						vspd = -jumpSpd;
						airHikeTime -- ;
					}
				}
			}
		}
	}
}