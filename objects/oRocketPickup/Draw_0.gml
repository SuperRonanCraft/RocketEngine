/// @desc Check if spawning in unwanted area, else draw
if (!checked) {
	//Check walls and other pickups
	var destroy = place_meeting(x, y, oWall) || place_meeting(x, y, oRocketPickup) 
	|| distance_to_object(oPlayer) < 100;
	if (destroy)
		instance_destroy();
	checked = true;
}
draw_self();