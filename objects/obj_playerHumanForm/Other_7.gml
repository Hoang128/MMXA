/// @description Animated end stuff
if (sprite_index == sprRunStart)
{
	sprite_index = sprRun;
	image_index = 0;
}

if (sprite_index == sprRunEnd)
{
	sprite_index = sprStand;
	image_index = 0;
}

if (sprite_index == sprJump1)
{
	sprite_index = sprJump2;
	image_index = 0;
}

if (sprite_index == sprJump3)
{
	sprite_index = sprJump4;
	image_index = 0;
}

if (sprite_index == sprLand)
{
	sprite_index = sprStand;
	image_index = 0;
}

if (sprite_index == sprDash1)
{
	dashPhase = 2;
	sprite_index = sprDash2;
	image_index = 0;
}

if (sprite_index == sprDash3)
{
	sprite_index = sprStand;
	image_index = 0;
}

if (sprite_index == sprSlide1)
{
	sprite_index = sprSlide2;
	image_index = 0;
}

if (sprite_index == sprDuck1)
{
	sprite_index = sprDuck2;
}

if (sprite_index == sprDuck3)
{
	sprite_index = sprStand;
	image_index = 0;
}

if (sprite_index == sprWallKick)
{
	image_index = 2;
}

if (sprite_index == sprDashKick1)
{
	sprite_index = sprDashKick2;
	image_index = 0;
}

if (isClimbing == 1)
{
	if (sprite_index == sprClimb3)
	{	
		sprite_index = sprStand;
		image_index = 0;
	}

	if (sprite_index == sprClimb1)
	{
		isClimbing = 0;
		
		sprite_index = sprClimb2;
		image_index = 0;
	}
}