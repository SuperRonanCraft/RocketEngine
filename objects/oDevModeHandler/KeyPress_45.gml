/// @description  War

for (var i = 0; i < CHARACTER.LENGTH; i++) {
    var test = instance_create_depth(mouse_x, mouse_y, depth, oPlayer);
	test.auto_aim = true;
	test.team = TEAM.RIGHT;
	
	with(test){
		scPlayerCharacterChange(i);
		scStartAI();	
	}
	
	
	test.draw_health = true;
	test.shootable_map[? SHOOTABLE_MAP.TEAM] = test.team;
	var palette = test.player_map[? PLAYER_MAP.CHARACTER_INFO];
	palette[? CHARACTER_MAP.PALETTE_INDEX] = irandom(sprite_get_width(palette[? CHARACTER_MAP.PALETTE])-1);

}

for (var i = 0; i < CHARACTER.LENGTH; i++) {
    var test = instance_create_depth(mouse_x, mouse_y, depth, oPlayer);
	test.auto_aim = true;
	test.team = TEAM.LEFT;
	
	with(test){
		scPlayerCharacterChange(i);
		scStartAI();	
	}
	
	
	test.draw_health = true;
	test.shootable_map[? SHOOTABLE_MAP.TEAM] = test.team;
	var palette = test.player_map[? PLAYER_MAP.CHARACTER_INFO];
	palette[? CHARACTER_MAP.PALETTE_INDEX] = irandom(sprite_get_width(palette[? CHARACTER_MAP.PALETTE])-1);

}

