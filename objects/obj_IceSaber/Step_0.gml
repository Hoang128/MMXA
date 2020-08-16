/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (createSpikeWait < createSpikeWaitMax)
	createSpikeWait += DELTA_TIME;
else
{
	randomize();
	instance_create_depth(x + 20 * image_xscale + random(8), y, depth + 1, obj_ZIceSpyke);
	createSpikeWait = 0;
}