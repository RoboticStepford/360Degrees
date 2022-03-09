/// @description COMBO END
if live_enabled {if (live_call()) return live_result;}
global.points += round(global.cscore * global.combo);
global.combostring = "";
global.cscore = 0;
global.repeatadd = 0;
global.combo = 0;
manualdif = 1;
manualang = 45; 