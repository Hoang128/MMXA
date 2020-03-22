/// @description Effect

//Shadow********************************************************************************

#region

if (weight != WeighType.MASSIVE)
{
	if ((aState == ActionState.DASHING) || (aState == ActionState.JUMPDASHING))
	{
		if (shadowCreateTime > 0) shadowCreateTime -= global.deltaTime;
		else
		{
			var obj = instance_create_depth(x, y, depth + 1, obj_PlayerShadowEffect);
			obj.core = self.object_index;
			shadowCreateTime = shadowCreateTimeMax;
		}
	}
	else
	{
		if (shadowCreateTime < shadowCreateTimeMax) shadowCreateTime = shadowCreateTimeMax;
	}
}

#endregion