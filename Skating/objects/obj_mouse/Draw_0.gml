/// @description 
//if live_enabled {if (live_call()) return live_result;}
if global.doMouse = true
{
	if instance_exists(obj_player)
	{
		draw_line_width_color(x,y,obj_player.x,obj_player.y,6,c_black,c_black);	
		draw_line_width_color(x,y,obj_player.x,obj_player.y,2,c_white,c_white);	
		draw_sprite_ext(spr_guide,0,x,y,1,1,get_timer()/100000,c_white,1);	
	}
}