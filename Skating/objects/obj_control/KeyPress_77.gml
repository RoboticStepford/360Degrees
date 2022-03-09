/// @description 
if live_enabled {if (live_call()) return live_result;}
if global.muted = false {audio_master_gain(0); global.muted=true;}
else{audio_master_gain(1); global.muted = false;}