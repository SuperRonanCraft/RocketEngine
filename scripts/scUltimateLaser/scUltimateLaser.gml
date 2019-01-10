/// @desc Laser ultimate
with (instance_create_depth(x, y, depth - 10, oUltimateLaser)) {
	owner = other;
	side = owner.team;
}