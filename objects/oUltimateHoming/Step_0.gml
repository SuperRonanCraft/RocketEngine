/// @description Increase timer and launch

x = owner.x;
y = owner.y;

if (timer % 3 == 0 && timer < 25)
	with (scSpawnRocket(x + irandom_range(-20, 20), y + irandom_range(-20, 20), depth,
			irandom_range(0, 360), owner, owner.rocket_map)) {
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
		for (var i = 0; i < instance_number(oPlayer); i++)
			if (instance_find(oPlayer, i) != owner)
				target = instance_find(oPlayer, i);	
		homingClock = 0;
		targetLocX = target.x + irandom_range(-30, 30);
		targetLocY = target.y + irandom_range(-30, 30);
		rocket_map[? ROCKET_MAP.SPEED] = 0.1;
		rocket_map[? ROCKET_MAP.ROCKET_STEP] = scRocketSpecialHomingUlt_Step;
		rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_GIVE] = false;	
	}

if (timer > 60)
	instance_destroy();	
timer++;