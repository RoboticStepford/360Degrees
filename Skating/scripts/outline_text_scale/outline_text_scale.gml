function outline_text_scale(outlinestr,outlinex,outliney,maincol,outlinecol,dist,seper,wid,xsca,ysca,angl){
	rangemod = dist;
	dist = 0;
	repeat(rangemod)
	{
		dist += 1;
		draw_set_color(outlinecol);
		draw_text_ext_transformed(outlinex-dist,outliney,outlinestr,seper,wid,xsca,ysca,angl); //left
		draw_text_ext_transformed(outlinex+dist,outliney,outlinestr,seper,wid,xsca,ysca,angl); //right
		draw_text_ext_transformed(outlinex,outliney-dist,outlinestr,seper,wid,xsca,ysca,angl); //up
		draw_text_ext_transformed(outlinex,outliney+dist,outlinestr,seper,wid,xsca,ysca,angl); //down
		draw_text_ext_transformed(outlinex-dist,outliney+dist,outlinestr,seper,wid,xsca,ysca,angl); //left + down
		draw_text_ext_transformed(outlinex-dist,outliney-dist,outlinestr,seper,wid,xsca,ysca,angl); //left + up
		draw_text_ext_transformed(outlinex+dist,outliney-dist,outlinestr,seper,wid,xsca,ysca,angl); //right + up
		draw_text_ext_transformed(outlinex+dist,outliney+dist,outlinestr,seper,wid,xsca,ysca,angl); //right + down
	}

	draw_set_color(maincol);
	draw_text_ext_transformed(outlinex,outliney,outlinestr,seper,wid,xsca,ysca,angl);
	draw_set_color(c_white);
}
