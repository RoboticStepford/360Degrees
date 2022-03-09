if live_enabled {if (live_call()) return live_result;}

objview = instance_create_layer(x,y,"Instances",obj_view);
objview.targ = obj_player; //FOCUS, NOONE will focus nothing.

global.muted = false;

global.timeminute = 2;
global.timesecond = 0;

alarm[0] = 60;

global.points = 0;
global.combo = 0;
global.cscore = 0;
global.combostring = "";

//x = room_width/2;
//y = room_height/2;

//display_set_gui_size(screenw*2, screenh*2);