/// @description 
if live_enabled {if (live_call()) return live_result;}


if flat = false {draw_sprite_ext(sprite_index,0,x,y,wave(0.9,1.1,1,0),1,0,c_white,1);}
else {draw_sprite_ext(sprite_index,1,x,y,1,1,0,c_white,1);}