/// @description Insert description here
// You can write your code in this editor
if (phase > 0)
{
	if (phase == 1)
	{
		if (waitTime <= 80)
		{
			instance_create_depth(x, y, -4000, obj_effClosing_Black);
			scr_BGMStop();
			phase = 2;
		}
	}

	if (phase == 2)
	{
		if (waitTime <=0)
		{
			if (room_exists(roomGo))
			{
				room_goto(roomGo);
				global.xSpawmLocation = xGo;
				global.ySpawmLocation = yGo;
				global.airSpawm = isAirSpawm;
			}
		}
	}
	
	waitTime--;
}