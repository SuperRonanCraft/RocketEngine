if (targets < targets_max && spawn_time < 0) {
	targets++;
	spawn_time = targets_max;
} else
	spawn_time--;

if (targets_created < targets)
	with (instance_create_layer(0, 0, layer, oTarget)) {
		other.targets_created++;
		owner = other;
	}