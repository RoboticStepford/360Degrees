/// @description 
if live_enabled {if (live_call()) return live_result;}

if global.ng = 1
{
	alarm[0] = room_speed * 40;
	name = ng_get_username();
}