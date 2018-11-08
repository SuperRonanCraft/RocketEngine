/// @desc Move Rocket
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);
if (place_meeting(x, y, pShootable)) {
	with (instance_place(x, y, pShootable))
		scHitShootable(other.owner, true);
		/*if (other.owner != id) {
			hp -= other.damage;
			flash = 3;
			hitfrom = other.direction;
			instance_destroy(other.id);
			if (other.owner.object_index == oEnemy)
				with (oScore)
					healthscale = 2;
		}*/
} else {
	var touching = instance_place(x, y, oWall);
	if (touching != noone && touching.shootable) {
		spd = 0;
		instance_change(oHitSpark, true);
		//layer_add_instance("Tiles", id);
		depth += 1;
	}
}