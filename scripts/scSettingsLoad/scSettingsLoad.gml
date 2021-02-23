function scSettingsLoad() {
	ini_open(scFileGetType(FILES.SETTINGS)); //Open stream

	//SOUNDS
	var sec = "Sound";
	global.vol_master = ini_read_real(sec, "master", global.vol_master);
	global.vol_music = ini_read_real(sec, "music", global.vol_music);
	global.vol_sounds = ini_read_real(sec, "effects", global.vol_sounds);

	//GRAPHICS
	global.pause_onfocus = ini_read_real(sec, "pause_onfocus", global.pause_onfocus);
	global.setting_controller_error = ini_read_real(sec, "controller_error", global.setting_controller_error);

	//CACHE
	var map = oSettingsHandler.settings_map;
	sec = scSettingsGetType(SETTINGS_TYPE.SECTION, SETTINGS.SECTION);
	for (var i = 0; i < SETTINGS.SECTION; i++) {
		var val = scSettingsGetType(SETTINGS_TYPE.SECTION, i);
		var def = scSettingsGetType(SETTINGS_TYPE.DEFAULT, i);
		map[? val] = ini_read_real(sec, val, def);
	}

	ini_close(); //Close stream


}
