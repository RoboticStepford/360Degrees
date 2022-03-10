/// @description 
if live_enabled {if (live_call()) return live_result;}
depth = -9999999;

pitch = 1;
songpitch = 1; 
waited = false;
clicked = false;
global.showskip = 1;

global.song = mus_silence;
global.vol = 1;
global.maxvol = 1;
oldsong = mus_silence;

forceplay = 0;