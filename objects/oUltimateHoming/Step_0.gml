/// @description Increase timer and launch

x = owner.x;
y = owner.y;

if (timer % (10 * (room_speed / 30)) == 0 && timer < room_speed)
	with (scSpawnRocket(x + irandom_range(-20, 20), y + irandom_range(-20, 20), depth,
			irandom_range(45, 135), owner, owner.weapon_map[? WEAPON_MAP.MAP], [ROCKET_MAP.SCALE], [1])) {
		/*owner = other.owner;
		//Give it the map of the current rocket
		rocket_map = ds_map_create(); 
		ds_map_copy(rocket_map, other.owner.rocket_map);*/
		rocket_map[? ROCKET_MAP.DAMAGE] = 1;
		//Give it the map of the current rocket
		sprite_index = sRocket_Homing_Ult;
		//Sizes
		size = 0.8;
		image_xscale = 0.8;
		image_yscale = 0.8;
		//Find a target
		var target = scFindTarget(owner.team), xx = x, yy = y;
		if (target != noone) {
			xx = target.x;
			yy = target.y;
		}
		homing = ds_map_create();
		homing[? "target"] = target;
		homing[? "clock"] = 0;
		homing[? "locX"] = xx;// + irandom_range(-30, 30);
		homing[? "locY"] = yy;// + irandom_range(-30, 30);
		rocket_map[? ROCKET_MAP.SPEED] = 0.1 / TIME_SPEED;
		rocket_map[? ROCKET_MAP.IGNORE_WALL] = true;
		rocket_map[? ROCKET_MAP.ROCKET_STEP] = scRocketSpecialHomingUlt_Step;
		rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_GIVE] = false;	
		rocket_map[? ROCKET_MAP.PARTICLE_TRAIL] = oParticleHandler.ds_part[? PARTICLES.KBSMOKE];
	}

if (timer > (room_speed * 2))
	instance_destroy();	
timer++;