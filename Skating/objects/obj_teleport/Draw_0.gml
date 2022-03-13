/// @description 
if live_enabled {if (live_call()) return live_result;}

//draw_sprite_ext(spr_wall_cover,0,x,y,1,1,0,c_white,1);
//draw_self();

if x > 3000
{
	if obj_player.x > x and x > 3000
	{
		obj_player.x = 608;
		obj_view.x = obj_player.x+50;
		instance_create_layer(obj_player.x,obj_player.y,"World",obj_fadein);

		playsnd(snd_scratch,1,1,false,1);
		obj_player.popuptimer = 120;
		obj_player.popblend = c_orange;
		obj_player.popuptext = "< < <";	
	}
}