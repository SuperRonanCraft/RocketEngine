/// @description Increase timer and launch

x = owner.x;
y = owner.y;



if(timer %3 == 0 && timer < 25){
	var miniRocket = instance_create_depth(x + irandom_range(-20,20), y + irandom_range(-20,20), depth, oRocket);	
	with miniRocket{
		owner = other.owner;
		//Give it the map of the current rocket
		rocket_map = ds_map_create(); 
		ds_map_copy(rocket_map, other.owner.rocket_map);
		rocket_map[? ROCKET_MAP.DAMAGE] = 1;
		//Give it the map of the current rocket
		sprite_index = sRocket_Homing_Ult;
		//Give it the direction a rocket would fly in
		direction = owner.team == TEAM.LEFT ? 0 : 180;
		
		direction+= irandom_range(0,360);
		
		
		image_angle = direction;
		//Sizes
		size = 0.8;
		image_xscale = 0.8;
		image_yscale = 0.8;
		
		//Find a target
		for (var i = 0; i < instance_number(oPlayer); i += 1)
				if (instance_find(oPlayer, i) != owner)
					target = instance_find(oPlayer, i);
					
					
		homingClock = 0;
		targetLocX = target.x + irandom_range(-30,30);
		targetLocY = target.y + irandom_range(-30,30);
		rocket_map[? ROCKET_MAP.SPEED] = .1;
		rocket_map[? ROCKET_MAP.ROCKET_STEP] = scRocketSpecialHomingUlt_Step;
		
	}
	
}

if(timer > 60){
	instance_destroy();	
}

timer++;