/// @description Back to previous menu if possible

if (parent != noone)
{
	if (instance_exists(parent))
	{
		parent.active = 1;
		with (parent)
		{
			for(var i = 0; i <= lineNumber; i++)
			{
				lineExecute[i] = false;
				lineHandle[i] = false;
			}
		}
	}
}

if (lastRoom != noone)
	room_goto(lastRoom);