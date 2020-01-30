///Loads up specific sprites into a ds_map for use in animation
///@arg character

var map = ds_map_create();

switch (argument0) {
	case CHARACTER_ENEMY.ZOMBIE:
	
		map[? ANIMATIONSTATE.SLICE] = sEnemy_Zombie_slice;
		map[? ANIMATIONSTATE.SLICEANIMB1] = sEnemy_Zombie_sliceAnimB1;
		map[? ANIMATIONSTATE.SLICEANIML1] = sEnemy_Zombie_sliceAnimL1;
		map[? ANIMATIONSTATE.SLICEANIMR1] = sEnemy_Zombie_sliceAnimR1;
		map[? ANIMATIONSTATE.SLICEANIMT1] = sEnemy_Zombie_sliceAnimT1;
		map[? ANIMATIONSTATE.SLICEANIMT2] = sEnemy_Zombie_sliceAnimT2;
		
		map[? ANIMATIONSTATE.HURT] = sEnemy_Zombie_hurt;
        map[? ANIMATIONSTATE.STANDING] = sEnemy_Zombie_idle;
		map[? ANIMATIONSTATE.SLIDING] = sEnemy_Zombie_walkend;
		map[? ANIMATIONSTATE.WALKING] = sEnemy_Zombie_walk;
		map[? ANIMATIONSTATE.RISING] = sEnemy_Zombie_rise;
		map[? ANIMATIONSTATE.FALLING] = sEnemy_Zombie_fall;
		map[? ANIMATIONSTATE.KNOCKBACK] = sEnemy_default_knockBack;
		map[? ANIMATIONSTATE.KNOCKBACK2] = sEnemy_default_knockBack2;
		map[? ANIMATIONSTATE.TECHED] = sEnemy_default_tech;
		map[? ANIMATIONSTATE.DEAD] = sEnemy_Zombie_dead1;
		map[? ANIMATIONSTATE.DEAD2] = sEnemy_Zombie_dead2;
		map[? ANIMATIONSTATE.TRAPPED] = sEnemy_default_trapped;
		map[? ANIMATIONSTATE.DEADFROZEN] = sEnemy_default_deadFrozen; 
		map[? ANIMATIONSTATE.DEADLASER] = sEnemy_default_deadLaser; 
		
		map[? ANIMATIONSTATE.GIBS] = sEnemy_Zombie_gibs; 
        break;	
	
	case CHARACTER_ENEMY.ENEMY:
	default:
		map[? ANIMATIONSTATE.SLICE] = sEnemy_default_idle;
        map[? ANIMATIONSTATE.STANDING] = sEnemy_default_idle;
		map[? ANIMATIONSTATE.SLIDING] = sEnemy_default_walkend;
		map[? ANIMATIONSTATE.WALKING] = sEnemy_default_walk;
		map[? ANIMATIONSTATE.RISING] = sEnemy_default_rise;
		map[? ANIMATIONSTATE.FALLING] = sEnemy_default_fall;
		map[? ANIMATIONSTATE.KNOCKBACK] = sEnemy_default_knockBack;
		map[? ANIMATIONSTATE.KNOCKBACK2] = sEnemy_default_knockBack2;
		map[? ANIMATIONSTATE.TECHED] = sEnemy_default_tech;
		map[? ANIMATIONSTATE.DEAD] = sEnemy_default_dead1;
		map[? ANIMATIONSTATE.DEAD2] = sEnemy_default_dead2;
		map[? ANIMATIONSTATE.TRAPPED] = sEnemy_default_trapped;
		map[? ANIMATIONSTATE.DEADFROZEN] = sEnemy_default_deadFrozen; 
		map[? ANIMATIONSTATE.DEADLASER] = sEnemy_default_deadLaser; 
		map[? ANIMATIONSTATE.GIBS] = sEnemy_default_gibs;
        break;
}

return map;