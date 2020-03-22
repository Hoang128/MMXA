/// @description Switch depend on player
sprite_index = core.sprite_index;
image_index = core.image_index;
image_xscale = core.image_xscale;

if (instance_exists(core))
{
	switch core.object_index
	{
		case obj_playerX:
		{
			myPalSprite = spr_PalXShadow;
		}
		break;
		default: break;
	}
}
else instance_destroy();
