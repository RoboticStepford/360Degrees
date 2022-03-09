/// @description 
if (live_call()) return live_result;

if alive = true
{
	if grounded = true
	{
		if manual = true
		{
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
			if mouse_check_button_pressed(mb_right) and grinding = false {trick = choose(1,2,3,4,5);}
		}
		else
		{
			if trick = 1 and tricksprite != spr_trick1 {canlandupside = false; tricksprite = spr_trick1;}
			else if trick = 2 and tricksprite != spr_trick2 {canlandupside = false; tricksprite = spr_trick2;}
			else if trick = 3 and tricksprite != spr_trick3 {canlandupside = false; tricksprite = spr_trick3;}
			else if trick = 4 and tricksprite != spr_trick4 {canlandupside = false; tricksprite = spr_trick4;}
			else if trick = 5 and tricksprite != spr_trick5 {canlandupside = false; tricksprite = spr_trick5;}
			global.cscore += global.repeatadd;
			draw_sprite_ext(tricksprite,0,x,y,xscale*zrotmod,yscale,boardang+grindmod,image_blend,1);
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

//draw_text(x,y,string(boardang));
//draw_sprite(spr_red,0,x+99,y);