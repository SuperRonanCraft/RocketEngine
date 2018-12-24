/// @desc dont spawn above another
if (checked) exit; //Checked already? Exit
if (place_meeting(x, y, object_get_parent(object_index)))
	instance_destroy();
checked = true;