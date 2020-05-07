/// @description Insert description here
// You can write your code in this editor

if (pieceType != noone)
{
	if (pieceNumber > 0)
	{
		if (pieceTime < pieceNumber)
		{
			if (waitTime < waitTimeMax)
			{
				waitTime += DELTA_TIME;
			}
			else
			{
				var obj = instance_create_depth(x ,y ,depth , obj_E_Piece);
				obj.hspd = hRange * hDir;
				obj.vspd = -(random(2) + 4);
				obj.sprite_index = pieceType;
				obj.image_index = pieceTime;
				if (palette != noone)
				{
					obj.palette = palette;
					obj.paletteNumber = paletteNumber;
					with (obj)
						scr_PalSwapInitSystem(shd_pal_swapper);
				}
				hDir *= -1;
				hRange += range;
				pieceTime ++;
				waitTime = 0;
			}
		}
		else instance_destroy();
	}
}