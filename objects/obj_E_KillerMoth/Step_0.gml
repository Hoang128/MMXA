/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (state)
{
	case 0:
	{
		sprite_index = spr_KillerMothFly;
		image_index = 0;
		imgSpd = 0;
		state = 1;
	}	break;
	
	case 1:
	{
		if (instance_exists(obj_gameManager.playerCore))
		{
			self.image_xscale = -sign(self.x - obj_gameManager.playerCore.x);
			if (abs(obj_gameManager.playerCore.x - self.x) < 72 && (obj_gameManager.playerCore.y > self.y))
			{
				sprite_index=spr_KillerMothFly;
				image_index = 0;
				imgSpd = 0.5;
				state=2;
			}
		}
	}	break;
	
	case 2:
	{
		x += self.image_xscale * 1.2 * DELTA_TIME;
		y += self.yDir * 0.6 * DELTA_TIME;
		if (instance_exists(obj_gameManager.playerCore))
		{
			if (((obj_gameManager.playerCore.x - self.x) > 40 && image_xscale == -1) || ((obj_gameManager.playerCore.x - self.x) < -40 && image_xscale == 1))
			{
				image_xscale *= -1;
				x += image_xscale;
			}
			if ((obj_gameManager.playerCore.y - self.y) < 72)
			{
				if (yDir == 1)
					yDir = -1;
			}
			if ((obj_gameManager.playerCore.y - self.y) > 112)
			{
				if (yDir == -1)
					yDir = 1;
			}
			if (abs(self.x - obj_gameManager.playerCore.x) <= 8 + 12-random(12) && abs(self.y - obj_gameManager.playerCore.y) >= 72 && abs(self.y - obj_gameManager.playerCore.y) <= 90){
				sprite_index=spr_KillerMothTrans;
				image_index=0;
				image_speed=1;
				state = 3;
			}
		}
	}	break;
	
	case 4:
	{
		if (createDustTime < createDustTimeMax)
		{
			createDustTime += DELTA_TIME;
		}
		else
		{
			instance_create_depth(x, y, depth - 1, obj_E_KillerMothDust);
			createDustTime = 0;
		}
		Angle += Speed * DELTA_TIME;
        if (Angle >= 360) Angle -= 360;
        x = lengthdir_x(Orbit, Angle) + Center_X;
        y = lengthdir_y(Orbit, Angle) + Center_Y;
		if (instance_exists(obj_gameManager.playerCore))
		{
			if (abs(self.x - obj_gameManager.playerCore.x) > 60)
			{
				createDustTime = 0;
				self.image_xscale = -sign(self.x - obj_gameManager.playerCore.x);
				sprite_index = spr_KillerMothFly;
				image_index = 0;
				image_speed = 1;
				Angle = 0;
				state = 2;
			}
		}
	}	break;
}