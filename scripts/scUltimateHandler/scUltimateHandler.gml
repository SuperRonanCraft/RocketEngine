var map = ultimate_map;

if (!map[? ULTIMATE_CASTING_MAP.ENABLED] || !playerMap[? PLAYER_MAP.CAN_CONTROL] || weapon_map[? WEAPON_MAP.ULTIMATE] == ULTIMATE.NONE) exit; //Is the system even enabled?

if (map[? ULTIMATE_CASTING_MAP.CHARGE] < map[? ULTIMATE_CASTING_MAP.CHARGE_MAX]) {scUltimateAddCharge(id, DAMAGETYPE.TIME); exit;} //Give charge by time, exit

var key_shoot = scKeybindsGet(KEYBIND_TYPE.ULT); //Holding both left and right keys to cast ult

if (player_aimode == 1 && aiBrain != noone)
	key_shoot = aiBrain.AIUlt;

var shoot = false;

if (key_shoot) { //Shoot key being held down
	if (map[? ULTIMATE_CASTING_MAP.CASTING]) {
		if (map[? ULTIMATE_CASTING_MAP.CAST_TIME] <= 0)
			shoot = true;
		else
			map[? ULTIMATE_CASTING_MAP.CAST_TIME]--;
		//current_cd = rocket_map[? ROCKET_MAP.COOLDOWN]; //Reset rocket cooldown
		var casting_map = map[? ULTIMATE_CASTING_MAP.CASTING_MAP];
		if (casting_map[? ULTIMATE_MAP.SCRIPT_CASTING_STEP] != noone)
			script_execute(casting_map[? ULTIMATE_MAP.SCRIPT_CASTING_STEP]); //Casting an ult but not calling one (pre-animation?)
	} else {
		//if (!keyboard_check_pressed(keyleft) && !keyboard_check_pressed(keyright)) exit; //Did we JUST press the shoot key?
		var ult = weapon_map[? WEAPON_MAP.ULTIMATE];
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
			map[? ULTIMATE_CASTING_MAP.CAST_TIME_MAX] = map[? ULTIMATE_CASTING_MAP.CAST_TIME];
			map[? ULTIMATE_CASTING_MAP.CASTING_LAST] = ult;
			ds_map_destroy(ult_map); //Delete the ult map
		}
		map[? ULTIMATE_CASTING_MAP.CASTING] = true; //Run this only once
		exit;
	}
} else {
	//Reset casting
	map[? ULTIMATE_CASTING_MAP.CASTING] = false;
	if (map[? ULTIMATE_CASTING_MAP.CAST_TIME] < map[? ULTIMATE_CASTING_MAP.CAST_TIME_MAX])
		map[? ULTIMATE_CASTING_MAP.CAST_TIME] += 1;
}

if (!shoot) exit; //Not shooting but we still have full ult charge!

var map = map[? ULTIMATE_CASTING_MAP.CASTING_MAP]; //Create an ult map
//scUltimateGet(ult_casting_last, map); //Grab the ult map

if (map[? ULTIMATE_MAP.CASTED_SCRIPT] != noone)
	script_execute(map[? ULTIMATE_MAP.CASTED_SCRIPT], !shoot_face ? (team == TEAM.LEFT ? 0 : 180) : (facing == 1 ? 0 : 180), map); //Run the ult script, no arguments as the player is the shooter
if (map[? ULTIMATE_MAP.CASTED_OBJECT] != noone)
	with (instance_create_depth(x, y, depth + map[? ULTIMATE_MAP.CASTED_DEPTH], map[? ULTIMATE_MAP.CASTED_OBJECT]))
		owner = other;
map[? ULTIMATE_CASTING_MAP.CASTED_DRAW] = map[? ULTIMATE_MAP.CASTED_SCRIPT_DRAW];
map[? ULTIMATE_CASTING_MAP.CHARGE] = 0; //Reset the ult charge
scPlaySound(map[? ULTIMATE_MAP.SOUND_CAST]); //Play the cast sound

//No longer casting
map[? ULTIMATE_CASTING_MAP.CASTING] = false;
map[? ULTIMATE_CASTING_MAP.CAST_TIME] = map[? ULTIMATE_CASTING_MAP.CAST_TIME_MAX]; //Reset for a new chargeup

if (track_stats)
	scStatsCacheAddGeneral(STATISTICS_GENERAL.ULTIMATES_CASTED, 1);