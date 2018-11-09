/// @desc Move Rocket
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

//Homing missle code
if (aimbot && target != noone) {
	direction = point_direction(x, y, target.x, target.y);
	image_angle = direction;
}