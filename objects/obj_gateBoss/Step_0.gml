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
				sprite_index = spr_gateBossOpen;
				image_index = 0;
				
				state = gateState.OPENING;
				phase = 2;
			}
		}	break;
		
		case 2:
		{
			if (image_index > 2)
			{
				if (sndEff == 0)
				{
					audio_play_sound_on(global.SFX_Emitter, snd_spinGate, 0, 0);
					sndEff = 1;
				}
			}
			
			if (image_index > 14)
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
			if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_gameManager.playerCore, false, false))
			{
				waitTimeOpen = 0;
				
				with (obj_gameManager.playerCore)
				{
					sprite_index = sprRunEnd;
					image_index = 0;
					
					hspd = 0;
					hState = HorizontalState.H_MOVE_NONE;
				}
				phase = 5;
			}
		}	break;
		
		case 5:
		{
			if (waitTimeOpen < waitTimeOpenMax)
				waitTimeOpen += DELTA_TIME;
			else
			{
				state = gateState.CLOSING;
				
				with (obj_view)	
					moveMode = 2;
				
				sprite_index = spr_gateBossOpen;
				image_index = 17;
				
				phase = 6;
			}
		}	break;
		
		case 6:
		{
			if (image_index < 1)
			{
				sprite_index = spr_gateBoss;
				image_index = 0;
				waitTimeOpen = 0;
				
				block = instance_create_depth(bbox_left, bbox_top, depth + 1, obj_block);
				block.image_xscale = 2;
				block.image_yscale = 4;
				state = gateState.LOCKING;
				
				var bossZone = collision_rectangle(obj_gameManager.playerCore.bbox_left, obj_gameManager.playerCore.bbox_top, obj_gameManager.playerCore.bbox_right, obj_gameManager.playerCore.bbox_bottom, obj_limitZoneBoss, false, false);
				if (bossZone)
				{
					with(bossZone)
					{
						if (phase == -1)
						{
							scr_BGMStop();
							phase = 0;
							
							with(obj_gateBoss)
							{
								if(place_meeting(x, y + 1, bossZone) 
								|| place_meeting(x, y - 1, bossZone) 
								|| place_meeting(x + 1, y, bossZone)
								|| place_meeting(x - 1, y, bossZone))
								{
									phase = 7;
								}
							}
						}
						else
						{
							other.phase = 0;
							with(obj_gameManager.playerCore)
								activateState = ActivateState.ACTIVATE;
						}
					}
				}
				else
				{
					phase = 0;
					with(obj_gameManager.playerCore)
						activateState = ActivateState.ACTIVATE;
				}
			}
			
			if (image_index < 14)
			{
				if (sndEff == 1)
				{
					audio_play_sound_on(global.SFX_Emitter, snd_spinGate, 0, 0);
					sndEff = 0;
				}
			}
			
			if (image_index < 17)
			{
				if (sndEff == 2)
				{
					audio_play_sound_on(global.SFX_Emitter, snd_moveGate, 0, 0);
					sndEff = 1;
				}
			}
		}	break;
	}
}