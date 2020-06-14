/// @description Intialize BGM set: scr_BGMSet(BGM, intro, loop)
/// @function Intialize BGM set: scrBGM_set
/// @param BGM
/// @param is stage theme
//--------------------------------------------------
if instance_exists(obj_BGMManager){
    with (obj_BGMManager){
		audio_stop_sound(currentBGM);
		if (argument[1] == true)
		{
			global.BGM_stage = argument[0];
			currentBGM = global.BGM_stage;
		}
		else
		{
			global.BGM_temp = argument[0];
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
			default:
			{
				show_message("BGM is not resigned its intro and loop length in scr_BGMSet() function!");
			}	break;
		}
        
        alarm[0]=1;
	}
}
//--------------------------------------------------