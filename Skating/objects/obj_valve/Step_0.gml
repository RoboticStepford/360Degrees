/// @description 
if live_enabled {if (live_call()) return live_result;}

if turning = true
{
	angle += 5;
	if count = false
	{
		playsnd(snd_valve,1,random_range(0.9,1.1),false,0.5);
		screenshake(3,3);
		count = true;
		global.valve += 1;
		
		if global.valve < global.maxvalve
		{
			playsnd(snd_snap,1,1 + global.valve/10,false,1);
			obj_player.popuptimer = 120;
			obj_player.popblend = c_white;
			obj_player.popuptext = "VALVE SPINNER: " + string(global.valve) + "/3";
		}
		else
		{		
			playsnd(snd_goaldone,1,1,false,1);
			obj_player.popuptimer = 120;
			obj_player.popblend = c_lime;
			obj_player.popuptext = "GOAL COMPLETE: VALVE SPINNER!!!";
			global.goals += 1;
		}	
	}
}