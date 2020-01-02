///scAIPlatformPathFindTo(x,y);
///@arg x
///@arg y
///@arg minDis -minimumdistance

var _x = argument[0];
var _y = argument[1];
var minDis = argument[2];

if(_x < player.x){
		AILeft = true;
		AIRight = false;
	}
	else if(player.x < _x){
		AILeft = false;
		AIRight = true;
	}
	else{
		AILeft = false;
		AIRight = false;
	}
	
	if( point_distance(player.x,player.y,_x,_y) > 5*minDis && _y < player.y){
		AIJump = true;	
	}
	else{
		AIJump = false;	
	}


