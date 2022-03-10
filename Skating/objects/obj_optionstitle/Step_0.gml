/// @description 
if live_enabled {if (live_call()) return live_result;}
if x < room_width/2
{
	if move = 0
	{
		move = 1
	}
	if move = 1
	{
		image_angle += 20;
		speed = 4;
	}
}
else
{
	done = true;
	if speed > 0 {playsnd(snd_skateboardjump,1,1,false,1);  screenshake(2,2);}
	speed = 0;
	image_angle = wave(-20,20,2,0);
	image_yscale = wave(1,4,1,0);
}

objCRT.crtDistortion = wave(-0.01,-0.2,6,0);