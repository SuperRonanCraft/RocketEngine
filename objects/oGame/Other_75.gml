/// @desc 
//if (event_type == "gamepad discovered")
if (async_load[? "event_type"] == "gamepad discovered") { //This controller was connected
	var index = async_load[? "pad_index"];
	show_debug_message("+ Gamepad #" + string(index) + " was connected!");
	ds_list_add(controllers, index);
	/*var pads = [SETTINGS.PLAYER_1_GAMEPAD, SETTINGS.PLAYER_2_GAMEPAD, 
		SETTINGS.PLAYER_3_GAMEPAD, SETTINGS.PLAYER_4_GAMEPAD];
	for (var cur = 0; cur < array_length_1d(pads); cur++) {
		for (var a = 0; a < array_length_1d(pads); a++)
			if (a != cur)
				if (scSettingsGetType(SETTINGS_TYPE.VALUE, a) == 
					scSettingsGetType(SETTINGS_TYPE.VALUE, cur)) //Current gamepad equals another gamepad
					
	}*/
} else if (async_load[? "event_type"] == "gamepad lost") {
	var index = async_load[? "pad_index"];
	show_debug_message("- Gamepad #" + string(index) + " was lost!");
	ds_list_delete(controllers, ds_list_find_index(controllers, index));
	if (instance_exists(pGMM))
		with (pGMM)
			event_user(10);
	if (!instance_exists(oUIGamepadLost))
		instance_create_depth(0, 0, -1000, oUIGamepadLost);
}