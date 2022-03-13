/// @description 
if live_enabled {if (live_call()) return live_result;}
if distance_to_object(obj_player) < 16 and hide = false
{
	hide = true;
	global.comboletter += 1;
	repeat(20) {d = instance_create_depth(x,y,depth-9999,obj_debree); d.sprite_index = sprite_index; d.image_index = image_index;}
	
	if global.comboletter < global.maxcombo
	{
		playsnd(snd_letter,1,1 + global.comboletter/10,false,1);
		obj_player.popuptimer = 120;
		obj_player.popblend = c_white;
		obj_player.popuptext = "GET COMBO: " + string(global.comboletter) + "/5";
	}
	else
	{		
		with(obj_combo_letter) {instance_destroy()}
		playsnd(snd_finish_letter,1,1,false,1);
		obj_player.popuptimer = 120;
		obj_player.popblend = c_lime;
		obj_player.popuptext = "GOAL COMPLETE: GET COMBO!!!";
		global.goals += 1;
	}	
}