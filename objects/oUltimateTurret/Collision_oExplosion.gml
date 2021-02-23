/// @desc hit by explosion
if (other.parent != owner) {
	for (var i = 0; i < ds_list_size(damaged_by); i++)
		if (damaged_by[| i] == other.id)
			exit;
	with (other) {
		scScreenShake(10, 30);
		//var dmg = rocket_map[? ROCKET_MAP.DAMAGE]
		other.turret_hp -= dmg;
		other.turret_hp_damaged = dmg;
		if (other.turret_hp <= 0)
			instance_destroy(other); //Destroy the ult
	}
	turret_hp_damaged_size = 2;
	ds_list_add(damaged_by, other.id);
}
