/// @description 
if live_enabled {if (live_call()) return live_result;}
if distance_to_object(obj_player) < 4
{
	global.tape += 1;
	instance_destroy();
		
	playsnd(snd_goaldone,1,1,false,1);
	obj_player.popuptimer = 120;
	obj_player.popblend = c_lime;
	obj_player.popuptext = "SECRET TAPE FOUND!!!";	
}