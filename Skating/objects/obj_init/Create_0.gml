randomize();


if os_browser == browser_not_a_browser
{
	global.inbrowser = false;
}
else
{
	global.inbrowser = true;
}

//use this to define stuff that should only happen during dev
globalvar debug; debug = true;

//set the resolution of the game
globalvar screenw; screenw = 480;
globalvar screenh; screenh = 270;

surface_resize(application_surface, screenw, screenh);
var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy);

global.scorescale = 1;

//set volume of the game sounds
globalvar musvol;
musvol = 0.4;
globalvar sndvol;
sndvol = 0.6;

global.timeminute = 2;
global.timesecond = 0;

global.points = 0;
global.combo = 0;
global.cscore = 0;
global.combostring = "";

//CREATE OBJECTS
if !instance_exists(obj_dj) {instance_create_layer(0,0,"Overlay",obj_dj);}
if !instance_exists(obj_mouse) {instance_create_layer(0,0,"Overlay",obj_mouse);}
if !instance_exists(objCRT) {instance_create_layer(0,0,"World",objCRT);}

alarm[0] = 1;