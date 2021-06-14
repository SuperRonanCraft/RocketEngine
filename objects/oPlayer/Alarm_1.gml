/// @desc Clone destroy timer

if (!variable_instance_exists(id, "clone_timer"))
	clone_timer = 0;
if (!variable_instance_exists(id, "clone_timer_max"))
	clone_timer_max = 30;

clone_timer++;

if (clone_timer > clone_timer_max) {
	shootable_map[? SHOOTABLE_MAP.SHOW_DAMAGE] = false;
	scShootableDamage(id, id, false, false, 9999, false, noone);
}

alarm[1] = 60;