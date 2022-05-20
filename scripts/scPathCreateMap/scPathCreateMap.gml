function scPathCreateMap(){
	
	if(mpGrid != noone)
		mp_grid_destroy(mpGrid);
	
	mpGrid = mp_grid_create(0,0,RES_W/BLOCK_SIZE,RES_H/BLOCK_SIZE,BLOCK_SIZE,BLOCK_SIZE);
	//mp_grid_add_instances(mpGrid,oWall,false);
	
	ds_grid_clear(dsGrid,0);
	mp_grid_to_ds_grid(mpGrid, dsGrid);
	
	var wallList = ds_list_create();
	collision_rectangle_list(0,0,RES_W,RES_H,oWall,false,true,wallList,false);
	
	//Mark walkable surfaces
	for (var i = 0; i < ds_list_size(wallList); i++) {
	    var wallCheck = wallList[|i];
		if(wallCheck.y div BLOCK_SIZE == 0)
			continue;
		ds_grid_set_region(dsGrid,wallCheck.x div BLOCK_SIZE,(wallCheck.y div BLOCK_SIZE)-1,(wallCheck.x+(BLOCK_SIZE*(wallCheck.image_xscale-1))) div BLOCK_SIZE,(wallCheck.y div BLOCK_SIZE)-1, 1);
	}
	
	//Mark walls as no good
	for (var i = 0; i < ds_list_size(wallList); i++) {
	    var wallCheck = wallList[|i];
		//if(wallCheck.y div BLOCK_SIZE == 0)
		//	continue;
		ds_grid_set_region(dsGrid,wallCheck.x div BLOCK_SIZE,(wallCheck.y div BLOCK_SIZE),(wallCheck.x+(BLOCK_SIZE*(wallCheck.image_xscale-1))) div BLOCK_SIZE,(wallCheck.y+(BLOCK_SIZE*(wallCheck.image_yscale-1))) div BLOCK_SIZE, -1);
	}
	//show_debug_message("Finished 1 loop of pathfinding");
	ds_list_destroy(wallList);
}