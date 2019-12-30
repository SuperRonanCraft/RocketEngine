///Arrow weapon map
///@arg arrow
///@arg weapon-map

scArrowChange(argument0, argument1);

enum WEAPON_ARROW_TYPE {
	NONE, DEFAULT, ICE, FIRE, PORTAL, BRICK, 
	MAGNET, SLIME, SAND, SHOTGUN, METAL, ELECTRIC
}

enum ARROW_SPRITE{
	NONE = noone, DEFAULT = sArrow_default,ICE = sShuriken_Ice, FIRE = sShuriken_Fire, PORTAL = sShuriken_Portal, 
	BRICK = sShuriken_Brick,  MAGNET = sShuriken_Magnet, SAND = sShuriken_Sand, SHOTGUN = sShuriken_Shotgun,
	SLIME = sShuriken_Slime, METAL = sShuriken_Metal, ELECTRIC = sShuriken_Shock, 
}

enum ARROW_MAP{

	//BASIC VARIABLES
	SPEED,DAMAGE,POWER, POWER_MAX,STICK,RELOAD_TIME, NAME, DESCRIPTION, TIMER, TYPE,PROJECTILE,
	COOLDOWN,CLIP,STARTUP, SCALE, SHURIKEN_STEP,BUFF,KBAMT, WEIGHT,
	SHURIKEN_AUTO_DESTROY,SHURIKEN_AUTO_DESTROY_ROOM, PARTICLE,PARTICLE_AMT,
	DESPAWN_SCRIPT,WALL_SCRIPT,PLAYER_SCRIPT,WEAPON_SCRIPT,	ROTATE,SPAWN_SCRIPT,SPRITE_STICK,
	//ULTIMATE
	//ULTIMATE,
	ULTIMATE_CHARGE_GIVE,ULTIMATE_CHARGE_MULTIPLIER,
	//UNIQUE
	DEATHCAUSE,

}