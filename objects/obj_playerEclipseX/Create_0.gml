/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

partHead = 0;
partArms = 0;
partBody = 0;
partFoot = 1;


objArmor = instance_create_depth(x, y, depth - 1, obj_armorImage);
objArmor.Head = partHead;
objArmor.Arms = partArms;
objArmor.Body = partBody;
objArmor.Foot = partFoot;
objArmor.core = self;