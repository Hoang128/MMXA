/// @description Intialize BGM set: scr_BGMSet(BGM, is stage theme)
/// @function Intialize BGM set: scrBGM_set
/// @param BGM
/// @param is stage theme
function scr_BGMSet(BGM, isStageTheme) {
	//--------------------------------------------------
	if instance_exists(obj_BGMManager){
	    with (obj_BGMManager){
			if (BGM != currentBGM)
			{
				audio_stop_sound(currentBGM);
				if (isStageTheme == true)
				{
					global.BGM_stage = BGM;
					currentBGM = global.BGM_stage;
				}
				else
				{
					global.BGM_temp = BGM;
					currentBGM = global.BGM_temp;
				}
		
				switch (currentBGM)
				{
					case bgm_MMZ3_Prismastic:
					{
						global.BGM_intro = 0.50;
						global.BGM_loop = 104.00;
					}	break;
			
					case bgm_ZLCrash:
					{
						global.BGM_intro = 13.50;
						global.BGM_loop = 77.40;
				
					}	break;
			
					case bgm_X5VSBoss:
					{
						global.BGM_intro = 3.00;
						global.BGM_loop = 44.50;
					}	break;
					case bgm_DrLight:
					{
						global.BGM_intro = 00.00;
						global.BGM_loop = 14.00;
					}	break;
					case bgm_PowerPlantMain:
					{
						global.BGM_intro = 28.00;
						global.BGM_loop = 79.50;
					}	break;
					case bgm_MMZ3_OldSpaceLife:
					{
						global.BGM_intro = 4.75;
						global.BGM_loop = 103.75;
					}	break;
					case noone:
					{
						global.BGM_intro = 0;
						global.BGM_loop = 0;
					}	break;
					default:
					{
						show_message("BGM is not resigned its intro and loop length in scr_BGMSet() function!");
					}	break;
				}
        
				if (currentBGM != noone)
				{
					bgm = audio_play_sound_on(global.BGM_Emitter,currentBGM,0,0);
					if init init--;
				}
				else
				{
					scr_BGMStop();
				}
			}
		}
	}
	//--------------------------------------------------


}
