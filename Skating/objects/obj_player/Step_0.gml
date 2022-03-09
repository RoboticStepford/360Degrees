/// @description 
//Get inputs (1 = pressed, 0 = not pressed)
if (live_call()) return live_result;

if alive = 1
{
	if slowdown = true
	{
		key_right = 1;
		key_left = 0;
		key_jump = 0;
		key_hold = 0;
		hsp_walk = approach(hsp_walk,0,0.1);
		image_speed = approach(image_speed,0,0.05);
	}
	else
	{
		if global.timesecond = 0 and global.timeminute = 0 and global.combo = 0 and vsp = 0 {slowdown = true;}
		key_right = 1;
		key_left = 0;
		key_jump = mouse_check_button_released(mb_left);
		key_hold = mouse_check_button(mb_left);
	}
	
	//Work out where to move horizontally
	hsp = (key_right - key_left) * hsp_walk;

	//Work out where to move vertically
	vsp = vsp + grv;
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
	key_hold = 0;
	manualdif = 1;

	//Work out where to move horizontally
	hsp = 0;

	//Work out where to move vertically
	vsp = 0;
}

if alive = true
{
	if grounded = false or manual = true
	{
		//SPEEEN
		if mouse_check_button_pressed(mb_middle) or keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("A")) or keyboard_check_pressed(ord("D")) {
			if zrotmod = -1 or zrotmod = 1
			{
				if zrotation = -1 {zrotation = 1;}else{zrotation=-1}
				if manual = true {addtrick(1,1,0,false,"BALANCING REVERT",true);}
				else if grinding = true {addtrick(1,1,0,false,"RAIL REVERT",true);}
				else {addtrick(1,1,0,false,"MID-AIR REVERT",true);}
			}
		}
	}
	else
	{
		//RESET ANGLE LOL
		zrotation = 1;	
	}
	//APPROACH ANGLE
	zrotmod = approach(zrotmod,zrotation,0.25);
	if zrotmod != zrotation and revertsnd = false {revertsnd = true; playsnd(snd_revert,1,random_range(0.8,1.2),false,1);}
	if zrotmod = zrotation and revertsnd = true {revertsnd = false;}

	//VISUALS WITH MANUALLING
	if grinding = false
	{
		if manual = true and visible = true {
			if manualang > 70 {objCRT.crtBleedSize = approach(objCRT.crtBleedSize,10,0.1);}else{objCRT.crtBleedSize = approach(objCRT.crtBleedSize,0,1);}
			objCRT.crtDistortion = approach(objCRT.crtDistortion,-0.3,0.01);
		}else {
			objCRT.crtBleedSize = approach(objCRT.crtBleedSize,0,1);
			objCRT.crtDistortion = approach(objCRT.crtDistortion,-0.2,0.01);
		}
	}
}


//Work out if we should jump
if (place_meeting(x,y+1,obj_wall))
{
	//RIDING ON GROUND
	obj_respawnpoint.x = x;
	obj_respawnpoint.y = y;
	grounded = true;
	canjump = true;
	if instance_exists(kickfliphit) {instance_destroy(kickfliphit);}
		
	if !audio_is_playing(snd_skateboardloop) {playsnd(snd_skateboardloop,1,1,true,0.1);}
	if audio_is_playing(snd_grindingmetal) {audio_stop_sound(snd_grindingmetal);}
}
else if (place_meeting(x,y+1,obj_rail)) and slowdown = false
{
	//GRINDING
	if instance_exists(kickfliphit) {instance_destroy(kickfliphit);}
	grounded = false;	
	canjump = true;
		
	if !audio_is_playing(snd_grindingmetal) {playsnd(snd_grindingmetal,1,1,true,0.1);}
}
else
{
	//MIDAIR
	manual = false;
	canjump = false;	
	if audio_is_playing(snd_grindingmetal) {audio_stop_sound(snd_grindingmetal);}
	
	if !instance_exists(obj_kickfliphit)
	{
		kickfliphit = instance_create_depth(obj_player.x,obj_player.y,-999,obj_kickfliphit);
		kickfliphit.image_angle = startangle+180;
		kickfliphit.x = obj_player.x;
		kickfliphit.y = obj_player.y;
	}
}
	
//JUMPING
if canjump = true and alive = true
{
	//HOLDING KEY
	if (key_hold)
	{
		yscale = approach(yscale,0.75,0.025);
		ymod = approach(ymod,3,1);
	}
	else
	{
		//NOT HOLDING LOL
		yscale = approach(yscale,1,0.025);
		ymod = approach(ymod,0,1);
	}
	
	if (key_jump)
	{
		//JUMPING
		startangle = point_direction(x,y,mouse_x,mouse_y);
		trickangle = 0;
			
		trick = 0;
		canlandupside = true;
		vsp = vsp_jump; 
		playsnd(snd_skateboardjump,10,random_range(0.8,1.2),false,1);
		addtrick(1,1,0,false,"OLLIE",true);
	}
}

//MIDAIR
if canjump = false
{
	if audio_is_playing(snd_skateboardloop) {audio_stop_sound(snd_skateboardloop);}
	yscale = approach(yscale,1,0.025);
	ymod = approach(ymod,0,1);
	grounded = false;
	boardang = point_direction(x,y,mouse_x,mouse_y);
	if is_between(boardang,90,270) {boardy = -1;} else {boardy = 1;}
}

//Check for horizontal collisions and then move if we can
var onepixel = sign(hsp) //moving left or right? right = 1, left = -1.
if (place_meeting(x+hsp,y,obj_wall))
{
	//move as close as we can
	while (!place_meeting(x+onepixel,y,obj_wall))
	{
	    x = x + onepixel;
	}
	if manual = true {stacked();}
	hsp = 0;
}
x = x + hsp;

//CHECK FOR VERTICAL GRINDING
if vsp > 0 and alive = true and slowdown = false and (place_meeting(x,y+vsp,obj_rail)) and (!place_meeting(x,y+vsp,obj_railstop))
{
	railben = instance_place(x,y+vsp,obj_rail);
	if railben = noone {railben = obj_nothing; railbenang = 0;}
		
	if instance_exists(railben)
	{
		//GET THE ANGLE OF THE RAIL
		railbenang = railben.image_angle;
			
		//GOING UP
		y += lengthdir_y(railben.image_angle/6,railben.image_angle);
		//move as close as we can
		while (!place_meeting(x,y+1,obj_rail))
		{
			y = y + 1;
		}
	}
	
	//STACKING ON THE RAIL
	if vsp > 0.25
	{
		if is_between(boardang,90-deathrange,90+deathrange) or is_between(boardang,270-deathrange,270+deathrange) or is_between(boardang,60,360-60) and canlandupside = false
		{
			stacked();	
		}
	}
		
	//GRINDING
	if grinding = false {playsnd(snd_jumponmetal,1,1,false,0.25); addtrick(1,1,1,true,"GRIND",true);}
	grinding = true;
	global.cscore += global.repeatadd;	
	if grinding = true
	{
		objCRT.crtDistortion = approach(objCRT.crtDistortion,0.5,0.01);
		screenshake(1,1);
		vsp = 0;
		puff = instance_create_depth(x,y,depth+10,obj_puff);
		puff.direction = random_range(180,90);
		puff.speed = random_range(4,8);
		puff.gravity = 0.25;
		puff.image_blend = c_yellow;
		puff.fdspd = 0.02;
		puff.sprite_index = spr_spark;
		puff.ang = 1;
	}
}
else
{
	//CHECK FOR WALLS BENEATH US
	if grinding = true {playsnd(snd_jumpoffmetal,1,1,false,0.1);}
	grinding = false;
	if manual = false {objCRT.crtDistortion = approach(objCRT.crtDistortion,-0.2,0.05);}
	var onepixel = sign(vsp) //up = -1, down = 1.
	if (place_meeting(x,y+vsp,obj_wall))
	{
		//move as close as we can
		while (!place_meeting(x,y+onepixel,obj_wall))
		{
		    y = y + onepixel;
		}
	
		if vsp > 1 {
			//LANDING
			if is_between(boardang,90-deathrange,90+deathrange) or is_between(boardang,270-deathrange,270+deathrange) or is_between(boardang,60,360-60) and canlandupside = false
			{
				stacked();
			}
			else
			{
				//PLAYER SUCCESSFULLY LANDED
					
				if is_between(boardang,90-manualrange,90) or is_between(boardang,270-manualrange,270) {
					manual = true; 
					//manualang = 45; 
					zrotation = 1; 
					playsnd(snd_manual,1,random_range(0.8,1.2),false,0.3);
					addtrick(1,1,1,true,"FRONTSIDE MANUAL",true);
				}
				else if is_between(boardang,90+manualrange,90) or is_between(boardang,270+manualrange,270) {
					manual = true; 
					//manualang = 45; 
					zrotation = -1; 
					playsnd(snd_manual,1,random_range(0.8,1.2),false,0.3);
					addtrick(1,1,1,true,"BACKSIDE MANUAL",true);
				} else{manual = false; if global.combo > 0 {alarm[0] = 1;}} //END COMBO
					
				trick = 0;
				canlandupside = true;
				if is_between(zrotmod,0.7,-0.7) {stacked();}
				playsnd(snd_skateboardland,10,random_range(0.8,1.2),false,1);
				screenshake(vsp*0.5,3);
				repeat(20) {
					puff = instance_create_depth(x,y,-9999,obj_puff);
			
					puff.fdspd = random_range(0.03,0.06);
					cho = choose(1,2);
					if cho = 1 {puff.direction = random_range(0-5,0+5); puff.speed = 6;}
					if cho = 2 {puff.direction = random_range(180-50,180+50); puff.speed = 1;}
				}
			}
		}
	
		vsp = 0;
	}
	y = y + vsp;
}

if alive = false
{
	//DEAD
	if global.combo > 0 {combofail();}
	if audio_is_playing(snd_skateboardloop) {audio_stop_sound(snd_skateboardloop);}
	if audio_is_playing(snd_grindingmetal) {audio_stop_sound(snd_grindingmetal);}
}