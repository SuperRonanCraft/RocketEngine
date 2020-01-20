///@desc Start the AI loop
//@arg ai_type

//This will be fun

var AICore = instance_create_depth(0, 0, 0, oAIHandler);
player_aimode = true;
AICore.player = id;
aiBrain = AICore;
system_ai = true;
track_stats = false;