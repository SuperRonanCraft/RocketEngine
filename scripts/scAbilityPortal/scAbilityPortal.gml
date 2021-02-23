///@arg ability map
function scAbilityPortal() {

	with (instance_create_depth(x, y, depth + 1, oUltimatePortal)) {
		owner = other;
	}


}
