event_inherited();
if (global.play) { //If game play is enabled
	if (targets < diff && spawn_time < 0 && random_range(0, 1)) {
		targets++;
		spawn_time = diff;
	} else
		spawn_time--;

	if (targets_created < targets)
		with (instance_create_layer(0, 0, layer, random_range(0, 100) < 95 ? oTarget : oTargetBomb)) {
			other.targets_created++;
			owner = other;
			timer = other.diff * 3;
		}
}
//Item ease in the score
points_x += (points_x_target - points_x) / points_speed;
//Lower scale slowly
points_scale = max(points_scale * 0.95, 1);