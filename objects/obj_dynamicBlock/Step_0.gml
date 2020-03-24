/// @description Step
self.solid = 0;

if (canSolid)
{
	if (instance_exists(obj_playerHumanForm))
	{
		if (place_meeting(x, y - (obj_playerHumanForm.vspd + 1), obj_playerHumanForm))
		{
			if (self.bbox_top - obj_playerHumanForm.bbox_bottom > 0)
			{
				obj_playerHumanForm.dynamicBlock = self.id;
				self.solid = 1;
			}
		}
	}
}
else
{
	if (timeWait > 0) timeWait -= global.deltaTime * myDeltaTime;
	else
	{
		canSolid = 1;
		timeWait = maxTimeWait;
	}
}