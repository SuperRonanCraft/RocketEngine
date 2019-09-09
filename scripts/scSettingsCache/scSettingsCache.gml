/// @arg setting
/// @arg value

var type = argument0;
var val = argument1;
var map = oSettingsHandler.settings_map;
map[? scSettingsGetType(SETTINGS_TYPE.SECTION, type)] = val;