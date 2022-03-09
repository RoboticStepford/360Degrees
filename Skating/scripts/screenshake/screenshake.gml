/// @function screenshake(ShakeMagnitude, ShakeLength)
function screenshake(sm, sl){
	if(sm > obj_view.shake){
		obj_view.shake = sm;
		obj_view.shake_m = sm;
		obj_view.shake_l = sl;
	}
}
