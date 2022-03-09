/// @description 
if live_enabled {if (live_call()) return live_result;}

if play = 1
{
	objCRT.crtDistortion = approach(objCRT.crtDistortion,-0.1,0.1);	
}

if speed > 0.25
{
	//Horizontal bounce
	if(place_meeting(x + hspeed, y, obj_wall))
	{
		direction = -direction + 180; 
		bounce = true;
	}
	//Vertical bounce
	if(place_meeting(x, y + vspeed, obj_wall))
	{
		direction = -direction; 
		bounce = true;
	}
	
	//BOUNCE
	if bounce = true
	{
		bounce = false;
		speed = speed/2; 
		scale = 0.5;
		if play = 1 {
			repeat(20){
			puff = instance_create_depth(x,y,depth+10,obj_puff);
			puff.direction = random_range(90-45,90+45);
			puff.speed = random_range(3,6);
			puff.gravity = 0.1;
			puff.image_blend = c_aqua;
			puff.fdspd = 0.02;
			puff.sprite_index = spr_spark;
			puff.ang = 1;}
			screenshake(3,1); 
			playsnd(snd_hitfloor,0,random_range(0.9,1.1),false,1);
			objCRT.crtDistortion = -0.8;
		}	
	}
}
else
{
	if gravity != 0 and play = 1 {alarm[0] = 60;}
	speed = 0;
	gravity = 0;
	direction = 0;
	angle = 0;
}