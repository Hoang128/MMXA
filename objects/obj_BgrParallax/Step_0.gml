if imgIndex<imgNumber imgIndex+=imgSpd;
else imgIndex=0;
x_Pos+=x_spd;
y_Pos+=y_spd;

event_perform(ev_step_begin, 0);