/// @description 
if live_enabled {if (live_call()) return live_result;}

global.ng = 1;
init = 1;

alarm[0] = room_speed * 40;
alarm[1] = room_speed;