/// @description Init
event_inherited();

depth = layer_get_depth(obj_gameManager.lBullet);

glow = 1;
damage = 0;
collisionSFX = noone;
collisionEff = noone;
maxTimmer = 5;
isGuardBreaker = false;
element = Element.NEUTRAL;
type = WeaponType.OTHER;
slowTime = false;
imgSpd = 0.5;