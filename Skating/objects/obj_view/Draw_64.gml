/// @description GUI
if live_enabled {if (live_call()) return live_result;}

if global.inbrowser = false {sc = 1; scwid = 480; schit = 270;}else{sc = 3; scwid = 480*3; schit = 270*3;}

if global.song = mus_CassieBee_SK8_ZSIX4 {artistname = "CassieBee"; songname = "SK8 ZSIX4"; artistspr = spr_cassiebee;}
else if global.song = mus_Packtion_Bread_Trap {artistname = "Packtion"; songname = "Bread Trap"; artistspr = spr_packtion;}
else if global.song = mus_Packtion_Egg_Trap {artistname = "Packtion"; songname = "Egg Trap"; artistspr = spr_packtion;}
else if global.song = mus_Packtion_BadLibs {artistname = "Packtion"; songname = "Badlibs"; artistspr = spr_packtion;}
else if global.song = mus_Jacob_Hyperventilation {artistname = "Jacob"; songname = "Hyperventilation"; artistspr = spr_jacob;}
else if global.song = mus_Jacob_Song_For_Stepford {artistname = "Jacob"; songname = "Song For Stepford"; artistspr = spr_jacob;}
else if global.song = mus_Valbun_Exorcism {artistname = "Valbun"; songname = "Self Exorcism (Edit)"; artistspr = spr_valbun;}
else if global.song = mus_Valbun_First_Times {artistname = "Valbun"; songname = "First Times (Edit)"; artistspr = spr_valbun;}
else if global.song = mus_Droid_Jet_Set_Loop {artistname = "Droid"; songname = "Jet Set Loop"; artistspr = spr_droid;}
else if global.song = mus_Predator_Sk8ing_Pussy {artistname = "Predator Music"; songname = "SK8ING PUSSY"; artistspr = spr_predator;}
else if global.song = mus_Demisurgex_Its_Dark_Outside {artistname = "DemisurgeX"; songname = "It's Dark Outside"; artistspr = spr_demisurge;}
else if global.song = mus_Dryest_Grinding {artistname = "Dryest"; songname = "Grinding"; artistspr = spr_dryest;}
else if global.song = mus_MistaJub_Dogboard {artistname = "MistaJub"; songname = "DogBoard"; artistspr = spr_mistajub;}
else if global.song = mus_Post_Elvis_Rock_The_Third_Eye {artistname = "Post Elvis"; songname = "Rock The Third Eye"; artistspr = spr_postelvis;}
else {artistname = "BE PATIENT..."; songname = "LOADING"; artistspr = spr_disc;}

//DRAW TOTAL SCORE
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_set_font(fnt_timer);
visnum = approach(visnum,global.points,global.points/50);
if visnum != global.points {shakenum = 3;}else{shakenum = 0;}
outline_text_scale(string(floor(visnum)),(scwid-(8*sc))+random_range(shakenum,-shakenum),(16*sc)+random_range(shakenum,-shakenum),c_white,c_black,1*sc,-1,9999,sc,sc,0);

//DRAW COMBO
if global.combo > 0
{
	global.scorescale = approach(global.scorescale,1,0.1);
	draw_set_halign(fa_center);
	outline_text_scale(string(global.cscore) + " x " + string(global.combo) ,scwid/2,(schit)-(14*sc),c_orange,c_black,1*sc,-1,9999,global.scorescale*sc,global.scorescale*sc,0);

	cullnum = 170;
	if string_length(global.combostring) > cullnum {amtodel = string_length(global.combostring)-cullnum; global.combostring = string_copy(global.combostring, amtodel, string_length(global.combostring));}
	draw_set_valign(fa_bottom);
	draw_set_font(fnt_freddy);
	outline_text_scale(string(global.combostring),scwid/2,(schit)-(20*sc),c_white,c_black,1*sc,-1,400,1*sc,global.scorescale*sc,0);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);


//DRAW TIMER
txtsca = approach(txtsca,1,0.1)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_timer);
timerx = lengthdir_x((4*sc),obj_control.alarm[0]*6);
timery = lengthdir_y((4*sc),obj_control.alarm[0]*6);
draw_sprite_ext(spr_timer,0,(scwid/2)+timerx,((16*sc))+timery,(1*sc),(1*sc),wave(-20,20,1,0),c_white,1);
timesec = string_format(global.timesecond, 2, 0);
timesec = string_replace_all(timesec," ","0");
outline_text_scale(string(global.timeminute) + ":" + string(timesec),(scwid/2)+random_range(-1,1),(16*sc)+random_range(-1,1),c_white,c_black,1*sc,-1,9999,txtsca*sc,txtsca*sc,wave(-10,10,1,0));
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//DRAW DISC
draw_set_font(fnt_freddy);
draw_sprite_ext(artistspr,0,24*sc,24*sc,1*sc,1*sc,get_timer()/10000,c_white,1);	
outline_text_scale(string(songname),46*sc,10*sc,c_white,c_black,1*sc,-1,9999,1*sc,1*sc,0);
outline_text_scale(string(artistname),46*sc,22*sc,c_ltgray,c_black,1*sc,-1,9999,1*sc,1*sc,0);
if global.showskip > 0 {outline_text_scale(string("[SPACE TO SKIP]"),46*sc,34*sc,c_orange,c_black,1*sc,-1,9999,1*sc,1*sc,0);}

//DISPLAY FPS OVERLAY
if showFPS = true {
	fps_speedometer(true,1,1);
}