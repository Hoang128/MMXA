#macro RESOLUTION_WIDTH "426"
#macro RESOLUTION_HEIGH "240"

global.debugging = true;

global.isStage = false;

//Game Config
room_speed = 60;
global.deltaTime = 1; //Using for slow-time effect
global.font = fontDebug;

//Default Key Blind
global.keyUp = vk_up;
global.keyDown = vk_down;
global.keyLeft = vk_left;
global.keyRight = vk_right;
global.keyDash = ord("Z");
global.keyJump = ord("X");
global.keyAtk = ord("C");
global.keySpAtk = ord("V");
global.keyChangeL = ord("A");
global.keyChangeR = ord("S");
global.keyGiga = vk_space;
global.keyChar1 = ord("D");
global.keyChar2 = ord("F");
global.keyStart = vk_enter;
global.keyMap = vk_tab;

//Item state
enum ItemState
{
	LOCK,
	UNLOCK,
	USING
}

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
global.zCore[1] = ItemState.USING;
global.zForm[1] = ItemState.USING;
global.zSaber[1] = ItemState.USING;

//Create Manager Object
if (!instance_exists(obj_gameManager))
	instance_create_depth(64, 96, -1000000, obj_gameManager);