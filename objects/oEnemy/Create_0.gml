/// @description Create

//======Change 'character' in Object Variables!=====

event_inherited();
//scStartAI();
//despawn = true; //Despawn player if dead

//Load basic player variables
scPlayerStart();

//Load Character
scEnemyCharacterChange(character, load_character_cache);

//Load keybinds
scKeybindsSet(keys);

auto_aim = true;
despawn = true;

//ultimate_map[? ULTIMATE_CASTING_MAP.ENABLED] = true; //Disable Ults
player_map[? PLAYER_MAP.HUD_SHOW] = false; //Dont show ammo