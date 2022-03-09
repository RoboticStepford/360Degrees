/// @description 
if live_enabled {if (live_call()) return live_result;}

if global.showskip > 0 {global.showskip -= 0.01;}

if clicked = true
{
	if waited = false
	{
		if !audio_is_playing(oldsong)
		{
			picksong();
			waited = true;	
			alarm[0] = 4*60;
		}
	}

	if keyboard_check_pressed(vk_space)
	{
		waited = false;	
		picksong();
		alarm[0] = 0;
	}

	/// @description 
	if global.song != oldsong and global.vol > 0
	{
		//SONG HAS CHANGED, LOWER VOLUMEs
		global.vol = approach(global.vol,0,1);
	}
	else if global.song != oldsong and global.vol = 0
	{
		//VOLUME IS = 0
		if audio_is_playing(oldsong) {audio_stop_sound(oldsong);}
		oldsong = global.song;
		audio_play_sound(oldsong,10,false);
	}
	else if global.vol < 1
	{
		//NOT MAX VOL YET
		global.vol = approach(global.vol,1,1);
	}

	//APPLY VOLUME TO SONG
	audio_sound_gain(oldsong,global.vol*global.musvol,0);
}
else
{
	if mouse_check_button_released(mb_left) {clicked = true}	
}