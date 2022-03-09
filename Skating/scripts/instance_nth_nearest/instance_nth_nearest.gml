/// @desc Returns the id of the nth nearest instance of an object to a given point or noone if none is found.
/// @function instance_nth_nearest(x,y,obj,n)

function instance_nth_nearest(pointx,pointy,object,n){
	//Vars
    n = min(max(1,n),instance_number(object));
    var list = ds_priority_create();
    var nearest = noone;
	
	//Check
    with (object) ds_priority_add(list,id,distance_to_point(pointx,pointy));
    repeat (n) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}