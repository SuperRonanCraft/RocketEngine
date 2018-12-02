/// @desc Check if spawning in unwanted area before drawing
if (checked) exit;
//Check walls and other pickups and not withing 100 of a player
var destroy =  place_meeting(x, y, oWall) || place_meeting(x, y, object_get_parent(object_index)) 
|| distance_to_object(oPlayer) < 100;
if (destroy)
	instance_destroy();
checked = true;