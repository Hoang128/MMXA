/// @description Draw Debug Info to Screen
xPlace = 1280;
yPlace = 0;

draw_set_font(fontDebug);
draw_set_halign(fa_right);
draw_set_valign(fa_top);

//Info
scr_LOG_INFO("Debugging mode", debugTextColorF, debugTextColorB);
scr_LOG_INFO("Press Q + H to show debug command list",debugTextColorF, debugTextColorB);
scr_LOG_INFO("Room speed = " + string(room_speed), debugTextColorF, debugTextColorB);
scr_LOG_INFO("Delta time = " + string(global.deltaTime), debugTextColorF, debugTextColorB);
scr_LOG_INFO("outer wind number = " + string(instance_number(obj_XW6TornadoOuterEff)), debugTextColorF, debugTextColorB);

//Show Debug Help
#region
if (showDebugHelp)
{
	scr_LOG_INFO("Debug command list", debugTextColorF, debugTextColorB);
	scr_LOG_INFO("Press Q + W + H to close this list", debugTextColorF, debugTextColorB);
	scr_LOG_INFO("Press Q + + to increase room speed by 10, Q + - to decrease room speed by 10", debugTextColorF, debugTextColorB);
	scr_LOG_INFO("Press Q + Page Up to increase global delta time by 0.1, Q + Page Down to decrease global delta time by 0.1", debugTextColorF, debugTextColorB);
	scr_LOG_INFO("Press Q + W + Page Up to increase global delta time by 0.01, Q + W + Page Down to decrease global delta time by 0.01", debugTextColorF, debugTextColorB);
	scr_LOG_INFO("Press Q + W + to increase room speed by 1, Q + W - to decrease room speed by 1", debugTextColorF, debugTextColorB);
	scr_LOG_INFO("Press Q + R to restart current room", debugTextColorF, debugTextColorB);
	scr_LOG_INFO("Press Q + P to turn on player log, Q + W + P to turn off", debugTextColorF, debugTextColorB);
	scr_LOG_INFO("Press Q + P to turn on sound log, Q + W + P to turn off", debugTextColorF, debugTextColorB);
	scr_LOG_INFO("Press Q + E to change character", debugTextColorF, debugTextColorB);
}
#endregion

else{
	//Log Player
	if (showPlayerLog)
	{
		#region
		if instance_exists(obj_playerHumanForm)
		{
			var aState = obj_playerHumanForm.aState;
			var atkState = obj_playerHumanForm.atkState;
			var hState = obj_playerHumanForm.hState;
			var vState = obj_playerHumanForm.vState;
			var activateState = obj_playerHumanForm.activateState;
			var inWaterState = obj_playerHumanForm.inWater;

			var str_aState = "";
			var str_atkState = "";
			var str_hState = "";
			var str_vState = "";
			var str_activateState = "";
			var str_inWaterState = "";
			
			switch activateState
			{
				case ActivateState.ACTIVATE: str_activateState = "ACTIVATE"; break;
				case ActivateState.DEACTIVATE: str_activateState = "DEACTIVATE"; break;
				case ActivateState.HALF_ACTIVATE: str_activateState = "HALF ACTIVATE"; break;
			}

			switch aState
			{
				case ActionState.ACTION_INTERACTION: str_aState = "ACTION INTERACTION"; break;
				case ActionState.BEAMDOWN: str_aState = "BEAMDOWN" break;
				case ActionState.IDLE: str_aState = "IDLE" break;
				case ActionState.DASHING: str_aState = "DASHING" break;
				case ActionState.STUNNING: str_aState = "STUNNING" break;
				case ActionState.DYING: str_aState = "DYING" break;
				case ActionState.CLIMBING: str_aState = "CLIMBING" break;
				case ActionState.SP_MOVE: str_aState = "SPECIAL MOVE" break;
				case ActionState.JUMPDASHING: str_aState = "JUMP DASHING" break;
				case ActionState.SLIDING: str_aState = "SLIDING" break;
				case ActionState.WALLKICK: str_aState = "WALL KICK" break;
				case ActionState.DASHKICK: str_aState = "DASH KICK" break;
				case ActionState.DUCKING: str_aState = "DUCKING"; break;
				case ActionState.WAITING: str_aState = "WAITING"; break;
				case ActionState.BEAMUP: str_aState = "BEAM UP"; break;
				case ActionState.WIRING: str_aState = "WIRING";	break;
				default: str_aState = "NOT HAVE STATE ?"; break;
			}

			switch atkState
			{
				case AttackState.A_NONE: str_atkState = "NONE"; break;
				case AttackState.A_NORMAL_ATTACK: str_atkState = "NORMAL ATTACK"; break;
				case AttackState.A_STRICT_ATTACK: str_atkState = "STRICT ATTACK"; break;
				case AttackState.A_STRICT_ATTACK_LV2: str_atkState = "STRICT ATTACK LV2"; break;
				case AttackState.A_STRICT_ATTACK_LV3: str_atkState = "STRICT ATTACK LV3"; break;
				case AttackState.A_STRICT_ATTACK_LV4: str_atkState = "STRICT ATTACK LV4"; break;
				case AttackState.A_FREEZE_ATTACK: str_atkState = "FREEZE ATTACK"; break;
				default: str_atkState = "NOT HAVE STATE ?"; break;
			}

			switch hState
			{
				case HorizontalState.H_MOVE_NONE: str_hState = "NONE"; break;
				case HorizontalState.H_MOVE_FORWARD: str_hState = "FOWARD"; break;
				case HorizontalState.H_MOVE_PASSIVE: str_hState = "PASSIVE"; break;
				default: str_hState = "NOT HAVE STATE ?"; break;
			}

			switch vState
			{
				case VerticalState.V_MOVE_NONE: str_vState = "NONE"; break;
				case VerticalState.V_MOVE_DOWN: str_vState = "MOVE DOWN"; break;
				case VerticalState.V_MOVE_UP: str_vState = "MOVE UP"; break;
				case VerticalState.V_MOVE_FALLING: str_vState = "MOVE FALLING"; break;
				case VerticalState.V_ON_GROUND: str_vState = "ON GROUND"; break;
				default: str_vState = "NOT HAVE STATE ?"; break;
			}
			
			switch inWaterState
			{
				case InLiquid.FULL:	str_inWaterState = "FULL"; break;
				case InLiquid.HALF: str_inWaterState = "HALF"; break;
				case InLiquid.NONE: str_inWaterState = "NONE"; break;
			}
			
			scr_LOG_INFO("Log player", debugTextColorF, debugTextColorB);
			scr_LOG_INFO("Char direction = " + string(obj_playerHumanForm.hDir), debugTextColorF, debugTextColorB);
			scr_LOG_INFO("Char Dash Phase = " + string(obj_playerHumanForm.dashPhase), debugTextColorF, debugTextColorB);
			scr_LOG_INFO("Char Action State = " + str_aState, debugTextColorF, debugTextColorB);
			scr_LOG_INFO("Char Horizontal State = " + str_hState, debugTextColorF, debugTextColorB);
			scr_LOG_INFO("Char Vertical State = " + str_vState, debugTextColorF, debugTextColorB);
			scr_LOG_INFO("Char Attack State = " + str_atkState, debugTextColorF, debugTextColorB);
			scr_LOG_INFO("Char In Water State = " + str_inWaterState, debugTextColorF, debugTextColorB);
			scr_LOG_INFO("Char Horizontal Speed = " + string(obj_playerHumanForm.hspd), debugTextColorF, debugTextColorB);
			scr_LOG_INFO("Char Vertical Speed = " + string(obj_playerHumanForm.vspd), debugTextColorF, debugTextColorB);
			scr_LOG_INFO("Char vDashDir = " + string(obj_playerHumanForm.vDashDir), debugTextColorF, debugTextColorB);
			if (instance_exists(obj_playerXUA))
			{
				scr_LOG_INFO("Charge Weapon = " + string(obj_playerXUA.chargeWeapon), debugTextColorF, debugTextColorB);
			}
		}
		#endregion
	}
	
	//Log sound
	if (showSoundLog)
	{
		#region
		
		scr_LOG_INFO("Master sound = " + string(global.masterVolume), debugTextColorF, debugTextColorB);
		scr_LOG_INFO("SFX sound = " + string(global.SFXVolume), debugTextColorF, debugTextColorB);
		scr_LOG_INFO("BGM sound = " + string(global.BGMVolume), debugTextColorF, debugTextColorB);
		
		#endregion
	}
}