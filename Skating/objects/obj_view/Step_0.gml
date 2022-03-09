/// @description Move view
if live_enabled {if (live_call()) return live_result;}
var w, h;
w = camera_get_view_width(view_camera[0]);
h = camera_get_view_height(view_camera[0]);

if(targ != noone and instance_exists(targ)){
	targ_x = targ.x+60;
	targ_y = targ.y;
	camera_set_view_pos(view_camera[0], x-(w/2), y-(h/2));
}
else
{
	camera_set_view_pos(view_camera[0], x-(w/2), y-(h/2));
}

//Move
x = lerp(x, targ_x, 0.3);
y = lerp(y, targ_y, 0.3);

x += random_range(-shake, shake);
y += random_range(-shake, shake);

if(shake_l > 0){
	shake_l--;	
}else{
	shake = lerp(shake, 0, 0.25);	
}


//SHOW FPS
if keyboard_check_pressed(vk_insert) and global.debug = true {
	if showFPS = false {showFPS = true;}
	else if showFPS = true {showFPS = false;}
}