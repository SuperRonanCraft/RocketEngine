///Shuriken fill weapon mpa
///@arg shuriken
///@arg weapon-map
function scShurikenStart(argument0, argument1) {

	scShurikenChange(argument0, argument1);

	enum WEAPON_SHURIKEN_TYPE {
		NONE, DEFAULT, ICE, FIRE, PORTAL, BRICK, MAGNET ,SLIME, SAND, SHOTGUN, METAL, ELECTRIC
	}

	enum SHURIKEN_SPRITE {
		NONE = noone, DEFAULT = sShuriken_Default,ICE = sShuriken_Ice, FIRE = sShuriken_Fire, PORTAL = sShuriken_Portal, 
		BRICK = sShuriken_Brick,  MAGNET = sShuriken_Magnet, SAND = sShuriken_Sand, SHOTGUN = sShuriken_Shotgun,
		SLIME = sShuriken_Slime, METAL = sShuriken_Metal, ELECTRIC = sShuriken_Shock, 
	}

	enum SHURIKEN_MAP {

		//BASIC VARIABLES
		SPEED, DAMAGE, STICK, RELOAD_TIME, NAME, DESCRIPTION, TIMER, TYPE, PROJECTILE,
		COOLDOWN,CLIP,STARTUP, SCALE, SHURIKEN_STEP,BUFF,KBAMT,
		SHURIKEN_AUTO_DESTROY, SHURIKEN_AUTO_DESTROY_ROOM, PARTICLE,PARTICLE_AMT,
		DESPAWN_SCRIPT, WALL_SCRIPT, PLAYER_SCRIPT,WEAPON_SCRIPT, ROTATE, SPAWN_SCRIPT, SPRITE_STICK,
		//ULTIMATE
		/*ULTIMATE,*/ 
		ULTIMATE_CHARGE_GIVE, ULTIMATE_CHARGE_MULTIPLIER,
		//UNIQUE
		DEATHCAUSE,

	}


}
