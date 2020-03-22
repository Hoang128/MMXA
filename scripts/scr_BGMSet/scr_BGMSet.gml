/// @description Intialize BGM set: scr_BGMSet(BGM, intro, loop)
/// @function Intialize BGM set: scrBGM_set
/// @param BGM
/// @param intro
/// @param loop
//--------------------------------------------------
if instance_exists(obj_BGMManager){
    with (obj_BGMManager){
		audio_stop_sound(global.BGM_current);
		global.BGM_current = argument[0];
        global.BGM_intro = argument[1];
        global.BGM_loop = argument[2];
        
        alarm[0]=1;
	}
}
//--------------------------------------------------