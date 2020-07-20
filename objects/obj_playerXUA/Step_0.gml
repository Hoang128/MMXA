/// @description Insert description here
// You can write your code in this editor

//Inherit the parent event
event_inherited();

//Passive all
if (resetBusterOnRowMax > 0)
	resetBusterOnRowMax -= DELTA_TIME;
else
{
	if (busterOnRow < busterOnRowMax && busterOnRow > 0)
	{
		busterOnRow = 0;
	}
}
if (waitShot > 0)
	waitShot -= DELTA_TIME;
else
{
	waitShot = 0;
	if (busterOnRow == busterOnRowMax)
		busterOnRow = 0;
}

if (activateState != ActivateState.DEACTIVATE)
{
	//Passive******************************************************************************************************
	if (atkSpriteTime > 0) atkSpriteTime -= DELTA_TIME;
	else 
	{
		if (inShotFrame == true)
		{
			if (sprite_index != spr_XCShotStand && sprite_index != spr_XCShotDuck)
				scr_playerXChangeShotSprite(object_index, false, false);
			atkSpriteTime = 0;
		}
	}
	
	//Active*******************************************************************************************************
	if (activateState == ActivateState.ACTIVATE)
	{
		///Action script
	}
}