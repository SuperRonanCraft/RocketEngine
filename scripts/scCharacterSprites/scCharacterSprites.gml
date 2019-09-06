///scCharacterSprites()
///Loads up specific sprites into a ds_map for use in animation

characterSprites = ds_map_create();

switch (playerMap[? PLAYER_MAP.CHARACTER]) {
    case CHARACTERS.SWORD:
        characterSprites[? ANIMATIONSTATE.STANDING] = sPlayer_sword_idle;
		characterSprites[? ANIMATIONSTATE.SLIDING] = sPlayer_sword_walkend;
		characterSprites[? ANIMATIONSTATE.WALKING] = sPlayer_sword_walk;
		characterSprites[? ANIMATIONSTATE.RISING] = sPlayer_sword_rise;
		characterSprites[? ANIMATIONSTATE.FALLING] = sPlayer_sword_fall;
		characterSprites[? ANIMATIONSTATE.KNOCKBACK] = sPlayer_sword_knockBack;
		characterSprites[? ANIMATIONSTATE.KNOCKBACK2] = sPlayer_sword_knockBack2;
		characterSprites[? ANIMATIONSTATE.TECHED] = sPlayer_sword_tech;
		characterSprites[? ANIMATIONSTATE.DEAD] = sPlayer_sword_dead1;
		characterSprites[? ANIMATIONSTATE.DEAD2] = sPlayer_sword_dead2;
		characterSprites[? ANIMATIONSTATE.TRAPPED] = sPlayer_sword_trapped;
		characterSprites[? ANIMATIONSTATE.DEADFROZEN] = sPlayer_sword_deadFrozen;
		characterSprites[? ANIMATIONSTATE.DEADLASER] = sPlayer_sword_deadLaser;
        break;
    default:
        characterSprites[? ANIMATIONSTATE.STANDING] = sPlayer_default_idle;
		characterSprites[? ANIMATIONSTATE.SLIDING] = sPlayer_default_walkend;
		characterSprites[? ANIMATIONSTATE.WALKING] = sPlayer_default_walk;
		characterSprites[? ANIMATIONSTATE.RISING] = sPlayer_default_rise;
		characterSprites[? ANIMATIONSTATE.FALLING] = sPlayer_default_fall;
		characterSprites[? ANIMATIONSTATE.KNOCKBACK] = sPlayer_default_knockBack;
		characterSprites[? ANIMATIONSTATE.KNOCKBACK2] = sPlayer_default_knockBack2;
		characterSprites[? ANIMATIONSTATE.TECHED] = sPlayer_default_tech;
		characterSprites[? ANIMATIONSTATE.DEAD] = sPlayer_default_dead1;
		characterSprites[? ANIMATIONSTATE.DEAD2] = sPlayer_default_dead2;
		characterSprites[? ANIMATIONSTATE.TRAPPED] = sPlayer_default_trapped;
		characterSprites[? ANIMATIONSTATE.DEADFROZEN] = sPlayer_default_deadFrozen;
		characterSprites[? ANIMATIONSTATE.DEADLASER] = sPlayer_default_deadLaser;
        break;
}