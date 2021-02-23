///@arg ability map
function scAbilityBlock() {

	with (instance_create_depth((x div BLOCK_SIZE) * BLOCK_SIZE, (bbox_bottom div BLOCK_SIZE) * BLOCK_SIZE, depth + 1, oWall)) {
		visible = true;
	}


}
