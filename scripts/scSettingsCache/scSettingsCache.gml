/// @arg setting
/// @arg value

var type = argument0;
var val = argument1;
var map = oSettingsHandler.settings_map;
show_debug_message("CACHING " + string(val));
map[? scSettingsGetType(SETTINGS_TYPE.SECTION, type)] = val;