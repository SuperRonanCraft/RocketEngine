if (!other.pickups_enabled || !global.play) exit;
//Add health to player

if (item != noone) {
	var added = false;
	with (other)
		if (hp > 0)
			if (other.healing > 0) {
				if (hp + other.healing <= hp_original) {
					hp += other.healing;
					hp_scale += 2;
					added = true;
				}
			} else {
				scDamageShootable(noone, false, false, abs(other.healing), false);
				scBuffAdd(BUFFTYPE.ANTIHEAL, id);
				added = true;
			}
	if (added) { //Can collect the hp
		timer_current = timer_org; //Reset the timer
		timer = timer_org;
		healing = healing_org;
		item = noone; //Reset item
		hacked = false;
	}
}