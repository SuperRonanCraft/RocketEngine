function scCreatePlayer(newX, newY, characterEnum){

	var test = instance_create_depth(newX, newY, depth, oPlayer);
	test.auto_aim = true;

	test.team = TEAM.RIGHT;
	test.display = false;

	with(test){
		scPlayerCharacterChange(characterEnum);
		scStartAI();	
	}

	test.draw_health = true;
	test.shootable_map[? SHOOTABLE_MAP.TEAM] = test.team;
	var palette = test.player_map[? PLAYER_MAP.CHARACTER_INFO];
	palette[? CHARACTER_MAP.PALETTE_INDEX] = irandom(sprite_get_width(palette[? CHARACTER_MAP.PALETTE])-1);
	return test;
}