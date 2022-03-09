/// @description 
if live_enabled {if (live_call()) return live_result;}
image_xscale -= fdspd;
image_yscale -= fdspd;

if ang = 1 {image_angle = direction; }

if image_xscale < 0.1
{
	instance_destroy();	
}