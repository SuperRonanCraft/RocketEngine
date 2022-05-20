/// @description
if(mpGrid != noone)
	mp_grid_destroy(mpGrid);
	
if(ds_exists(dsGrid, ds_type_grid)){
	ds_grid_destroy(dsGrid);	
}
