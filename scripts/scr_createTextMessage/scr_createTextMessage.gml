if (argument_count==0) exit;

if (!instance_exists(obj_menuMessageText)){
    var mess = instance_create_layer(0, 0, obj_gameManager.lUI, obj_menuMessageText);
    mess.lineNumber = argument_count;
    for (i = 0; i < argument_count; i++){
           mess.lineContext[i] = argument[i];
        }
    }