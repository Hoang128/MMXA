/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (touchPlayer == true && destroyAfterTouch == true)
{
	createBulletEff = true;
	instance_destroy();
}