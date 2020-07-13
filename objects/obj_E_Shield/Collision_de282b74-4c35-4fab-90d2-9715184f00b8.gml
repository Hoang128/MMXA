/// @description Insert description here
// You can write your code in this editor

if (damageTimmer == -1)
	damageTimmer = 0;
if (damageTimmer <= 0)
{
	if (guard == 0)
	{		
		
	}
	else
	{	
		//Create collision effect
		scr_createEnemyColGuardEff();
	}
	damageTimmer = other.maxTimmer;
}