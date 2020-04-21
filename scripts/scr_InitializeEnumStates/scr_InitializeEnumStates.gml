//Initialize Activate State****************************************************************************************************************************************
enum ActivateState
{
	DEACTIVATE,
	HALF_ACTIVATE,
	ACTIVATE
}

//Initialize Player Action State***********************************************************************************************************************************
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

//Initialize Player Vertical State**********************************************************************************************************************************
enum VerticalState
{
	V_MOVE_FALLING, //Affect by Gravity
	V_MOVE_UP, //Move up, not affect by gravity
	V_MOVE_DOWN, //Move down, not affect by gravity
	V_MOVE_NONE, //Do not change y position
	V_ON_GROUND //On ground
};

//Initialize Player Horizontal State********************************************************************************************************************************
enum HorizontalState
{
	H_MOVE_NONE,
	H_MOVE_FORWARD,
	H_MOVE_PASSIVE
};

//Initialize Player Attack State************************************************************************************************************************************
enum AttackState
{
	A_NONE,
	A_NORMAL_ATTACK, //Attack in normal sprite
	A_STRICT_ATTACK, //Cannot cancel by duck
	A_STRICT_ATTACK_LV2, //Cannot cancel by run, duck
	A_STRICT_ATTACK_LV3, //Cannot cancel by run, dash, duck
	A_STRICT_ATTACK_LV4, //Cannot cancel by run, dash, jump, duck
	A_FREEZE_ATTACK  //Cannot cancel
}

//Initialize Weight Type********************************************************************************************************************************************
enum WeighType
{
	LIGHT,
	MEDIUM,
	HEAVY,
	MASSIVE
}


//Initialize Saber State********************************************************************************************************************************************
enum SaberState
{
	SABER_NONE,
	SABER_COMBO_1,
	SABER_COMBO_2,
	SABER_COMBO_3,
	SABER_JUMP_SLASH,
	SABER_DUCK_SLASH,
	SABER_SPIN_SLASH,
	SABER_SLIDE_SLASH,
	SABER_CLIMB_SLASH,
	SABER_LAND_SLASH,
	SABER_CHARGE_SLASH
}

//Initialize Item State*********************************************************************************************************************************************
enum ItemState
{
	LOCK,
	UNLOCK,
	USING
}

//Initialize Enemy Type*********************************************************************************************************************************************
enum EnemyType
{
	REAL_ENEMY,
	BULLET,
	ELF_ENEMY
}

//Initialize In Liquid Type*****************************************************************************************************************************************
enum InLiquid
{
	NONE,
	HALF,
	FULL
}

//Initialize Stun Type**********************************************************************************************************************************************
enum StunType
{
	STUN_NONE,
	STUN_SOFT,
	STUN_NORMAL,
	STUN_HARD,
	CAPTURED
}

//Initialize Element Type*******************************************************************************************************************************************
enum Element
{
	NEUTRAL,
	FIRE,
	ICE,
	ELECT
}

//Initialize Weapons*************************************************************************************************************************************************
enum WeaponType
{
	BUSTER,
	SABER,
	BEAM,
	BULLET,
	OTHER
}