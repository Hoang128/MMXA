switch (obj_gameManager.playerCore.object_index)
{
	case obj_playerX:
	{
		scr_createTextMessChain(
			scr_createTextMessage(
				spr_bs_dynamo,
				"Nice to meet you, hunter! Searching for elves too ?"
			),
			scr_createTextMessage(
				spr_bs_x,
				"Dynamo! Leave this place now! This elf world is too dangerous to stay at!"
			),
			scr_createTextMessage(
				spr_bs_dynamo,
				"Oh, and let you have all those elves ? I'm not a fool, X! Fight me if you want me to leave"
			)
		);
	}	break;
	case obj_playerZ:
	{
		scr_createTextMessChain(
			scr_createTextMessage(
				spr_bs_dynamo,
				"Nice to meet you, hunter! Searching for elves too ?"
			),
			scr_createTextMessage(
				spr_bs_zero,
				"Dynamo! Leave this place now!!"
			),
			scr_createTextMessage(
				spr_bs_dynamo,
				"Oh, and let you have all those elves ? I'm not a fool, Zero! Fight me if you want me to leave"
			)
		);
	}	break;
}