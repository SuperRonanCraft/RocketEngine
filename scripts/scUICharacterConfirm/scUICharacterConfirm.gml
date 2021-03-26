function scUICharacterConfirm() {
	//@arg force-confirm
	var force = argument[0];

	selected = true;
	var all_selected = true;

	with (object_index)
		if (!selected)
			all_selected = false;

	if (all_selected || force) {
		if (force)
			with (oPlayer) { //random character
				var val = irandom_range(0, CHARACTER.LENGTH - 1);
				scPlayerCharacterChange(val);
				scPlayerLoadModifiers(id);
			}
		
		with (oPlayer) { //Save last character selected
			var _map = player_map[? PLAYER_MAP.CHARACTER_INFO];
				for (var i = 0; i < instance_number(oPlayer); i++) {
					if (instance_find(oPlayer, i) == id) {
						switch (i) {
							case 0: //First Player
								if (!player_aimode) {
									global.last_character_p1 = _map[? CHARACTER_MAP.TYPE];
									global.last_pallet_p1 = _map[? CHARACTER_MAP.PALETTE_INDEX];
								} else {
									global.last_character_p1 = noone;
									global.last_pallet_p1 = noone;
								}
								break;
							case 1: //Second Player
								if (!player_aimode) {
									global.last_character_p2 = _map[? CHARACTER_MAP.TYPE];
									global.last_pallet_p2 = _map[? CHARACTER_MAP.PALETTE_INDEX];
								} else {
									global.last_character_p2 = noone;
									global.last_pallet_p2 = noone;
								}
								break;
						}
					}
				}
		}
		
		with (pGMM)
			timer_enabled = true;
		if (force)
			with (object_index)
				instance_destroy();
		else
			with (object_index)
				char_animate = true;
		with (oPlayer)
			image_alpha = 1;
	}


}
