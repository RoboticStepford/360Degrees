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
		
		if obj_player.trick = 0 {addtrick(1,100,false,0,"KICKFLIP",true);}
		else if obj_player.trick = 1 {addtrick(1,125,false,0,"ONE FOOTED SMITH 360",true);}
		else if obj_player.trick = 2 {addtrick(1,150,false,0,"DARKSIDE CHRIST 360",true);}
		else if obj_player.trick = 3 {addtrick(1,175,false,0,"ASSUMED POSITION 360",true);}
		else if obj_player.trick = 4 {addtrick(1,200,false,0,"HANDSTAND 360",true);}
		else if obj_player.trick = 5 {addtrick(1,225,false,0,"LAZYBONES 360",true);}
	}
}