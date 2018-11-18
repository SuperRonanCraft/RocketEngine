/// @desc Hit a shootable
/// @arg shooter-instance
/// @arg delete
/// @arg play-sound-hit

if (argument0 != id) {
	hp -= other.rocket_map[? ROCKET_MAP.DAMAGE];
	flash = 3;
	hitfrom = other.direction;
	if (argument1)
		instance_destroy(other.id);
	hpscale = 2;
	if (hp > 0) //{
		if (argument2) //Play hit sound effect?
			audio_play_sound(SOUND.GP_HIT, 1, false);
	//} else if (hp <= 0) {
	//	Shootable dead code
	//}
}