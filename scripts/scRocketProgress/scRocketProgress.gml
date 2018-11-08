if (projectile == -1)
	return;

//Rocket
if (current_delay == 0) {
	if (ammo != 0) {
		with (instance_create_depth(x + lengthdir_x(offset, direction), y + lengthdir_y(offset, direction), depth - 1, oRocket)) {
			sprite_index = other.projectile;
			direction = other.direction;
			image_angle = direction;
			spd = other.bulletspeed;
			owner = other;
			damage = other.damage;
		}
		ammo -= 1;
		//Recoil code
		//with (owner) {
		//	hsp -= lengthdir_x(other.recoil_push, other.direction);
		//	vsp -= lengthdir_y(other.recoil_push, other.direction);
		//}
		//current_recoil = recoil;
		
		//Sound effects and screen shaking
		//ScreenShake(2, 10);
		//audio_sound_pitch(snShoot, choose(0.8, 1.0, 1.2));
		//audio_play_sound(snShoot, 5, false);
	}
}
//Cooldown
current_delay = max(-1, current_delay - 1);
if (current_delay == -1)
	current_cd = max(0, current_cd - 1);
current_recoil = max(0, floor(current_recoil * 0.8));

//Reload
if (ammo == 0)
	if (current_reload > reload_time) {
		ammo = clip;
		current_reload = 0;
	} else
		current_reload++;