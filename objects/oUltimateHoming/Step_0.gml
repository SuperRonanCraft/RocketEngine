/// @description Increase timer and launch

x = owner.x;
y = owner.y;

if (timer % 10 == 0 && timer < 30)
	with (scSpawnRocket(x + irandom_range(-20, 20), y + irandom_range(-20, 20), depth,
			irandom_range(45, 135), owner, owner.rocket_map)) {
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
		var target = noone, xx = x, yy = y;
		for (var i = 0; i < instance_number(pShootable); i++) {
			var obj = instance_find(pShootable, i)
			if (obj != owner) {
				target = obj;
				xx = target.x;
				yy = target.y;
			}
		}
		homing = ds_map_create();
		homing[? "target"] = target;
		homing[? "clock"] = 0;
		homing[? "locX"] = xx + irandom_range(-30, 30);
		homing[? "locY"] = yy + irandom_range(-30, 30);
		rocket_map[? ROCKET_MAP.SPEED] = 0.1;
		rocket_map[? ROCKET_MAP.IGNORE_WALL] = true;
		rocket_map[? ROCKET_MAP.SCALE] = 1;
		rocket_map[? ROCKET_MAP.ROCKET_STEP] = scRocketSpecialHomingUlt_Step;
		rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_GIVE] = false;	
		rocket_map[? ROCKET_MAP.PARTICLE_TRAIL] = oParticleHandler.ds_part[? PARTICLES.KBSMOKE];
	}

if (timer > 60)
	instance_destroy();	
timer++;