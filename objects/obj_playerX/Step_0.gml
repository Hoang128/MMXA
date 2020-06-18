/// @description Insert description here
// You can write your code in this editor

//Inherit the parent event
event_inherited();

//Passive all
if (resetBusterOnRowMax > 0)
	resetBusterOnRowMax -= DELTA_TIME;
else
{
	if (busterOnRow < busterOnRowMax && busterOnRow > 0)
	{
		busterOnRow = 0;
	}
}
if (waitShot > 0)
	waitShot -= DELTA_TIME;
else
{
	waitShot = 0;
	if (busterOnRow == busterOnRowMax)
		busterOnRow = 0;
}

if (activateState != ActivateState.DEACTIVATE)
{
	//Passive******************************************************************************************************
	if (atkSpriteTime > 0) atkSpriteTime -= DELTA_TIME;
	else 
	{
		if (inShotFrame == true)
		{
			if (sprite_index != spr_XCShotStand && sprite_index != spr_XCShotDuck)
				scr_playerXChangeShotSprite(object_index, false, false);
			atkSpriteTime = 0;
		}
	}
	
	//Active*******************************************************************************************************
	if (activateState == ActivateState.ACTIVATE)
	{
		if (keyboard_check_pressed(global.keyAtk))
		{
			if (atkState < AttackState.A_STRICT_ATTACK)
			{
				if (busterOnRow < busterOnRowMax)
				{
					if (waitShot == 0)
					{
						scr_playerXChangeShotSprite(object_index, true, false);
						if (sprite_index != spr_XClimbStart && sprite_index != spr_XClimbEnd)
						{
							var obj = instance_create_depth(x, y, depth - 1, obj_ShotEffXBuster);
							obj.core = self;
							atkSpriteTime = atkSpriteTimeMax;
						
							if (sprite_index == spr_XShotClimb)
							{
								vspd = 0;
								vState = VerticalState.V_MOVE_NONE;
								isClimbing = 0;
							}
							atkState = AttackState.A_NORMAL_ATTACK;
						
							busterOnRow++;
							resetBusterOnRowMax = waitShotLong;
							if (busterOnRow == busterOnRowMax)
								waitShot = waitShotLong;
							else
								waitShot = waitShotNormal;
						}
					}
				}
			}
		}
		
		if (keyboard_check(global.keyAtk))
		{
			if (chargeNormal < chargeLv2Limit)
			{
				chargeNormal += DELTA_TIME;
				if (chargeNormal >= chargeLv1Limit)
				{
					if (!instance_exists(obj_XChargeEffLv1))
					{
						var objChargeEff = instance_create_depth((bbox_right + bbox_left) / 2, (bbox_top + bbox_bottom) / 2, depth - 2, obj_XChargeEffLv1);
						objChargeEff.core = self;
						objChargeEff.chargeParameter = self.chargeNormal;
					}
				}
			}
			else
			{
				chargeNormal = chargeLv2Limit;
				if (!instance_exists(obj_XChargeEffLv2))
				{
					var objChargeEff = instance_create_depth((bbox_right + bbox_left) / 2, (bbox_top + bbox_bottom) / 2, depth - 2, obj_XChargeEffLv2);
					objChargeEff.core = self;
					objChargeEff.chargeParameter = self.chargeNormal;
				}
			}
		}
		
		if (keyboard_check_released(global.keyAtk))
		{
			if (chargeNormal >= chargeLv1Limit)
			{
				if (chargeNormal < chargeLv2Limit)
				{
					scr_playerXChangeShotSprite(object_index, true, false);
					if (sprite_index != spr_XClimbStart && sprite_index != spr_XClimbEnd)
					{
						var obj = instance_create_depth(x, y, depth - 1, obj_ShotEffXBusterC1);
						obj.core = self;
						atkSpriteTime = atkSpriteTimeMax;
						if (sprite_index == spr_XShotClimb)
						{
							vspd = 0;
							vState = VerticalState.V_MOVE_NONE;
							isClimbing = 0;
						}
						atkState = AttackState.A_NORMAL_ATTACK;
						chargeNormal = 0;
						waitShot = waitShotLong;
						busterOnRow = 0;
					}
				}
				else
				{	
					scr_playerXChangeShotSprite(object_index, true, true);
					randomize();
					var r = random(4);
					if (r >= 1)
					{
						if (r >=1 && r < 2)
							audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot1, 0, 0);
						if (r >=2 && r < 3)
							audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot2, 0, 0);
						if (r >=3 && r < 4)
							audio_play_sound_on(global.SFX_Emitter, snd_VXChargeShot3, 0, 0);
					}
					if (sprite_index != spr_XClimbStart && sprite_index != spr_XClimbEnd)
					{
						var obj = instance_create_depth(x, y, depth - 1, obj_ShotEffXBusterC2);
						obj.core = self;
						atkSpriteTime = atkSpriteTimeMax;
						if (sprite_index == spr_XShotClimb)
						{
							vspd = 0;
							vState = VerticalState.V_MOVE_NONE;
							isClimbing = 0;
						}
						atkState = AttackState.A_NORMAL_ATTACK;
						chargeNormal = 0;	
						waitShot = waitShotMax;
						busterOnRow = 0;
					}
				}
			}
			else	chargeNormal = 0;
		}
	}
}