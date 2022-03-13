/// @description 
if live_enabled {if (live_call()) return live_result;}
fadeout = true;
ftr=instance_create_depth(x,y,-999999,obj_fadetoroom);
ftr.rm = rm_score;