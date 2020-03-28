/// @description Init

//Initialize parameter
font = fnt_UIBig;
lineNumber = 3;
background = 0;
lineSpace = 16;
xStartSpace = 4;
yStartSpace = 4;
width = 360;
height = 360;
haveEndEff = 0;
haveStartAnim = 0;

lineContext[0] = "";
lineContext[1] = "Start";
lineContext[2] = "Continue";
lineContext[3] = "Option";

for(var i=0; i <= lineNumber; i++)
{
	lineEnable[i] = true;
}

for(var i=0; i <= lineNumber; i++)
{
	lineHandle[i] = false;
}

for(var i=0; i <= lineNumber; i++)
{
	lineExecute[i] = false;
}

//Initialize inside variables
cursor = 1;
active = 1;