/// @description 
if live_enabled {if (live_call()) return live_result;}

if visible = 1
{
	draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,image_angle,image_blend,image_alpha)
}