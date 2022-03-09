/// @description 
if live_enabled {if (live_call()) return live_result;}

cx = camera_get_view_x(0);
cy = camera_get_view_y(0);

//draw_sprite_ext(spr_disc,0,48+cx,48+cy,1,1,get_timer()/10000,c_white,1);
//draw_text(cx+48,cy+48,"waited = " + string(waited));