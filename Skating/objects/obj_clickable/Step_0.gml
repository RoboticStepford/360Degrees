/// @description 
if live_enabled {if (live_call()) return live_result;}
if obj_360degrees.done = true
{
	visible = 1;	
	yscale = wave(1.9,2.2,1,0);
	
	if instance_place(x,y,obj_mouse)
	{
		if play = 0 {playsnd(snd_punch,1,random_range(0.7,1.4),false,0.4); play = 1;}
		//x = random_range(x-1,x+1);
		//y = random_range(y-1,y+1);
		xscale = wave(-2,2,2,1);
		
		if mouse_check_button_pressed(mb_left)
		{
			if play = 1 {playsnd(snd_honk,1,random_range(0.7,1.4),false,1.5); play = 2;}	
			
			ftr = instance_create_depth(x,y,-99999,obj_fadetoroom);
			
			if sprite_index = spr_hitdastreets {ftr.rm = rm_test; picksong();}
			if sprite_index = spr_howtoplay {ftr.rm = rm_tutorial;}
			if sprite_index = spr_options {ftr.rm = rm_options;}
		}
	}
	else
	{
		xscale = 2;
		play = 0;	
	}
}