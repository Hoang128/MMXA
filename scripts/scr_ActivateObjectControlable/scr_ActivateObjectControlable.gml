function scr_ActivateObjectControlable(argument0, argument1, argument2) {
	//Argument 0: object to deactivate
	//Argument 1: object to activate
	//Argument 2: state to activate: HALF or FULL
	var objToDeactivate = argument0;
	var objToActivate = argument1;
	var stateToActivate = argument2;

	if (!instance_exists(objToActivate) || !instance_exists(objToDeactivate))
		return;
	else
	{
		objToDeactivate.activateState = ActivateState.DEACTIVATE;

		objToActivate.activateState = stateToActivate;

		obj_gameManager.playerCore = objToActivate;
	}


}
