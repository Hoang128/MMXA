/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (!instance_exists(core))
	instance_destroy();
else
{
	switch (top)
	{
		case false:
		{
			{
				if (core.shieldEff2 != self.id)
					instance_destroy();
				else
				{
					self.image_xscale = core.image_xscale;
					self.x = core.x + xPlace * core.image_xscale;
					self.y = core.y + yPlace;
				}
			}
		}	break;
		case true:
		{
			if (self.top == true)
			{
				if (core.shieldEff1 != self.id)
					instance_destroy();
				else
				{
					self.image_xscale = core.image_xscale;
					self.x = core.x + xPlace * core.image_xscale;
					self.y = core.y + yPlace;
				}
			}
		}	break;
	}
}