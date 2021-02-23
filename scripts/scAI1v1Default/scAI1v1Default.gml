///@desc ROCKET Weapon ai
///@arg shoot_ai?
function scAI1v1Default(argument0) {

	var _shoot = argument0;

	switch (randDirection) {
	    case ACTIONS.RIGHT:
	        AIRight = true;
			AILeft = false;
	        break;
		case ACTIONS.LEFT:
	        AILeft = true;
	        AIRight = false;
			break;
		default:
			break;	
	}

	//If you stand, have a 'chance' to jump
	if (player.gravity_map[? GRAVITY_MAP.STANDING]) {
		if (irandom_range(1, 10) == 10)
			AIJump = true;
	} else if (player.gravity_map[? GRAVITY_MAP.JUMP_JUMPS] < player.gravity_map[? GRAVITY_MAP.JUMP_JUMPS_MAX]) {
		if (irandom_range(0, 50) > 48)
				AIJump = true;
	} else
		AIJump = false;

	//As long as you live, shoot!
	if (_shoot)
		if (!ultReady && player.player_map[? PLAYER_MAP.ALIVE] && irandom_range(0, 10) > 8)
			AIShoot = true;	
		else
			AIShoot = false;

	//If ult is ready, fire IMMEDIATELY
	if (player.system_ultimate)
		if (player.ultimate_map[? ULTIMATE_CASTING_MAP.CHARGE] >= player.ultimate_map[? ULTIMATE_CASTING_MAP.CHARGE_MAX] && timer - irandom(10) <= 0) {
			ultReady = true;
		} else
			ultReady = false;

	//If ability ready, initiate!
	if (player.system_ability)
		if (player.ability_map[? ABILITY_MAP.CURRENT_TIME] <= 0 && timer - irandom(10) <= 0) {
			AIAbility = true;
		} else
			AIAbility = false;
	
	AIUlt = ultReady;

	//Reset timer
	if (timer < 0) {
		timer = irandom_range(30, 120);	
		if (!ultReady)
			randDirection = irandom_range(0, 1);
		else
			randDirection = noone;	
	} else
		timer--;


}
