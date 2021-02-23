/// @desc Shield ultimate
function scUltimateShield() {
	with (instance_create_layer(x, y, layer, oUltimateShield)) {
		owner = other;
		if (owner.damage_take) {
			damage_toggle = true;
			owner.damage_take = false;
		}
	}


}
