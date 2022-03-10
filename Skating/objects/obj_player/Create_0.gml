/// @description INIT
if (live_call()) return live_result;

grv = 0.4; //gravity
hsp = 0; //current horizontal speed
vsp = 0; //current vertical speed
hsp_walk = 4; //walk speed
vsp_jump = -10; //jump speed
grounded = true; //Grounded 
boardang = 0; 
boardy = 1;
alive = true;
slowdown = false;

manualdif = 1;

zrotation = 1;
zrotmod = 1;

popuptimer = 0;
popuptext = "";
popblend = c_white;

alarm[1] = 60;

tutphase = 0;
tuttext = "";

xscale = 1;
yscale = 1;
ymod = 0;
canjump = true;
trick = 0;
canlandupside = true;
grinding = false;
manual = false;
manualang = 45; 
many = 0;
manualintend = 0;
manrange = 0
manmod = 0
many = 0
indscale = 0;
grindmod = 0;
grindcd = 0;

deathrange = 20;
manualrange = 60;

indscale = 1;

tricksprite = sprite_index;

revertsnd = false;

startangle = 0;
trickangle = 0;
kickfliphit = obj_nothing;

instance_create_depth(x,y,-999,obj_respawnpoint);