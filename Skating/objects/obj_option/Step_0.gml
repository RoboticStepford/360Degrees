/// @description 
if live_enabled {if (live_call()) return live_result;}

visible = 1;	

if sprite_index = spr_mus_vol {yscale = (global.musvol*2)+0.1; xscale = yscale;}
if sprite_index = spr_snd_vol {yscale = (global.sndvol*2)+0.1; xscale = yscale;}
if sprite_index = spr_wobblyoption {if global.doWobbly = true {image_blend = c_lime}else{image_blend = c_red;}}
if sprite_index = spr_crtoption {if global.doCRT = true {image_blend = c_lime}else{image_blend = c_red;}}
if sprite_index = spr_mouseoption {if global.doMouse = true {image_blend = c_lime}else{image_blend = c_red;}}
if sprite_index = spr_screenshakeoption {if global.doScreenshake = true {image_blend = c_lime}else{image_blend = c_red;}}

if instance_place(x,y,obj_mouse)
{
	shake = 1;
	if play = 0 {playsnd(snd_punch,1,random_range(0.7,1.4),false,0.4); play = 1;}
	//x = random_range(x-1,x+1);
	//y = random_range(y-1,y+1);	
		
	if mouse_check_button_pressed(mb_left)
	{		
		if sprite_index = spr_mus_vol {global.musvol -= 0.1; if global.musvol < 0 {global.musvol = 1;}}
		if sprite_index = spr_snd_vol {global.sndvol -= 0.1; if global.sndvol < 0 {global.sndvol = 1;}}
		if sprite_index = spr_wobblyoption {if global.doWobbly = true {global.doWobbly = false;}else{global.doWobbly = true;}}
		if sprite_index = spr_crtoption {if global.doCRT = true {global.doCRT = false}else{global.doCRT = true}}
		if sprite_index = spr_mouseoption {if global.doMouse = true {global.doMouse = false;}else{global.doMouse = true}}
		if sprite_index = spr_screenshakeoption {if global.doScreenshake = true {global.doScreenshake = false;}else{global.doScreenshake = true}}
		
		playsnd(snd_honk,1,random_range(0.7,1.4),false,1.5);
	}
}
else
{
	shake = 0;
	play = 0;	
}
