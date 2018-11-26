/// @desc Nukem gamemode started
for (var i = 0; i < instance_number(oPlayer); i++) {
	var ins = instance_find(oPlayer, i);
	with (ins) {
		hp = other.hp_start;
		hp_original = hp;
	}
}
diff = DIFFICULTY.EASY;
nukes = 0;
nukes_created = 0;
spawn_time = 60;

event_inherited();