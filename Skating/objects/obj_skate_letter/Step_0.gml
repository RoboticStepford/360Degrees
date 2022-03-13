/// @description 
if live_enabled {if (live_call()) return live_result;}
if distance_to_object(obj_player) < 16
{
	global.skate += 1;
	instance_destroy();
	repeat(20) {d = instance_create_depth(x,y,depth-9999,obj_debree); d.sprite_index = sprite_index; d.image_index = image_index;}
	
	if global.skate < global.maxskate 
	{
		playsnd(snd_letter,1,1 + global.skate/10,false,1);
		obj_player.popuptimer = 120;
		obj_player.popblend = c_white;
		obj_player.popuptext = "COLLECT SKATE: " + string(global.skate) + "/5";
	}
	else
	{		
		playsnd(snd_finish_letter,1,1,false,1);
		obj_player.popuptimer = 120;
		obj_player.popblend = c_lime;
		obj_player.popuptext = "GOAL COMPLETE: COLLECT SKATE!!!";
		global.goals += 1;
	}	
}