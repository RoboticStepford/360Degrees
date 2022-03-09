/// @description 
if live_enabled {if (live_call()) return live_result;}
angle = direction+wave(-20,20,1,0);
if scale < 1 {scale += 0.05;}
draw_sprite_ext(sprite_index,image_index,x,y,scale,scale,angle,image_blend,image_alpha);