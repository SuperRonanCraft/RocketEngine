///@arg ability map
function scAbilityDodge() {

	var _map = gravity_map
	
	//_map[? GRAVITY_MAP.VSP_MOVE] += (-_map[? GRAVITY_MAP.JUMP_HEIGHT]) * grv_dir * 0.5;
	_map[? GRAVITY_MAP.HSP_MOVE_MOD] += (facing * 25);
	iframes += 25;

}
