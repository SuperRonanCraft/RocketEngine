/// @desc collision checks

//Collision
if (!instance_exists(oRocket)) exit;
var rlist = ds_list_create();
collision_rectangle_list(x1, y1, x2, y2, oRocket, false, true, rlist, false); //Find all rocket instances in collision area
for (var i = 0; i < ds_list_size(rlist); i++) //Iterate through the rocket list
	with (ds_list_find_value(rlist, i)) //Find it
		if (owner != other.owner)
			event_user(0); //Explode it
ds_list_destroy(rlist);