/// @description  Despawn

var arrow_map = weapon_map[? WEAPON_MAP.MAP];

if (arrow_map[? ARROW_MAP.DESPAWN_SCRIPT] == noone) {
		
	if(!debounce){
		rotate = true;
		var randdirx = irandom_range(hsp*.5,hsp);
		var randdiry = irandom_range(-abs(vsp) *1.1,-abs(vsp) * 0.5);
	
		image_speed = sign(randdirx);
	
		stuckTo = noone;
		deactivate = true;
	
		debounce = true;
		hsp = randdirx
		vsp = randdiry;
		if(instance_exists(stuckTo)){
			if(variable_instance_exists(stuckTo, "stuckAmount"))
				stuckTo.stuckAmount--;
		}
	}
	vsp += 2 * arrow_map[?ARROW_MAP.WEIGHT]/room_speed;
	image_alpha -= 0.01;
	image_angle += hsp;
	


}

else{
	script_execute(arrow_map[? ARROW_MAP.DESPAWN_SCRIPT]);
}

