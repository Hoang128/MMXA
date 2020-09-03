function scr_ConsumeEnergyCapsule(hpConsume, capsule) {
	if (global.hp[global.currentPlayer] + hpConsume > global.hpMax[global.currentPlayer])
	{
		global.hp[global.currentPlayer] = global.hpMax[global.currentPlayer];
	}
	else
	{
		global.hp[global.currentPlayer] += hpConsume;
	}
	
	instance_destroy(capsule);
}