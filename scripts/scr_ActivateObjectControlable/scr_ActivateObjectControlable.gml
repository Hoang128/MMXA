//Argument 0: object to activate
//Argument 1: state to activate: HALF or FULL
if (!instance_exists(argument0)) return false;
with(obj_player)
{
	activate = ActivateState.DEACTIVATE;
}
argument0.activate = argument1;
return true;