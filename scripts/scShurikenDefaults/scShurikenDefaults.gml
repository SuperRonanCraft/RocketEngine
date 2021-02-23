function scShurikenDefaults() {


	//All lines tagged with a '*' are MUST HAVE.


	var map = ds_map_create();

	map[? SHURIKEN_MAP.PROJECTILE] = SHURIKEN_SPRITE.NONE; //Sprite to showw
	map[? SHURIKEN_MAP.NAME] = "default"; //Name of weapon*
	map[? SHURIKEN_MAP.DESCRIPTION] = "Hidden like a ninja."; //Description of weapon*
	map[? SHURIKEN_MAP.SPEED] = 0; //speed of weapon
	map[? SHURIKEN_MAP.STICK] = true; //allow wall stick
	map[? SHURIKEN_MAP.TYPE] = WEAPON_SHURIKEN_TYPE.NONE;//weapon type*
	map[? SHURIKEN_MAP.COOLDOWN] = 5; //cooldown between shots
	map[? SHURIKEN_MAP.DAMAGE] = 1; //base damage
	map[? SHURIKEN_MAP.RELOAD_TIME] = -1;
	map[? SHURIKEN_MAP.TIMER] = 125; //uptime
	map[? SHURIKEN_MAP.CLIP] = -1; //ammo in a clip
	map[? SHURIKEN_MAP.STARTUP] = 0; //delay between pressing key and shooting
	map[? SHURIKEN_MAP.SCALE] = 1; //size of sprite
	map[? SHURIKEN_MAP.SHURIKEN_AUTO_DESTROY] = false; //auto destroy on collision
	map[? SHURIKEN_MAP.SHURIKEN_AUTO_DESTROY_ROOM] = true; //auto destroy when out of room
	map[? SHURIKEN_MAP.SHURIKEN_STEP] = noone; //script to override step (including movement)
	map[? SHURIKEN_MAP.BUFF] = noone; //buff to apply
	map[? SHURIKEN_MAP.ROTATE] = true; //rotate the projectile
	map[? SHURIKEN_MAP.DEATHCAUSE] = noone; //A deathcause
	map[? SHURIKEN_MAP.KBAMT] = 2; //HSP to apply on hit
	map[? SHURIKEN_MAP.DESPAWN_SCRIPT] = noone; //Special script to apply when destroyed
	map[? SHURIKEN_MAP.WALL_SCRIPT] = noone; //Special script to apply when hitting a wall
	map[? SHURIKEN_MAP.PLAYER_SCRIPT] = noone; //Special script to apply when hitting a pShootable object
	map[? SHURIKEN_MAP.WEAPON_SCRIPT] = noone; //Special script to apply when hitting a pWeapon object
	map[? SHURIKEN_MAP.SPAWN_SCRIPT] = noone; //Special script to apply when spawning a shuriken. Overrides shoot and aim action.
	map[? SHURIKEN_MAP.SPRITE_STICK] = noone; //Change sprite on stick

	map[? SHURIKEN_MAP.PARTICLE] = oParticleHandler.ds_part[? PARTICLES.SPEED];; // Particle to emit
	map[? SHURIKEN_MAP.PARTICLE_AMT] = 3; //Number of particles to emit

	//map[? SHURIKEN_MAP.ULTIMATE] = ULTIMATE.DEFAULT_SWORD;//weapon's ultimate ability
	map[? SHURIKEN_MAP.ULTIMATE_CHARGE_GIVE] = true; //if weapon gives ult charge
	map[? SHURIKEN_MAP.ULTIMATE_CHARGE_MULTIPLIER] = 1; //multiplier of charge rate

	return map;


}
