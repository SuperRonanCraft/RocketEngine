rocket_map = ds_map_create();
rocket_map[? ROCKET_MAP.RECOIL] = 0; //Amount of recoil to push the player back
rocket_map[? ROCKET_MAP.DAMAGE] = 1; //Damage count
rocket_map[? ROCKET_MAP.PROJECTILE] = -1; //Sprite to show
rocket_map[? ROCKET_MAP.PROJECTILE_SOUND] = SOUND.GP_SHOOT; //Rocket shoot sound
rocket_map[? ROCKET_MAP.COOLDOWN] = 0; //Cooldown between shots
rocket_map[? ROCKET_MAP.SPEED] = 0; //Speed of rocket
rocket_map[? ROCKET_MAP.OFFSET] = 10; //offset to spawn the rocket
rocket_map[? ROCKET_MAP.STARTUP] = 0; //Delay between clicking the shoot key and launching
rocket_map[? ROCKET_MAP.CLIP] = -1; //How much 
rocket_map[? ROCKET_MAP.RELOAD_TIME] = -1; //Reload time
rocket_map[? ROCKET_MAP.SPECIALS] = noone; //Special scripts
rocket_map[? ROCKET_MAP.TIMER] = -1; //Up-time
rocket_map[? ROCKET_MAP.IGNORE_WALL] = false; //allow wall clipping
rocket_map[? ROCKET_MAP.NAME] = "default";
rocket_map[? ROCKET_MAP.BUFF] = noone;
rocket_map[? ROCKET_MAP.EXPLOSION] = sHit_Spark;
rocket_map[? ROCKET_MAP.PARTICLE_TRAIL] = noone;
rocket_map[? ROCKET_MAP.PARTICLE_EXPLOSION] = noone;

//Special Collision Checks
//Determine what a rocket does when it collides with either object
//If kept at noone, does default action
/*specialCollideWall = noone;
specialCollideRocket = noone;
specialCollideShootable = noone;