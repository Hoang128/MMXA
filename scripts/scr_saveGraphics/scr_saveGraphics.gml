ini_open("config.ini");

ini_write_real("window", "window_width", global.wWidth);
ini_write_real("window", "window_height", global.wHeight);
ini_write_real("window", "window_mode", global.fullScreen);

ini_close();