/// @description Create

//======Change 'character' in Object Variables!=====

event_inherited();
despawn = true; //Despawn player if dead

//Load basic player variables
scPlayerStart();

//Load Character
scEnemyCharacterChange(character, load_character_cache);

//Reset gravity variables
//scGravityStart();

//Load keybinds
scKeybindsSet(keys);

//Load Alternate Intelegence (AI)
scStartAI(AI_TYPE.TEST);

//ultimate_map[? ULTIMATE_CASTING_MAP.ENABLED] = true; //Disable Ults
player_map[? PLAYER_MAP.HUD_SHOW] = false; //Dont show ammo