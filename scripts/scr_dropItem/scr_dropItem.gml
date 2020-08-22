function scr_dropItem() {
	var total = 10;
	var eCapsuleLv1 = 0.5;
	var eCapsuleLv2 = 0.5;
	var wCapsuleLv1 = 0.5;
	var wCapsuleLv2 = 0.5;
	var liveUp		= 0.05;

	randomize();
	var dropNumber = random(total);

	var minNumber = 0;
	var maxNumber = eCapsuleLv1;
	if (dropNumber > minNumber && dropNumber < maxNumber)
	{
		var obj = instance_create_depth(x, y, depth, obj_ECapsuleLv1);
		obj.canBeFade = true;
		return;
	}

	minNumber += eCapsuleLv2;
	maxNumber += eCapsuleLv2;
	if (dropNumber > minNumber && dropNumber < maxNumber)
	{
		var obj = instance_create_depth(x, y, depth, obj_ECapsuleLv2);
		obj.canBeFade = true;
		return;
	}

	minNumber += wCapsuleLv1;
	maxNumber += wCapsuleLv1;
	if (dropNumber > minNumber && dropNumber < maxNumber)
	{
		var obj = instance_create_depth(x, y, depth, obj_WCapsuleLv1);
		obj.canBeFade = true;
		return;
	}

	minNumber += wCapsuleLv2;
	maxNumber += wCapsuleLv2;
	if (dropNumber > minNumber && dropNumber < maxNumber)
	{
		var obj = instance_create_depth(x, y, depth, obj_WCapsuleLv2);
		obj.canBeFade = true;
		return;
	}

	minNumber += liveUp;
	maxNumber += liveUp;
	if (dropNumber > minNumber && dropNumber < maxNumber)
	{
		var obj = instance_create_depth(x, y, depth, obj_LiveUp);
		obj.canBeFade = true;
		return;
	}


}
