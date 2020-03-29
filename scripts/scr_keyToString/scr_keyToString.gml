var returnStr = "";
switch (argument0)
{
	case vk_enter:		returnStr = "ENTER"; break;
	case vk_space:		returnStr = "SPACE"; break;
	case vk_lshift:		returnStr = "LEFT SHIFT"; break;
	case vk_rshift:		returnStr = "RIGHT SHIFT"; break;
	case vk_lalt:		returnStr = "LEFT ALT"; break;
	case vk_ralt:		returnStr = "RIGHT ALT"; break;
	case vk_lcontrol:	returnStr = "LEFT CTRL"; break;
	case vk_rcontrol:	returnStr = "RIGHT CTRL"; break;
	case vk_tab:		returnStr = "TAB"; break;
	case vk_numpad0:	returnStr = "NUMPAD 0"; break;
	case vk_numpad1:	returnStr = "NUMPAD 1"; break;
	case vk_numpad2:	returnStr = "NUMPAD 2"; break;
	case vk_numpad3:	returnStr = "NUMPAD 3"; break;
	case vk_numpad4:	returnStr = "NUMPAD 4"; break;
	case vk_numpad5:	returnStr = "NUMPAD 5"; break;
	case vk_numpad6:	returnStr = "NUMPAD 6"; break;
	case vk_numpad7:	returnStr = "NUMPAD 7"; break;
	case vk_numpad8:	returnStr = "NUMPAD 8"; break;
	case vk_numpad9:	returnStr = "NUMPAD 9"; break;
	case vk_pageup:		returnStr = "PAGE UP"; break;
	case vk_pagedown:	returnStr = "PAGE DOWN"; break;
	case vk_home:		returnStr = "HOME"; break;
	case vk_end:		returnStr = "END"; break;
	case vk_decimal:	returnStr = "NUMPAD ."; break;
	case vk_delete:		returnStr = "DELETE"; break;
	case vk_divide:		returnStr = "NUMPAD DIVINE"; break;
	case vk_escape:		returnStr = "ESC"; break;
	case vk_subtract:	returnStr = "NUMPAD SUBTRACT"; break;
	case vk_multiply:	returnStr = "NUMPAD MULTIPLY"; break;
	case vk_add:		returnStr = "NUMPAD ADD"; break;
	case vk_backspace:  returnStr = "BACKSPACE"; break;
	case vk_right:		returnStr = "RIGHT ARROW"; break;
	case vk_left:		returnStr = "LEFT ARROW"; break;
	case vk_up:			returnStr = "UP ARROW"; break;
	case vk_down:		returnStr = "DOWN ARROW"; break;
	default:			returnStr = chr(argument0); break;
}

return returnStr;