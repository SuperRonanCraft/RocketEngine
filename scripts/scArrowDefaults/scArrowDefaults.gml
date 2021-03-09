function scArrowDefaults() {


	//All lines tagged with a '*' are MUST HAVE.


	var map = ds_map_create();

	map[? ARROW_MAP.PROJECTILE] = ARROW_SPRITE.NONE; //Sprite to showw
	map[? ARROW_MAP.NAME] = "default"; //Name of weapon*
	map[? ARROW_MAP.DESCRIPTION] = "A 'pointer' to null :]"; //Description of weapon*
	map[? ARROW_MAP.SPEED] = 0; //speed of weapon
	map[? ARROW_MAP.STICK] = true; //allow wall stick
	map[? ARROW_MAP.TYPE] = WEAPON_ARROW_TYPE.NONE;//weapon type*
	map[? ARROW_MAP.COOLDOWN] = 5; //cooldown between shots
	map[? ARROW_MAP.DAMAGE] = 1; //base damage
	map[? ARROW_MAP.POWER] = 1; //base power gain
	map[? ARROW_MAP.POWER_MAX] = 200; //base power maximum
	map[? ARROW_MAP.RELOAD_TIME] = -1;
	map[? ARROW_MAP.TIMER] = 225; //uptime
	map[? ARROW_MAP.CLIP] = -1; //ammo in a clip
	map[? ARROW_MAP.STARTUP] = 0; //delay between pressing key and shooting
	map[? ARROW_MAP.SCALE] = 1; //size of sprite
	map[? ARROW_MAP.ARROW_CREATE] = -4; //Script for when arrow is created
	map[? ARROW_MAP.ARROW_AUTO_DESTROY] = false; //auto destroy on collision
	map[? ARROW_MAP.ARROW_AUTO_DESTROY_ROOM] = true; //auto destroy when out of room
	map[? ARROW_MAP.ARROW_STEP] = noone; //script to override step (including movement)
	map[? ARROW_MAP.BUFF] = noone; //buff to apply
	map[? ARROW_MAP.ROTATE] = false; //rotate the projectile
	map[? ARROW_MAP.DEATHCAUSE] = noone; //A deathcause
	map[? ARROW_MAP.KBAMT] = 2; //HSP to apply on hit
	map[? ARROW_MAP.DESPAWN_SCRIPT] = noone; //Special script to apply when destroyed
	map[? ARROW_MAP.WALL_SCRIPT] = noone; //Special script to apply when hitting a wall
	map[? ARROW_MAP.PLAYER_SCRIPT] = noone; //Special script to apply when hitting a pShootable object
	map[? ARROW_MAP.WEAPON_SCRIPT] = noone; //Special script to apply when hitting a pWeapon object
	map[? ARROW_MAP.SPAWN_SCRIPT] = noone; //Special script to apply when spawning a weapon. Overrides shoot and aim action.
	map[? ARROW_MAP.SPRITE_STICK] = noone; //Change sprite on stick
	map[? ARROW_MAP.WEIGHT] = 20; //weight of projectile

	map[? ARROW_MAP.PARTICLE] = oParticleHandler.ds_part[?PARTICLES.SPEED];; // Particle to emit
	map[? ARROW_MAP.PARTICLE_AMT] = 3; //Number of particles to emit

	//map[? ARROW_MAP.ULTIMATE] = ULTIMATE.DEFAULT_SWORD;//weapon's ultimate ability
	map[? ARROW_MAP.ULTIMATE_CHARGE_GIVE] = true; //if weapon gives ult charge
	map[? ARROW_MAP.ULTIMATE_CHARGE_MULTIPLIER] = 1; //multiplier of charge rate

	return map;


}
