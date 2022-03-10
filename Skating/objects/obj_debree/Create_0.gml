/// @description 
if live_enabled {if (live_call()) return live_result;}
image_speed = 0;
alarm[0] = 12*60;
direction = random_range(45,90+45);
speed = random_range(3,6);
gravity = 0.1;