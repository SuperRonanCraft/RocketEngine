if (owner.playerid == 1 && direction != 180) {
	direction = 180
	image_angle = direction;
} else if (owner.playerid == 2 && direction != 0) {
	direction = 0;
	image_angle = direction;
} else if (x < 50 && direction == 180)
	x = RES_W - 50;
else if (x > RES_W - 50 && direction == 0)
	x = 50;