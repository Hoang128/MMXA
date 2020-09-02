/// @description Clean all texture pages
draw_texture_flush();

switch(global.currentPlayer)
{
	case 0:
	{
		if (global.hp[0] == 0)
		{
			global.hp[0] = global.hpMax[0];
			for(var i = 0; i <= 8; i++)
			{
				global.wp[i] = global.wpMax[0];
			}
		}
	}	break;
	case 1:
	{
		if (global.hp[1] == 0)
		{
			global.hp[1] = global.hpMax[1];
			global.zp = global.wpMax[1];
		}
	}	break;
}