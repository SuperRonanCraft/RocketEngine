///scmap()
///Loads up specific sprites into a ds_map for use in animation
///@arg character

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