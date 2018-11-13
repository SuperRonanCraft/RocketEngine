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