/// @description 
if live_enabled {if (live_call()) return live_result;}
draw_sprite_ext(sprite_index,image_index,x+random_range(shake,-shake),y+random_range(shake,-shake),xscale,yscale,image_angle,image_blend,image_alpha)