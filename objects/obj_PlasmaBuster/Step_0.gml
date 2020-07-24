/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (canCreateOrb < 1)
	canCreateOrb += DELTA_TIME;
else
	canCreateOrb = 1;