/// @description Insert description here
// You can write your code in this editor

if (bounce == 1)
{
	var startAngle = 180;
	if (image_xscale == -1)
		startAngle = 0;
	var bounceUp = 1;
	randomize();
	if (random(2) > 1)
		bounceUp = -1;
	
	var obj = instance_create_depth(x, y, depth, obj_BusterNormalBounce);
	obj.sprite_index = bounceSpr;
	obj.image_angle = startAngle - bounceUp * (random(30) + 30);
	obj.direction = obj.image_angle;
	obj.moveSpd = moveSpd;
}