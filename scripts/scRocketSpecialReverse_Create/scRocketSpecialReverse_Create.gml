if (owner.playerid == 1 && direction != 180) {
	direction = 180
	image_angle = direction;
} else if (owner.playerid == 2 && direction != 0) {
	direction = 0;
	image_angle = direction;
}
teleported = false;
teleporting = false;