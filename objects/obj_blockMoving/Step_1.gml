/// @description Set direction
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (moveDir)
{
	case 0:		{	hDir = 1;	vDir = 0;	}	break;
	case 90:	{	hDir = 0;	vDir = -1;	}	break;
	case 180:	{	hDir = -1;	vDir = 0;	}	break;
	case 270:	{	hDir = 0;	vDir = 1;	}	break;
	default:
	{	
		var dir = moveDir % 90;
		if ((moveDir > 0) && (moveDir < 90))
		{
			hDir = cos(dir);
			vDir = -sin(dir);
		}
		
		else if ((moveDir > 90) && (moveDir < 180))
		{
			hDir = -sin(dir);
			vDir = -cos(dir);
		}
		
		else if ((moveDir > 180) && (moveDir < 270))
		{
			hDir = -cos(dir);
			vDir = sin(dir);
		}
		
		else if ((moveDir > 270 && moveDir < 360))
		{
			hDir = sin(dir);
			vDir = cos(dir);
		}
	}
	break;
}