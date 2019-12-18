///scMergeWall(wall)
///@arg wall
///@arg chunk_id

var wall = argument[0];

var expanded = false;

var wallOn = collision_point(x,y,oWall,false,true);
var wallRight = collision_point(x + (BLOCK_SIZE*image_xscale),y,oWall,false,true);
var wallLeft = collision_point(x - 1,y,oWall,false,true);
var wallBelow = collision_point(x,y+ (BLOCK_SIZE*image_yscale),oWall,false,true);
var wallAbove = collision_point(x,y- 1,oWall,false,true);

//Declare as noone if not same size
if(wallLeft != noone){
	if(wallLeft.image_yscale != wall.image_yscale){
		wallLeft = noone;	
	}
}

if(wallRight != noone){
	if(wallRight.image_yscale != wall.image_yscale){
		wallRight = noone;	
	}
}

//------

if(wallOn){
	if(wallOn.image_xscale == wall.image_xscale && wallOn.image_yscale== wall.image_yscale){
		instance_destroy(wallOn);	
	}
}

if(		
	wallBelow != noone &&
	wallBelow.x == wall.x)
{
	if(wallBelow.image_xscale == wall.image_xscale){
		wall.image_yscale += wallBelow.image_yscale;
		instance_destroy(wallBelow);
		expanded = true;
	}
	
}

if(
		wallBelow == noone &&
		wallAbove != noone &&
		wallAbove.x == wall.x)
{
	if(wallAbove.image_xscale == wall.image_xscale){
		wall.x = wallAbove.x;
		wall.y = wallAbove.y;
		wall.image_yscale += wallAbove.image_yscale;
		instance_destroy(wallAbove);
		expanded = true;
	}
	
}

if(wallRight != noone &&
	wallRight.y == wall.y){
	wall.image_xscale += wallRight.image_xscale;
	instance_destroy(wallRight);
	expanded = true;
}

if(wallLeft != noone &&
	wallLeft.y == wall.y){
	wall.x = wallLeft.x;
	wall.image_xscale += wallLeft.image_xscale;
	instance_destroy(wallLeft);
	expanded = true;
}


if(expanded){
	scMergeWall(wall);	
}

