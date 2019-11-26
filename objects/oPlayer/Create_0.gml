/// @desc Create

//Load up health
event_inherited();

//Load basic player variables
scPlayerStart();

//Load Ultimates
scUltimateStart();

//Load Abilities
scAbilityStart();

//Load Character
scPlayerCharacterChange(character, load_character_cache);

//Load keybinds
scKeybindsSet(keys);

//Load Combos
scComboStart();