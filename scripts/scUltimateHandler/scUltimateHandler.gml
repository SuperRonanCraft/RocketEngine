if (!ult_enabled || rocket_map[? ROCKET_MAP.ULTIMATE] == ULTIMATE.NONE) exit; //Is the system even enabled?

if (ult_charge < ult_charge_max) {scUltimateAddCharge(DAMAGETYPE.TIME); exit;} //Give charge by time, exit

var key_shoot = scKeybindsGet(KEYBIND_TYPE.ULT); //Holding both left and right keys to cast ult

if (player_aimode == 1 && aiBrain != noone){
	key_shoot = aiBrain.AIUlt;	
}

var shoot = false;

if (key_shoot) { //Shoot key being held down
	if (ult_casting) {
		if (ult_cast_time <= 0)
			shoot = true;
		else
			ult_cast_time--;
		//current_cd = rocket_map[? ROCKET_MAP.COOLDOWN]; //Reset rocket cooldown
		if (ult_casting_map[? ULTIMATE_MAP.SCRIPT_CASTING_STEP] != noone)
			script_execute(ult_casting_map[? ULTIMATE_MAP.SCRIPT_CASTING_STEP]); //Casting an ult but not calling one (pre-animation?)
	} else {
		//if (!keyboard_check_pressed(keyleft) && !keyboard_check_pressed(keyright)) exit; //Did we JUST press the shoot key?
		var ult = rocket_map[? ROCKET_MAP.ULTIMATE];
		if (ult != ult_casting_last) { //New ultimate being casted?
			var map = ds_map_create(); //Create an ult map
			scUltimateGet(ult, map); //Grab the ult map
			/*ult_cast_time = map[? ULTIMATE_MAP.CAST_TIME];
			ult_casting_step = map[? ULTIMATE_MAP.SCRIPT_CASTING_STEP];
			ult_casting_draw = map[? ULTIMATE_MAP.SCRIPT_CASTING_DRAW];
			ult_casting_last = ult; //The last ult we were casting*/
			ds_map_clear(ult_casting_map);
			ds_map_copy(ult_casting_map, map);
			ult_cast_time = ult_casting_map[? ULTIMATE_MAP.CAST_TIME];
			ult_cast_time_max = ult_cast_time;
			ult_casting_last = ult;
			ds_map_destroy(map); //Delete the ult map
		}
		ult_casting = true; //Run this only once
		exit;
	}
} else {
	//Reset casting
	ult_casting = false;
	if (ult_cast_time < ult_cast_time_max)
		ult_cast_time += 1;
}

if (!shoot) exit; //Not shooting but we still have full ult charge!

var map = ult_casting_map; //Create an ult map
//scUltimateGet(ult_casting_last, map); //Grab the ult map

if (map[? ULTIMATE_MAP.CASTED_SCRIPT] != noone)
	script_execute(map[? ULTIMATE_MAP.CASTED_SCRIPT], !shoot_face ? (team == TEAM.LEFT ? 0 : 180) : (facing == 1 ? 0 : 180), map); //Run the ult script, no arguments as the player is the shooter
if (map[? ULTIMATE_MAP.CASTED_OBJECT] != noone)
	with (instance_create_depth(x, y, depth + map[? ULTIMATE_MAP.CASTED_DEPTH], map[? ULTIMATE_MAP.CASTED_OBJECT]))
		owner = other;
ult_casted_draw = map[? ULTIMATE_MAP.CASTED_SCRIPT_DRAW];
ult_charge = 0; //Reset the ult charge
scPlaySound(map[? ULTIMATE_MAP.SOUND_CAST]); //Play the cast sound

//No longer casting
ult_casting = false;
ult_cast_time = ult_cast_time_max; //Reset for a new chargeup