/// @desc
if (!checked) {
	if (place_meeting(x, y, oWall)) {
		var wlist = ds_list_create();
		instance_place_list(x, y, oWall, wlist, false);
		for (var i = 0; i < ds_list_size(wlist); i++)
			instance_destroy();
	}
	checked = true;
}
draw_self();