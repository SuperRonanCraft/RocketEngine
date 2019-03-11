///Calculate line travel immediately

//Define main interactions we want
var playerHit = noone;
var wallHit = noone;
var playerList = ds_list_create();
var wallList = ds_list_create();
var num = 0;
var tpX = owner.x;
var tpY = owner.y;


var lineEnd;
var currentDir = direction;
var miss = true;

//If facing right, start from player and end at length of room
if (currentDir == 0) {
	lineEnd = room_width;
}
else if(currentDir == 180){
	lineEnd = 0;
}

	
num = collision_line_list(owner.x, owner.y, lineEnd, owner.y, pShootable, false, true, playerList, true);

if (num > 0)
	for (var i = 0; i < ds_list_size(playerList); i++) {
		playerHit = playerList[| i];
			
		if (playerHit != owner && playerHit.team != owner.team)
			break;
		else
			playerHit = noone;	
	}
//Check for wall hit
num = collision_line_list(owner.x, owner.y, lineEnd, owner.y, oWall, false, true, wallList, true);

if (num > 0)
	for (var i = 0; i < ds_list_size(wallList); i++) {
		wallHit = wallList[| i];
		if (wallHit.object_index != oSeperator)
			break;
		else
			wallHit = noone;
	}
	
if (playerHit != noone) {
	if (wallHit != noone) {
		//If the player is earlier than the wall
		//Succesful hit
		
		if(currentDir == 0){
			if ( (playerHit.x <= wallHit.x && currentDir == 0) || (playerHit.x >= wallHit.x && currentDir == 180)) {
				scDamageShootable(owner, playerHit, false, false, rocket_map[? ROCKET_MAP.DAMAGE], false);
				part_particles_create(global.ParticleSystem1, owner.x, owner.y - 50, oParticleHandler.ds_part[? PARTICLES.RELOAD], 1);
				owner.current_cd /= 3;
				
				//Blow up at player
				tpX = playerHit.x;
				miss = false;	
			} 
				
			
		}
	}
} 

//If miss, hit wall
if (wallHit != noone && miss){
	if(currentDir == 0)
		tpX = wallHit.x;
			
	else
		tpX = wallHit.x + (wallHit.image_xscale*wallHit.sprite_width);
}

x = tpX;
y = tpY;

//Explode
event_user(0);

ds_list_destroy(playerList);
ds_list_destroy(wallList);