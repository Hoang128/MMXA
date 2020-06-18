/// @description
if (!instance_exists(obj_menuKeyboard))
	instance_destroy();

if (init == false)
{
	switch (keyId)
	{
		case 1:		keyCode = global.keyUp;			break;
		case 2:		keyCode = global.keyDown;		break;
		case 3:		keyCode = global.keyLeft;		break;
		case 4:		keyCode = global.keyRight;		break;
		case 5:		keyCode = global.keyAtk;		break;
		case 6:		keyCode = global.keySpAtk;		break;
		case 7:		keyCode = global.keyJump;		break;
		case 8:		keyCode = global.keyDash;		break;
		case 9:		keyCode = global.keyGiga;		break;
		case 10:	keyCode = global.keyMap;		break;
		case 11:	keyCode = global.keyChangeL;	break;
		case 12:	keyCode = global.keyChangeR;	break;
		default:	keyCode = noone;				break;
	}
	init = true;
}
else
{
	if ((core.lineVisibleTop <= keyId) && (keyId < (core.lineVisibleTop + core.lineNumberVisible)))
		visible = true;
	else
		visible = false;
		
	if (canChange > -3)
	{
		if (canChange == 1)
		{
			if (effectTime < 30) effectTime++
			else	effectTime = 0;
			if (keyboard_check_pressed(vk_anykey))
			{
				var currentKey = keyboard_lastkey;
				for (var i = 1; i <= 14; i++)
				{
					if (i == self.keyId) continue;
					if (core.keyChangeContext[i].keyCode == currentKey)
					{
						audio_play_sound_on(global.SFXVolume, soundMove, 0, 0);
						core.active = 1;
						core.lineExecute[keyId] = false;
						core.lineHandle[keyId] = false;
						self.active = 0;
						self.canChange = -4;
						var pUp = instance_create_depth(x, y, -1000, obj_popUpKeyboardDuplicate);
						pUp.parent = obj_menuKeyboard;
						pUp.x = VIEW_WIDTH/2 - pUp.width/2;
						pUp.y = VIEW_HEIGHT/2 - pUp.height/2;
						break;
					}
				}
				if (canChange != -4)
				{
					audio_play_sound_on(global.SFXVolume, soundConfirm, 0, 0);
					keyCode = currentKey;
					switch(keyId)
					{
						case 1:		global.keyUp = keyCode;			break;
						case 2:		global.keyDown = keyCode;		break;
						case 3:		global.keyLeft = keyCode;		break;
						case 4:		global.keyRight = keyCode;		break;
						case 5:		global.keyAtk = keyCode;		break;
						case 6:		global.keySpAtk = keyCode;		break;
						case 7:		global.keyJump = keyCode;		break;
						case 8:		global.keyDash = keyCode;		break;
						case 9:		global.keyGiga = keyCode;		break;
						case 10:	global.keyChar1 = keyCode;		break;
						case 11:	global.keyChar2 = keyCode;		break;
						case 12:	global.keyChangeL = keyCode;	break;
						case 13:	global.keyChangeR = keyCode;	break;
						case 14:	global.keyMap = keyCode;		break;
					}
					core.active = 1;
					core.lineExecute[keyId] = false;
					core.lineHandle[keyId] = false;
					self.active = 0;
					self.canChange = -3;
				}
				canChange = -3;
			}
		}
			
		else
			canChange++;
	}
}