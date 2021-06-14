function scPotionDefaults() {


	//All lines tagged with a '*' are MUST HAVE.


	var map = ds_map_create();

	map[? POTION_MAP.PROJECTILE] = POTION_SPRITE.NONE; //Sprite to showw
	map[? POTION_MAP.NAME] = "default"; //Name of weapon*
	map[? POTION_MAP.DESCRIPTION] = "Hidden like a ninja."; //Description of weapon*
	map[? POTION_MAP.SPEED] = 0; //speed of weapon
	map[? POTION_MAP.STICK] = true; //allow wall stick
	map[? POTION_MAP.TYPE] = WEAPON_POTION_TYPE.NONE;//weapon type*
	map[? POTION_MAP.COOLDOWN] = 5; //cooldown between shots
	map[? POTION_MAP.DAMAGE] = 1; //base damage
	map[? POTION_MAP.RELOAD_TIME] = -1;
	map[? POTION_MAP.TIMER] = 125; //uptime
	map[? POTION_MAP.CLIP] = -1; //ammo in a clip
	map[? POTION_MAP.STARTUP] = 0; //delay between pressing key and shooting
	map[? POTION_MAP.SCALE] = 1; //size of sprite
	map[? POTION_MAP.POTION_AUTO_DESTROY] = false; //auto destroy on collision
	map[? POTION_MAP.POTION_AUTO_DESTROY_ROOM] = true; //auto destroy when out of room
	map[? POTION_MAP.POTION_STEP] = noone; //script to override step (including movement)
	map[? POTION_MAP.BUFF] = noone; //buff to apply
	map[? POTION_MAP.ROTATE] = true; //rotate the projectile
	map[? POTION_MAP.DEATHCAUSE] = noone; //A deathcause
	map[? POTION_MAP.KBAMT] = 2; //HSP to apply on hit
	map[? POTION_MAP.DESPAWN_SCRIPT] = noone; //Special script to apply when destroyed
	map[? POTION_MAP.WALL_SCRIPT] = noone; //Special script to apply when hitting a wall
	map[? POTION_MAP.DELETE_ON_HIT] = true; //Delete instance on hit, allowing for one collision
	map[? POTION_MAP.HIT_SCRIPT] = noone; //Script to add onto when hitting an entity
	map[? POTION_MAP.PLAYER_SCRIPT] = noone; //Special script to apply when hitting a pShootable object
	map[? POTION_MAP.WEAPON_SCRIPT] = noone; //Special script to apply when hitting a pWeapon object
	map[? POTION_MAP.SPAWN_SCRIPT] = noone; //Special script to apply when spawning a POTION. Overrides shoot and aim action.
	map[? POTION_MAP.SPRITE_STICK] = noone; //Change sprite on stick
	map[? POTION_MAP.WALL_COLLIDE] = false; //Collide with walls
	map[? POTION_MAP.WEIGHT] = 9.8; //How fast the entity falls
	map[? POTION_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.DUST]; // Particle to emit
	map[? POTION_MAP.PARTICLE_AMT] = 1; //Number of particles to emit
	map[? POTION_MAP.PARTICLE_SPLASH] = oParticleHandler.ds_part[? PARTICLES.POTION_SPLASH];//Particle to splash
	map[? POTION_MAP.PARTICLE_SPLASH_COLOR] = c_aqua;
	//map[? POTION_MAP.ULTIMATE] = ULTIMATE.DEFAULT_SWORD;//weapon's ultimate ability
	map[? POTION_MAP.ULTIMATE_CHARGE_GIVE] = true; //if weapon gives ult charge
	map[? POTION_MAP.ULTIMATE_CHARGE_MULTIPLIER] = 1; //multiplier of charge rate

	return map;


}
