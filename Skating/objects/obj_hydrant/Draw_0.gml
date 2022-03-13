/// @description 
if live_enabled {if (live_call()) return live_result;}
draw_self();

if global.valve = global.maxvalve
{
	if distance_to_object(obj_player) < 200 and irandom(30) > 25
	{
		d = instance_create_depth(x,y,depth-1,obj_debree); d.sprite_index = spr_droplet;
	}
	
	draw_sprite_ext(spr_waterstream,0,x,y,wave(-2,2,0.25,0.25),wave(0.9,1.1,1,0.25),0,c_white,0.35);
	draw_sprite_ext(spr_waterstream,0,x,y,wave(-1,1,0.25,0),wave(0.9,1.1,1,0),0,c_white,1);

	if is_between(obj_player.x,x-16,x+16)
	{
		if obj_player.y < y and obj_player.y > y-350
		{
			if obj_player.vsp > -20
			{
				obj_player.vsp -= 3;
			}
			else
			{
				obj_player.vsp = -20;	
			}
		}
	}
}