/// @desc Apply Dev Mode Options

//Apply buffs
var _map = tab_map;
if (_map[? "players"] != noone) {
	var _ps = _map[? "players"];
	for (var i = 0; i < array_length_1d(_ps); i++) //Preview who to affect (red dot above head)
		with (_ps[i])
			scDrawCircle(x, bbox_top, 5, c_red, false, 0.5);
	if (_map[? "apply"]) { //Apply Option
		if (tab != -1) {
			for (var i = 0; i < array_length_1d(_ps); i++)
			with (_ps[i]) //Apply whatever we need in current tab
				switch (other.tab) {
					case 1: //BUFFS
						scBuffAdd(_map[? "buffs_type"], id, id);
						break;
					case 2: //WEAPONS
						scWeaponModify(_ps[i], _map[? "weapon_type"]);
						break;
					case 3: //MOVEMENT
						//Handled in Event User 4
						break;
				}
		}
		_map[? "apply"] = false;
	}
}
//Add player to list
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