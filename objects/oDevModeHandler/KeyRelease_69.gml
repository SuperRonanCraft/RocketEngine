/// @desc Spawn an enemy, without AI
if (!keyboard_check(vk_control)) {
	var _enemy = instance_create_depth(mouse_x, mouse_y, depth, oEnemy);
	
	with(_enemy){
		scEnemyCharacterChange(CHARACTER_ENEMY.ZOMBIE);
	}
	_enemy.team = TEAM.RIGHT;
	_enemy.shootable_map[? SHOOTABLE_MAP.TEAM] = _enemy.team;
	//_enemy.system_ai = false;
} else {
	var _enemy = instance_create_depth(mouse_x, mouse_y, depth, oEnemy);
	
	with(_enemy){
		scEnemyCharacterChange(CHARACTER_ENEMY.ZOMBIE);
	}
	_enemy.team = TEAM.LEFT;
	_enemy.shootable_map[? SHOOTABLE_MAP.TEAM] = _enemy.team;
	//_enemy.system_ai = false;
}
//ADD CODE FOR SPAWNING ENEMIES
