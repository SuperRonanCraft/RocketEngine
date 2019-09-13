//Get the weapon modifier icon
///@arg weapon-modifier
var type = argument0

switch (type) {
	case WEAPON_MODIFIER.ICE: return s_modifier_default; break;
	case WEAPON_MODIFIER.FIRE: return s_modifier_fire; break;
	case WEAPON_MODIFIER.PORTAL: return s_modifier_portal; break;
	case WEAPON_MODIFIER.MAGNET: return s_modifier_magnet; break;
	default: return s_modifier_default;
}
