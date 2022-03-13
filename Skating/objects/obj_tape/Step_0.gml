/// @description 
if live_enabled {if (live_call()) return live_result;}
if obj_360degrees.done = true
{
	if global.gottape = 1 {visible = 1;}	
	
	if visible = 1
	{
		yscale = wave(0.9,1.1,1,0);
	
		if instance_place(x,y,obj_mouse)
		{
			if play = 0 {playsnd(snd_punch,1,random_range(0.7,1.4),false,0.4); play = 1;}
			xscale = wave(-1,1,2,1);
		
			if mouse_check_button_pressed(mb_left)
			{
				if play = 1 {playsnd(snd_honk,1,random_range(0.7,1.4),false,1.5); play = 2;}	
				ftr = instance_create_depth(x,y,-99999,obj_fadetoroom);
				ftr.rm = rm_video;
			}
		}
		else
		{
			xscale = 1;
			play = 0;	
		}
	}
}