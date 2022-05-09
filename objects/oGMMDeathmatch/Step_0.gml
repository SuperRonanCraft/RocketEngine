/// @desc 

if( global.play && chars < limit_chars){
	chars++;
	total_chars++;
	var test = instance_create_depth(RES_W/2, 50, depth, oPlayer);
	test.auto_aim = true;
	test.team = TEAM.RIGHT;
	

	with(test){
		display = false;
		scPlayerCharacterChange(irandom(CHARACTER.LENGTH-1));
		scStartAI();	
		var hp = shootable_map[? SHOOTABLE_MAP.HEALTH];
		hp = 1;//other.total_chars;
		shootable_map[? SHOOTABLE_MAP.HEALTH_BASE] = hp;
		shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD] = 0;			
		shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR] = 0;
		shootable_map[? SHOOTABLE_MAP.HEALTH_VITAL] = 0;			
		shootable_map[? SHOOTABLE_MAP.HEALTH_BASE_ORIGINAL] = shootable_map[? SHOOTABLE_MAP.HEALTH_BASE];
		shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD_ORIGINAL] = 0;
		shootable_map[? SHOOTABLE_MAP.HEALTH_VITAL_ORIGINAL] = 0;
		shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR_ORIGINAL] = 0;
		auto_aim = true;
	}

	test.draw_health = true;
	test.shootable_map[? SHOOTABLE_MAP.TEAM] = test.team;
	var palette = test.player_map[? PLAYER_MAP.CHARACTER_INFO];
	palette[? CHARACTER_MAP.PALETTE_INDEX] = irandom(sprite_get_width(palette[? CHARACTER_MAP.PALETTE])-1);

}


with (oPlayer) //Dont allow players to bug out :D
	if (x > RES_W || x < 0 || y > RES_H || y < 0) {
		x = xstart;
		y = ystart;
	}
event_inherited();