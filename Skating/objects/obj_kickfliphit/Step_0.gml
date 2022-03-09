/// @description 
if live_enabled {if (live_call()) return live_result;}

x = obj_player.x;
y = obj_player.y;

if place_meeting(x,y,obj_mouse)
{
	num += 1;
	image_angle = image_angle + 180;
	if num = 2 
	{
		num = 0;
		addtrick(1,125,false,0,"KICKFLIP",true);
	}
}