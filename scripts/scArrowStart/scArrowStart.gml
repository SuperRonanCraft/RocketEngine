///Arrow weapon map
///@arg arrow
///@arg weapon-map
function scArrowStart(argument0, argument1) {

	scArrowChange(argument0, argument1);

	enum WEAPON_ARROW_TYPE {
		NONE, DEFAULT, ICE, FIRE, PORTAL, BRICK, 
		MAGNET, SLIME, SAND, SHOTGUN, METAL, ELECTRIC
	}

	enum ARROW_SPRITE{
		NONE = noone, DEFAULT = sArrow_default,ICE = sArrow_ice, FIRE = sArrow_fire, PORTAL = sArrow_portal, 
		BRICK = sArrow_brick,  MAGNET = sShuriken_Magnet, SAND = sArrow_sand, SHOTGUN = sArrow_shotgun,
		SLIME = sArrow_slime, METAL = sArrow_metal, ELECTRIC = sArrow_shock, 
	}

	enum ARROW_MAP{

		//BASIC VARIABLES
		SPEED,DAMAGE,POWER, POWER_MAX,STICK,RELOAD_TIME, NAME, DESCRIPTION, TIMER, TYPE,PROJECTILE,
		COOLDOWN,CLIP,STARTUP, SCALE, ARROW_STEP,BUFF,KBAMT, WEIGHT,
		ARROW_AUTO_DESTROY,ARROW_AUTO_DESTROY_ROOM, PARTICLE,PARTICLE_AMT,
		DESPAWN_SCRIPT,WALL_SCRIPT,PLAYER_SCRIPT,WEAPON_SCRIPT,	ROTATE,SPAWN_SCRIPT,SPRITE_STICK, ARROW_CREATE,
		//ULTIMATE
		//ULTIMATE,
		ULTIMATE_CHARGE_GIVE,ULTIMATE_CHARGE_MULTIPLIER,
		//UNIQUE
		DEATHCAUSE,

	}


}
