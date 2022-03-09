/*
===============================
  Press Ctrl+M to organize this script
===============================


Please take a look at the 'Documentation' file!


*/


#region functions

#region make_fx


///@arg sprite
///@arg x
///@arg y
///@arg depth
///@arg [xscale]
///@arg [yscale]
///@arg [rot]
///@arg [col]
///@arg [alpha]


function make_fx(_sprite, _x, _y, _depth){


var _obj = instance_create_depth(_x, _y, _depth, fx);

_obj.sprite_index = _sprite;

// centipede code

if argument_count > 4 {
_obj.image_xscale = argument[4];
}
if argument_count > 5 {
_obj.image_yscale = argument[5];
}
if argument_count > 6 {
_obj.image_angle = argument[6];
}
if argument_count > 7 {
_obj.image_blend = argument[7];
}
if argument_count > 8 {
_obj.image_alpha = argument[8];
}

return _obj;
}


#endregion

#region playsound


///@param sound
///@param {real} [pitch]
///@param {real} [x]
///@param {real} [y]


function playsound(_sound, _pitch) {
    
    var _s;
    if argument_count > 2 {
        _s = audio_play_sound_at(_sound, argument[2], argument[3], 300, 50, 150, 1, false, -10);
    } else {
        _s = audio_play_sound(_sound, -10, false);
    }
    
    if argument_count > 1 {
audio_sound_pitch(_s, _pitch);
    }
    
    return _s;
    
}


#endregion

#region spring


///@param value
///@param value_speed
///@param target_value
///@param tension
///@param damping


function spring(_val, _valsp, _tar, _tension, _damping){

var _spd_to_add = (_tension * (_tar - _val)) - (_damping * _valsp);

_valsp += _spd_to_add;

var result;
result[0] = _val + _valsp;
result[1] = _valsp;

return (result);

}


#endregion

#region approach


///@param start
///@param end
///@param shift


//function approach(_start, _end, _shift) {

//if (_start < _end) return min(_start + _shift, _end); 
//else return max(_start - _shift, _end);

//}


#endregion

#region pixelscale


///@param amt


function pixelscale(_amt) {

window_set_size(window_get_width()*_amt, window_get_height()*_amt);

}


#endregion

#region wrap


///@param value
///@param min
///@param max


function wrap(_value, _min, _max) {

while (_value < _min) _value += (_max - _min);
while (_value > _max) _value -= (_max - _min);

return _value;

}


#endregion

#region curve


///@param val1
///@param val2
///@param amount
///@param curve_id
///@param index


function curve(_val1, _val2, _amount, _curvename, _curveindex) {
return lerp(_val1, _val2, animcurve_channel_evaluate(animcurve_get_channel(_curvename, _curveindex), _amount))
}


#endregion

#region maskdraw


function md_contents() {
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);
gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
gpu_set_alphatestenable(true);
}
function md_mask_begin() {
gpu_set_blendenable(false)
gpu_set_colorwriteenable(false,false,false,true);
draw_set_alpha(0);
draw_rectangle(0,0, room_width,room_height, false);
draw_set_alpha(1);
}
function md_mask_end() {
gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);
}


#endregion

#region sleep


///@param ms 


function sleep(_ms) {
var tt = current_time + _ms;
while (current_time < tt) { /* loop */ }
}


#endregion

#region cursed_cat


function cursed_cat() {
    
    image_stock = sprite_add("https://thiscatdoesnotexist.com/", 0, 0, 0, 0, 0);
    return image_stock;
    
}


#endregion



#endregion

#region macros


/*

I personally really like to use these-
But you can remove them if you want.

*/


//#macro log show_debug_message
//#macro key keyboard_check
#macro cam0 view_camera[0]


#endregion



#region credits
/*


This script and all included functions made by Trixelized
bit.ly/trixlink

Feel free to use this in any projects!
I love you muah


*/
#region error message removal - feel free to remove this

if 1==0 {


// none of this works lol
// this is to avoid the 'unused script' thing to pop up

//log(key(cam0)); 
neverexecute();
fx = 0;
cam0 = 0;
make_fx(0, 0, 0, 0);
playsound(0);
spring(0, 0, 0, 0, 0);sleep(0);cursed_cat();pixelscale(0);
approach(0, 0, 0);wrap(0, 0, 0);curve(0, 0, 0, 0, 0);
md_mask_begin(); md_contents(); md_mask_end();


}

#endregion
#endregion