/// @desc Set all the default values for a Rockets ROCKET_MAP
/// @arg ds_map The map to set all the values to

var rocket_map = ds_map_create();
rocket_map[? ROCKET_MAP.RECOIL] = 0; //Amount of recoil to push the player back
rocket_map[? ROCKET_MAP.PROJECTILE] = ROCKET_SPRITE.NONE; //Sprite to show
rocket_map[? ROCKET_MAP.COOLDOWN] = 0; //Cooldown between shots
rocket_map[? ROCKET_MAP.SPEED] = 0; //Speed of rocket
rocket_map[? ROCKET_MAP.OFFSET] = 30; //offset to spawn the rocket
rocket_map[? ROCKET_MAP.STARTUP] = 0; //Delay between clicking the shoot key and launching
rocket_map[? ROCKET_MAP.CLIP] = -1; //How much 
rocket_map[? ROCKET_MAP.RELOAD_TIME] = -1; //Reload time
rocket_map[? ROCKET_MAP.TIMER] = -1; //Up-time
rocket_map[? ROCKET_MAP.IGNORE_WALL] = false; //allow wall clipping
rocket_map[? ROCKET_MAP.NAME] = "default"; //Name of rocket (must have)
rocket_map[? ROCKET_MAP.DESCRIPTION] = "Uh... Nothing?"; //Description of rocket (must have)
rocket_map[? ROCKET_MAP.TYPE] = ROCKET.NONE; //Rocket type (must have)
rocket_map[? ROCKET_MAP.BUFF] = noone; //The buffs a rocket has (array)
rocket_map[? ROCKET_MAP.ENABLED] = true; //Is the rocket enabled in-game?
//DAMAGES
rocket_map[? ROCKET_MAP.DAMAGE] = 1; //Base damage
rocket_map[? ROCKET_MAP.DAMAGE_ROCKET] = 0; //Damage by direct rocket
rocket_map[? ROCKET_MAP.DAMAGE_EXPLOSION] = 0; //Damage by explosion splash
//ROCKET EVENTS
rocket_map[? ROCKET_MAP.ROCKET_CREATE] = noone; //Event when a rocket is created (adds)
rocket_map[? ROCKET_MAP.ROCKET_STEP] = noone; //Step event (overrides movement)
rocket_map[? ROCKET_MAP.ROCKET_DRAW] = noone; //Draw event for rockets (adds)
rocket_map[? ROCKET_MAP.ROCKET_DESTROY] = noone; //The rocket destroy script (adds)
//PARTICLES
rocket_map[? ROCKET_MAP.PARTICLE_TRAIL] = noone; //rocket particle trail
rocket_map[? ROCKET_MAP.PARTICLE_EXPLOSION] = noone; //Explosion particle
rocket_map[? ROCKET_MAP.PARTICLE_AMT] = 1; //rocket particle trail
//SCREEN SHAKE
rocket_map[? ROCKET_MAP.SHAKE_MAGNITUDE] = 2; //Screen shake magnitude
rocket_map[? ROCKET_MAP.SHAKE_FRAMES] = 8; //Screen shake frame
//EXPLOSIONS
rocket_map[? ROCKET_MAP.EXPLOSION_SPRITE] = sexplosion_Default; //Sprite of explosion
rocket_map[? ROCKET_MAP.EXPLOSION_CREATE] = noone; //Only if no event for rocket, wall or shootable
rocket_map[? ROCKET_MAP.EXPLOSION_ROCKET] = noone; //Explosion with a rocket
rocket_map[? ROCKET_MAP.EXPLOSION_WALL] = noone; //Explosion with a wall
rocket_map[? ROCKET_MAP.EXPLOSION_SHOOTABLE] = noone; //Explosion with a shootable
rocket_map[? ROCKET_MAP.EXPLOSION_STEP] = noone; //Explosion step event
//SOUNDS
rocket_map[? ROCKET_MAP.SOUND_SHOOT] = SOUND.EFFECT_SHOOT; //Rocket shoot sound
rocket_map[? ROCKET_MAP.SOUND_EXPLOSION] = SOUND.EFFECT_EXP; //Rocket explode sound
//ULTIMATE
rocket_map[? ROCKET_MAP.ULTIMATE] = ULTIMATE.DEFAULT; //The rockets ultimate power
rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_GIVE] = true; //If the rocket should give ultcharge
rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_MULTIPLIER] = 1; //Multiplier offset of a specific rocket 1 for none
//KNOCKBACK
rocket_map[? ROCKET_MAP.KBAMT] = 20;
var map = argument0;
map = rocket_map;