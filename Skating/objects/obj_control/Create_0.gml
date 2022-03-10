if live_enabled {if (live_call()) return live_result;}

objview = instance_create_layer(x,y,"Instances",obj_view);
objview.targ = obj_player; //FOCUS, NOONE will focus nothing.

global.muted = false;

alarm[0] = 60;

global.timeminute = 2;
global.timesecond = 0;
global.points = 0;
global.combo = 0;
global.cscore = 0;
global.combostring = "";
global.repeatadd = 0;

global.crushedbird = 0;
global.maxbird = 5;
global.skate = 0;
global.maxskate = 5;
global.comboletter = 0;
global.maxcombo = 5;
global.tape = 0;
global.maxtape = 1;
global.trash = 0;
global.maxtrash = 10;


//x = room_width/2;
//y = room_height/2;

//display_set_gui_size(screenw*2, screenh*2);