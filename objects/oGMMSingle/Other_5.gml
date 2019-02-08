/// @desc Save stats
event_inherited();
var keys = [CACHE.GM_SINGLE_CHECKPOINT, CACHE.GM_SINGLE_LEVEL, CACHE.GM_SINGLE_LIVES, CACHE.GM_SINGLE_ROCKET];
var vals = [player_checkpoint, room, player_hp, player_rocket];
scStatsSet(gamemode, keys, vals);
