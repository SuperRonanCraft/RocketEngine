/// @desc player dust

if (gravity_map[? GRAVITY_MAP.STANDING]) {
	var amt = 0;
	var dirs, ori = facing == 1 ? [180, 180] : [90, 90];
	var spd_ind = time_dialation;
	var spd = [0.75 * spd_ind, 1.25 * spd_ind, -0.015 * spd_ind];
	var range = 5;
	if (gravity_map[? GRAVITY_MAP.HSP] != 0) {
		//var _img = floor(player_map[? PLAYER_MAP.ANIMATION_VAR]);
		if (smoke_cur >= (smoke_act / time_dialation) - irandom(smoke_act / 2)) {
			amt = irandom_range(1, 3);
			dirs = gravity_map[? GRAVITY_MAP.HSP] < 0 ? [-5, 5] : [175, 185];
			smoke_cur = 0;
		} else
			smoke_cur++;
	}
	if (smoke_lastvsp > 20) {
		amt = 20;
		dirs = [-20, 200];
		range = 15;
		smoke_lastvsp = 0;
		scPlaySound(SOUND.EFFECT_PLAYER_FALL, random_range(0.5, 0.6));
	}
	if (amt > 0)
		scDrawParticle(bbox_left - range, bbox_bottom - 5, bbox_right + range, 
			bbox_bottom + 2, PARTICLES.DUST, amt, dirs, ori, noone, spd);
} else
	smoke_lastvsp = gravity_map[? GRAVITY_MAP.VSP];