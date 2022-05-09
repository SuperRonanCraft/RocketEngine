function scBomb_Brick_WallScript(){
	if(Wall1 == noone){
		x+=hsp;
		y+=vsp;
		x = BLOCK_SIZE * ( (x div BLOCK_SIZE));
		y = BLOCK_SIZE * ( (y div BLOCK_SIZE));
		x+=BLOCK_SIZE/2;
		y+=BLOCK_SIZE/2;
		hsp = 0;
		vsp = 0;
		grv_dir = 0;
		//deactivate = true;
		
		if(Wall1 == noone && collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,pEntity,false,true) == noone){
			Wall1 = instance_create_depth(x-BLOCK_SIZE/2,y-BLOCK_SIZE/2,depth,oWall);	
			Wall1.image_alpha = 0.1;
			Wall1.image_yscale = 1;
			Wall1.image_xscale = 1;
		}
	}
}
