/// @desc Hit a shootable
/// @arg healing-inst
/// @arg health
/// @arg show-healing
/// @arg play-sound*
function scShootableHeal() {

	var healable = argument[0];
	var heal = argument[1];
	var healed = 0; //Amount we actually healed
	var show = argument[2];
	var sound = argument_count > 3 ? (argument[3] != noone ? argument[3] : true ) : true;

	if (heal < 0) { //Negative health
		scShootableDamage(healable, noone, false, sound, abs(heal));
	}

	with (healable) {
		var map = shootable_map;
		for (var i = 0; i < heal; i++) {
			if (map[? SHOOTABLE_MAP.HEALTH_BASE_ORIGINAL] > map[? SHOOTABLE_MAP.HEALTH_BASE]) {
				map[? SHOOTABLE_MAP.HEALTH_BASE]++;
				healed++;
			} else if (map[? SHOOTABLE_MAP.HEALTH_ARMOR_ORIGINAL] > map[? SHOOTABLE_MAP.HEALTH_ARMOR]) {
				map[? SHOOTABLE_MAP.HEALTH_ARMOR]++;
				healed++;
			} else if (map[? SHOOTABLE_MAP.HEALTH_SHIELD_ORIGINAL] > map[? SHOOTABLE_MAP.HEALTH_SHIELD]) {
				map[? SHOOTABLE_MAP.HEALTH_SHIELD]++;
				healed++;
			}
		}
	
		if (map[? SHOOTABLE_MAP.HEALTH] > map[? SHOOTABLE_MAP.HEALTH_SHIELD_ORIGINAL])
			map[? SHOOTABLE_MAP.HEALTH_SHIELD] = map[? SHOOTABLE_MAP.HEALTH_SHIELD_ORIGINAL];
	
		//hp_scale += 2; //GUI hp scale
		//if (sound) {
			//scPlaySound(SOUND.EFFECT_HIT);
		//}
		//health_map[? HEALTH_MAP.DAMAGE] -= healed;
		health_map[? HEALTH_MAP.HEAL] += healed;
		health_map[? HEALTH_MAP.HEAL_TIME] = health_map[? HEALTH_MAP.SHOW_TIME];
		if (show && healed > 0) {
			with (instance_create_depth(x, y, depth - 1, oPartDamageNum)) {
				value_damage = healed;
				damage_type = DAMAGE_TYPE.HEALING;
			}
		}
	}

	return healed;


}
