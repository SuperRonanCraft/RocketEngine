/// @desc Save stats
event_inherited();
var keys = [STATISTICS_GAMEMODE.GM_SINGLE_CHECKPOINT, STATISTICS_GAMEMODE.GM_SINGLE_LEVEL, STATISTICS_GAMEMODE.GM_SINGLE_LIVES, STATISTICS_GAMEMODE.GM_SINGLE_ROCKET];
var vals = [player_checkpoint, room, player_hp, player_rocket];
scStatsSet(gamemode, keys, vals);
