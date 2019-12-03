/// @desc Stuff
if (!global.play) exit;

//scPlayerHandler(PLAYER_EVENT.STEP);

scStateCheck();

//--------
//DEVMODE 
//JUMP + KEYSHOOT = CHANGE ROCKET
//JUMP + F5 = CHANGE AND APPLY BUFF
//JUMP + F6 = APPLY BUFF
if (global.devmode && global.debug && keys != KEYBIND.NONE && keyboard_check(scSettingsGetType(SETTINGS_TYPE.VALUE, key_map[? KEYBIND_MAP.JUMP])))
	if (keyboard_check_pressed(scSettingsGetType(SETTINGS_TYPE.VALUE, key_map[? KEYBIND_MAP.SHOOT]))) {
		weapons_cur++;
		while(scWeaponModify(id, weapons_cur))
			if (weapons_cur >= WEAPON_MODIFIER.LENGTH)
				weapons_cur = 0;
			else
				weapons_cur++;
	} else if (keyboard_check_pressed(vk_f5)) {
		buffs_cur++;
		if (buffs_cur >= BUFFTYPE.LENGHT)
			buffs_cur = 0;
		scBuffAdd(buffs_cur, id, id);
	} else if (keyboard_check_pressed(vk_f6)) {
		if (buffs_cur >= 0)
			scBuffAdd(buffs_cur, id, id);
	}
//--------

scKeybindsControls();
scCheckTech();

//Buff step handler
scBuffHandler(BUFF_EVENT.STEP);

//Collision
scGravityStep();

//Weapon activate
scWeaponProgress();

//Combo handling (alters ultimate charge)
scComboHandler();

//Ability step handler
scAbilityHandler();

//Ultimate step handler
scUltimateHandler();

//Check health
scCheckHealth();

//Knockback handling
scKnockback();

//Step Sound
switch (player_map[? PLAYER_MAP.ANIMATION_STATE]) {
	case ANIMATIONSTATE.WALKING:
		if (player_map[? PLAYER_MAP.ANIMATION_VAR] == 0 || 
				player_map[? PLAYER_MAP.ANIMATION_VAR] == 
				sprite_get_number(characterSprites[? ANIMATIONSTATE.WALKING]) / 2)
			scPlaySound(choose(SOUND.EFFECT_PLAYER_STEP_1), 
				random_range(0.5, 0.6));
			break;
	case ANIMATIONSTATE.TECHED:
}


//Mostly meant for clones
if (despawn && ((shootable_map[? SHOOTABLE_MAP.HEALTH] <= 0 && player_map[? PLAYER_MAP.PLAYER_STATE] == PLAYERSTATE.DEAD && gravity_map[? GRAVITY_MAP.VSP] == 0) || image_alpha != 1)) { //Despawn player object
	image_alpha -= 0.025;
	destroy = true;
	if (image_alpha <= 0)
		instance_destroy();
}