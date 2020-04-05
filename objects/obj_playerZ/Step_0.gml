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
	
	//Change attack sprite from jump to land
	if (place_meeting(x, y + 1, obj_block) || (place_meeting(x, y + 1, dynamicBlock) && dynamicBlock.solid == 1))
	{
		//Jump slash
		if (sprite_index == spr_ZSlashJump)
		{
			sprite_index = spr_ZSlashLand;
			
			atkState = AttackState.A_STRICT_ATTACK;
			obj_ZSaber.state = SaberState.SABER_LAND_SLASH;
			obj_ZSaber.setupState = true;
		}
		
		//Spin slash
		if (sprite_index == spr_ZSlashSpin)
		{
			sprite_index = sprLand;
			
			atkState = AttackState.A_NONE;
			instance_destroy(obj_ZSaber);
		}
		
		if (sprite_index == spr_ZShotNorA)
		{
			sprite_index = spr_ZShotNorG;
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
	
	//Buster
	//Normal shot
	if ((sprite_index == spr_ZShotNorG) || (sprite_index == spr_ZShotNorA))
	{
		if ((image_index > 4) && (image_index < 5))
		{
			if (busterType != noone)
			{
				if (!instance_exists(obj_ShotEffZBusterNor))
				{
					var xPlace;
					var yPlace;
					if (sprite_index == spr_ZShotNorG)
					{
						xPlace = 24;
						yPlace = -22;
					}
					if (sprite_index == spr_ZShotNorA)
					{
						xPlace = 30;
						yPlace = -24;
					}
					var shotEff = instance_create_depth(x + xPlace * image_xscale, y + yPlace, depth - 1, obj_ShotEffZBusterNor);
					shotEff.image_xscale = image_xscale;
					shotEff.busterType = busterType;
					busterType = noone;
				}
			}
		}
	}
	
	//Active*******************************************************************************************************
	if (activateState == ActivateState.ACTIVATE)
	{
		//Normal attack	
		if (keyboard_check_pressed(global.keyAtk))
		{
			if (canSlash > 0)
			{
				//Tripple slash
				if (vState == VerticalState.V_ON_GROUND)
				{
					if ((aState == ActionState.IDLE) || (aState == ActionState.DASHING))
					{
						if (sprite_index != sprLand)
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
						else
						{
							if (atkState == AttackState.A_NONE)
							{
								sprite_index = spr_ZSlashLand;
								image_index = 0;
								audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo2, 0, 0);
								audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash2, 0, 0);
							
								hspd = 0;
								atkState = AttackState.A_STRICT_ATTACK;
								var objSaber = instance_create_depth(x, y, depth - 1, obj_ZSaber);
								objSaber.state = SaberState.SABER_LAND_SLASH;
								objSaber.core = self;
							}
						}
					}
					
					if (aState == ActionState.DUCKING)
					{
						if (atkState == AttackState.A_NONE)
						{
							sprite_index = spr_ZSlashDuck;
							image_index = 0;
							randomize();
							if (random(2) > 1.2)
								audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo1, 0, 0);
							audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash1, 0, 0);
							atkState = AttackState.A_STRICT_ATTACK;
							var objSaber = instance_create_depth(x, y, depth - 1, obj_ZSaber);
							objSaber.state = SaberState.SABER_DUCK_SLASH;
							objSaber.core = self;
						}
					}
				}
				
				//JumpSlash
				else if (vState == VerticalState.V_MOVE_FALLING)
				{
					if ((sprite_index != spr_ZDoubleJump) && !keyboard_check(global.keyUp))
					{
						if (atkState == AttackState.A_NONE)
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
					}
					else
					{
						if (atkState == AttackState.A_NONE)
						{
							sprite_index = spr_ZSlashSpin;
							image_index = 0;
							randomize();
							if (random(2) > 1.2)
								audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo2, 0, 0);
							audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash2, 0, 0);
							
							hspd = 0;
							atkState = AttackState.A_NORMAL_ATTACK;
							var objSaber = instance_create_depth(x, y, depth - 1, obj_ZSaber);
							objSaber.state = SaberState.SABER_SPIN_SLASH;
							objSaber.core = self;
						}
					}
				}
				
				//Slide & Climb Slash
				else
				{
					//Slide Slash
					if ((aState == ActionState.SLIDING) && (sprite_index == sprSlide2))
					{
						if (atkState == AttackState.A_NONE)
						{
							sprite_index = spr_ZSlashSlide;
							image_index = 0;
							audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo1, 0, 0);
							audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash1, 0, 0);
							
							hspd = 0;
							atkState = AttackState.A_NORMAL_ATTACK;
							var objSaber = instance_create_depth(x, y, depth - 1, obj_ZSaber);
							objSaber.state = SaberState.SABER_SLIDE_SLASH;
							objSaber.core = self;
						}
					}
					
					//Climb Slash
					if ((aState == ActionState.CLIMBING) && (sprite_index == sprClimb2))
					{
						if (atkState == AttackState.A_NONE)
						{
							sprite_index = spr_ZSlashClimb;
							image_index = 0;
							image_speed = 0;
							audio_play_sound_on(global.SFX_Emitter, snd_VZSlashCombo1, 0, 0);
							audio_play_sound_on(global.SFX_Emitter, snd_ZSaberSlash1, 0, 0);
							
							vspd = 0;
							isClimbing = 0;
							vState = VerticalState.V_MOVE_NONE;
							atkState = AttackState.A_STRICT_ATTACK;
							var objSaber = instance_create_depth(x, y, depth - 1, obj_ZSaber);
							objSaber.state = SaberState.SABER_CLIMB_SLASH;
							objSaber.core = self;
						}
					}
				}
				
				canSlash = -slashWaitTime;
			}
		}
		
		//Special attack
		if (keyboard_check_pressed(global.keySpAtk))
		{
			//Chrono Field
			if ((!keyboard_check(global.keyUp)) && (!keyboard_check(global.keyDown)))
			{
				if (!instance_exists(obj_ZChronoField))
				{
					if (atkState == AttackState.A_NONE)
					{
						if (vState == VerticalState.V_ON_GROUND)
						{
							sprite_index = spr_ZShotNorG;
							image_index = 0;
						
							busterType = obj_ZChronoField;
							hspd = 0;
							aState = ActionState.IDLE;
							atkState = AttackState.A_STRICT_ATTACK_LV2;
						}
						else
						{
							sprite_index = spr_ZShotNorA;
							image_index = 0;
						
							busterType = obj_ZChronoField;
							if (aState == ActionState.DASHING)
								aState = ActionState.IDLE;
							atkState = AttackState.A_NORMAL_ATTACK;
							vState = VerticalState.V_MOVE_FALLING;
						}
					}
				}
			}
		}
		
		//Form attack
		if (keyboard_check_pressed(global.keyGiga))
		{
			//Z buster
			if ((!keyboard_check(global.keyUp)) && (!keyboard_check(global.keyDown)))
			{
				if (atkState == AttackState.A_NONE)
				{
					if (vState == VerticalState.V_ON_GROUND)
					{
						sprite_index = spr_ZShotNorG;
						image_index = 0;
						
						busterType = obj_ZBusterNor;
						hspd = 0;
						aState = ActionState.IDLE;
						atkState = AttackState.A_STRICT_ATTACK_LV2;
					}
					else
					{
						sprite_index = spr_ZShotNorA;
						image_index = 0;
						
						busterType = obj_ZBusterNor;
						if (aState == ActionState.DASHING)
							aState = ActionState.IDLE;
						atkState = AttackState.A_NORMAL_ATTACK;
						vState = VerticalState.V_MOVE_FALLING;
					}
				}
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