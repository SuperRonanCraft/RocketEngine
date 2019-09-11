//Load characters weapon

weapon_map = ds_map_create();
var map = weapon_map;
var char = player_map[? PLAYER_MAP.CHARACTER_INFO];
map[? WEAPON_MAP.TYPE] = char[? CHARACTER_MAP.WEAPON];
map[? WEAPON_MAP.ENABLED] = true;
map[? WEAPON_MAP.ULTIMATE] = ULTIMATE.NONE;
map[? WEAPON_MAP.RELOAD_TIME] = 0;
map[? WEAPON_MAP.RELOAD_TIME_ORIGINAL] = 0;
map[? WEAPON_MAP.COOLDOWN_TIME] = 0;
map[? WEAPON_MAP.COOLDOWN_TIME_ORIGINAL] = 0;
map[? WEAPON_MAP.DELAY_TIME] = -1;
map[? WEAPON_MAP.AMMO] = 0;
map[? WEAPON_MAP.CLIP] = 0;
map[? WEAPON_MAP.MAP] = ds_map_create(); //Custom info the weapon wants to save
map[? WEAPON_MAP.DAMAGE] = 0; //damage of weapon
map[? WEAPON_MAP.SPEED] = 0; //speed of weapon
map[? WEAPON_MAP.GUI_WEAPON_SCALE] = 1;
map[? WEAPON_MAP.GUI_BUFFS] = noone;
map[? WEAPON_MAP.GUI_ICON] = noone;

switch (map[? WEAPON_MAP.TYPE]) {
	case WEAPON.ROCKET:
		scRocketStart(ROCKET.DEFAULT);
		ultimate_map[? ULTIMATE_CASTING_MAP.CHARGE_MULTI] = 1;
		ultimate_map[? ULTIMATE_CASTING_MAP.CAST_TIME] = 1;
		break;
	case WEAPON.SHURIKEN:
		scShurikenStart(SHURIKEN.DEFAULT);
		ultimate_map[? ULTIMATE_CASTING_MAP.CHARGE_MULTI] = 5;
		break;
}

enum WEAPON {
	NONE, ROCKET, SHURIKEN
}

enum WEAPON_MAP {
	TYPE, ENABLED,
	//Set per weapon
	ULTIMATE, 
	RELOAD_TIME_ORIGINAL, RELOAD_TIME, 
	COOLDOWN_TIME, COOLDOWN_TIME_ORIGINAL,
	DELAY_TIME, AMMO, CLIP, MAP, DAMAGE, SPEED,
	//Gui stuff
	GUI_WEAPON_SCALE, GUI_BUFFS,
	//Set icon per weapon
	GUI_ICON
}