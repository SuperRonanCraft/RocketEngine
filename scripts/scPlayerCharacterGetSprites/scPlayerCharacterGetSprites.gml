///scmap()
///Loads up specific sprites into a ds_map for use in animation
///@arg character

var map = ds_map_create();
//var map = player_map[? PLAYER_MAP.CHARACTER_INFO];

switch (argument0) {
	case CHARACTERS.ENEMY:
        map[? ANIMATIONSTATE.STANDING] = sEnemy_default_idle;
		map[? ANIMATIONSTATE.SLIDING] = sEnemy_default_walkend;
		map[? ANIMATIONSTATE.WALKING] = sEnemy_default_walk;
		map[? ANIMATIONSTATE.RISING] = sEnemy_default_rise;
		map[? ANIMATIONSTATE.FALLING] = sEnemy_default_fall;
		map[? ANIMATIONSTATE.KNOCKBACK] = sEnemy_default_knockBack;
		map[? ANIMATIONSTATE.KNOCKBACK2] = sEnemy_default_knockBack2;
		map[? ANIMATIONSTATE.TECHED] = sPlayer_sword_tech; //MISSING sEnemy_default_tech;
		map[? ANIMATIONSTATE.DEAD] = sEnemy_default_dead1;
		map[? ANIMATIONSTATE.DEAD2] = sEnemy_default_dead2;
		map[? ANIMATIONSTATE.TRAPPED] = sEnemy_default_trapped;
		map[? ANIMATIONSTATE.DEADFROZEN] = sPlayer_sword_deadFrozen; //MISSING sEnemy_default_deadFrozen;
		map[? ANIMATIONSTATE.DEADLASER] = sPlayer_sword_deadLaser; //MISSING sEnemy_default_deadLaser;
        break;
    case CHARACTERS.SWORD:
        map[? ANIMATIONSTATE.STANDING] = sPlayer_sword_idle;
		map[? ANIMATIONSTATE.SLIDING] = sPlayer_sword_walkend;
		map[? ANIMATIONSTATE.WALKING] = sPlayer_sword_walk;
		map[? ANIMATIONSTATE.RISING] = sPlayer_sword_rise;
		map[? ANIMATIONSTATE.FALLING] = sPlayer_sword_fall;
		map[? ANIMATIONSTATE.KNOCKBACK] = sPlayer_sword_knockBack;
		map[? ANIMATIONSTATE.KNOCKBACK2] = sPlayer_sword_knockBack2;
		map[? ANIMATIONSTATE.TECHED] = sPlayer_sword_tech;
		map[? ANIMATIONSTATE.DEAD] = sPlayer_sword_dead1;
		map[? ANIMATIONSTATE.DEAD2] = sPlayer_sword_dead2;
		map[? ANIMATIONSTATE.TRAPPED] = sPlayer_sword_trapped;
		map[? ANIMATIONSTATE.DEADFROZEN] = sPlayer_sword_deadFrozen;
		map[? ANIMATIONSTATE.DEADLASER] = sPlayer_sword_deadLaser;
        break;
    default:
        map[? ANIMATIONSTATE.STANDING] = sPlayer_default_idle;
		map[? ANIMATIONSTATE.SLIDING] = sPlayer_default_walkend;
		map[? ANIMATIONSTATE.WALKING] = sPlayer_default_walk;
		map[? ANIMATIONSTATE.RISING] = sPlayer_default_rise;
		map[? ANIMATIONSTATE.FALLING] = sPlayer_default_fall;
		map[? ANIMATIONSTATE.KNOCKBACK] = sPlayer_default_knockBack;
		map[? ANIMATIONSTATE.KNOCKBACK2] = sPlayer_default_knockBack2;
		map[? ANIMATIONSTATE.TECHED] = sPlayer_default_tech;
		map[? ANIMATIONSTATE.DEAD] = sPlayer_default_dead1;
		map[? ANIMATIONSTATE.DEAD2] = sPlayer_default_dead2;
		map[? ANIMATIONSTATE.TRAPPED] = sPlayer_default_trapped;
		map[? ANIMATIONSTATE.DEADFROZEN] = sPlayer_default_deadFrozen;
		map[? ANIMATIONSTATE.DEADLASER] = sPlayer_default_deadLaser;
        break;
}

return map;