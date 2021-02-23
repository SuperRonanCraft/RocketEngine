function scAutoAim() {

	//var index = object_get_parent(object_index) != -100 ? object_get_parent(object_index) : object_index;
	var index = pEntity;
	var obj = instance_furthest(x, y, index);
	var dis = distance_to_object(obj);
	for (var i = 0; i < instance_number(index); i++) {
		var cur_obj = instance_find(index, i);
		if (cur_obj != id && cur_obj.shootable_map[? SHOOTABLE_MAP.HEALTH] >= 0) {
			var cur_dis = distance_to_object(cur_obj);
			if (cur_dis < dis) {
				dis = cur_dis;
				obj = cur_obj;
			}
		}
	}

	if (obj != noone && obj != id)
		return obj.x - x > 0 ? 0 : 180;
	else
		return facing == 1 ? 0 : 180;


}
