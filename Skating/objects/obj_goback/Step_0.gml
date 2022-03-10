/// @description 
if live_enabled {if (live_call()) return live_result;}

visible = 1;	
yscale = wave(1.9,2.2,1,0);
	
if instance_place(x,y,obj_mouse)
{
	if play = 0 {playsnd(snd_punch,1,random_range(0.7,1.4),false,0.4); play = 1;}
	xscale = wave(1,2.5,0.5,1);
		
	if mouse_check_button_pressed(mb_left)
	{
		if play = 1 {
			playsnd(snd_honk,1,random_range(0.7,1.4),false,1.5); play = 2;
			if room = rm_options
			{
				ini_open("save.ini");
				ini_write_real("option","CRT",global.doCRT);
				ini_write_real("option","WOBBLY",global.doWobbly);
				ini_write_real("option","MOUSE",global.doMouse);
				ini_write_real("option","SCREENSHAKE",global.doScreenshake);
				ini_write_real("option","MUSIC",musvol);
				ini_write_real("option","SOUND",sndvol);
				ini_close();
			}
		}	
		
		ftr = instance_create_depth(x,y,-99999,obj_fadetoroom);
		ftr.rm = rm_title;
	}
}
else
{
	play = 0;	
}