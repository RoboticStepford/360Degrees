/// @description 
if live_enabled {if (live_call()) return live_result;}

//draw_sprite_ext(sprite_index,image_index,x,y,1.5,1.5,wave(-360,360,1,0),c_white,0.2);
draw_self();
//draw_sprite_ext(sprite_index,image_index,x,y,wave(1,2,1,0),wave(1,2,1,0),wave(-10,10,4,0),c_white,1);