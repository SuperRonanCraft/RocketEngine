/// @arg setting
/// @arg value
function scSettingsCache(argument0, argument1) {

	var type = argument0;
	var val = argument1;
	var map = oSettingsHandler.settings_map;
	//show_debug_message("CACHING type = " + string(type) + " val = " + string(val));
	map[? scSettingsGetType(SETTINGS_TYPE.SECTION, type)] = val;


}
