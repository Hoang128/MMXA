/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (damageTimmer > 0) damageTimmer -= global.deltaTime;
if (hp <= 0) instance_destroy();