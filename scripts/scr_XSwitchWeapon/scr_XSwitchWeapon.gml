if (keyboard_check_pressed(global.keyChangeR) && !keyboard_check(global.keyChangeL))
{
	do
	{
		currentWeapon++;
		if (currentWeapon == 9)	
		{
			currentWeapon = 0;
		}
	}
	until (global.weapon[currentWeapon] == ItemState.USING);
}

if (keyboard_check_pressed(global.keyChangeL) && !keyboard_check(global.keyChangeR))
{

	do
	{
		currentWeapon--;
		if (currentWeapon == -1)
		{
			currentWeapon = 8;
		}
	}
	until (global.weapon[currentWeapon] == ItemState.USING);
}