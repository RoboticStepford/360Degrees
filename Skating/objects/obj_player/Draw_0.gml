/// @description 
if (live_call()) return live_result;

if alive = true
{
	if grounded = true
	{
		if manual = true
		{
			if slowdown = true {manual = false;}
			
			if manualang >= 88 
			{
				stacked();
			}
			else if manualang <= 2
			{
				manual = false;
				alarm[0] = 1;
			}
			else
			{
				global.cscore += global.repeatadd;
				draw_sprite_ext(spr_manual,image_index,x-12,y+many,xscale*zrotmod,yscale,manualang*zrotmod,image_blend,1);	
				balancecode();
			}
		}
		else
		{
			draw_sprite_ext(spr_skateboard,image_index,x,y,xscale*zrotmod,1,image_angle,image_blend,1);
			draw_sprite_ext(spr_bunny_noboard,image_index,x,y+ymod,xscale*zrotmod,yscale,image_angle,image_blend,1);
		}
	}
	else
	{	
	
		if abs(trickangle) >= abs(340+startangle) {
			//startangle = point_direction(x,y,mouse_x,mouse_y);
			//addtrick(1,50,false,0,"KICKFLIP",true);
		}
		
		if grinding = true
		{
			balancecode();
			if manualang >= 88 
			{
				stacked();
			}
			else if manualang <= 2
			{
				stacked();
			}
		}
		
		if trick = 0 {
			tricksprite = sprite_index;
			canlandupside = true;
			if grinding = false {draw_sprite_ext(spr_bunny_in_air,image_index,x,y,xscale*zrotmod,yscale,wave(-10,10,1,0),image_blend,1); grindmod = 0;}
			if grinding = true {draw_sprite_ext(spr_bunny_noboard,image_index,x,y,xscale*zrotmod,yscale,wave(-10,10,1,0)+grindmod,image_blend,1);}
			draw_sprite_ext(spr_skateboard,0,x,y,xscale*zrotmod,boardy,boardang+grindmod,image_blend,1);
			
			
			if mouse_check_button_pressed(mb_right) and grinding = false 
			{
				modifi = 60;
				mousdist = point_distance(x,y,obj_mouse.x,obj_mouse.y);
				if mousdist < modifi {trick = 1;}
				else if mousdist < modifi*2 {trick = 2;}
				else if mousdist < modifi*3 {trick = 3;}
				else if mousdist < modifi*4 {trick = 4;}
				else {trick = 5;}
			}
		}
		else
		{
			if trick = 1 and tricksprite != spr_trick_1 {canlandupside = false; tricksprite = spr_trick_1; addtrick(0,10,false,0,"ONE FOOTED SMITH",true);}
			else if trick = 2 and tricksprite != spr_trick_2 {canlandupside = false; tricksprite = spr_trick_2; addtrick(0,15,false,0,"DARKSIDE CHRIST",true);}
			else if trick = 3 and tricksprite != spr_trick_3 {canlandupside = false; tricksprite = spr_trick_3; addtrick(0,20,false,0,"ASSUMED POSITION",true);}
			else if trick = 4 and tricksprite != spr_trick_4 {canlandupside = false; tricksprite = spr_trick_4; addtrick(0,25,false,0,"HANDSTAND",true);}
			else if trick = 5 and tricksprite != spr_trick_5 {canlandupside = false; tricksprite = spr_trick_5; addtrick(0,30,false,0,"LAZYBONES",true);}
			global.cscore += global.repeatadd;
			draw_sprite_ext(tricksprite,image_index,x,y,xscale*zrotmod,yscale,boardang+grindmod,image_blend,1);
		}
		if !mouse_check_button(mb_right) and grinding = false {trick = 0;}
	}
}
else
{
	manualdif = 1;
	grinding = false;
	manual = false;
}

if popuptimer > 0
{
	popuptimer -= 1;
	draw_set_font(fnt_freddy);
	draw_set_halign(fa_center);
	outline_text_scale(string(popuptext),x+random_range(-1,1),y+20+random_range(-1,1),popblend,c_black,2,12,999,2,2,0);
	draw_set_halign(fa_left);
}

if keyboard_check_pressed(vk_escape) {ftr = instance_create_depth(x,y,-9999,obj_fadetoroom); ftr.rm=rm_init;}

//WATER SOUNDS
if global.valve = global.maxvalve
{
	hy = instance_nearest(x,y,obj_hydrant)
	if distance_to_object(hy) < 200
	{
		if !audio_is_playing(snd_hydrantspray)
		{
			playsnd(snd_hydrantspray,1,random_range(0.9,1.1),true,0.35);	
		}
	}
	else
	{
		audio_stop_sound(snd_hydrantspray);
	}
}

if room = rm_tutorial
{
	draw_sprite_ext(spr_tut,0,x+150,y-50,1,1,0,c_white,1);
	draw_set_font(fnt_freddy);
	draw_set_halign(fa_center);
	outline_text_scale(string(tuttext),x,y+20,c_white,c_black,2,12,150,2,2,0);
	draw_set_halign(fa_left);
}

//draw_text(x,y,string(boardang));
//draw_sprite(spr_red,0,x+99,y);