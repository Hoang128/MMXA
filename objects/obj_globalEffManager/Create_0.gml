/// @description Init
//Time slow
timeSlowEff = false;
timeSlowCounter = 0;
timeSlowRatio = 1;

//Earth Quake
earthQuakeEff = false;
earthQuakeCounter = 0;
earthQuakeRange = 3;

//Glow
instance_create_depth(x, y, depth, obj_glowEff);

myDeltaTime = 1;