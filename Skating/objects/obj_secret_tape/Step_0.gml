/// @description 
if live_enabled {if (live_call()) return live_result;}
if distance_to_object(obj_player) < 4
{
	global.tape += 1;
	instance_destroy();
	
	repeat(20) {d = instance_create_depth(x,y,depth-9999,obj_debree); d.sprite_index = spr_disc;}
	
	playsnd(snd_tape,1,random_range(0.9,1.1),false,0.5);
	playsnd(snd_goaldone,1,1,false,1);
	obj_player.popuptimer = 120;
	obj_player.popblend = c_lime;
	obj_player.popuptext = "SECRET TAPE FOUND!!!";	
	global.goals += 1;
}