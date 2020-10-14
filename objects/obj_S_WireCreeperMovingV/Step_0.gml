/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!subInit)
{
	if (instance_exists(self.child))
	{
		self.child.sprite_index = self.sprite_index;
		subInit = true;
	}
}