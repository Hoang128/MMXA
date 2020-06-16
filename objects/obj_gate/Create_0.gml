/// @description Insert description here
// You can write your code in this editor

event_inherited();

enum gateState
{
	LOCKING,
	OPENING,
	UNLOCKING,
	CLOSING
}

state = gateState.LOCKING;
phase = 0;
waitTimeOpenMax = 30;
waitTimeOpen = 0;
imgSpd = 0;
sndEff = 0;
distanceToCloseGate = 16;

lock = false;