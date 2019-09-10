if (!other.player_map[? PLAYER_MAP.ENABLED_PICKUP] || !global.play) exit;
//Add health to player

if (item != noone) {
	var added = false;
	with (other) {
		var map = shootable_map;
		if (shootable_map[? SHOOTABLE_MAP.HEALTH] > 0)
			if (other.healing > 0) {
				if (shootable_map[? SHOOTABLE_MAP.CAN_HEAL] && map[? SHOOTABLE_MAP.HEALTH] + other.healing <= map[? SHOOTABLE_MAP.HEALTH_ORIGINAL]) {
					map[? SHOOTABLE_MAP.HEALTH] += other.healing;
					hp_scale += 2;
					added = true;
				}
			} else {
				scDamageShootable(id, id, false, false, abs(other.healing), false);
				scBuffAdd(BUFFTYPE.ANTIHEAL, id, id);
				added = true;
			}
	}
	if (added) { //Can collect the hp
		timer_current = timer_org; //Reset the timer
		timer = timer_org;
		healing = healing_org;
		item = noone; //Reset item
		hacked = false;
	}
}