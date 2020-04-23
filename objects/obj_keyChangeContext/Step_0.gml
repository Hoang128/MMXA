/// @description
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
		case 10:	keyCode = global.keyChar1;		break;
		case 11:	keyCode = global.keyChar2;		break;
		case 12:	keyCode = global.keyChangeL;	break;
		case 13:	keyCode = global.keyChangeR;	break;
		case 14:	keyCode = global.keyMap;		break;
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
}