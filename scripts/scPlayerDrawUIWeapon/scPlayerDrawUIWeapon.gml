function scPlayerDrawUIWeapon(argument0, argument1, argument2, argument3, argument4) {
	//DRAW PLAYER WEAPON/ULTIMATE
	///@arg x
	///@arg y
	///@arg buffer
	///@arg alpha
	///@arg team-respect

	if (!system_inventory) exit;

	//----------TEST SPRITE
	scDrawSpriteExt(RES_W - 4, RES_H - 4, sUIInventoryWeapon, 0);
	//----------TEST SPRITE

	var _inv_grid = inventory_map[? INVENTORY_MAP.GRID_WEAPON];
	var item_map = _inv_grid[# inventory_map[? INVENTORY_MAP.WEAPON_SELECTED], 0];
	if (item_map == noone) exit;
	var map = item_map[? ITEM_MAP.MAP];
	if (map == noone || map[? WEAPON_MAP.TYPE] == WEAPON_TYPE.NONE) exit;
	var _x = argument0;
	var _y = argument1;
	var _buffer = argument2;
	var _alpha = argument3;
	var _team_respect = argument4;

	exit;

	//The projectile sprite

	var sprite = scWeaponModifyGetType(map[? WEAPON_MAP.MODIFIER], WEAPON_MODIFIER_MAP.ICON);

	//determine side
	var xpos = _team_respect ? (team == TEAM.LEFT ? _x : RES_W - _x - 32 - _buffer) : _x;
	var ypos = _y;
	var c = c_dkgray;

	//Background
	//scDrawRect(xpos, ypos, xpos + 32 + _buffer * 2, ypos + 32 + _buffer * 2, c_gray, false, _alpha);
	scDrawNineSplice(sUIBox, xpos - 8, ypos - 8, xpos + 32 + _buffer * 2, ypos + 32 + _buffer * 2, _alpha, 0.8 * _alpha);

	//Buff of the weapon
	if (map[? WEAPON_MAP.GUI_BUFFS] != noone) {
		var buffsid = map[? WEAPON_MAP.GUI_BUFFS];
		var buffy = RES_H / 16;
		var buffx = xpos + (team == TEAM.LEFT ? 32 : -50);
		if (is_array(buffsid))
			for (var i = 0; i < array_length_1d(buffsid); i++) {
				var buff_map = ds_map_create();
				scBuffGet(buffsid[i], buff_map);
				if (buff_map[? BUFF_MAP.ENABLED]) {
					draw_sprite_ext(buff_map[? BUFF_MAP.ICON], 0, buffx, buffy, 0.3, 0.3, 0, c_white, map[? WEAPON_MAP.ENABLED] ? 0.5 : 0.2);
					buffx += (team == TEAM.LEFT ? 22 : -22);
				}
				ds_map_destroy(buff_map);
			}
		else {
			var buff_map = ds_map_create();
			scBuffGet(buffsid, buff_map);
			draw_sprite_ext(buff_map[? BUFF_MAP.ICON], 0, buffx, buffy, 0.3, 0.3, 0, c_white, map[? WEAPON_MAP.ENABLED] ? 0.5 : 0.2);
			ds_map_destroy(buff_map);
		}
	}
	
	//var xposcir = xpos + (team == TEAM.LEFT ? -(w / 8) : (w / 8));
	
	//WEAPON COOLDOWN
	if (map[? WEAPON_MAP.ENABLED] && global.play) {
		var cd = map[? WEAPON_MAP.AMMO] == 0 ? map[? WEAPON_MAP.RELOAD_TIME_ORIGINAL] : map[? WEAPON_MAP.COOLDOWN_TIME_ORIGINAL];
		var curr_cd = map[? WEAPON_MAP.AMMO] == 0 ? map[? WEAPON_MAP.RELOAD_TIME] : map[? WEAPON_MAP.COOLDOWN_TIME];
		var c = c_yellow;
		if (!map[? WEAPON_MAP.CHARGING]) {
			for (var i = 0; i < ds_list_size(buffs_map); i++) {
				//Grab the buff map
				var ds_list = buffs_map[| i];
				//Is the buff a cooldown?
				if (ds_list[? BUFF_MAP.TYPE] == BUFFTYPE.COOLDOWN)
					c = c_blue;
			}
		} else {
			c = c_fuchsia;
			cd = 1;
			curr_cd = map[? WEAPON_MAP.CHARGE];
		}
		
		scDrawPieRect(xpos + 16 + _buffer, ypos + 16 + _buffer, curr_cd, cd, c, 16 + _buffer, 0.8 * _alpha);
	}

	//WEAPON SPRITE EQUIPPED
	var scale = map[? WEAPON_MAP.GUI_WEAPON_SCALE];
	var _offset = (scale - 1) * 16;
	draw_sprite_ext(sprite, 0, xpos + _buffer - _offset, ypos + _buffer - _offset, scale / 2, scale / 2, 0, c_white, map[? WEAPON_MAP.ENABLED] ? _alpha : 0.3);
	//Make the scale smaller over time
	map[? WEAPON_MAP.GUI_WEAPON_SCALE] = max(map[? WEAPON_MAP.GUI_WEAPON_SCALE] * 0.95, 1);


}
