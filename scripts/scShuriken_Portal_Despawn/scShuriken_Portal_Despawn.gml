function scShuriken_Portal_Despawn() {


	if(!deactivate){
		var xplo = instance_create_depth(x,y,depth,oExplosion_Shuriken);

		xplo.owner = owner;
		xplo.image_xscale = 1.5;
		xplo.image_yscale = 1.5;
		ds_map_copy(xplo.weapon_map, weapon_map);
		ds_list_copy(xplo.hitList, hitList);
		deactivate = true;
		image_alpha = 0;
		scScreenShake(25,5);
		//instance_destroy();
	}
	else{
		instance_destroy();	
	}


}
