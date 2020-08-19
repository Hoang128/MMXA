function scr_createTextMessChain() {
	if (argument_count==0) exit;

	if (!instance_exists(obj_menuMessTextChain)){
	    var messChain = instance_create_layer(0, 0, obj_gameManager.lUI, obj_menuMessTextChain);
	    messChain.messChain = argument_count;
	    for (i = 0; i < argument_count; i++){
	           messChain.messArr[i] = argument[i];
	        }
	    }


}
