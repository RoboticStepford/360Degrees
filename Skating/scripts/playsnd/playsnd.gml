///@desc playsnd()
function playsnd(snd_index, snd_priority, snd_pitch, snd_loop, snd_vol){
	var sound_index = audio_play_sound(snd_index, snd_priority, snd_loop);
	audio_sound_pitch(snd_index, snd_pitch);
	audio_sound_gain(snd_index, (snd_vol)*(sndvol), 0);
	return sound_index;
}