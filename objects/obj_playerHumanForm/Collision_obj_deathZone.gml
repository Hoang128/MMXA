/// @description Dead Zone

if (weight < WeighType.MASSIVE)
{
	if (stunTime <= 0)
		switch (object_index)
		{
			case obj_playerX:
			case obj_playerXUA:
			case obj_playerEclipseX:
				global.hp[0] = 0;	break;
			case obj_playerZ:
				global.hp[1] = 0;	break;
		}	
}