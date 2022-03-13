function balancecode(){
	if mouse_check_button_pressed(mb_right) or keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")) {indscale = 1.5; manualang += 16; playsnd(snd_adjust,1,0.9,false,0.1);}
	manualdif += 0.01;
	manualintend = 0;
	manrange = distance_to_point(manualang,manualintend);
	manualang = approach(manualang,manualintend,0.1+(manualdif/30));
	manmod = 32-(manualang/1.5);
	many = manualang/20;
	indscale = approach(indscale,1,0.1);
	grindmod = (manualang-45)/2
				
	draw_sprite_ext(spr_grind_meter,0,x+54,y-16,1,1,(manualang-45)/6,c_white,1);
	draw_sprite_ext(spr_grind_ind,0,x+54,y+manmod-16,indscale+wave(0,0.2,1,0),indscale+wave(0,0.2,1,0),0,c_white,1);
	if manualang < 60 {draw_sprite_ext(spr_clicky,get_timer()/100000,x+88,y+manmod-16,indscale+wave(0,0.2,1,0),indscale+wave(0,0.2,1,0),wave(-10,10,2,0),c_white,1);}
}