/// @description 
if live_enabled {if (live_call()) return live_result;}
if x < room_width/2
{
	if move = 0
	{
		if mouse_check_button_pressed(mb_left) {move = 1;}	
		if obj_dj.clicked = true {move = 1;}
	}
	if move = 1
	{
		image_angle += 20;
		speed = 2;
	}
}
else
{
	done = true;
	if speed > 0 {playsnd(snd_360deg,1,1,false,2); screenshake(2,2);}
	speed = 0;
	image_angle = wave(-20,20,2,0);
	image_yscale = wave(1,4,1,0);
}

objCRT.crtDistortion = wave(-0.01,-0.2,6,0);