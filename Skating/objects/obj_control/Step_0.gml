/// @description 
if live_enabled {if (live_call()) return live_result;}

objCRT.enabled = global.doCRT;

if room = rm_test {
var lay_id = layer_get_id("Wobbly");
layer_set_visible(lay_id, global.doWobbly);
}