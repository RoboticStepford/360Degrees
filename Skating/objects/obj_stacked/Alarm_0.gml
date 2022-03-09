/// @description 
if live_enabled {if (live_call()) return live_result;}
obj_player.x = obj_respawnpoint.x;
obj_player.y = obj_respawnpoint.y;
obj_player.visible = 1;
obj_view.targ = obj_player;
obj_player.alive = true;

with(obj_stacked) {instance_destroy();}