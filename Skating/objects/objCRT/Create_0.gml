#region create

// Edit this script if you want to tweak values!!
BjortFX_config();





surfacePPTemp1 = -1; // Pass 1
surfacePPTemp2 = -1; // Pass 2
surfacePPTemp3 = -1; // Pass 3

// Destroy an instance of objCRT if it already exists.
// This should never have to happen, but if it were to happen things might start getting slow.
if instance_number(objCRT)>1 {
	instance_destroy(self, false);
	exit;	
}

#region check if the shaders compiled correctly


var _shaderok;
_shaderok = shader_is_compiled(shd_retroscreen_screenfilter);
_shaderok &= shader_is_compiled(shd_retroscreen_distortion);
_shaderok &= shader_is_compiled(shd_retroscreen_postprocessing);

if (!_shaderok)
{
    show_message("Whoops, seems like the program has failed to compile the shaders...#This program requires a graphics card that supports Shaders!#(You could also, install / update your DirectX drivers and try again to see if it works.)");
    game_end();
}


#endregion

#endregion