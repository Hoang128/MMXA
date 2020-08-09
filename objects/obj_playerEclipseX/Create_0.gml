/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

//Special Frames
sprDashCrossDown1 = spr_XDashCrossDown1;
sprDashCrossDown2 = spr_XDashCrossDown2;

//Armor
partHead = 0;
partArms = 1;
partBody = 0;
partFoot = 1;

objArmor = instance_create_depth(x, y, depth - 1, obj_armorImage);
objArmor.Head = partHead;
objArmor.Arms = partArms;
objArmor.Body = partBody;
objArmor.Foot = partFoot;
objArmor.core = self;

//Parameters
maxSolarDashTime = 2;
ArmorPointMax = 4;
coolDownAPTimeMax = 480;
coolDownSpdSlow = 1;
coolDownSpdNormal = 2;
coolDownSpdCharge = 80;
minTimeInImpactDown = 20;


//Inside Variables
ignitionMode = false;
SolarDrive = false;
freezeMode = false;
LunarDrive = false;
solarDashTime = 2;
usedFirstAirDash = false;
dashed = false;
coolDownSpd = 2;
canUseArmorPoint = true;
ArmorPoint = 4;
usedFArmorPointFlag = false;
coolDownAPTime = 0;
timeInImpactDown = 0;
isCrossDashing = false;
chargeWeapon = 0;