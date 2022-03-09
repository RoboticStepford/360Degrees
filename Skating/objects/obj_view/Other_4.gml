/// @description Check
if live_enabled {if (live_call()) return live_result;}
if(targ != noone and instance_exists(targ)){
	x = targ.x;
	y = targ.y;
}else{
	targ_x = room_width/2;
	targ_y = room_height/2;
	x = targ_x;
	y = targ_y;
}
