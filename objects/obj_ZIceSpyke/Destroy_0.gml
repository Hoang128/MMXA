/// @description Insert description here
// You can write your code in this editor
if (createEff == true)
{
	audio_play_sound_on(global.SFX_Emitter, snd_IceBreak, false, false);
	randomize();
	var obj1 = instance_create_depth(x, bbox_bottom, depth - 1, obj_ZIcePieces);
		obj1.image_index = 0;
		obj1.hspd = 0.5 + 0.1 * random(5);
		obj1.vspd = -6  + 0.1 * random(5);
	
	var obj2 = instance_create_depth(x, bbox_bottom, depth - 1, obj_ZIcePieces);
		obj2.image_index = 1;
		obj2.hspd = -1  + 0.1 * random(5);
		obj2.vspd = -2  + 0.1 * random(5);
	
	var obj3 = instance_create_depth(x, bbox_bottom, depth - 1, obj_ZIcePieces);
		obj3.image_index = 2;
		obj3.hspd = 2     + 0.1 * random(5);
		obj3.vspd = -4  + 0.1 * random(5);
}