/// @desc Hit a shootable
/// @arg healing-inst
/// @arg health
/// @arg play-sound

var healable = argument[0];
var heal = argument[1];
var healed = 0; //Amount we actually healed
var sound = argument[2];

with (healable) {
	var map = shootable_map;
	for (var i = 0; i < heal; i++) {
		if (map[? SHOOTABLE_MAP.HEALTH_ORIGINAL] > map[? SHOOTABLE_MAP.HEALTH]) {
			map[? SHOOTABLE_MAP.HEALTH]++;
			healed++;
		}
	}
	hp_scale += 2; //GUI hp scale
	//if (sound)
	//	scPlaySound(SOUND.EFFECT_HIT);
	with (instance_create_depth(x, y, depth - 1, oPartDamageNum)) {
		value_damage = healed;
		damage_type = DAMAGETYPE.HEALING;
	}
}

return healed;