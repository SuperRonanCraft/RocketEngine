/// @desc

var p = ds_map_find_first(respawns);
for (var i = 0; i <	ds_map_size(respawns); i++) {
	if (i != 0)
		p = ds_map_find_next(respawns, p);
	if (!instance_exists(p)) {ds_map_delete(respawns, p); break;}
	var time = respawns[? p];
	if (time <= 0) {
		p.image_alpha = 1;
		p.shootable_map[? SHOOTABLE_MAP.CAN_INTERACT] = true;
		ds_map_delete(respawns, p);
		break;
	} else
		respawns[? p]--;
}
