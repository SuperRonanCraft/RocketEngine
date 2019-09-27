///@arg weapon-modifier
var modifier = argument0;

var type = weapon_map[? WEAPON_MAP.TYPE];
var weapon = noone;
switch (type) {
	case WEAPON.ROCKET:
		switch (modifier) {
			case WEAPON_MODIFIER.DEFAULT: weapon = ROCKET.DEFAULT; break;
			case WEAPON_MODIFIER.ICE: weapon = ROCKET.ICE; break;
			case WEAPON_MODIFIER.FIRE: weapon = ROCKET.FIRE; break;
			case WEAPON_MODIFIER.PORTAL: weapon = ROCKET.TELEPORT; break;
			case WEAPON_MODIFIER.MAGNET: weapon = ROCKET.MAGNET; break;
			case WEAPON_MODIFIER.SHOTGUN: weapon = ROCKET.SHOTGUN; break;
			case WEAPON_MODIFIER.SLIME: weapon = ROCKET.SLIME; break;
			case WEAPON_MODIFIER.BRICK: weapon = ROCKET.BRICK; break;
			case WEAPON_MODIFIER.SAND: weapon = ROCKET.SAND; break;
			case WEAPON_MODIFIER.METAL: weapon = ROCKET.SPIKED; break;
			case WEAPON_MODIFIER.ELECTRIC: weapon = ROCKET.LIGHTNING; break;
			default: weapon = noone; break;
		}
		break;
	case WEAPON.SHURIKEN:
		switch (modifier) {
			case WEAPON_MODIFIER.DEFAULT: weapon = SHURIKEN.DEFAULT; break;
			case WEAPON_MODIFIER.ICE: weapon = SHURIKEN.ICE; break;
			case WEAPON_MODIFIER.FIRE: weapon = SHURIKEN.FIRE; break;
			case WEAPON_MODIFIER.PORTAL: weapon = SHURIKEN.PORTAL; break;
			case WEAPON_MODIFIER.MAGNET: weapon = SHURIKEN.MAGNET; break;
			case WEAPON_MODIFIER.SLIME: weapon = SHURIKEN.SLIME; break;
			case WEAPON_MODIFIER.BRICK: weapon = SHURIKEN.BRICK; break;
			case WEAPON_MODIFIER.SAND: weapon = SHURIKEN.SAND; break;
			case WEAPON_MODIFIER.SHOTGUN: weapon = SHURIKEN.SHOTGUN; break;
			case WEAPON_MODIFIER.METAL: weapon = SHURIKEN.METAL; break;
			case WEAPON_MODIFIER.ELECTRIC: weapon = SHURIKEN.ELECTRIC; break;
			default: weapon = noone; break;
		}
		break;
	default: weapon = noone;
}

return weapon;

enum WEAPON_MODIFIER {
	DEFAULT, ICE, FIRE, PORTAL, MAGNET,
	SHOTGUN, SLIME, BRICK, SAND, METAL,
	ELECTRIC,
	//keep last
	LENGTH
}