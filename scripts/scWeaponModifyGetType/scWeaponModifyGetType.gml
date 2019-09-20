//Get the weapon modifier map
///@arg weapon-modifier
///@arg weapon-map-type
var modifier = argument0;
var type = argument1;
var map = ds_map_create();
map[? WEAPON_MODIFIER_MAP.ICON] = noone;
map[? WEAPON_MODIFIER_MAP.NAME] = noone;
map[? WEAPON_MODIFIER_MAP.DESCRIPTION] = noone;

switch (modifier) {
	case WEAPON_MODIFIER.DEFAULT: 
		map[? WEAPON_MODIFIER_MAP.ICON] = s_modifier_default;
		map[? WEAPON_MODIFIER_MAP.NAME] = "DEFAULT";
		map[? WEAPON_MODIFIER_MAP.DESCRIPTION] = "Basic Soldier";
		break;
	case WEAPON_MODIFIER.ICE: 
		map[? WEAPON_MODIFIER_MAP.ICON] = s_modifier_ice;
		map[? WEAPON_MODIFIER_MAP.NAME] = "ICE";
		map[? WEAPON_MODIFIER_MAP.DESCRIPTION] = "Frosty legs";
		break;
	case WEAPON_MODIFIER.FIRE:
		map[? WEAPON_MODIFIER_MAP.ICON] = s_modifier_fire;
		map[? WEAPON_MODIFIER_MAP.NAME] = "FIRE";
		map[? WEAPON_MODIFIER_MAP.DESCRIPTION] = "It's hotter than the sun!";
		break;
	case WEAPON_MODIFIER.PORTAL: 
		map[? WEAPON_MODIFIER_MAP.ICON] = s_modifier_portal;
		map[? WEAPON_MODIFIER_MAP.NAME] = "PORTAL"
		map[? WEAPON_MODIFIER_MAP.DESCRIPTION] = "Into another dimension";
		break;
	case WEAPON_MODIFIER.MAGNET: 
		map[? WEAPON_MODIFIER_MAP.ICON] = s_modifier_magnet;
		map[? WEAPON_MODIFIER_MAP.NAME] = "MAGNET"
		map[? WEAPON_MODIFIER_MAP.DESCRIPTION] = "Don't bring your watch";
		break;
	case WEAPON_MODIFIER.SHOTGUN: 
		map[? WEAPON_MODIFIER_MAP.ICON] = s_modifier_shotgun;
		map[? WEAPON_MODIFIER_MAP.NAME] = "SHOTGUN"
		map[? WEAPON_MODIFIER_MAP.DESCRIPTION] = "The best one shot";
		break;
	case WEAPON_MODIFIER.SLIME: 
		map[? WEAPON_MODIFIER_MAP.ICON] = s_modifier_slime;
		map[? WEAPON_MODIFIER_MAP.NAME] = "SLIME"
		map[? WEAPON_MODIFIER_MAP.DESCRIPTION] = "Sticky stuff";
		break;
	case WEAPON_MODIFIER.BRICK: 
		map[? WEAPON_MODIFIER_MAP.ICON] = s_modifier_brick;
		map[? WEAPON_MODIFIER_MAP.NAME] = "BRICK"
		map[? WEAPON_MODIFIER_MAP.DESCRIPTION] = "Better start jumping";
		break;
	case WEAPON_MODIFIER.SAND: 
		map[? WEAPON_MODIFIER_MAP.ICON] = s_modifier_sand; 
		map[? WEAPON_MODIFIER_MAP.NAME] = "SAND"
		map[? WEAPON_MODIFIER_MAP.DESCRIPTION] = "Slow, but deadly";
		break;
	case WEAPON_MODIFIER.METAL: 
		map[? WEAPON_MODIFIER_MAP.ICON] = s_modifier_metal; 
		map[? WEAPON_MODIFIER_MAP.NAME] = "METAL"
		map[? WEAPON_MODIFIER_MAP.DESCRIPTION] = "Heavy hitter";
		break;
	default: break;
}

var val = noone;
if (map[? type] != undefined)
	val = map[? type];
ds_map_destroy(map);
return val;

enum WEAPON_MODIFIER_MAP {
	ICON, NAME, DESCRIPTION
}
