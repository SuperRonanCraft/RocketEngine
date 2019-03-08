/// @desc 
repeat (striking == noone ? 5 : 2) {
	var dir = irandom(360);
	scDrawLightning(x, y, x + lengthdir_x(light_range, dir), y + lengthdir_y(light_range, dir), 
		irandom_range(light_branches / 2, light_branches), c_blue);
}
		
//SHOW BOLT
if (striking != noone) {
	repeat (2)
		scDrawLightning(x, y, striking.x, striking.y, irandom_range(light_branches / 2, 
			light_branches), c_blue);
	if (damage_cooldown_cur <= 0) {
		scDamageShootable(owner, striking, false, false, 1, false);
		damage_cooldown_cur = damage_cooldown;
	} else
		damage_cooldown_cur--;
}
