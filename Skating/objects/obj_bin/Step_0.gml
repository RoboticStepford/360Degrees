/// @description 
if live_enabled {if (live_call()) return live_result;}
if distance_to_object(obj_player) < 2
{
	global.trash += 1;
	d1 = instance_create_depth(x,y,depth-9999,obj_debree); d1.image_index = 0;
	d2 = instance_create_depth(x,y,depth-9999,obj_debree); d2.image_index = 1;
	repeat(2) {d3 = instance_create_depth(x,y,depth-9999,obj_debree); d3.image_index = 2;}
	
	
	instance_destroy();
	playsnd(snd_trashcan,1,random_range(0.9,1.1),false,0.4);
	
	if global.trash < global.maxtrash
	{
		playsnd(snd_snap,1,1 + global.trash/10,false,1);
		obj_player.popuptimer = 120;
		obj_player.popblend = c_white;
		obj_player.popuptext = "BIN TIPPER: " + string(global.trash) + "/10";
	}
	else
	{		
		playsnd(snd_goaldone,1,1,false,1);
		obj_player.popuptimer = 120;
		obj_player.popblend = c_lime;
		obj_player.popuptext = "GOAL COMPLETE: BIN TIPPER!!!";
		global.goals += 1;
	}	
}