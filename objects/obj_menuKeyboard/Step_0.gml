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
			lineContext[6] = "Element weapon 1";
			lineContext[10] = "Element weapon 2";
			lineContext[11] = "Use fusion elf";
		}	break;
		case 2:
		{
			lineContext[5] = "Z - Saber";
			lineContext[6] = "Special Attack";
			lineContext[10] = "Use fusion elf 1";
			lineContext[11] = "Use fusion elf 2";
		}	break;
		case 3:
		{
			lineContext[5] = "Main weapon attack 1";
			lineContext[6] = "Main weapon attack 1";
			lineContext[10] = "Sub weapon attack 2";
			lineContext[11] = "Sub weapon attack 2";
		}	break;
	}
	charConfiguration = -1;
}

if (backExecute)
{
	instance_destroy();
}

for(var i = 1; i <= 14; i++)
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