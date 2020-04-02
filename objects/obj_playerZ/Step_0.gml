/// @description Insert description here
// You can write your code in this editor

//Inherit the parent event
event_inherited();

if (activateState != ActivateState.DEACTIVATE)
{
	//Passive******************************************************************************************************
	
	//Air hike
	if ((vState == VerticalState.V_ON_GROUND) || (aState == ActionState.WALLKICK) || (aState == ActionState.CLIMBING) || (aState == ActionState.SLIDING))
	{
		airHikeTime = airHikeTimeMax;
	}
	
	if (canAirDash == 0) airHikeTime = 0;
	//Change slash from jump to land
	if (sprite_index == spr_ZSlashJump)
	{
		if (place_meeting(x, y + 1, obj_block))
		{
			sprite_index = spr_ZSlashLand;
			
			obj_ZSaber.state = SaberState.SABER_LAND_SLASH;
			obj_ZSaber.setupState = true;
		}
	}
	
	//Slash timmer
	if (canSlash < 1) 
	{
		if (atkState == AttackState.A_NONE) canSlash = 1;
		canSlash += global.deltaTime;
	}
	
	//Slash combo 2
	if ((standCombo > 0) && (atkState != AttackState.A_STRICT_ATTACK)) standCombo = 0;
	
	if ((sprite_index == spr_ZSlashCombo1) && (image_index > 8))
	{
		if (standCombo > 1)
		{
			sprite_index = spr_ZSlashCombo2;
			image_index = 0;
			audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo2, 0, 0);
			audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash2, 0, 0);
			
			if (instance_exists(obj_ZSaber)) 
			{
				obj_ZSaber.state = SaberState.SABER_COMBO_2;
				obj_ZSaber.setupState = true;
			}
		}
	}
	
	//Slash combo 3
	if ((sprite_index == spr_ZSlashCombo2) && (image_index > 6))
	{
		if (standCombo > 2)
		{
			sprite_index = spr_ZSlashCombo3;
			image_index = 0;
			audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo3, 0, 0);
			audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash3, 0, 0);
			
			if (instance_exists(obj_ZSaber)) 
			{
				obj_ZSaber.state = SaberState.SABER_COMBO_3;
				obj_ZSaber.setupState = true;
			}
			atkState = AttackState.A_STRICT_ATTACK_LV2;
		}
	}
	
	//Active*******************************************************************************************************
	if (activateState == ActivateState.ACTIVATE)
	{
		
		if (keyboard_check_pressed(global.keyAtk))
		{
			if (canSlash > 0)
			{
				//Tripple slash
				if (vState == VerticalState.V_ON_GROUND)
				{
					if ((aState == ActionState.IDLE) || (aState == ActionState.DASHING))
					{
						if (standCombo < 3)
						{
							standCombo++;
						}
						aState = ActionState.IDLE;
					
						if (atkState == AttackState.A_NONE)
						{
							sprite_index = spr_ZSlashCombo1;
							image_index = 0;
							audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo1, 0, 0);
							audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash1, 0, 0);
							
							hspd = 0;
							atkState = AttackState.A_STRICT_ATTACK;
							var objSaber = instance_create_depth(x, y, depth - 1, obj_ZSaber);
							objSaber.state = SaberState.SABER_COMBO_1;
							objSaber.core = self;
						}
					}
				}
				
				//JumpSlash
				if (vState == VerticalState.V_MOVE_FALLING)
				{
					if (sprite_index != spr_ZDoubleJump)
					{
						sprite_index = spr_ZSlashJump;
						image_index = 0;
						randomize();
						if (random(2) > 1.2)
							audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo2, 0, 0);
						audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash2, 0, 0);
							
						hspd = 0;
						atkState = AttackState.A_NORMAL_ATTACK;
						var objSaber = instance_create_depth(x, y, depth - 1, obj_ZSaber);
						objSaber.state = SaberState.SABER_JUMP_SLASH;
						objSaber.core = self;
					}
					else
					{
						
					}
				}
				canSlash = -slashWaitTime;
			}
		}
		
		//Double Jump
		if (keyboard_check_pressed(global.keyJump) && (canJump))
		{
			if ((aState == ActionState.IDLE) && atkState < (AttackState.A_STRICT_ATTACK_LV4))
			{
				if ((vState == VerticalState.V_MOVE_FALLING) && (vspd >= 0))
				{
					if (airHikeTime > 0)
					{
						sprite_index = spr_ZDoubleJump;
						image_index = 0;
						audio_play_sound_on(global.SFX_Emitter, sndJumpEff, 0, 0);
						var randVoiceJump = random(4);
						if (randVoiceJump <= 3)
						{
							if (randVoiceJump > 2) audio_play_sound_on(global.SFX_Emitter, sndVoiceJump1, 0, 0);
							else if (randVoiceJump >1) audio_play_sound_on(global.SFX_Emitter, sndVoiceJump2, 0, 0);
							else audio_play_sound_on(global.SFX_Emitter, sndVoiceJump3, 0, 0);
						}
				
						atkState = AttackState.A_NONE;
						vspd = -jumpSpd;
						airHikeTime -- ;
					}
				}
			}
		}
	}
}