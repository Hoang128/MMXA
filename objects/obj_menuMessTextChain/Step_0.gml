/// @description Insert description here
// You can write your code in this editor
if (init == 0)
{
	messArr[0].init = 1;
	init = 1;
}
else
{
	if (messChain == 0)
	{
		instance_destroy();
	}
	else
	{
		if (!instance_exists(messArr[messCurrent]))
		{
			if (messCurrent < messChain - 1)
			{
				messCurrent++;
				messArr[messCurrent].init = 1;
			}
			else
				instance_destroy();
		}
	}
}
