/// @description 
if live_enabled {if (live_call()) return live_result;}

if instance_place(x,y,obj_player) and image_speed = 0
{
	obj_player.vsp = -20;
	image_speed = 0.9;
	playsnd(snd_bounce,1,random_range(0.8,1.2),false,2);
}