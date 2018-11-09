/// @desc Move Rocket
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

if (place_meeting(x, y, pShootable)) { //Check if touching a shootable object (not a wall)
	with (instance_place(x, y, pShootable))
		scHitShootable(other.owner, true);
} else {
	//Check if thouching a wall, and see if it can be shot
	var touching = instance_place(x, y, oWall);
	if (touching != noone && touching.shootable) {
		spd = 0;
		instance_change(oHitSpark, true);
		//layer_add_instance("Tiles", id);
		depth += 1;
	}
}
//if (aimbot)
//	target = point_direction(x, y, p2, p2);
//code for aimboting the rocket to opposite player	