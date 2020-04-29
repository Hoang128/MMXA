var hpConsume = argument0;
var character = argument1;
var capsule = argument2;
var charNumber = 0;
switch (character)
{
	case obj_playerX:	charNumber = 0;	break;
	case obj_playerZ:	charNumber = 1;	break;
}

if (hp + hpConsume > global.hpMax[charNumber])
{
	hp = global.hpMax[charNumber];
	instance_destroy(capsule);
	return;
}
else
{
	hp += hpConsume;
	instance_destroy(capsule);
	return;
}