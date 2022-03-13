/// @description 
if live_enabled {if (live_call()) return live_result;}

if distance_to_object(obj_player) < 2 and obj_player.vsp > 0.1 and flat = false
{
	global.crushedbird += 1;
	flat = true;
	//instance_destroy();
	
	repeat(20) {d = instance_create_depth(x,y,depth-9999,obj_debree); d.sprite_index = spr_feather;}
	
	playsnd(snd_bird,1,random_range(0.9,1.1),false,0.5);
	
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
		global.goals += 1;
	}	
}