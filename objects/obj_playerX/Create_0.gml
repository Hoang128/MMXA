/// @description Init

// Inherit the parent event
event_inherited();

//Initialize Parameters
hp = global.hpMax[0];
wp = global.wpMax[0];
atkSpriteTimeMax = 30;
xPlaceDashEff = -25;
yPlaceDashEff = -4;
chargeLv1Limit = 30; //Time hold attack button to show lv1 charge effect
chargeLv2Limit = 100; //Time hold attack button to show lv2 charge effect
busterOnRowMax = 3;
waitShotNormal = 3;
waitShotLong = 15;
waitShot = 0;

//Initialize sprite
scr_InitSpritePlayerHFormBase(obj_playerX);

//Initialize Sound FX
audio_group_load(grpXSounds);
scr_InitSoundPlayerHFromBase(obj_playerX);

//Initialize shader
scr_PalSwapInitSystem(shd_pal_swapper);
myPal = spr_PalX;

//Initialize states
scr_InitStatePlayer(weight);

//Initialize Inside Variables
atkSpriteTime = 0;
busterOnRow = 0;
resetBusterOnRowMax = 0;

//Sound Beam-down
audio_play_sound_on(global.SFX_Emitter, snd_XBeamDownEff, 0, 0);