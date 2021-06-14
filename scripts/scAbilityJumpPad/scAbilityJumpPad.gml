///@arg ability map
function scAbilityJumpPad() {

	with (instance_create_depth(x, y, depth + 1, oUltimateJumpPad)) {
		owner = other;
	}


}
