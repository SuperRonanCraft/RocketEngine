/// @desc Hit a shootable
/// @arg instance
/// @arg delete

if (argument0 != id) {
	hp -= other.damage;
	flash = 3;
	hitfrom = other.direction;
	if (argument1)
		instance_destroy(other.id);
	hpscale = 2;
}