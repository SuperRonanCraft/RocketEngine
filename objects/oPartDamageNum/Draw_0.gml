/// @desc draw sprites

var _c = c_red;
switch (damage_type) {
	case DAMAGE_TYPE.CRITICAL:
		_c = c_purple; break;
	case DAMAGE_TYPE.HEALING:
		_c = c_green; break;
	default:
		switch (damage_took) {
			case DAMAGE_TOOK.ARMOR:
				_c = c_orange; break;
			case DAMAGE_TOOK.SHIELD:
				_c = c_aqua; break;
			case DAMAGE_TOOK.VITAL:
				_c = c_purple; damage_type = DAMAGE_TYPE.CRITICAL; break;
		}
}
//scDrawText(x, y, value_damage, color, scale, noone, alpha, noone, noone, angle);

for (var i = 0; i < array_length(value_cached); i++)
	scDrawSpriteExt(x + ((offset * (i - 1)) * scale), y, sprite_index, value_cached[i], _c, alpha, scale, scale, angle);
	
//Base Type
if(damage_type != DAMAGE_TYPE.NONE && damage_type != noone){
	scDrawSpriteExt(x + ((offset * (i - 1)) * scale), y, sUIDamageTypeIcons, damage_type, _c, alpha, scale, scale, angle);
	//Amped damage
	if(base_damage_amped != 0){
		if(sign(base_damage_amped) == 1){
			scDrawSpriteExt(x + ((offset * (i - 1)) * scale), y - offset, sUIDamageIcons, 4, _c, alpha, scale, scale, angle);
		}
		else{
			scDrawSpriteExt(x + ((offset * (i - 1)) * scale), y - offset, sUIDamageIcons, 3, _c, alpha, scale, scale, angle);
		}
	}
	i++;

}

//Element Type
if(damage_element != DAMAGE_ELEMENT.NONE && damage_element != noone){
	scDrawSpriteExt(x + ((offset * (i - 1)) * scale), y, sUIElementIcons, damage_element, _c, alpha, scale, scale, angle);

	//Amped damage
	if(element_damage_amped != 0){
		if(sign(element_damage_amped) == 1){
			scDrawSpriteExt(x + ((offset * (i - 1)) * scale), y - offset, sUIDamageIcons, 4, _c, alpha, scale, scale, angle);
		}
		else{
			scDrawSpriteExt(x + ((offset * (i - 1)) * scale), y - offset, sUIDamageIcons, 3, _c, alpha, scale, scale, angle);
		}
	}

}


if (damage_killed)
	scale = lerp(scale, scale_max, 0.04);
else if (vsp < 0)
	scale = lerp(scale, scale_goal, 0.1);

switch (damage_type) {
	case DAMAGE_TYPE.HEALING:
		vsp = lerp(vsp, -0.25, 0.75);
		break;
	case DAMAGE_TYPE.CRITICAL:
		vsp += grv;
		hsp = lerp(hsp, 0, 0.05);
		angle += angle_change * angle_side;
		break;
	default:
		if (damage_killed)
			vsp = lerp(vsp, -0.2, 0.07)
		else {
			if (vsp > 0)
				scale = lerp(scale, scale_min, 0.05 / max(1, combo));
			vsp += vsp < 0 ? grv : grv / 2;
			hsp = lerp(hsp, 0, 0.05);
		}
		break;
}

y += vsp;
x += hsp;

var reduce = false;
switch (damage_type) {
	case DAMAGE_TYPE.HEALING:
		reduce = vsp >= -2; break;
	default:
		if (damage_killed)
			reduce = vsp >= -1;
		else
			reduce = vsp >= 0;
		break;
}

if (reduce) {
	if (alpha == 1) //Combo streak = less grav
		grv = lerp(0, grv, 1 / max(1, (min(combo, 10) * 2)));
	alpha = max(alpha - alpha_reduce, 0);
}
	
if (alpha <= 0)
	instance_destroy();