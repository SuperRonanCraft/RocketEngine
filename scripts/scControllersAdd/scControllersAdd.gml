///@arg index 
function scControllersAdd(argument0) {
	var index = argument0;
	var pads = [SETTINGS.PLAYER_3_GAMEPAD, SETTINGS.PLAYER_4_GAMEPAD];
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


}
