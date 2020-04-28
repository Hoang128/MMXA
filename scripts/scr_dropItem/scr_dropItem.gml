var total = 10;
var eCapsuleLv1 = 1.2;
var eCapsuleLv2 = 1.2;
var wCapsuleLv1 = 1.2;
var wCapsuleLv2 = 1.2;
var liveUp		= 0.2;

randomize();
var dropNumber = random(total);

var minNumber = 0;
var maxNumber = eCapsuleLv1;
if (dropNumber > minNumber && dropNumber < maxNumber)
{
	instance_create_depth(x, y, depth, obj_ECapsuleLv1);
	return;
}

minNumber += eCapsuleLv2;
maxNumber += eCapsuleLv2;
if (dropNumber > minNumber && dropNumber < maxNumber)
{
	instance_create_depth(x, y, depth, obj_ECapsuleLv2);
	return;
}

minNumber += wCapsuleLv1;
maxNumber += wCapsuleLv1;
if (dropNumber > minNumber && dropNumber < maxNumber)
{
	instance_create_depth(x, y, depth, obj_WCapsuleLv1);
	return;
}

minNumber += wCapsuleLv2;
maxNumber += wCapsuleLv2;
if (dropNumber > minNumber && dropNumber < maxNumber)
{
	instance_create_depth(x, y, depth, obj_WCapsuleLv2);
	return;
}

minNumber += liveUp;
maxNumber += liveUp;
if (dropNumber > minNumber && dropNumber < maxNumber)
{
	instance_create_depth(x, y, depth, obj_LiveUp);
	return;
}