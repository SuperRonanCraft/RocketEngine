/// @desc Reverse ultimate
function scUltimateClone_Destroy() {
	if(instance_exists(owner)){
		with (owner)
			player_map[? "clones"]--;
	}

}
