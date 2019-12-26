/// @desc Spawn an enemy, without AI
if (!keyboard_check(vk_control)) {
	var _enemy = instance_create_depth(mouse_x, mouse_y, depth, oEnemy);
	
	with(_enemy){
		scEnemyCharacterChange(CHARACTER_ENEMY.ZOMBIE);
	}
	_enemy.system_ai = false;
} else {
	var _p = instance_create_depth(mouse_x, mouse_y, depth, oEnemy);
	_p.team = TEAM.LEFT;
	_p.system_ai = false;
}
//ADD CODE FOR SPAWNING ENEMIES
