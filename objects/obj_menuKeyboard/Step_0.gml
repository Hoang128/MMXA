/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (charConfiguration > 0)
{
	switch (charConfiguration)
	{
		case 1:
		{
			lineContext[5] = "X - Buster";
			lineContext[6] = "Element weapon";
		}	break;
		case 2:
		{
			lineContext[5] = "Z - Saber";
			lineContext[6] = "Buster Attack";
		}	break;
		case 3:
		{
			lineContext[5] = "Main weapon attack";
			lineContext[6] = "Sub weapon attack";
		}	break;
	}
	charConfiguration = -1;
}

if (backExecute)
{
	instance_destroy();
}

for(var i = 1; i <= 12; i++)
{
	if(lineExecute[i])
	{
		if (keyChangeContext[i].canChange == -3)
		{
			keyChangeContext[i].active = 1;
			keyChangeContext[i].canChange = -2;
		}
	}
}