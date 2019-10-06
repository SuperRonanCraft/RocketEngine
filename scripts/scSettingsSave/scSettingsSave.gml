var fileStr = scFileGetType(FILES.SETTINGS); //File name
//if (file_exists(fileStr)) file_delete(fileStr); //Delete the last save file

ini_open(fileStr); //Open stream

//SOUNDS
var sec = "Sound";
ini_write_real(sec, "master", global.vol_master);
ini_write_real(sec, "music", global.vol_music);
ini_write_real(sec, "effects", global.vol_sounds);

//GRAPHICS
ini_write_real(sec, "pause_onfocus", global.pause_onfocus);
ini_write_real(sec, "controller_error", global.setting_controller_error);

//CACHE
sec = scSettingsGetType(SETTINGS_TYPE.SECTION, SETTINGS.SECTION);
for (var i = 0; i < SETTINGS.SECTION; i++) {
	if (!scSettingsGetType(SETTINGS_TYPE.SAVE, i)) continue; //Dont cache this value
	var key = scSettingsGetType(SETTINGS_TYPE.SECTION, i);
	var val = scSettingsGetType(SETTINGS_TYPE.VALUE, i);
	if (key != noone)
		ini_write_real(sec, key, val);
}

ini_close(); //Close stream