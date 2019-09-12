///@arg player
///@arg weapon-modifier
var player = argument0
var modifier = argument1;

with (player) {
	var type = weapon_map[? WEAPON_MAP.TYPE];
	var weapon = noone;
	switch (type) {
		case WEAPON.ROCKET:
			switch (modifier) {
				case WEAPON_MODIFIER.DEFAULT: weapon = ROCKET.DEFAULT; break;
				case WEAPON_MODIFIER.ICE: weapon = ROCKET.ICE; break;
				case WEAPON_MODIFIER.FIRE: weapon = ROCKET.FIRE; break;
				default: weapon = noone; break;
			}
			if (weapon != noone)
				scRocketChange(weapon);
			break;
		case WEAPON.SHURIKEN:
			switch (modifier) {
				default: weapon = noone; break;
			}
			if (weapon != noone)
				scShurikenChange(weapon);
			break;
		default: weapon = noone;
	}
}

enum WEAPON_MODIFIER {
	DEFAULT, ICE, FIRE,
	//keep last
	LENGTH
}