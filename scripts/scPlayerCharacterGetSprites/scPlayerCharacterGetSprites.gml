///scmap()
///Loads up specific sprites into a ds_map for use in animation
///@arg character
function scPlayerCharacterGetSprites(argument0) {

	var map = ds_map_create();

	switch (argument0) {
	    case CHARACTER.SWORD:
	        map[? ANIMATIONSTATE.STANDING] = sPlayer_sword_idle;
			map[? ANIMATIONSTATE.SLICE] = sPlayer_sword_idle;
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
			map[? ANIMATIONSTATE.GIBS] = sPlayer_sword_gibs;
	        break;
	    case CHARACTER.ARROW:
			map[? ANIMATIONSTATE.SLICE] = sPlayer_arrow_idle;
	        map[? ANIMATIONSTATE.STANDING] = sPlayer_arrow_idle;
			map[? ANIMATIONSTATE.SLIDING] = sPlayer_arrow_walkend;
			map[? ANIMATIONSTATE.WALKING] = sPlayer_arrow_walk;
			map[? ANIMATIONSTATE.RISING] = sPlayer_arrow_rise;
			map[? ANIMATIONSTATE.FALLING] = sPlayer_arrow_fall;
			map[? ANIMATIONSTATE.KNOCKBACK] = sPlayer_arrow_knockBack;
			map[? ANIMATIONSTATE.KNOCKBACK2] = sPlayer_arrow_knockBack2;
			map[? ANIMATIONSTATE.TECHED] = sPlayer_arrow_tech;
			map[? ANIMATIONSTATE.DEAD] = sPlayer_arrow_dead1;
			map[? ANIMATIONSTATE.DEAD2] = sPlayer_arrow_dead2;
			map[? ANIMATIONSTATE.TRAPPED] = sPlayer_arrow_trapped;
			map[? ANIMATIONSTATE.DEADFROZEN] = sPlayer_arrow_deadFrozen;
			map[? ANIMATIONSTATE.DEADLASER] = sPlayer_arrow_deadLaser;
			map[? ANIMATIONSTATE.GIBS] = sPlayer_arrow_gibs;
	        break;
	    case CHARACTER.POTION:
			map[? ANIMATIONSTATE.SLICE] = sPlayer_potion_idle;
	        map[? ANIMATIONSTATE.STANDING] = sPlayer_potion_idle;
			map[? ANIMATIONSTATE.SLIDING] = sPlayer_potion_walkend;
			map[? ANIMATIONSTATE.WALKING] = sPlayer_potion_walk;
			map[? ANIMATIONSTATE.RISING] = sPlayer_potion_rise;
			map[? ANIMATIONSTATE.FALLING] = sPlayer_potion_fall;
			map[? ANIMATIONSTATE.KNOCKBACK] = sPlayer_potion_knockBack;
			map[? ANIMATIONSTATE.KNOCKBACK2] = sPlayer_potion_knockBack2;
			map[? ANIMATIONSTATE.TECHED] = sPlayer_potion_tech;
			map[? ANIMATIONSTATE.DEAD] = sPlayer_potion_dead1;
			map[? ANIMATIONSTATE.DEAD2] = sPlayer_potion_dead2;
			map[? ANIMATIONSTATE.TRAPPED] = sPlayer_potion_trapped;
			map[? ANIMATIONSTATE.DEADFROZEN] = sPlayer_potion_deadFrozen;
			map[? ANIMATIONSTATE.DEADLASER] = sPlayer_potion_deadLaser;
			map[? ANIMATIONSTATE.GIBS] = sPlayer_potion_gibs;
	        break;
	    case CHARACTER.BOMB:
			map[? ANIMATIONSTATE.SLICE] = sPlayer_bomb_idle;
	        map[? ANIMATIONSTATE.STANDING] = sPlayer_bomb_idle;
			map[? ANIMATIONSTATE.SLIDING] = sPlayer_bomb_walkend;
			map[? ANIMATIONSTATE.WALKING] = sPlayer_bomb_walk;
			map[? ANIMATIONSTATE.RISING] = sPlayer_bomb_rise;
			map[? ANIMATIONSTATE.FALLING] = sPlayer_bomb_fall;
			map[? ANIMATIONSTATE.KNOCKBACK] = sPlayer_bomb_knockBack;
			map[? ANIMATIONSTATE.KNOCKBACK2] = sPlayer_bomb_knockBack2;
			map[? ANIMATIONSTATE.TECHED] = sPlayer_bomb_tech;
			map[? ANIMATIONSTATE.DEAD] = sPlayer_bomb_dead1;
			map[? ANIMATIONSTATE.DEAD2] = sPlayer_bomb_dead2;
			map[? ANIMATIONSTATE.TRAPPED] = sPlayer_bomb_trapped;
			map[? ANIMATIONSTATE.DEADFROZEN] = sPlayer_bomb_deadFrozen;
			map[? ANIMATIONSTATE.DEADLASER] = sPlayer_bomb_deadLaser;
			map[? ANIMATIONSTATE.GIBS] = sPlayer_bomb_gibs;
			break;
/*		case CHARACTER.GUN:
			map[? ANIMATIONSTATE.SLICE] = sPlayer_bomb_idle;
	        map[? ANIMATIONSTATE.STANDING] = sPlayer_bomb_idle;
			map[? ANIMATIONSTATE.SLIDING] = sPlayer_bomb_walkend;
			map[? ANIMATIONSTATE.WALKING] = sPlayer_bomb_walk;
			map[? ANIMATIONSTATE.RISING] = sPlayer_bomb_rise;
			map[? ANIMATIONSTATE.FALLING] = sPlayer_bomb_fall;
			map[? ANIMATIONSTATE.KNOCKBACK] = sPlayer_bomb_knockBack;
			map[? ANIMATIONSTATE.KNOCKBACK2] = sPlayer_bomb_knockBack2;
			map[? ANIMATIONSTATE.TECHED] = sPlayer_bomb_tech;
			map[? ANIMATIONSTATE.DEAD] = sPlayer_bomb_dead1;
			map[? ANIMATIONSTATE.DEAD2] = sPlayer_bomb_dead2;
			map[? ANIMATIONSTATE.TRAPPED] = sPlayer_bomb_trapped;
			map[? ANIMATIONSTATE.DEADFROZEN] = sPlayer_bomb_deadFrozen;
			map[? ANIMATIONSTATE.DEADLASER] = sPlayer_bomb_deadLaser;
			map[? ANIMATIONSTATE.GIBS] = sPlayer_bomb_gibs;
	        break;
*/
	default:
			if (argument0 != CHARACTER.DEFAULT)
				show_debug_message("Character " + string(argument0) + " does not exist!");
	        map[? ANIMATIONSTATE.SLICE] = sPlayer_default_idle;
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
			map[? ANIMATIONSTATE.GIBS] = sPlayer_default_gibs;
	        break;
	}

	return map;


}
