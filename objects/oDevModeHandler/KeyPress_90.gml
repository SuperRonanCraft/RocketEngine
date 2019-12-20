/// @desc Spawn an enemy, without AI
if (!keyboard_check(vk_control)) {
	var _enemy = instance_create_depth(mouse_x, mouse_y, depth, oEnemy);
	_enemy.system_ai = false;
} else {
	var _p = instance_create_depth(mouse_x, mouse_y, depth, oPlayer);
	if (keyboard_check(ord("A")))
		with (_p) {
			scStartAI();
			scKeybindsSet(KEYBIND_PLAYER.PLAYER2);
			//system_ai = true;
		}
}
//ADD CODE FOR SPAWNING ENEMIES
