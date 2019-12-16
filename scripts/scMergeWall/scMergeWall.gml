///scMergeWall(wall)
///@arg wall

var wall = argument[0];

var expanded = false;

var wallOn = collision_point(x,y,oWall,false,true);
var wallRight = collision_point((x + BLOCK_SIZE)*image_xscale,y,oWall,false,true);
var wallBelow = collision_point(x,(y+BLOCK_SIZE)*image_yscale,oWall,false,true);
var wallDiag = collision_point((x+BLOCK_SIZE)*image_xscale,(y+BLOCK_SIZE)*image_yscale,oWall,false,true);



if(wallOn){
	instance_destroy(wallOn);	
}

if(wallRight != noone &&
	wallBelow != noone &&
	wallDiag != noone)
{
	if(wallRight.image_yscale == wall.image_yscale &&
		wallBelow.image_xscale == wall.image_xscale&&
		wallDiag.image_xscale == 1 && 
		wallDiag.image_yscale == 1)
	{
		wall.image_xscale ++;
		wall.image_yscale ++;
	
		instance_destroy(wallRight);
		instance_destroy(wallBelow);
		instance_destroy(wallDiag);
		expanded = true;
	}
}

else if(wallRight == noone &&
		wallBelow != noone)
{
	if(wallBelow.image_xscale == wall.image_xscale){
		wall.image_yscale += wallBelow.image_yscale;
		instance_destroy(wallBelow);
		expanded = true;
	}
	
}

else if(wallRight != noone &&
		wallBelow == noone)
{
	if(wallRight.image_yscale == wall.image_yscale){
		wall.image_xscale += wallRight.image_xscale;
		instance_destroy(wallRight);
		expanded = true;
	}
	
}

if(expanded){
	scMergeWall(wall);	
}

