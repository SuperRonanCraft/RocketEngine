/// @desc 
if (keyboard_check_pressed(vk_space)) {
	with (my_player) {
		var _map = player_map[? PLAYER_MAP.CHARACTER_INFO];
		var char = _map[? CHARACTER_MAP.TYPE];
		char++;
		if (char >= CHARACTER.LENGTH)
			char = 0;
		scPlayerCharacterChange(char, false);
	}
}

if (my_player != noone && !instance_exists(oServer))
	if (my_player_x != my_player.x || my_player_y != my_player.y)
		scNetworkSendPosition(my_player.x, my_player.y);