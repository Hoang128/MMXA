//Initialize Enum States & Macros
scr_InitializeMacros();
scr_InitializeEnumStates();

global.BGM_stage = noone;

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
global.wpMax[0] = 32;
global.wpMax[1] = 32;
global.wpMax[2] = 32;

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

//Zero Core(5 Core: Ultimate, Saber, Buster, Stardust, Shadow, Omega)
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

//Weapons
for(i = 0; i <= 8; i++)
{
	global.weapon[i] = ItemState.LOCK;
}
global.weapon[0] = ItemState.USING;
global.weapon[6] = ItemState.USING;
global.weapon[7] = ItemState.USING;
global.weapon[8] = ItemState.USING;

//Default Zero
global.zCore[2] = ItemState.USING;
global.zForm[1] = ItemState.USING;
global.zSaber[2] = ItemState.USING;

//Default Key
global.keyCardRed = ItemState.UNLOCK;	//For debug
global.keyCardBlue = ItemState.UNLOCK;
global.keyCardOrange = ItemState.UNLOCK;
global.keyCardPurple = ItemState.LOCK;

//Default Weather Effect
global.glow = 0;


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

//Default Keyboard Blind
global.keyStart = vk_enter;
global.keyBack = vk_escape;
global.keyUp = vk_up;
global.keyDown = vk_down;
global.keyLeft = vk_left;
global.keyRight = vk_right;
global.keyAtk = ord("C");
global.keySpAtk = ord("V");
global.keyDash = ord("Z");
global.keyJump = ord("X");
global.keyGiga = vk_space;
global.keyMap = ord("D");
global.keyChangeL = ord("A");
global.keyChangeR = ord("S");

//Default volume
global.masterVolume=1;
global.BGMVolume=1;
global.SFXVolume=1;
global.BGM_Emitter = audio_emitter_create();
global.SFX_Emitter = audio_emitter_create();

//Load config*********************************************************************************************
scr_loadConfig();