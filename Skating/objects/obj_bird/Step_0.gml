/// @description 
if live_enabled {if (live_call()) return live_result;}

if instance_place(x,y,obj_player) and obj_player.vsp > 0.1 and flat = false
{
	global.crushedbird += 1;
	flat = true;
	//instance_destroy();
	
	if global.crushedbird < global.maxbird
	{
		playsnd(snd_snap,1,1 + global.crushedbird/10,false,1);
		obj_player.popuptimer = 120;
		obj_player.popblend = c_white;
		obj_player.popuptext = "MAGPIES FLATTENED: " + string(global.crushedbird) + "/5";
	}
	else
	{		
		playsnd(snd_goaldone,1,1,false,1);
		obj_player.popuptimer = 120;
		obj_player.popblend = c_lime;
		obj_player.popuptext = "GOAL COMPLETE: MAGPIE SQUASH!!!";
	}	
}