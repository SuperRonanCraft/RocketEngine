/// @description  Despawn

var shuriken_map = weapon_map[? WEAPON_MAP.MAP];

if (shuriken_map[? SHURIKEN_MAP.DESPAWN_SCRIPT] == noone) {
		
	if(!debounce){
		rotate = true;
		var randdirx = irandom_range(-7,7);
		var randdiry = irandom_range(-12,-8);
	
		image_speed = sign(randdirx);
	
		if(instance_exists(stuckTo)){
			if(variable_instance_exists(stuckTo, "stuckAmount"))
				stuckTo.stuckAmount--;
		}
		stuckTo = noone;
		deactivate = true;
	
		debounce = true;
		hsp = randdirx
		vsp = randdiry;
		
	}
	vsp += 1.1;
	image_alpha -= 0.01;
	
	


}

else{
	script_execute(shuriken_map[? SHURIKEN_MAP.DESPAWN_SCRIPT]);
}

