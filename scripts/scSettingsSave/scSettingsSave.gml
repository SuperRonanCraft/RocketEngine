var fileStr = scFileGetType(FILES.SETTINGS); //File name
if (file_exists(fileStr)) file_delete(fileStr); //Delete the last save file

ini_open(fileStr); //Open stream

//SOUNDS
var sec = "Sound";
ini_write_real(sec, "master", global.vol_master);
ini_write_real(sec, "music", global.vol_music);
ini_write_real(sec, "effects", global.vol_sounds);

//KEYBINDS
sec = "Keybinds";
ini_write_real(sec, "p1_jump", global.key_p1_jump);
ini_write_real(sec, "p1_left", global.key_p1_left);
ini_write_real(sec, "p1_right", global.key_p1_right);
ini_write_real(sec, "p1_shoot", global.key_p1_shoot);
ini_write_real(sec, "p2_jump", global.key_p2_jump);
ini_write_real(sec, "p2_left", global.key_p2_left);
ini_write_real(sec, "p2_right", global.key_p2_right);
ini_write_real(sec, "p2_shoot", global.key_p2_shoot);

//GRAPHICS
ini_write_real(sec, "pause_onfocus", global.pause_onfocus);

//CACHE
sec = scSettingsGetType(SETTINGS_TYPE.SECTION, SETTINGS.SECTION);
for (var i = 0; i < SETTINGS.SECTION; i++) {
	var key = scSettingsGetType(SETTINGS_TYPE.SECTION, i);
	var val = scSettingsGetType(SETTINGS_TYPE.VALUE, i);
	ini_write_real(sec, key, val);
}

ini_close(); //Close stream