/// @description Init Sound

global.masterVolume=1;
global.BGMVolume=1;
global.SFXVolume=0.6;
global.BGM_Emitter = audio_emitter_create();
global.SFX_Emitter = audio_emitter_create();

audio_master_gain(global.masterVolume);
audio_emitter_gain(global.BGM_Emitter, global.BGMVolume);
audio_emitter_gain(global.SFX_Emitter, global.SFXVolume);

instance_create_depth(x, y, depth, obj_BGMManager);