function scUltimateHandler() {
	if (!system_ultimate) exit;
	var map = ultimate_map;

	if (local_player) {
		var _old_key_ult = key_ult;
		key_ult = scKeybindsGet(KEYBIND.ULT);
		if (_old_key_ult != key_ult)
			scNetworkSendKey(KEYBIND.ULT, key_ult);
	}

	var char_map = player_map[? PLAYER_MAP.CHARACTER_INFO];

	if (!map[? ULTIMATE_CASTING_MAP.ENABLED] || !player_map[? PLAYER_MAP.CAN_CONTROL] || char_map[? CHARACTER_MAP.ULTIMATE] == ULTIMATE_TYPE.NONE) exit; //Is the system even enabled?

	if (map[? ULTIMATE_CASTING_MAP.CHARGE] < map[? ULTIMATE_CASTING_MAP.CHARGE_MAX]) {scUltimateAddCharge(id, DAMAGE_TYPE.TIME); exit;} //Give charge by time, exit

	if (player_aimode == 1 && aiBrain != noone)
		key_ult = aiBrain.AIUlt;

	var shoot = false;

	if (key_ult) { //Shoot key being held down
		if (map[? ULTIMATE_CASTING_MAP.CASTING]) {
			//if (map[? ULTIMATE_CASTING_MAP.CAST_TIME] <= 0)
				shoot = true;
			//else
				//map[? ULTIMATE_CASTING_MAP.CAST_TIME]--;
			//current_cd = rocket_map[? ROCKET_MAP.COOLDOWN]; //Reset rocket cooldown
			//var casting_map = map[? ULTIMATE_CASTING_MAP.CASTING_MAP];
			//if (casting_map[? ULTIMATE_MAP.SCRIPT_CASTING_STEP] != noone)
			//	script_execute(casting_map[? ULTIMATE_MAP.SCRIPT_CASTING_STEP]); //Casting an ult but not calling one (pre-animation?)
		} else {
			//if (!keyboard_check_pressed(keyleft) && !keyboard_check_pressed(keyright)) exit; //Did we JUST press the shoot key?
			var ult = char_map[? CHARACTER_MAP.ULTIMATE];
			if (ult != map[? ULTIMATE_CASTING_MAP.CASTING_LAST]) { //New ultimate being casted?
				var ult_map = ds_map_create(); //Create an ult map
				scUltimateGet(ult, ult_map); //Grab the ult map
				/*ult_cast_time = map[? ULTIMATE_MAP.CAST_TIME];
				ult_casting_step = map[? ULTIMATE_MAP.SCRIPT_CASTING_STEP];
				ult_casting_draw = map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW];
				ult_casting_last = ult; //The last ult we were casting*/
				ds_map_clear(map[? ULTIMATE_CASTING_MAP.CASTING_MAP]);
				ds_map_copy(map[? ULTIMATE_CASTING_MAP.CASTING_MAP], ult_map);
				map[? ULTIMATE_CASTING_MAP.CAST_TIME] = ult_map[? ULTIMATE_MAP.CAST_TIME];
				map[? ULTIMATE_CASTING_MAP.CAST_TIME_ORIGINAL] = map[? ULTIMATE_CASTING_MAP.CAST_TIME];
				map[? ULTIMATE_CASTING_MAP.CASTING_LAST] = ult;
				ds_map_destroy(ult_map); //Delete the ult map
			}
			//map[? ULTIMATE_CASTING_MAP.CASTING] = true; //Run this only once **DEBUGGED**
			shoot = true;
			//exit;
		}
	} else {
		//Reset casting
		map[? ULTIMATE_CASTING_MAP.CASTING] = false;
		if (map[? ULTIMATE_CASTING_MAP.CAST_TIME] < map[? ULTIMATE_CASTING_MAP.CAST_TIME_ORIGINAL])
			map[? ULTIMATE_CASTING_MAP.CAST_TIME] += 1;
	}

	if (!shoot) exit; //Not shooting but we still have full ult charge!

	var ult_map = map[? ULTIMATE_CASTING_MAP.CASTING_MAP]; //Create an ult map
	//scUltimateGet(ult_casting_last, map); //Grab the ult map
	if (ult_map[? ULTIMATE_MAP.CASTED_SCRIPT] != noone) {
		var dir = team != TEAM.NONE ? (team == TEAM.LEFT ? 0 : 180) : (facing == 1 ? 0 : 180);
		if (auto_aim)
			dir = scAutoAim();
		script_execute(ult_map[? ULTIMATE_MAP.CASTED_SCRIPT], dir, ult_map); //Run the ult script, direction and ult map
	}
	if (ult_map[? ULTIMATE_MAP.CASTED_OBJECT] != noone)
		with (instance_create_depth(x, y, depth + ult_map[? ULTIMATE_MAP.CASTED_DEPTH], ult_map[? ULTIMATE_MAP.CASTED_OBJECT]))
			owner = other;
	map[? ULTIMATE_CASTING_MAP.CASTED_DRAW] = ult_map[? ULTIMATE_MAP.CASTED_SCRIPT_DRAW];
	map[? ULTIMATE_CASTING_MAP.CHARGE] = 0; //Reset the ult charge
	scPlaySound(ult_map[? ULTIMATE_MAP.SOUND_CAST]); //Play the cast sound

	//No longer casting
	map[? ULTIMATE_CASTING_MAP.CASTING] = false;
	map[? ULTIMATE_CASTING_MAP.CAST_TIME] = map[? ULTIMATE_CASTING_MAP.CAST_TIME_ORIGINAL]; //Reset for a new chargeup

	if (track_stats)
		scStatsCacheAddGeneral(STATISTICS_GENERAL.ULTIMATES_CASTED, 1);

	key_ult = false;


}
