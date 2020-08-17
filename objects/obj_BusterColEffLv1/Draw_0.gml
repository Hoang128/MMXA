/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if (myPalette != noone)
{
	switch (from)
	{
		case	obj_XBusterC1:
		case	obj_XBusterC2:
		case	obj_XBusterNormal:			pal = 0;	break;
		case	obj_solarDashDamageEff:
		case	obj_SolarBusterNormal:
		case	obj_SolarBusterC1:	
		case	obj_SolarBusterC2:
		case	obj_SolarBusterC3:	
		case	obj_ZFlame:
		case	obj_ZFlameAir:
		case	obj_WPFireEff:				pal = 1;	break;
		case	obj_ZBusterCharge:
		case	obj_ZThunderBlaster:
		case	obj_ZBusterNor:				pal = 2;	break;
		default:							pal = 0;	break;
	}

	scr_PalSwapSet(myPalette, pal, false);
}

event_inherited();

if (myPalette != noone)
{
	scr_PalSwapReset();
}