///@desc Start the AI loop
function scStartAI(aiType=AI_TYPE.ONEVONE) {
	//@arg ai_type

	//This will be fun

	var AICore = instance_create_depth(0, 0, 0, oAIHandler);
	player_aimode = true;
	AICore.aiType = aiType;
	AICore.player = id;
	aiBrain = AICore;
	system_ai = true;
	track_stats = false;
	


}
