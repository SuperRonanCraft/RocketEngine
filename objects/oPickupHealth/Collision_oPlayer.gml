if (!other.player_map[? PLAYER_MAP.ENABLED_PICKUP] || !global.play) exit;
//Add health to player

if (item != noone) {
	var added = false;
	with (other) {
		if (shootable_map[? SHOOTABLE_MAP.HEALTH] > 0)
			if (other.healing > 0) {
				if (scShootableHeal(id, other.healing, true, true) > 0)
					added = true;
			} else {
				scShootableDamage(id, id, false, false, abs(other.healing), false);
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
		/*var stat_hp = scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, STATISTICS_GENERAL.HEALED);
		if (!ds_exists(stat_hp, ds_type_map)) {
			stat_hp = ds_map_create();
			scStatsCache(STATISTICS_TYPE.VALUE_GENERAL, [STATISTICS_GENERAL.HEALED], stat_hp);
			stat_hp[? id] = 0;
		} else if (ds_map_find_value(stat_hp, id) == undefined)
			stat_hp[? id] = 0;
		stat_hp[? id] += healing;
		scAchievements_CustomEvent(ACHIEVEMENTS.MEDIC, stat_hp[? id]);*/
	}
}