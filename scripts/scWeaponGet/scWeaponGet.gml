//Load weapon stuff
///@arg weapon-type
///@arg weapon-sub-type*

var type = argument[0];
var type_sub = argument_count > 1 ? (argument[1] != noone ? argument[1] : noone) : noone;
//ds_map_destroy(weapon_map);
var map = ds_map_create();

//var char = player_map[? PLAYER_MAP.CHARACTER_INFO];
map[? WEAPON_MAP.TYPE] = type;//char[? CHARACTER_MAP.WEAPON];
map[? WEAPON_MAP.ENABLED] = true;
//map[? WEAPON_MAP.ULTIMATE] = ULTIMATE.NONE;
map[? WEAPON_MAP.SHAKE_MAGNITUDE] = 0;
map[? WEAPON_MAP.SHAKE_FRAMES] = 0;
map[? WEAPON_MAP.RELOAD_TIME] = 0;
map[? WEAPON_MAP.RELOAD_TIME_ORIGINAL] = 0;
map[? WEAPON_MAP.COOLDOWN_TIME] = 0;
map[? WEAPON_MAP.COOLDOWN_TIME_ORIGINAL] = 0;
map[? WEAPON_MAP.DELAY_TIME] = -1;
map[? WEAPON_MAP.POWER] = 0;
map[? WEAPON_MAP.AMMO] = 0;
map[? WEAPON_MAP.CLIP] = 0;
map[? WEAPON_MAP.DAMAGE] = 0; //damage of weapon
map[? WEAPON_MAP.SPEED] = 0; //speed of weapon
map[? WEAPON_MAP.COMBO_TYPE] = COMBO_TYPE.KNOCKBACK;
map[? WEAPON_MAP.COMBO_COOLDOWN] = 20;
map[? WEAPON_MAP.GUI_WEAPON_SCALE] = 1;
map[? WEAPON_MAP.GUI_BUFFS] = noone;
map[? WEAPON_MAP.GUI_ICON] = noone;
map[? WEAPON_MAP.CHARGING] = false;
map[? WEAPON_MAP.CHARGE] = 0;
map[? WEAPON_MAP.MODIFIER] = WEAPON_MODIFIER.DEFAULT; //CHANGE THIS IF YOU HAVE ANOTHER DEFAULT
map[? WEAPON_MAP.MAP] = noone; //Custom info the weapon wants to save

switch (map[? WEAPON_MAP.TYPE]) {
	case WEAPON_TYPE.ROCKET:
		var _type = WEAPON_ROCKET_TYPE.DEFAULT;
		if (type_sub != noone)
			_type = type_sub;
		scRocketStart(_type, map);
		map[? WEAPON_MAP.COMBO_TYPE] = COMBO_TYPE.KNOCKBACK;
		map[? WEAPON_MAP.COMBO_COOLDOWN] = 45;
		break;
	case WEAPON_TYPE.SHURIKEN:
		var _type = WEAPON_SHURIKEN_TYPE.DEFAULT;
		if (type_sub != noone)
			_type = type_sub;
		scShurikenStart(_type, map);
		map[? WEAPON_MAP.COMBO_TYPE] = COMBO_TYPE.NO_MISS;
		map[? WEAPON_MAP.COMBO_COOLDOWN] = 120;
		break;
		
	case WEAPON_TYPE.ARROW:
		var _type = WEAPON_ARROW_TYPE.DEFAULT;
		if (type_sub != noone)
			_type = type_sub;
		scArrowStart(_type, map);
		map[? WEAPON_MAP.COMBO_TYPE] = COMBO_TYPE.NO_MISS;
		map[? WEAPON_MAP.COMBO_COOLDOWN] = 180;
		break;
}

return map;

enum WEAPON_TYPE {
	NONE, ROCKET, SHURIKEN, ARROW,
}

enum WEAPON_MAP {
	TYPE, ENABLED,
	//Set per weapon
	NAME, DESCRIPTION,
	SHAKE_MAGNITUDE, SHAKE_FRAMES,
	
	RELOAD_TIME_ORIGINAL, RELOAD_TIME, 
	COOLDOWN_TIME, COOLDOWN_TIME_ORIGINAL,
	
	DELAY_TIME, POWER, AMMO, CLIP, DAMAGE, SPEED,
	COMBO_TYPE, COMBO_COOLDOWN,
	//Gui stuff
	GUI_WEAPON_SCALE, GUI_BUFFS, CHARGING, CHARGE,
	//Set icon per weapon
	GUI_ICON, MODIFIER,
	MAP //Custom vars
}