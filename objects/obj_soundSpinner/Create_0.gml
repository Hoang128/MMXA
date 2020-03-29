/// @description Init
minVal = 0;
maxVal = 10;

parameter = global.masterVolume;
ratio = 10;
valDisplay = parameter * ratio;
triangleSpace = 32;
triangleWidth = 20;
triangleHeight = 32;
soundConfirm = snd_UISelect;
soundMove = snd_UISelectChange;
line = 1;

active = -3;
font = fnt_UIBoldMedium;