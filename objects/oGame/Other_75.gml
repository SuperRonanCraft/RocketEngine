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
	scControllersAdd(index);
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