/// @description 
if live_enabled {if (live_call()) return live_result;}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if phase >= 1
{
	draw_set_font(fnt_timer); outline_text_scale("YOOOO FINAL SCORE",room_width/2,32,c_white,c_black,2,-1,9999,1,1,wave(-10,10,1,0));
	draw_set_font(fnt_freddy); outline_text_scale("lets see how u did hrmmm",room_width/2,58,c_ltgray,c_black,1,-1,9999,1,1,wave(-4,4,1,0));
}

if phase >= 2
{
	draw_set_font(fnt_timer); outline_text_scale("OBJECTIVES:",room_width/2,84,c_white,c_black,2,-1,9999,1,1,wave(-4,4,1,0));
}

draw_set_font(fnt_freddy);
pl = 15;

if phase >= 3 outline_text_scale("COLLECT SKATE: " + string(global.skate) + "/" + string(global.maxskate),(room_width/2),120+wave(-2,2,4,0),g1,c_black,1,-1,9999,1,1,0);
if phase >= 4 outline_text_scale("COLLECT COMBO: " + string(global.comboletter) + "/" + string(global.maxcombo),(room_width/2),120+wave(-2,2,4,0)+pl*1,g2,c_black,1,-1,9999,1,1,0);
if phase >= 5 outline_text_scale("KNOCK OVER 10 TRASH CANS: " + string(global.trash) + "/" + string(global.maxtrash),(room_width/2),120+wave(-2,2,4,0)+pl*2,g3,c_black,1,-1,9999,1,1,0);
if phase >= 6 outline_text_scale("SQUASH 5 MAGPIES: " + string(global.crushedbird) + "/" + string(global.maxbird),(room_width/2),120+wave(-2,2,4,0)+pl*3,g4,c_black,1,-1,9999,1,1,0);
if phase >= 7 outline_text_scale("OVERLOAD THE WATER SYSTEM: " + string(global.valve) + "/" + string(global.maxvalve),(room_width/2),120+wave(-2,2,4,0)+pl*4,g5,c_black,1,-1,9999,1,1,0);
if phase >= 8 outline_text_scale("FIND THE SECRET TAPE: " + string(global.tape) + "/" + string(global.maxtape),(room_width/2),120+wave(-2,2,4,0)+pl*5,g6,c_black,1,-1,9999,1,1,0);

draw_set_font(fnt_freddy);
if phase >= 9 outline_text_scale("that means your score is:",room_width/2,210,c_ltgray,c_black,1,-1,9999,1,1,wave(-2,2,1,0));
if phase >= 10 outline_text_scale(string(global.points) + " x 1." + string(global.goals*10),room_width/2,225,c_ltgray,c_black,1,-1,9999,1,1,0);

if phase >= 11 {draw_set_font(fnt_timer); outline_text_scale(string(totalscore),(room_width/2)+random_range(-1,1),238+random_range(-1,1),c_ltgray,c_black,1,-1,9999,1,1,wave(-2,2,4,0));}

draw_set_halign(fa_left);
draw_set_valign(fa_top);