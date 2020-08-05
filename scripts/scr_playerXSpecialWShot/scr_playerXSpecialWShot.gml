/// @description Intialize scr_playerXSpecialWShot: scr_playerXSpecialWShot(is charged, shot object, wait time between two shot, sprite attack time)
/// @function Intialize scr_playerXSpecialWShot: scr_playerXSpecialWShot
/// @param isCharged is charged
/// @param shotObj shot object
/// @param waitTime wait time between two shot
/// @param atkSpriteTimeSpecial sprite attack time

var isCharged = argument0;
var shotObj = argument1;
var waitTime = argument2;
var atkSpriteTimeSpecial = argument3;

if (isCharged = false)
{
	if (keyboard_check_pressed(global.keySpAtk))
	{
		if ((aState != ActionState.SP_MOVE) && (isCrossDashing == false))
		{
			if (atkState < AttackState.A_STRICT_ATTACK)
			{
				if (waitShotSpecial == 0)
				{
					scr_playerXChangeShotSprite(object_index, true, false);
					if (sprite_index != spr_XClimbStart && sprite_index != spr_XClimbEnd)
					{
						var obj = instance_create_depth(x, y, depth - 1, shotObj);
						obj.core = self;
						atkSpriteTime = atkSpriteTimeSpecial;
						
						if (sprite_index == spr_XShotClimb)
						{
							vspd = 0;
							vState = VerticalState.V_MOVE_NONE;
							isClimbing = 0;
						}
						atkState = AttackState.A_NORMAL_ATTACK;
						waitShotSpecial = waitTime;
					}
				}
			}
		}
	}
}
else
{
	if (keyboard_check_released(global.keySpAtk))
	{
		if ((aState != ActionState.SP_MOVE) && !((object_index == obj_playerEclipseX) && (isCrossDashing == false)))
		{
			if (chargeWeapon >= chargeLv2Limit)
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
					var obj = instance_create_depth(x, y, depth - 1, shotObj);
					obj.core = self;

					atkSpriteTime = atkSpriteTimeMax;
					if (sprite_index == spr_XShotClimb)
					{
						vspd = 0;
						vState = VerticalState.V_MOVE_NONE;
						isClimbing = 0;
					}
					atkState = AttackState.A_NORMAL_ATTACK;
					chargeWeapon = 0;	
					waitShot = waitShotMax;
					busterOnRow = 0;
				}
			}
			else	chargeWeapon = 0;
		}	else	chargeWeapon = 0;
	}
}