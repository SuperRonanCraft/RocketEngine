///@arg modifier
///@arg weapon-map
function scWeaponModifyGetWeapon(argument0, argument1) {
	var modifier = argument0;
	var _map = argument1;

	var type = _map[? WEAPON_MAP.TYPE];
	var weapon = noone;
	switch (type) {
		case WEAPON_TYPE.ROCKET:
			switch (modifier) {
				case WEAPON_MODIFIER.DEFAULT: weapon = WEAPON_ROCKET_TYPE.DEFAULT; break;
				case WEAPON_MODIFIER.ICE: weapon = WEAPON_ROCKET_TYPE.ICE; break;
				case WEAPON_MODIFIER.FIRE: weapon = WEAPON_ROCKET_TYPE.FIRE; break;
				case WEAPON_MODIFIER.PORTAL: weapon = WEAPON_ROCKET_TYPE.TELEPORT; break;
				case WEAPON_MODIFIER.SHOTGUN: weapon = WEAPON_ROCKET_TYPE.SHOTGUN; break;
				case WEAPON_MODIFIER.SLIME: weapon = WEAPON_ROCKET_TYPE.SLIME; break;
				case WEAPON_MODIFIER.BRICK: weapon = WEAPON_ROCKET_TYPE.BRICK; break;
				case WEAPON_MODIFIER.SAND: weapon = WEAPON_ROCKET_TYPE.SAND; break;
				case WEAPON_MODIFIER.METAL: weapon = WEAPON_ROCKET_TYPE.SPIKED; break;
				case WEAPON_MODIFIER.ELECTRIC: weapon = WEAPON_ROCKET_TYPE.LIGHTNING; break;
				default: weapon = noone; break;
			}
			break;
		case WEAPON_TYPE.SHURIKEN:
			switch (modifier) {
				case WEAPON_MODIFIER.DEFAULT: weapon = WEAPON_SHURIKEN_TYPE.DEFAULT; break;
				case WEAPON_MODIFIER.ICE: weapon = WEAPON_SHURIKEN_TYPE.ICE; break;
				case WEAPON_MODIFIER.FIRE: weapon = WEAPON_SHURIKEN_TYPE.FIRE; break;
				case WEAPON_MODIFIER.PORTAL: weapon = WEAPON_SHURIKEN_TYPE.PORTAL; break;
				case WEAPON_MODIFIER.SLIME: weapon = WEAPON_SHURIKEN_TYPE.SLIME; break;
				case WEAPON_MODIFIER.BRICK: weapon = WEAPON_SHURIKEN_TYPE.BRICK; break;
				case WEAPON_MODIFIER.SAND: weapon = WEAPON_SHURIKEN_TYPE.SAND; break;
				case WEAPON_MODIFIER.SHOTGUN: weapon = WEAPON_SHURIKEN_TYPE.SHOTGUN; break;
				case WEAPON_MODIFIER.METAL: weapon = WEAPON_SHURIKEN_TYPE.METAL; break;
				case WEAPON_MODIFIER.ELECTRIC: weapon = WEAPON_SHURIKEN_TYPE.ELECTRIC; break;
				default: weapon = noone; break;
			}
			break;
		
		case WEAPON_TYPE.ARROW:
			switch (modifier) {
				case WEAPON_MODIFIER.DEFAULT: weapon = WEAPON_ARROW_TYPE.DEFAULT; break;
				case WEAPON_MODIFIER.ICE: weapon = WEAPON_ARROW_TYPE.ICE; break;
				case WEAPON_MODIFIER.FIRE: weapon = WEAPON_ARROW_TYPE.FIRE; break;
				case WEAPON_MODIFIER.PORTAL: weapon = WEAPON_ARROW_TYPE.PORTAL; break;
				case WEAPON_MODIFIER.SLIME: weapon = WEAPON_ARROW_TYPE.SLIME; break;
				case WEAPON_MODIFIER.BRICK: weapon = WEAPON_ARROW_TYPE.BRICK; break;
				case WEAPON_MODIFIER.SAND: weapon = WEAPON_ARROW_TYPE.SAND; break;
				case WEAPON_MODIFIER.SHOTGUN: weapon = WEAPON_ARROW_TYPE.SHOTGUN; break;
				case WEAPON_MODIFIER.METAL: weapon = WEAPON_ARROW_TYPE.METAL; break;
				case WEAPON_MODIFIER.ELECTRIC: weapon = WEAPON_ARROW_TYPE.ELECTRIC; break;
				default: weapon = noone; break;
			}
			break;
		
		default: weapon = noone;
	}

	return weapon;

	enum WEAPON_MODIFIER {
		DEFAULT, ICE, FIRE, PORTAL, //MAGNET,
		SHOTGUN, SLIME, BRICK, SAND, METAL,
		ELECTRIC,
		//keep last
		LENGTH
	}


}
