/// @desc Laser ultimate
with (instance_create_depth(x, y, depth, oUltimateLaser)) {
	owner = other;
	side = owner.team;
}