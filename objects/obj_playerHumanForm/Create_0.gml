/// @description Init

// Inherit the parent event
event_inherited();

//Initialize Parameter
runSpd = 2; //Run speed
dashSpdPhase1 = 2; //Dash speed when start dash
dashSpdPhase2 = 5; //Dash speed when dash
jumpDashSpd = 4.5;
maxDashTime = 30; //Dash time
maxAirDashTime = 25; //Air dash time
jumpSpd = 6; //Jump speed
grav = 0.3; //Gravity Accleration
maxGrav = 6; //Max fall speed
minSlideHeigh = 12; //Minimum heigh from player to floor that player can slide
minWallKickRange = 4; //Minimum range from player to wall to perform wall/dash kick
slideSpd = 2; //Slide speed
wallKickSpd = 4; //Wall kick heigh
wallKickTimeMax = 6; //Wall kick time
hWallKickSpd = 2; //Wall kick speed
dashKickSpd = 3.6; //Dash kick heigh
dashKickTimeMax = 6; //Dash kick time
dashKickFlyTimeMax = 12; //Max dash kick fly time
hDashKickSpd = 3.6; //Dash kick speed
shadowCreateTimeMax = 2; //Frame number between create shadow frame
maxDisDetectSlopeAbove = 4; //Distance to detect slope on the ground
minDistanceToLadder = 6; //Distance to ladder to climb
distanceToMoveAnimationLadder = 34; //DO NOT MODIFY THIS
beamSpd = 3; //Beam down and beam up speed
canJumpWaitMax = 2;
climbSpd = 2;
xPlaceDashEff = 0;
yPlaceDashEff = 0;

//Initialize State
enum ActionState
{
	ACTION_INTERACTION,
	BEAMDOWN,
	BEAMUP,
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
	DASHKICK,
	
	WAITING //Only ride armor
}

enum VerticalState
{
	V_MOVE_FALLING, //Affect by Gravity
	V_MOVE_UP, //Move up, not affect by gravity
	V_MOVE_DOWN, //Move down, not affect by gravity
	V_MOVE_NONE, //Do not change y position
	V_ON_GROUND //On ground
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
	A_NORMAL_ATTACK, //X's attack
	A_STRICT_ATTACK, //Cannot cancel by duck
	A_STRICT_ATTACK_LV2, //Cannot cancel by run, duck
	A_STRICT_ATTACK_LV3, //Cannot cancel by run, dash, duck
	A_STRICT_ATTACK_LV4, //Cannot cancel by run, dash, jump, duck
	A_FREEZE_ATTACK  //Cannot cancel
}

enum WeighType
{
	LIGHT,
	MEDIUM,
	HEAVY,
	MASSIVE
}

//Default state
weight = WeighType.MEDIUM;
activateState = ActivateState.HALF_ACTIVATE;
aState = ActionState.BEAMDOWN;
vState = VerticalState.V_MOVE_DOWN;
hState = HorizontalState.H_MOVE_NONE;
atkState = AttackState.A_NONE;

//Inside Variable
hspd = 0;
vspd = 0;
hDir = 1;
canAirDash = 1;
dashPhase = 0;
dashTime = 0;
dashSpd = 0;
canJump = 1;
canJumpWait = canJumpWaitMax;
canSlide = 0;
wallKickTime = 0;
dashKickTime = 0;
dashKickFlyTime = 0;
shadowCreateTime = shadowCreateTimeMax;
isClimbing = 0;
dynamicBlock = noone;

//Initialize sprite
sprFlash = noone;
sprBeamDown = noone;
sprBeamUp = noone;
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
sprClimb1 = noone;
sprClimb2 = noone;
sprClimb3 = noone;

//Initialize sound fx
sndVoiceDie = noone;
sndVoiceHurt1 = noone;
sndVoiceHurt2 = noone;
sndVoiceJump1 = noone;
sndVoiceJump2 = noone;
sndVoiceJump3 = noone;
sndVoiceLowHp1 = noone;
sndVoiceLowHp2 = noone;
sndVoiceLowHp3 = noone;
sndVoiceWallKick = noone;
sndVoiceSwitch = noone;

sndDashEff = noone;
sndJumpEff = noone;
sndLandEff = noone;
sndSlideEff = noone;
sndBeamUp = noone;
sndBeamDown = noone;