/// @description Initialize view object
if live_enabled {if (live_call()) return live_result;}
targ_x = room_width/2;
targ_y = room_height/2;
targ = noone;

shake = 0;
shake_m = 0;
shake_l = 0;

showFPS = false;
txtsca = 1;

songname = " ";
artistname = " ";
artistspr = spr_disc;
visnum = 0;