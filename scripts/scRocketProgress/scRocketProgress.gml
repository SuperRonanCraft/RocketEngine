/// @desc Check when to shoot a tocket
/// @arg player-id-(-1-to-disable)


if (rocket_map[? ROCKET_MAP.PROJECTILE] == -1)
	return;

//Set the direction of the rocket
var dir = direction;
if (argument0 != -1)
	dir = argument0 == 1 ? 0 : 180;

//Rocket
if (current_delay == 0) {
	if (ammo != 0) {
		scScreenShake(rocket_map[? ROCKET_MAP.SHAKE_MAGNITUDE], rocket_map[? ROCKET_MAP.SHAKE_FRAMES]);
		var offset = rocket_map[? ROCKET_MAP.OFFSET];
		with (instance_create_depth(x + lengthdir_x(offset, dir), y + lengthdir_y(offset, dir), depth - 1, oRocket)) {
			direction = dir;
			image_angle = direction;
			sprite_index = other.rocket_map[? ROCKET_MAP.PROJECTILE];
			owner = other;
			rocket_map = other.rocket_map;
			timer = other.rocket_map[? ROCKET_MAP.TIMER];
			owner.rockets++;
			//Run custom creation script for rocket, no instances of shooter as "owner" is already same variable
			if (rocket_map[? ROCKET_MAP.CREATE_SCRIPT] != noone)
				script_execute(rocket_map[? ROCKET_MAP.CREATE_SCRIPT]);
			//Shot sound effect
			audio_play_sound(other.rocket_map[? ROCKET_MAP.PROJECTILE_SOUND], 10, false);
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
	if (current_reload > rocket_map[? ROCKET_MAP.RELOAD_TIME]) {
		ammo = rocket_map[? ROCKET_MAP.CLIP];
		current_reload = 0;
	} else
		current_reload++;