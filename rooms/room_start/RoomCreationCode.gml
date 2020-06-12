//Initialize Enum States & Macros
scr_InitializeMacros();
scr_InitializeEnumStates();

global.BGM_current = noone;

global.font = fontDebug;

global.debugging = true;

global.isStage = false;

//Default parameter***************************************************************************************
//Default Lives
lives = 2;

//Default Spawm location
global.xSpawmLocation = 0;
global.ySpawmLocation = 0;
global.airSpawm = true;

//Default HP & MP
global.hpMax[0] = 16;
global.hpMax[1] = 16;
global.hpMax[2] = 16;
global.wpMax[0] = 16;
global.wpMax[1] = 16;
global.wpMax[2] = 16;

//Default Elves
for(i = 0; i < 16; i++)
{
	global.elves[i] = ItemState.LOCK;
}

//Armor(Ultimate + Solar 4 part + Lunar 4 part)
for(i = 0; i <= 8; i++)
{
	global.xArmor[i] = ItemState.LOCK;
}

//Zero Core(5 Core: Ultimate, Saber, Buster, Light, Shadow, Omega)
for(i = 0; i <= 4; i++)
{
	global.zCore[i] = ItemState.LOCK;
}

//Zero Form(5 Form: Ultimate, Red, Black, Nightmare, Blue, Crimson)
for(i = 0; i <=4; i++)
{
	global.zForm[i] = ItemState.LOCK;
}

//Zero Saber(5 Saber: Ultimate, Green, Cyan, Purple, Black, Orange)
for(i = 0; i <=4; i++)
{
	global.zSaber[i] = ItemState.LOCK;
}

//Default Zero
global.zCore[2] = ItemState.USING;
global.zForm[1] = ItemState.USING;
global.zSaber[1] = ItemState.USING;

//Create Manager Object
if (!instance_exists(obj_gameManager))
	instance_create_depth(64, 96, -1000000, obj_gameManager);

//Game Speed**********************************************************************************************
room_speed = 60;
global.deltaTime = 1; //Using for slow-time effect

//Default Config******************************************************************************************
//Default Graphics config
global.wWidth = 1280;
global.wHeight = 720;
global.fullScreen = 0;

//Default Key Blind
global.keyStart = vk_enter;
global.keyUp = vk_up;
global.keyDown = vk_down;
global.keyLeft = vk_left;
global.keyRight = vk_right;
global.keyAtk = ord("C");
global.keySpAtk = ord("V");
global.keyDash = ord("Z");
global.keyJump = ord("X");
global.keyGiga = vk_space;
global.keyChar1 = ord("D");
global.keyChar2 = ord("F");
global.keyChangeL = ord("A");
global.keyChangeR = ord("S");
global.keyMap = vk_tab;

//Default volume
global.masterVolume=1;
global.BGMVolume=1;
global.SFXVolume=1;
global.BGM_Emitter = audio_emitter_create();
global.SFX_Emitter = audio_emitter_create();

//Load config*********************************************************************************************
scr_loadConfig();