/// @desc Hit by rocket, change direction
var otherdir = other.direction;
direction = otherdir;
image_angle = direction;
with (other)
	event_user(0);