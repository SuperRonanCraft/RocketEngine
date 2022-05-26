/// @description  
if(!activated){
	if(ownedWall != noone){
		instance_destroy(ownedWall);
		ownedWall = noone;
	}
}
else if(ownedWall == noone){
	ownedWall = instance_create_depth(x,y,depth,oWall);
	ownedWall.image_xscale = image_xscale;
	ownedWall.image_yscale = image_yscale;
}
