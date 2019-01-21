var list = ds_list_create();
collision_rectangle_list(x - 10, y, x + 10, 0, oPlayer, false, false, list, false);
for (var i = 0; i < ds_list_size(list); i++) {
	var p = list[| i];
	if (p.team != parent.team)
		ds_list_add(hitList, p);
}
