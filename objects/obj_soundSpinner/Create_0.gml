/// @description Init
minVal = 0;
maxVal = 10;

parameter = global.masterVolume;
ratio = 10;
valDisplay = parameter * ratio;
triangleSpace = 24;
triangleWidth = 24;
triangleHeight = 36;
line = 0;
soundConfirm = snd_UISelect;
soundMove = snd_UISelectChange;

active = -3;
font = fnt_UIBoldMedium;