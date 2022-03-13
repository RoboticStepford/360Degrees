/// @description 
if live_enabled {if (live_call()) return live_result;}

if turning = true 
{
	if distance_to_object(obj_player) < 175
	{
		if irandom(20) > 15
		{
			d = instance_create_depth(x,y,depth-1,obj_debree); d.sprite_index = spr_droplet;
		}
	}
}

draw_sprite_ext(spr_valve_post,0,x,y,1,1,0,c_white,1);
draw_sprite_ext(sprite_index,image_index,x,y,1,1,angle,c_white,1);