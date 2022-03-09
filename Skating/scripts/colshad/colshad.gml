function colshad(argument0){
    image_blend = argument0;
    shader_set(sh_color);
}

function colclear(argument0){
    shader_reset();
    image_blend = argument0;
}