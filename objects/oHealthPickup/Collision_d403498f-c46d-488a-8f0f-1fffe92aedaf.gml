if (!other.pickups_enabled || !global.play) exit;
//Add health to player

if (item != noone) {
	var added = false;
	with (other)
		if (hp > 0)
			if (hp != hp_original) {
				hp += 1;
				hp_scale += 2;
				added = true;
			}
	if (added) { //Can collect the hp
		timer_current = timer; //Reset the timer
		item = noone; //Reset item
	}
}