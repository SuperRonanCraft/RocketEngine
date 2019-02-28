/// @desc hit by explosion
if (other.parent != owner)
	with (other) {
		scScreenShake(10, 30);
		other.turret_hp -= rocket_map[? ROCKET_MAP.DAMAGE];
		if (other.turret_hp <= 0)
			instance_destroy(other); //Destroy the ult
	}
