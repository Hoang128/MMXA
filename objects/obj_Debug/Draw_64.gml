/// @description Draw Debug Info to Screen
var xPlace = 1280;
var yPlace = 0;

draw_set_font(fontDebug);
draw_set_halign(fa_right);
draw_set_valign(fa_top);

//Log Player
#region
if instance_exists(obj_playerHumanForm)
{
	var aState = obj_playerHumanForm.aState;
	var atkState = obj_playerHumanForm.atkState;
	var hState = obj_playerHumanForm.hState;
	var vState = obj_playerHumanForm.vState;

	var str_aState = "";
	var str_atkState = "";
	var str_hState = "";
	var str_vState = "";

	switch aState
	{
		case ActionState.ACTION_INTERACTION: str_aState = "ACTION INTERACTION"; break;
		case ActionState.FLASHING: str_aState = "FLASHING" break;
		case ActionState.IDLE: str_aState = "IDLE" break;
		case ActionState.DASHING: str_aState = "DASHING" break;
		case ActionState.STUNNING: str_aState = "STUNNING" break;
		case ActionState.DYING: str_aState = "DYING" break;
		case ActionState.CLIMBING: str_aState = "CLIMBING" break;
		case ActionState.SP_MOVE: str_aState = "SPECIAL MOVE" break;
		case ActionState.JUMPDASHING: str_aState = "JUMP DASHING" break;
		default: str_aState = "NOT HAVE STATE ?"; break;
	}

	switch atkState
	{
		case AttackState.A_NONE: str_atkState = "NONE"; break;
		case AttackState.A_NORMAL_ATTACK: str_atkState = "NORMAL ATTACK"; break;
		case AttackState.A_STRICT_ATTACK: str_atkState = "STRIC ATTACK"; break;
		case AttackState.A_FREEZE_ATTACK: str_atkState = "FREEZE ATTACK"; break;
		default: str_atkState = "NOT HAVE STATE ?"; break;
	}

	switch hState
	{
		case HorizontalState.H_MOVE_NONE: str_hState = "NONE"; break;
		case HorizontalState.H_MOVE_FORWARD: str_hState = "FOWARD"; break;
		case HorizontalState.H_MOVE_BACKWARD: str_hState = "BACKWARD"; break;
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
	draw_set_color(c_black);
	draw_text(xPlace+1,yPlace+1,string_hash_to_newline("Char direction = " + string(obj_playerHumanForm.hDir)));
	draw_set_color(c_white);
	draw_text(xPlace,yPlace,string_hash_to_newline("Char direction = " + string(obj_playerHumanForm.hDir)));
	yPlace += lineSpace;
	draw_set_color(c_black);
	draw_text(xPlace+1,yPlace+1,string_hash_to_newline("Char Action State = " + str_aState));
	draw_set_color(c_white);
	draw_text(xPlace,yPlace,string_hash_to_newline("Char Action State = " + str_aState));
	yPlace += lineSpace;
	draw_set_color(c_black);
	draw_text(xPlace+1,yPlace+1,string_hash_to_newline("Char Horizontal State = " + str_hState));
	draw_set_color(c_white);
	draw_text(xPlace,yPlace,string_hash_to_newline("Char Horizontal State = " + str_hState));
	yPlace += lineSpace;
	draw_set_color(c_black);
	draw_text(xPlace+1,yPlace+1,string_hash_to_newline("Char Vertical State = " + str_vState));
	draw_set_color(c_white);
	draw_text(xPlace,yPlace,string_hash_to_newline("Char Vertical State = " + str_vState));
	yPlace += lineSpace;
	draw_set_color(c_black);
	draw_text(xPlace+1,yPlace+1,string_hash_to_newline("Char Attack State = " + str_atkState));
	draw_set_color(c_white);
	draw_text(xPlace,yPlace,string_hash_to_newline("Char Attack State = " + str_atkState));
	yPlace += lineSpace;
	draw_set_color(c_black);
	draw_text(xPlace+1,yPlace+1,string_hash_to_newline("Can air dash = " + string(obj_playerHumanForm.canAirDash)));
	draw_set_color(c_white);
	draw_text(xPlace,yPlace,string_hash_to_newline("Can air dash = " + string(obj_playerHumanForm.canAirDash)));
	yPlace += lineSpace;
	draw_set_color(c_black);
	draw_text(xPlace+1,yPlace+1,string_hash_to_newline("Self Horizontal speed = " + string(obj_playerHumanForm.hspd)));
	draw_set_color(c_white);
	draw_text(xPlace,yPlace,string_hash_to_newline("Self Horizontal speed = " + string(obj_playerHumanForm.hspd)));
	yPlace += lineSpace;
	draw_set_color(c_black);
	draw_text(xPlace+1,yPlace+1,string_hash_to_newline("Self Vertical speed = " + string(obj_playerHumanForm.vspd)));
	draw_set_color(c_white);
	draw_text(xPlace,yPlace,string_hash_to_newline("Self Vertical speed = " + string(obj_playerHumanForm.vspd)));
	yPlace += lineSpace;
}
#endregion