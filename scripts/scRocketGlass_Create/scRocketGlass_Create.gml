///Calculate line travel immediately

//Define main interactions we want
var playerHit = noone;
var wallHit = noone;
var playerList = ds_list_create();
var wallList = ds_list_create();
var num = 0;
var tpX = owner.x;
var tpY = owner.y;


//If facing right, start from player and end at length of room
if(direction == 0){
	
	
	num = collision_line_list(owner.x,owner.y,room_width,owner.y,oPlayer,false,true,playerList,true);
	
	if(num > 0){
		for (var i = 0; i < ds_list_size(playerList); i++) {
		    playerHit = playerList[| i];
			
			if(playerHit != owner && playerHit.team != owner.team){
					break;
			}
			else{
				playerHit = noone;	
			}
		}
	}
	
	//Check for wall hit
	num = collision_line_list(owner.x,owner.y,room_width,owner.y,oWall,false,true,wallList,true);
	
	if(num > 0){
		for (var i = 0; i < ds_list_size(wallList); i++) {
		    wallHit = wallList[| i];
			
			if(wallHit.object_index != oSeperator ){
					break;
			}
			else{
				wallHit = noone;	
			}
		}
	}	
	if(playerHit != noone){
		
		if(wallHit != noone){
			
			//If the player is earlier than the wall
			//Succesful hit
			if(playerHit.x <= wallHit.x){
				scDamageShootable(owner,playerHit,false,false,rocket_map[?ROCKET_MAP.DAMAGE],false);
				part_particles_create(global.ParticleSystem1,owner.x,owner.y - 50,oParticleHandler.ds_part[? PARTICLES.RELOAD],1);
				owner.current_cd /= 2; //Not 0 because that means instant fire o_o
				tpX = playerHit.x;
			}
			else{
				tpX = wallHit.x;
			}
			
	
		}
	
	}
	
	else{
		if(wallHit != noone){
			tpX = wallHit.x;	
		}
	}
	
	
}

//Otherwise, start from player and go to front of room
else{
	num = collision_line_list(owner.x,owner.y,0,owner.y,oPlayer,false,true,playerList,true);
	
	if(num > 0){
		for (var i = 0; i < ds_list_size(playerList); i++) {
		    playerHit = playerList[| i];
			
			if(playerHit != owner && playerHit.team != owner.team){
					break;
			}
			else{
				playerHit = noone;	
			}
		}
	}
	
	//Check for wall hit
	num = collision_line_list(owner.x,owner.y,0,owner.y,oWall,false,true,wallList,true);
	
	if(num > 0){
		for (var i = 0; i < ds_list_size(wallList); i++) {
		    wallHit = wallList[| i];
			
			if(wallHit.object_index != oSeperator ){
					break;
			}
			else{
				wallHit = noone;	
			}
		}
	}	
	if(playerHit != noone){
		
		if(wallHit != noone){
			
			//If the player is earlier than the wall
			//Succesful hit
			if(playerHit.x >= wallHit.x){
				scDamageShootable(owner,playerHit,false,false,rocket_map[?ROCKET_MAP.DAMAGE],false);
				part_particles_create(global.ParticleSystem1,owner.x,owner.y - 50,oParticleHandler.ds_part[? PARTICLES.RELOAD],1);
				owner.current_cd /= 2; //Not 0 because that means instant fire o_o
				tpX = playerHit.x;
			}
			else{
				tpX = wallHit.x + (wallHit.sprite_width * wallHit.image_xscale);
			}
			
	
		}
	
	}
	
	else{
		if(wallHit != noone){
			tpX = wallHit.x + (wallHit.sprite_width * wallHit.image_xscale);	
		}
	}
	
	
}

x = tpX;
y = tpY;

ds_list_destroy(playerList);