function scBombDefaults() {


	//All lines tagged with a '*' are MUST HAVE.


	var map = ds_map_create();

	map[? BOMB_MAP.PROJECTILE] = BOMB_SPRITE.NONE; //Sprite to showw
	map[? BOMB_MAP.NAME] = "default"; //Name of weapon*
	map[? BOMB_MAP.DESCRIPTION] = "Hidden like a ninja."; //Description of weapon*
	map[? BOMB_MAP.SPEED] = 0; //speed of weapon
	map[? BOMB_MAP.STICK] = true; //allow wall stick
	map[? BOMB_MAP.TYPE] = WEAPON_BOMB_TYPE.NONE;//weapon type*
	map[? BOMB_MAP.COOLDOWN] = 5; //cooldown between shots
	map[? BOMB_MAP.DAMAGE] = 1; //base damage
	map[? BOMB_MAP.RELOAD_TIME] = -1;
	map[? BOMB_MAP.TIMER] = room_speed* 1; //uptime
	map[? BOMB_MAP.CLIP] = -1; //ammo in a clip
	map[? BOMB_MAP.STARTUP] = 0; //delay between pressing key and shooting
	map[? BOMB_MAP.SCALE] = 1; //size of sprite
	map[? BOMB_MAP.BOMB_AUTO_DESTROY] = false; //auto destroy on collision
	map[? BOMB_MAP.BOMB_AUTO_DESTROY_ROOM] = true; //auto destroy when out of room
	map[? BOMB_MAP.BOMB_STEP] = noone; //script to override step (including movement)
	map[? BOMB_MAP.BUFF] = noone; //buff to apply
	map[? BOMB_MAP.ROTATE] = true; //rotate the projectile
	map[? BOMB_MAP.DEATHCAUSE] = noone; //A deathcause
	map[? BOMB_MAP.KBAMT] = 15; //HSP to apply on hit
	map[? BOMB_MAP.DESPAWN_SCRIPT] = noone; //Special script to apply when destroyed
	map[? BOMB_MAP.WALL_SCRIPT] = noone; //Special script to apply when hitting a wall
	map[? BOMB_MAP.DELETE_ON_HIT] = true; //Delete instance on hit, allowing for one collision
	map[? BOMB_MAP.HIT_SCRIPT] = noone; //Script to add onto when hitting an entity
	map[? BOMB_MAP.PLAYER_SCRIPT] = noone; //Special script to apply when hitting a pShootable object
	map[? BOMB_MAP.WEAPON_SCRIPT] = noone; //Special script to apply when hitting a pWeapon object
	map[? BOMB_MAP.SPAWN_SCRIPT] = noone; //Special script to apply when spawning a BOMB. Overrides shoot and aim action.
	map[? BOMB_MAP.SPRITE_STICK] = noone; //Change sprite on stick
	map[? BOMB_MAP.WALL_COLLIDE] = true; //Collide with walls
	map[? BOMB_MAP.WEIGHT] = 9.8; //How fast the entity falls
	map[? BOMB_MAP.RICOCHET] = false; //Bomb bounces off player
	map[? BOMB_MAP.FRICTION] = 0.25; //Friction on collision
	map[? BOMB_MAP.BOUNCE] = 0.5; //Height reduction on collision
	map[? BOMB_MAP.DAMAGE_ELEMENT] = DAMAGE_ELEMENT.NONE; //Damage element to inflict
	map[? BOMB_MAP.DAMAGE_TYPE] = DAMAGE_TYPE.SPLASH; //Damage type to inflict
	map[? BOMB_MAP.TIMER_ACCEL] = 0.1; //Percentage of timer to add when in contact with entity on ground
	map[? BOMB_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.DUST]; // Particle to emit
	map[? BOMB_MAP.PARTICLE_AMT] = 1; //Number of particles to emit
	map[? BOMB_MAP.PARTICLE_SPLASH] = oParticleHandler.ds_part[? PARTICLES.SCRAPING];//Particle to splash
	map[? BOMB_MAP.PARTICLE_SPLASH_COLOR] = c_aqua;
	map[? BOMB_MAP.PARTICLE_EXPLOSION] = oParticleHandler.ds_part[? PARTICLES.EXPLOSION_DEFAULT];//Particle to explode
	map[? BOMB_MAP.PARTICLE_WALL] = false; //Spawn particles on wall hit
	map[? BOMB_MAP.SHAKE_MAGNITUDE] = 2;
	map[? BOMB_MAP.SHAKE_FRAMES] = 7;
	map[? BOMB_MAP.EXPLOSION_CREATE] = noone;
	map[? BOMB_MAP.EXPLOSION_CREATE_DRAW] = noone;
	map[? BOMB_MAP.EXPLOSION_SCALE] = 3;
	map[? BOMB_MAP.EXPLOSION_SPRITE] = sexplosionDefault;
	map[? BOMB_MAP.EXPLOSION_STEP] = noone;
	map[? BOMB_MAP.EXPLOSION_ADDS_BUFF] = false; //Boolean stating whether the explosion applies buff as well
	//map[? BOMB_MAP.ULTIMATE] = ULTIMATE.DEFAULT_SWORD;//weapon's ultimate ability
	map[? BOMB_MAP.ULTIMATE_CHARGE_GIVE] = true; //if weapon gives ult charge
	map[? BOMB_MAP.ULTIMATE_CHARGE_MULTIPLIER] = 1; //multiplier of charge rate

	return map;


}
