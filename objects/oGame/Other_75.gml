/// @desc 
//if (event_type == "gamepad discovered")
if (async_load[? "event_type"] == "gamepad discovered") { //This controller was connected
	var index = async_load[? "pad_index"];
	if (index < 4)
		show_debug_message("+ Gamepad #" + string(index) + " was connected!");
	else {
		show_debug_message("+ Gamepad #" + string(index) + " was connected, but declined as a valid controller!");
		exit;
	}
	ds_list_add(controllers, index);
	with (oTips) {
		ds_list_add(not_text, "&aController #" + string(index + 1) + " was connected!");
		event_user(1);
	}
	var pads = [SETTINGS.PLAYER_1_GAMEPAD, SETTINGS.PLAYER_2_GAMEPAD, 
		SETTINGS.PLAYER_3_GAMEPAD, SETTINGS.PLAYER_4_GAMEPAD];
	for (var cur = 0; cur < array_length_1d(pads); cur++) //Remove duplicate gamepads
		for (var a = 0; a < array_length_1d(pads); a++)
			if (pads[a] != pads[cur] && scSettingsGetType(SETTINGS_TYPE.VALUE, pads[a]) != noone)
				if (scSettingsGetType(SETTINGS_TYPE.VALUE, pads[a]) == 
					scSettingsGetType(SETTINGS_TYPE.VALUE, pads[cur])) //Current gamepad equals another gamepad
					scSettingsCache(pads[a], noone);
	//Assign controller to next player
	for (var i = 0; i < array_length_1d(pads); i++) {
		var pad = scSettingsGetType(SETTINGS_TYPE.VALUE, pads[i]);
		if (!gamepad_is_connected(pad)) {
			var found = false;
			for (var a = 0; a < array_length_1d(pads); a++) {
				if (a != i && scSettingsGetType(SETTINGS_TYPE.VALUE, pads[a]) == index) {
					found = true; break; //This controller is already assigned!
				}
			}
			if (!found)
				scSettingsCache(pads[i], index);
			break;
		}
	}
	with (pUICore)
		button_gamepad = scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_1_GAMEPAD);
} else if (async_load[? "event_type"] == "gamepad lost") {
	var index = async_load[? "pad_index"];
	show_debug_message("- Gamepad #" + string(index) + " was lost!");
	ds_list_delete(controllers, ds_list_find_index(controllers, index));
	if (global.setting_controller_error) {
		if (instance_exists(pGMM))
			with (pGMM)
				event_user(10);
		event_user(2);
		global.gamepad_error = true;
		if (!instance_exists(oUIGamepadLost))
			instance_create_depth(0, 0, -1000, oUIGamepadLost);
	}
	with (oTips) {
		ds_list_add(not_text, "&cController #" + string(index + 1) + " was disconnected!");
		event_user(1);
	}
}