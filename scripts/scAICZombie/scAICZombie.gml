///@desc ROCKET Weapon ai
///@arg shoot_ai?

var _shoot = argument0;

var meleeRange = 30;

if(aiTarget != noone){
	
	
	if(aiTarget.x < player.x-meleeRange){
		AILeft = true;
		AIRight = false;
	}
	else if(player.x+meleeRange < aiTarget.x){
		AILeft = false;
		AIRight = true;
	}
	else{
		AILeft = false;
		AIRight = false;
	}
	
	if( (point_distance(player.x,player.y,aiTarget.x,aiTarget.y) > 2*meleeRange || aiTarget.gravity_map[?GRAVITY_MAP.STANDING]) && aiTarget.y < player.y){
		AIJump = true;	
	}
	else{
		AIJump = false;	
	}
	
	if(point_distance(player.x,player.y,aiTarget.x,aiTarget.y) < meleeRange){
		AIShoot = true;
	}
	else{
		AIShoot = false;	
	}

}
