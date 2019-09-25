///@desc Change a players palette
///@arg palette

var index = argument0;
var map = player_map[? PLAYER_MAP.CHARACTER_INFO];
map[? CHARACTER_MAP.PALETTE_INDEX] = index;
var value = map[? CHARACTER_MAP.PALETTE_INDEX];
//var value = [map[? CHARACTER_MAP.TYPE], map[? CHARACTER_MAP.PALETTE_INDEX]];

for (var i = 0; i < instance_number(object_index); i++)
	if (instance_find(object_index, i) == self) {
		switch (i) {
			case 0:
				scSettingsCache(SETTINGS.PLAYER_1_PALETTE, value);
				break;
			case 1:
				scSettingsCache(SETTINGS.PLAYER_2_PALETTE, value);
				break;
			case 2:
				scSettingsCache(SETTINGS.PLAYER_3_PALETTE, value);
				break;
			case 3:
				scSettingsCache(SETTINGS.PLAYER_4_PALETTE, value);
				break;
			default: show_debug_message("No Player #" + string(i + 2))
		}
		break;
	}