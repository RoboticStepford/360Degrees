function addtrick(comboadd,scoreadd,increment,repeating,name,addto){
	global.combo += comboadd;
	global.cscore += scoreadd;
	
	if addto = true
	{
		str_len = string_length(global.combostring)+1;
		global.combostring = string_insert(" + " + name,global.combostring,str_len)
		playsnd(snd_trick,1,1,false,0.1);
		global.scorescale = 1.25;
	}
	
	if increment = true
	{
		global.repeatadd = repeating;
	}
}