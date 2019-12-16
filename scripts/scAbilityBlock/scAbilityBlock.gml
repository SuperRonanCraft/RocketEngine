///@arg ability map

with (instance_create_depth((x div BLOCK_SIZE) * BLOCK_SIZE, (bbox_bottom div BLOCK_SIZE) * BLOCK_SIZE, depth + 1, oWall)) {
	visible = true;
	scMergeWall(id);
}