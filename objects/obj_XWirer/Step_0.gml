/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (instance_exists(core))
{
	switch(core.wireType)
	{
		case WireType.HORIZONTAL:
		{
			if (core.hspd != 0)
				sprite_index = spr_XWirerEff;
			else
				sprite_index = spr_XWirer;
		}	break;
		case WireType.VERTICAL:
		{
			if (core.vspd > 0)
			{
				sprite_index = spr_XWirerDownEff;
			}
			else
			{
				if (core.vspd < 0)
					sprite_index = spr_XWirerUpEff;
				else
					sprite_index = spr_XWirerUp;
			}
		}	break;
	}
}