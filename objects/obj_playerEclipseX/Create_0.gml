/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

//Special Frames
sprDashCrossDown1 = spr_XDashCrossDown1;
sprDashCrossDown2 = spr_XDashCrossDown2;

//Armor
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

//Parameters
dashCrossSpd1 = 1;
dashCrossSpd2 = 6;
ArmorPointMax = 4;
coolDownAPTimeMax = 120;
coolDownAPTimeSlow = 180;

//Inside Variables
canUseArmorPoint = true;
ArmorPoint = 4;
usedFArmorPointFlag = false;
coolDownAPTime = 0;