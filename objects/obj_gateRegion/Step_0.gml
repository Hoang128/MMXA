/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_gameManager.playerCore))
{
	switch (phase)
	{
		case 0:
		{
			if (collision_rectangle(bbox_right, bbox_top, bbox_right + 1, bbox_bottom, obj_gameManager.playerCore, false, false)
			|| collision_rectangle(bbox_left, bbox_top, bbox_left - 1, bbox_bottom, obj_gameManager.playerCore, false, false))
			{
				if ((bbox_bottom >= obj_gameManager.playerCore.bbox_bottom) && (bbox_top <= obj_gameManager.playerCore.bbox_top))
				if (obj_gameManager.playerCore.hDir == sign(self.x - obj_gameManager.playerCore.x))
				{
					if (lock == false)
					{
						with(obj_iceController)
						{
							playerAffect = false;
							iceSlideAcr = 0;
							iceSlideSlope = 0;
							iceSlideSpd = 0;
						}
						scr_playerBackToIdle();
						phase = 1;
					}
				}
			}
		}	break;
		
		case 1:
		{
			if (waitTimeOpen < waitTimeOpenMax)
				waitTimeOpen += DELTA_TIME;
			else
			{
				sprite_index = spr_gateCommonOpen;
				image_index = 0;
				
				state = gateState.OPENING;
				phase = 2;
			}
		}	break;
		
		case 2:
		{
			if (image_index > 1)
			{
				if (sndEff == 0)
				{
					audio_play_sound_on(global.SFX_Emitter, snd_spinGate, 0, 0);
					sndEff = 1;
				}
			}
			
			if (image_index > 13)
			{
				if (sndEff == 1)
				{
					audio_play_sound_on(global.SFX_Emitter, snd_moveGate, 0, 0);
					sndEff = 2;
				}
			}
		}	break;
		
		case 3:
		{
			if (waitTimeOpen < waitTimeOpenMax)
				waitTimeOpen += DELTA_TIME;
			else
			{
				state = gateState.UNLOCKING;
				instance_create_depth(0, 0, depth, obj_effClosing_Black);
				
				with (obj_view)	
					moveMode = 2;
				
				with (obj_gameManager.playerCore)
				{
					sprite_index = sprRunStart;
					image_index = 0;
					
					hspd = hDir * 1;
					hState = HorizontalState.H_MOVE_FORWARD;
				}
				phase = 4;
			}
		}	break;
		
		case 4:
		{
			if (waitTimeEnd < waitTimeEndMax)
				waitTimeEnd++;
			else
			{
				room_goto(roomNew);
				global.xSpawmLocation = xNew;
				global.ySpawmLocation = yNew;
				global.airSpawm = false;
			}
		}	break;
	}
}