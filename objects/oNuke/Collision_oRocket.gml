/// @desc Hit by rocket, change direction
var otherdir = other.direction;
direction = otherdir >= 90 && otherdir <= 270 ? 180 : 0;
image_angle = direction;
timer = 60;
with (other)
	event_user(0);