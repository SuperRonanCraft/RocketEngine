//mask_index = sPlatform;
if (x != x_original)
	if (x > (x_original + x_max) || x < (x_original - y_max))
		hsp = -hsp;
if (y != y_original)
	if (y > (y_original + y_max) || y < (y_original - y_max))
		vsp = -vsp;
x += hsp;
y += vsp;

event_inherited();

/*
var list = ds_list_create();
var obj = instance_place_list(x, y - 1, oPlayer, list, true);
if (obj > 0)
	for (var i = 0; i < obj; i++)
		with (list[| i]) {
			gravity_map[? GRAVITY_MAP.HSP_PUSH] = other.hsp;
			gravity_map[? GRAVITY_MAP.VSP_PUSH] = other.vsp;
		}
ds_list_destroy(list);