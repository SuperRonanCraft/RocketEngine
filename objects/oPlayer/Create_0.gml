/// @desc Create

//Load up health
event_inherited();

//Load basic player variables
scPlayerStart();

//Load Ultimates
scUltimateStart();

//Load Character
scPlayerCharacterChange(character, load_character_cache);

//Load Abilities
var _pinfo = player_map[? PLAYER_MAP.CHARACTER_INFO];
scAbilityStart(_pinfo[? CHARACTER_MAP.ABILITY]);

//Load keybinds
scKeybindsSet(keys);

//Load Combos
scComboStart();