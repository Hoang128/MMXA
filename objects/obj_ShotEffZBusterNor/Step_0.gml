/// @description Handle
if ((image_index > frameShot - 1) && (image_index < frameShot))
{
	if (!bulletCreate)
	{
		var buster = instance_create_depth(x, y, depth - 1, obj_ZChronoField);
		buster.image_xscale = image_xscale;
		bulletCreate = true;
	}
}