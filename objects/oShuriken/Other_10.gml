/// @description  Despawn

var shuriken_map = weapon_map[? WEAPON_MAP.MAP];

if (shuriken_map[? SHURIKEN_MAP.DESPAWN_SCRIPT] == noone) {
		
	if(!debounce){
		var randdirx = irandom_range(-7,7);
		var randdiry = irandom_range(-12,-8);
	
		image_speed = sign(randdirx);
	
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

