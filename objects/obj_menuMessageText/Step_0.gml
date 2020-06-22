/// @description Insert description here
// You can write your code in this editor

if (init == false)
{
	
	init = true;
}
else
{
	switch(phase)
	{
		case 0:
		{
			if (haveStartAnim == true)
			{
				switch(animPhase)
				{
					//Anim border
					case 0:
					{
						if (width < widthMax)
						{
							width  += animXPixelSpd;
							height += heightMax * animXPixelSpd / widthMax;
						}
						else
						{
							if (bustShot == fa_left)
							{
								xStartSpace = x + 2 * bustShotX + bustShotW;
								yStartSpace = 8;
								lineW = borderSpace + widthMax - xStartSpace - xEndSpace;
							}
							else
							{
								xStartSpace = 8;
								yStartSpace = 8;
								lineW = borderSpace + widthMax - xStartSpace - xEndSpace - (2 * bustShotX + bustShotW);
							}
							width  = widthMax;
							height = heightMax;
							animPhase = 1;
						}
					}	break;
			
					//Anim mugshot
					case 1:
					{
						if (bustShotImg != noone)
						{
							if (bustShotXScale < 1)
							{
								bustShotXScale += bustShotAnimSpd;
								bustShotYScale += bustShotAnimSpd;
							}
							else
							{
								bustShotXScale = 1;
								bustShotYScale = 1;
								phase = 1;
								animPhase = 2;
							}
						}
						else
						{
							phase = 1;
							animPhase = 2;
						}
					}	break;
				}
			}
			else
				phase = 1;
		}	break;
		
		case 1:
		{
			//for testing
			if (charCursorMax == 0)
			{
				charCursorMax = string_length(lineContext[contextCurrent]);
				charCursor = 0;
				messageIndex = "";
			}
			else
			{
				if (charCursor < charCursorMax)
				{
					var ratio = 1;
					if (keyboard_check(vk_anykey))
						ratio = 2;
					if ((charCursor + ratio * contextRevealSpd) < charCursorMax)
						charCursor += ratio * contextRevealSpd;
					else
						charCursor = charCursorMax;
					messageIndex = string_copy(lineContext[contextCurrent], 0, floor(charCursor));
				}
			}
			if (keyboard_check_pressed(global.keyJump))
			{
				if (contextCurrent < (contextNumber - 1))
				{
					if (charCursor == charCursorMax)
					{
						contextCurrent++;
						charCursorMax = 0;
					}
				}
				else
					phase = 2;
			}
		}	break;
		
		case 2:
		{
			switch(animPhase)
			{
				case 2:
				{
					if (bustShotImg != noone)
					{
						if (bustShotXScale > 0)
						{
							bustShotXScale -= bustShotAnimSpd;
							bustShotYScale -= bustShotAnimSpd;
						}
						else
						{
							bustShotXScale = 0;
							bustShotYScale = 0;
							animPhase = 1;
						}
					}
					else
						animPhase = 1;
				}	break;
				
				case 1:
				{
					if (width > 0)
					{
						width  -= animXPixelSpd;
						height -= heightMax * animXPixelSpd / widthMax;
					}
					else
					{
						width = 0;
						height = 0;
						animPhase = 0;
					}
				}	break;
				
				case 0:
				{
					instance_destroy();
				}	break;
			}
		}
	}
}