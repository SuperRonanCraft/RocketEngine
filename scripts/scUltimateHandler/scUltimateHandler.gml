if (!ult_enabled) exit;

if (ult_charge >= 1) {
	var map = ds_map_create();
	scUltimateGet(rocket_map[? ROCKET_MAP.ULTIMATE], map);
	instance_create_layer(x, y, layer, map[? ULTIMATE_MAP.OBJECT]);
	ult_charge = 0;
	ds_map_destroy(map);
} else {
	ult_charge += 0.01;
}