///Arrow weapon map
///@arg arrow
///@arg weapon-map
function scBulletStart(argument0, argument1) {

	scBulletChange(argument0, argument1);

	enum WEAPON_BULLET_TYPE {
		NONE, DEFAULT, ICE, FIRE, PORTAL, BRICK, 
		MAGNET, SLIME, SAND, SHOTGUN, METAL, ELECTRIC
	}

	enum BULLET_SPRITE{
		NONE = noone, DEFAULT = sArrow_default,ICE = sArrow_ice, FIRE = sArrow_fire, PORTAL = sArrow_portal, 
		BRICK = sArrow_brick,  MAGNET = sShuriken_Magnet, SAND = sArrow_sand, SHOTGUN = sArrow_shotgun,
		SLIME = sArrow_slime, METAL = sArrow_metal, ELECTRIC = sArrow_shock, 
	}

	enum BULLET_MAP{

		//BASIC VARIABLES
		SPEED,DAMAGE,POWER, POWER_MAX,STICK,RELOAD_TIME, NAME, DESCRIPTION, TIMER, TYPE,PROJECTILE,
		COOLDOWN,CLIP,STARTUP, SCALE, BULLET_STEP,BUFF,KBAMT, WEIGHT, WALL_COLLIDE,
		BULLET_AUTO_DESTROY,BULLET_AUTO_DESTROY_ROOM, PARTICLE,PARTICLE_AMT,
		OUT_OF_ROOM_SCRIPT,DESPAWN_SCRIPT,WALL_SCRIPT,PLAYER_SCRIPT,WEAPON_SCRIPT,	ROTATE,SPAWN_SCRIPT,SPRITE_STICK, BULLET_CREATE,
		DAMPENING, DAMAGE_ELEMENT, DAMAGE_TYPE,RECOIL,
		//ULTIMATE,
		ULTIMATE_CHARGE_GIVE,ULTIMATE_CHARGE_MULTIPLIER,
		//UNIQUE
		DEATHCAUSE,

	}


}