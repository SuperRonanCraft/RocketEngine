function scBulletDefaults() {


	//All lines tagged with a '*' are MUST HAVE.


	var map = ds_map_create();

	map[? BULLET_MAP.PROJECTILE] = BULLET_SPRITE.NONE; //Sprite to showw
	map[? BULLET_MAP.NAME] = "default"; //Name of weapon*
	map[? BULLET_MAP.DESCRIPTION] = "A 'pointer' to null :]"; //Description of weapon*
	map[? BULLET_MAP.SPEED] = 0; //speed of weapon
	map[? BULLET_MAP.STICK] = true; //allow wall stick
	map[? BULLET_MAP.TYPE] = WEAPON_BULLET_TYPE.NONE;//weapon type*
	map[? BULLET_MAP.COOLDOWN] = 5; //cooldown between shots
	map[? BULLET_MAP.DAMAGE] = 1; //base damage
	map[? BULLET_MAP.POWER] = 1; //base power gain
	map[? BULLET_MAP.POWER_MAX] = 200; //base power maximum
	map[? BULLET_MAP.RELOAD_TIME] = -1;
	map[? BULLET_MAP.TIMER] = 225; //uptime
	map[? BULLET_MAP.CLIP] = -1; //ammo in a clip
	map[? BULLET_MAP.STARTUP] = 0; //delay between pressing key and shooting
	map[? BULLET_MAP.SCALE] = 1; //size of sprite
	map[? BULLET_MAP.WALL_COLLIDE] = false;
	map[? BULLET_MAP.BULLET_CREATE] = -4; //Script for when bullet is created
	map[? BULLET_MAP.OUT_OF_ROOM_SCRIPT] = -4; //Script for when bullet is out of room
	map[? BULLET_MAP.BULLET_AUTO_DESTROY] = false; //auto destroy on collision
	map[? BULLET_MAP.BULLET_AUTO_DESTROY_ROOM] = true; //auto destroy when out of room
	map[? BULLET_MAP.BULLET_STEP] = noone; //script to override step (including movement)
	map[? BULLET_MAP.BUFF] = noone; //buff to apply
	map[? BULLET_MAP.ROTATE] = false; //rotate the projectile
	map[? BULLET_MAP.DEATHCAUSE] = noone; //A deathcause
	map[? BULLET_MAP.KBAMT] = 2; //HSP to apply on hit
	map[? BULLET_MAP.DESPAWN_SCRIPT] = noone; //Special script to apply when destroyed
	map[? BULLET_MAP.WALL_SCRIPT] = noone; //Special script to apply when hitting a wall
	map[? BULLET_MAP.PLAYER_SCRIPT] = noone; //Special script to apply when hitting a pShootable object
	map[? BULLET_MAP.WEAPON_SCRIPT] = noone; //Special script to apply when hitting a pWeapon object
	map[? BULLET_MAP.SPAWN_SCRIPT] = noone; //Special script to apply when spawning a weapon. Overrides shoot and aim action.
	map[? BULLET_MAP.SPRITE_STICK] = noone; //Change sprite on stick
	map[? BULLET_MAP.WEIGHT] = 20; //weight of projectile

	map[? BULLET_MAP.PARTICLE] = oParticleHandler.ds_part[?PARTICLES.SPEED];; // Particle to emit
	map[? BULLET_MAP.PARTICLE_AMT] = 3; //Number of particles to emit

	//map[? BULLET_MAP.ULTIMATE] = ULTIMATE.DEFAULT_SWORD;//weapon's ultimate ability
	map[? BULLET_MAP.ULTIMATE_CHARGE_GIVE] = true; //if weapon gives ult charge
	map[? BULLET_MAP.ULTIMATE_CHARGE_MULTIPLIER] = 1; //multiplier of charge rate

	return map;


}
