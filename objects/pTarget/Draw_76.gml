/// @desc dont spawn above another
if (place_meeting(x, y, object_get_parent(object_index)))
	instance_destroy();