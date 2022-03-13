function combofail(){
	global.combo = 0;
	global.combostring = "";
	global.cscore = 0;
	global.repeatadd = 0;
	manualdif = 1;
	manualang = 45; 
	
	if instance_exists(obj_combo_letter) {
		with(obj_combo_letter){hide = false;} 
		if global.comboletter > 0 
		{
			global.comboletter = 0;	
			//playsnd(snd_punch,1,1,false,1);
			//obj_player.popuptimer = 120;
			//obj_player.popblend = c_red;
			//obj_player.popuptext = "GOAL FAIL: LOST COMBO!!!";
		}
	}
}