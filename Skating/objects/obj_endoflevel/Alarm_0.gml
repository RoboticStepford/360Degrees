/// @description 
if live_enabled {if (live_call()) return live_result;}

if phase < 10
{
	playsnd(snd_snap,1,0.8+phase/20,false,1);
	phase += 1;
	alarm[0] = 30;
}
else
{
	playsnd(snd_punch,1,1,false,1);
	phase += 1;
	alarm[1] = room_speed*6;	
}
