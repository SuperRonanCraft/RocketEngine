/// @desc Set all the default values for a Rockets map

var map = ds_map_create();
map[? ROCKET_MAP.RECOIL] = 0; //Amount of recoil to push the player back
map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.NONE; //Sprite to show
map[? ROCKET_MAP.COOLDOWN] = 0; //Cooldown between shots
map[? ROCKET_MAP.SPEED] = 0; //Speed of rocket
map[? ROCKET_MAP.OFFSET] = 30; //offset to spawn the rocket
map[? ROCKET_MAP.STARTUP] = 0; //Delay between clicking the shoot key and launching
map[? ROCKET_MAP.CLIP] = -1; //How much 
map[? ROCKET_MAP.RELOAD_TIME] = -1; //Reload time
map[? ROCKET_MAP.TIMER] = -1; //Up-time
map[? ROCKET_MAP.IGNORE_WALL] = false; //allow wall clipping
map[? ROCKET_MAP.NAME] = "default"; //Name of rocket (must have)
map[? ROCKET_MAP.DESCRIPTION] = "Uh... Nothing?"; //Description of rocket (must have)
map[? ROCKET_MAP.TYPE] = ROCKET.NONE; //Rocket type (must have)
map[? ROCKET_MAP.BUFF] = noone; //The buffs a rocket has (array)
map[? ROCKET_MAP.ENABLED] = true; //Is the rocket enabled in-game?
//DAMAGES
map[? ROCKET_MAP.DAMAGE] = 1; //Base damage
map[? ROCKET_MAP.DAMAGE_ROCKET] = 0; //Damage by direct rocket
map[? ROCKET_MAP.DAMAGE_EXPLOSION] = 0; //Damage by explosion splash
//ROCKET EVENTS
map[? ROCKET_MAP.ROCKET_CREATE] = noone; //Event when a rocket is created (adds)
map[? ROCKET_MAP.ROCKET_STEP] = noone; //Step event (overrides movement)
map[? ROCKET_MAP.ROCKET_DRAW] = noone; //Draw event for rockets (adds)
map[? ROCKET_MAP.ROCKET_DESTROY] = noone; //The rocket destroy script (adds)
//PARTICLES
map[? ROCKET_MAP.PARTICLE_TRAIL] = noone; //rocket particle trail
map[? ROCKET_MAP.PARTICLE_EXPLOSION] = noone; //Explosion particle
map[? ROCKET_MAP.PARTICLE_AMT] = 5; //rocket particle trail amount
//SCREEN SHAKE
map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 2; //Screen shake magnitude
map[? ROCKET_MAP.SHAKE_FRAMES] = 8; //Screen shake frame
//EXPLOSIONS
map[? ROCKET_MAP.EXPLOSION_SPRITE] = sexplosion_Default; //Sprite of explosion
map[? ROCKET_MAP.EXPLOSION_CREATE] = noone; //Only if no event for rocket, wall or shootable
map[? ROCKET_MAP.EXPLOSION_ROCKET] = noone; //Explosion with a rocket
map[? ROCKET_MAP.EXPLOSION_WALL] = noone; //Explosion with a wall
map[? ROCKET_MAP.EXPLOSION_SHOOTABLE] = noone; //Explosion with a shootable
map[? ROCKET_MAP.EXPLOSION_STEP] = noone; //Explosion step event
//SOUNDS
map[? ROCKET_MAP.SOUND_SHOOT] = SOUND.EFFECT_SHOOT; //Rocket shoot sound
map[? ROCKET_MAP.SOUND_EXPLOSION] = SOUND.EFFECT_EXP; //Rocket explode sound
//ULTIMATE
map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.DEFAULT; //The rockets ultimate power
map[? ROCKET_MAP.ULTIMATE_CHARGE_GIVE] = true; //If the rocket should give ultcharge
map[? ROCKET_MAP.ULTIMATE_CHARGE_MULTIPLIER] = 1; //Multiplier offset of a specific rocket 1 for none
//KNOCKBACK
map[? ROCKET_MAP.KBAMT] = 20;
return map;