if (mob_current < mob_count) {
	var nowall = false;
	var tries = 0;
	while (!nowall) {
		var xx = irandom_range(50, RES_W - 50);
		var yy = irandom_range(50, RES_H - 50);
		var wall = instance_nearest(xx, yy, oWall);
		if (wall != noone) {
			if (point_distance(xx, yy, wall.x, wall.y) > 100)
				with (instance_create_depth(xx, yy, depth, oPlayer)) {
					team = other.owner.team; //Same team as caster
					display = false; //No ui
					ult_enabled = false; //Disable ult
					hp = 1; //One hit kill
					hp_original = 1;
					despawn = true; //Despawn player if dead
					walksp += random_range(-2, 2);
					scStartAI();
				}
		}
		tries++;
		if (tries > 100)
			break;
	}
	mob_current++;
}