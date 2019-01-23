var fileStr = scFileGetType(FILES.SETTINGS); //File name
if (!file_exists(fileStr)) exit; //No save file

ini_open(fileStr); //Open stream

//SOUNDS
var sec = "Sound";
global.vol_master = ini_read_real(sec, "master", global.vol_master);
global.vol_music = ini_read_real(sec, "music", global.vol_music);
global.vol_sounds = ini_read_real(sec, "effects", global.vol_sounds);

//KEYBINDS
sec = "Keybinds";
global.key_p1_jump = ini_read_real(sec, "p1_jump", global.key_p1_jump_default);
global.key_p1_left = ini_read_real(sec, "p1_left", global.key_p1_left_default);
global.key_p1_right = ini_read_real(sec, "p1_right", global.key_p1_right_default);
global.key_p1_shoot = ini_read_real(sec, "p1_shoot", global.key_p1_shoot_default);
global.key_p2_jump = ini_read_real(sec, "p2_jump", global.key_p2_jump_default);
global.key_p2_left = ini_read_real(sec, "p2_left", global.key_p2_left_default);
global.key_p2_right = ini_read_real(sec, "p2_right", global.key_p2_right_default);
global.key_p2_shoot = ini_read_real(sec, "p2_shoot", global.key_p2_shoot_default);

ini_close(); //Close stream