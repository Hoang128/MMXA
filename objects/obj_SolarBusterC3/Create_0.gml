/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

damage = 5;
moveSpd = 6;

collisionSFX = snd_RWeaponColEnemyEff;
collisionEff = obj_BusterColEffLv2;

level = 1;

if (instance_exists(obj_gameManager.playerCore))
{
	if (obj_gameManager.playerCore.upgradeChargeStack > 0)
	{
		obj_gameManager.playerCore.upgradeChargeStack--;
		level = 2;
	}
}

lv2ExistTime = 90;
lv2ExistTimeMax = 120;