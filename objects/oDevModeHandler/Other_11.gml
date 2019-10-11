/// @desc Buffs Draw

if (ds_map_empty(tab_map)) {
	tab_map[? "players"] = noone;
	tab_map[? "apply"] = false;
	tab_map[? "type"] = noone;
} else { //Apply buffs
	var _map = tab_map;
	if (_map[? "players"] != noone) {
		var _ps = _map[? "players"];
		for (var i = 0; i < array_length_1d(_ps); i++)
			with (_ps[i])
				scDrawCircle(x, bbox_top - 20, 5, c_red, false, 0.5);
		if (_map[? "apply"]) {
			for (var i = 0; i < array_length_1d(_ps); i++)
				with (_ps[i])
					scBuffAdd(_map[? "type"], id, id);
			_map[? "apply"] = false;
		}
	}
	with (oPlayer) {
		var _b = 32;
		if (mouse_x > bbox_left - _b && mouse_x < bbox_right + _b)
			if (mouse_y > bbox_top - _b && mouse_y < bbox_bottom + _b) {
				if (mouse_check_button_pressed(mb_left)) {
					var _ps = _map[? "players"];
					if (_ps == noone)
						_ps[0] = id;
					else {
						var found = false;
						for (var i = 0; i < array_length_1d(_ps); i++)
							if (_ps[i] == id) {
								found = true; break;
							}
						if (!found)
							_ps[array_length_1d(_ps)] = id;
						else {
							var _psNEW = noone;
							var index = 0;
							for (var i = 0; i < array_length_1d(_ps); i++) {
								if (_ps[i] != id) {
									_psNEW[index] = _ps[i];
									index++;
								}
							}
							_ps = _psNEW;		
						}
					}
					_map[? "players"] = _ps;
				}
			}
	}
}