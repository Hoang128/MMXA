ini_open("config.ini");

ini_write_real("keyboard", "up", global.keyUp);
ini_write_real("keyboard", "down", global.keyDown);
ini_write_real("keyboard", "left", global.keyLeft);
ini_write_real("keyboard", "right", global.keyRight);
ini_write_real("keyboard", "attack", global.keyAtk);
ini_write_real("keyboard", "special_attack", global.keySpAtk);
ini_write_real("keyboard", "dash", global.keyDash);
ini_write_real("keyboard", "jump", global.keyJump);
ini_write_real("keyboard", "map", global.keyMap);
ini_write_real("keyboard", "key_change_l", global.keyChangeL);
ini_write_real("keyboard", "key_change_r", global.keyChangeR);
ini_write_real("keyboard", "giga", global.keyGiga);

ini_close();