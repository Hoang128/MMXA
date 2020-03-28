/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (active)
{
	if (keyboard_check_pressed(global.keyJump) || keyboard_check_pressed(vk_enter))
	{
		if (cursor == 1)
		{
			room_goto(room_test);
		}
	}
}