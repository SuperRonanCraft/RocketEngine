///@desc ROCKET Weapon ai
///@arg shoot_ai?

var _shoot = argument0;

if(variable_instance_exists(id,"meleeCooldown")){
	meleeCooldown--;
}
else{
	meleeCooldown = 50;	
}

var meleeRange = 30;

if(aiTarget != noone){
	
	
	if(aiTarget.x < player.x){
		AILeft = true;
		AIRight = false;
	}
	else if(player.x < aiTarget.x){
		AILeft = false;
		AIRight = true;
	}
	else{
		AILeft = false;
		AIRight = false;
	}
	
	if( (point_distance(player.x,player.y,aiTarget.x,aiTarget.y) > 5*meleeRange || aiTarget.gravity_map[?GRAVITY_MAP.STANDING]) && aiTarget.y < player.y){
		AIJump = true;	
	}
	else{
		AIJump = false;	
	}
	
	if(point_distance(player.x,player.y,aiTarget.x,aiTarget.y) < meleeRange){
		AIRight = false;
		AILeft = false;
		AIJump = false;
		if(meleeCooldown <= 0){
			var obj = instance_create_depth(player.x,player.y,depth-5,oMelee_Bite);
			obj.owner = player.id;
			meleeCooldown = 40;
		}
	}

}
else{
	AIRight = false;
	AILeft = false;
	AIJump = false;
}
