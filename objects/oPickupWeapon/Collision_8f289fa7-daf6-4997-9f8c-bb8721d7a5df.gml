if (!other.player_map[? PLAYER_MAP.ENABLED_PICKUP] || !global.play) exit;
/// @desc Pickup item if any

if (item != noone) {
	scWeaponModify(other, item_weapon); //Give rocket
	timer_current = timer_org; //Reset cooldown
	item = noone; //Reset item
	hacked = false;
	
	if (other.track_stats)
		scStatsCacheAddGeneral(STATISTICS_GENERAL.ROCKETS_CHANGED, 1);
}