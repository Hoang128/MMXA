/// @description Initialize
playerOnIce = false;
iceSlideAcr = 0.05;

iceSlideSpd = 0;

running = keyboard_check(global.keyRight) - keyboard_check(global.keyLeft);
dashing = keyboard_check(global.keyDash);