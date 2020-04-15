/// @description Handle

// Slow time
if (instance_exists(obj_ZChronoField))
{
	if ((distance_to_object(obj_ZChronoField) < obj_ZChronoField.radius) && (obj_ZChronoField.phase > 0))
	{
		if (myDeltaTime == 1)
			myDeltaTime *= obj_ZChronoField.slowRatio;
	}
	else myDeltaTime = 1;
}

// Moving
if (moveTime > 0)
{
	hspd = hDir * moveSpd * DELTA_TIME;
	vspd = vDir * moveSpd * DELTA_TIME;
	
	moveTime -= DELTA_TIME;
}
else
{
	hspd = 0;
	vspd = 0;
}

virtualX += hspd;
virtualY += vspd;

x = floor(virtualX);
y = floor(virtualY);

//Collision with player
if (solid)
{
	with (obj_physicTemplate)
	{
		if (object_index != obj_block)
		{
			var bbox_width = abs(bbox_right - bbox_left) / 2;
			var hsp = other.hspd;
			if (abs(hsp) < 1) hsp = sign(hsp);
			if (place_meeting(x - hsp, y, other))
			{
				other.playerOther = other.id;
				if (!collision_rectangle(x + bbox_width / 2 * sign(other.hspd), bbox_top, x + (bbox_width / 2 + 1) * sign(other.hspd), bbox_bottom, obj_block, false, true))
				{
					x += hsp;
				}
		
				if (!place_meeting(x, y + clamp(other.vspd, 1, other.vspd), obj_block))
				{
					y += other.vspd;
				}
			}
			
			if (place_meeting(x, y + 1, other))
			{
				if (!collision_rectangle(x + bbox_width / 2 * sign(other.hspd), bbox_top, x + (bbox_width / 2 + 1) * sign(other.hspd), bbox_bottom, obj_block, false, true))
				{
					x += other.hspd;
				}
				
				if (!place_meeting(x, y + clamp(other.vspd, 1, other.vspd), obj_block))
				{
					y += other.vspd;
				}
			}
	
			if (place_meeting(x, y - 1, other) && (other.vspd > 0))
			{
				other.playerOther = other.id;
				if (!place_meeting(x, y + clamp(other.vspd, 1, other.vspd), obj_block))
				{
					y += other.vspd;
				}
			}
		}
	}
}