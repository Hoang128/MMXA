/// @description Init

// Inherit the parent event
event_inherited();

//Initialize Parameter
runSpd = 2; //Run speed
dashSpdPhase1 = 2; //Dash speed phase 1
dashSpdPhase2 = 5; //Dash speed phase 2
maxDashTime = 30; //Dash time
jumpSpd = 6; //Jump speed
grav = 0.3; //Gravity Accleration
maxGrav = 6; //Max fall speed
minSlideHeigh = 12; //minimum heigh from player to floor that player can slide
slideSpd = 2; //Slide speed
wallKickSpd = 4; //Wall kick heigh
wallKickTimeMax = 6; //Wall kick time
hWallKickSpd = 2; //Wall kick speed
dashKickSpd = 6; //Dash kick heigh
dashKickTimeMax = 6; //Dash kick time
hDashKickSpd = 5; //Dash kick speed
shadowCreateTimeMax = 2;

//Initialize State
enum ActionState
{
	ACTION_INTERACTION,
	FLASHING,
	IDLE,
	DASHING,
	JUMPDASHING,
	STUNNING,
	DYING,
	CLIMBING,
	SP_MOVE,
	SLIDING,
	DUCKING,
	WALLKICK,
	DASHKICK
}

enum VerticalState
{
	V_MOVE_FALLING,
	V_MOVE_UP,
	V_MOVE_DOWN,
	V_MOVE_NONE,
	V_ON_GROUND
};

enum HorizontalState
{
	H_MOVE_NONE,
	H_MOVE_FORWARD,
	H_MOVE_PASSIVE
};

enum AttackState
{
	A_NONE,
	A_NORMAL_ATTACK, //Can cancel
	A_STRICT_ATTACK, //Can only cancel by attacked by enemy 
	A_FREEZE_ATTACK  //Cannot cancel
}

enum WeighType
{
	LIGHT,
	MEDIUM,
	HEAVY,
	MASSIVE
}

aState = ActionState.FLASHING;
vState = VerticalState.V_MOVE_DOWN;
hState = HorizontalState.H_MOVE_NONE;
atkState = AttackState.A_NONE;
weight = WeighType.MEDIUM;

//For test
activateState = ActivateState.ACTIVATE;
aState = ActionState.IDLE;
vState = VerticalState.V_MOVE_FALLING;

//Inside Variable
hspd = 0;
vspd = 0;
hDir = 1;
canAirDash = 1;
dashPhase = 0;
dashTime = 0;
dashSpd = 0;
canSlide = 0;
wallKickTime = 0;
dashKickTime = 0;
shadowCreateTime = shadowCreateTimeMax;

//Initialize sprite
sprStand = noone;
sprDying = noone;
sprLand = noone;
sprRunStart = noone;
sprRun = noone;
sprRunEnd = noone;
sprDash1 = noone;
sprDash2 = noone;
sprDash3 = noone;
sprJump1 = noone;
sprJump2 = noone;
sprJump3 = noone;
sprJump4 = noone;
sprDuck1 = noone;
sprDuck2 = noone;
sprDuck3 = noone;
sprSlide1 = noone;
sprSlide2 = noone;
sprWallKick = noone;
sprDashKick1 = noone;
sprDashKick2 = noone;
