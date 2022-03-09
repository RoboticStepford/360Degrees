/// @description 
//if live_enabled {if (live_call()) return live_result;}
if xmode = 1
{
	global.x1 = x;
}
else
{
	global.x2 = x;		
}