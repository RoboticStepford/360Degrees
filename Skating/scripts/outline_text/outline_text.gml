function outline_text(outlinestr,outlinex,outliney,maincol,outlinecol,dist,seper,wid){
	draw_set_color(outlinecol);
	draw_text_ext(outlinex-dist,outliney,outlinestr,seper,wid);
	draw_text_ext(outlinex+dist,outliney,outlinestr,seper,wid);
	draw_text_ext(outlinex,outliney-dist,outlinestr,seper,wid);
	draw_text_ext(outlinex,outliney+dist,outlinestr,seper,wid);
	draw_text_ext(outlinex-dist,outliney+dist,outlinestr,seper,wid);
	draw_text_ext(outlinex+dist,outliney-dist,outlinestr,seper,wid);
	draw_text_ext(outlinex+dist,outliney+dist,outlinestr,seper,wid);
	draw_text_ext(outlinex-dist,outliney-dist,outlinestr,seper,wid);
	draw_set_color(maincol);
	draw_text_ext(outlinex,outliney,outlinestr,seper,wid);
	draw_set_color(c_white);
}
