/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_gameManager.playerCore))
{
	draw_sprite(spr_HUDFrameMain, 0, X_VIEW + xPlace, Y_VIEW + yPlace);
	
	//Draw HP******************************************************************************************************************************************************
	#region
	
	//Draw Frame---------------------------------------------------------------------------------------------------------------------------------------------------
	for (var i = 1; i <= indHPMax; i++)
	{
		if (i == indHPMax)
			draw_sprite(spr_HUDFrameHPEnd, 0, X_VIEW + xPlace + 26 + i * 5, Y_VIEW + yPlace + 1);
		else
			draw_sprite(spr_HUDFrameHP, 0, X_VIEW + xPlace + 26 + i * 5, Y_VIEW + yPlace + 1);
	}
	
	//Draw value---------------------------------------------------------------------------------------------------------------------------------------------------
	for (var i = 0; i < indHP; i++)
	{
		draw_sprite(spr_HUDHPG, 0, X_VIEW + xPlace + 30 + i * 5, Y_VIEW + yPlace + 4);
	}
	
	#endregion
	
	//Draw WP******************************************************************************************************************************************************
	#region
	
	//Draw Frame---------------------------------------------------------------------------------------------------------------------------------------------------
	for (var i = 1; i <= indWPMax; i++)
	{
		if (i == indWPMax)
			draw_sprite(spr_HUDFrameEPEnd, 0, X_VIEW + xPlace + 21 + i * 2, Y_VIEW + yPlace + 11);
		else
			draw_sprite(spr_HUDFrameEP, 0, X_VIEW + xPlace + 21 + i * 2, Y_VIEW + yPlace + 11);
	}
	
	//Draw Value---------------------------------------------------------------------------------------------------------------------------------------------------
	for (var i = 0; i < indWP; i++)
	{
		draw_sprite(spr_HUDEP, 0, X_VIEW + xPlace + 23 + i * 2, Y_VIEW + yPlace + 12);
	}
	
	#endregion
	
	//Draw Unique**************************************************************************************************************************************************
	#region
	
	switch (obj_gameManager.playerCore.object_index)
	{
		case obj_playerZ:
		{
			#region
			
			draw_sprite(spr_HUDZFrame, 0, X_VIEW + xPlace, Y_VIEW + yPlace);
			var core = 0;
			for (var i = 0; i < 5; i++)
			{
				if (global.zCore[i] == ItemState.USING)
				{
					core = i - 1;
					break;
				}
			}
			draw_sprite(spr_HUDZCores, core, X_VIEW + xPlace + 17, Y_VIEW + yPlace + 18);
			
			#endregion
		}	break;

		case obj_playerX:
		case obj_playerXUA:
		case obj_playerEclipseX:
		{
			#region
			
			draw_sprite(spr_HUDXFrame, 0, X_VIEW + xPlace, Y_VIEW + yPlace);
			
			#endregion
		}	break;
	}
	
	#endregion
}