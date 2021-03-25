/// @desc Close destroy timer

if (!variable_instance_exists(id, "clone_timer"))
	clone_timer = 0;
clone_timer++;

if (clone_timer > 30) {
	shootable_map[? SHOOTABLE_MAP.SHOW_DAMAGE] = false;
	scShootableDamage(id, id, false, false, 100, false, noone);
}

alarm[1] = 60;