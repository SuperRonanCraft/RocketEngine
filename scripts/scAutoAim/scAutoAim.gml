
var obj = instance_furthest(x, y, object_index);
var dis = distance_to_object(obj);
for (var i = 0; i < instance_number(object_index); i++) {
	if (instance_find(object_index, i) != id) {
		var cur_obj = instance_furthest(x, y, object_index);
		var cur_dis = distance_to_object(cur_obj);
		if (cur_dis < dis) {
			dis = cur_dis;
			obj = cur_obj;
		}
	}
}

return obj.x - x > 0 ? 0 : 180;