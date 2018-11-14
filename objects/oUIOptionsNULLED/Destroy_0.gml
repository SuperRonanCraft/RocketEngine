/// @desc Destory objects
for (var i = 0; i < obj_items; i++)
	if (obj_created[i]) {
		obj_created[i] = false;
		instance_destroy(obj[i]);
	}