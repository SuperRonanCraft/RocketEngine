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
	enable_last_known_coords = false;
	
	scAIPlatformPathFindTo(aiTarget.x,aiTarget.y,meleeRange);
	
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
	
	if( point_distance(player.x,player.y,aiTarget.x,aiTarget.y) > 500
		|| scBuffFind(aiTarget,BUFFTYPE.INVISIBLE)){
		last_known_x = aiTarget.x;
		last_known_y = aiTarget.y;
		enable_last_known_coords = true;
		aiTarget = noone;
		AIRight = false;
		AILeft = false;
		AIJump = false;
		
	}

}
else{
	
	if(enable_last_known_coords && point_distance(player.x,player.y,last_known_x,last_known_y) > meleeRange){
		scAIPlatformPathFindTo(last_known_x,last_known_y,meleeRange);
	}
	
	else{
		if(enable_last_known_coords && meleeCooldown <= 0){
			var obj = instance_create_depth(player.x,player.y,depth-5,oMelee_Bite);
			obj.owner = player.id;
			meleeCooldown = 40;
		}
		
		enable_last_known_coords = false;
		AIRight = false;
		AILeft = false;
		AIJump = false;
	}
}

///run from oAiHandler