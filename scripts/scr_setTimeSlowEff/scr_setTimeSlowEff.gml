var time = argument0;
var ratio = argument1;

if (!instance_exists(obj_globalEffManager))
	return;

obj_globalEffManager.timeSlowCounter = time;
obj_globalEffManager.timeSlowEff = true;
global.deltaTime = ratio;
