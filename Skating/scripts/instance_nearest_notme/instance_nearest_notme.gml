/// instance_nearest_notme(x,y,obj)
//
//  Returns the nearest instance to a given point,
//  disregarding the calling instance.
//
//      x,y         position, real
//      obj         object instance to find, real
//
//  GMLscripts.com/license
function instance_nearest_notme(var_x,var_y,var_object){
    instance_deactivate_object(self);
    var n = instance_nearest(var_x, var_y, var_object);
    instance_activate_object(self);
    return n;
}