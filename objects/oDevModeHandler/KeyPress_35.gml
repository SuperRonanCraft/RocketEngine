/// @desc Make a controlled player

var test = instance_create_depth(mouse_x, mouse_y, depth, oPlayer);
test.auto_aim = true;

if (!keyboard_check(vk_control)) {
	test.team = TEAM.RIGHT;

}
else{
	test.team = TEAM.LEFT;
}

with(test){
	scPlayerCharacterChange(irandom(CHARACTER.LENGTH-1))
	//scStartAI();	
}

//test.draw_health = true;
oCameraFollow.follow = test;
test.shootable_map[? SHOOTABLE_MAP.TEAM] = test.team;
var palette = test.player_map[? PLAYER_MAP.CHARACTER_INFO];
palette[? CHARACTER_MAP.PALETTE_INDEX] = irandom(sprite_get_width(palette[? CHARACTER_MAP.PALETTE])-1);

