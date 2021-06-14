function scPotion_Portal_HitScript() {


	if(!deactivate){
		var particle_range = 20;
		part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left-particle_range, bbox_right+particle_range, bbox_top-particle_range, bbox_bottom+particle_range, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.MAGNET], 20);
		var inst = instance_create_depth(x, y, depth, oPlayer);
		var local_owner = owner;
		if(instance_exists(owner)){
			with (inst) {
				var _cmap = local_owner.player_map[? PLAYER_MAP.CHARACTER_INFO];
				scPlayerCharacterChange(_cmap[? CHARACTER_MAP.TYPE], false);
		
				scStartAI();
		
				ultimate_map[? ULTIMATE_CASTING_MAP.ENABLED] = false;
				weapon_map[? WEAPON_MAP.ENABLED] = false;
				ability_map[? ABILITY_MAP.ENABLED] = false;
				system_ability = false;
				system_combo = false;
				system_ultimate = false;
				keys = local_owner.keys;
				scKeybindsSet(keys);
				var _keyLeft = key_map[? KEYBIND_MAP.LEFT];
				key_map[? KEYBIND_MAP.LEFT] = key_map[? KEYBIND_MAP.RIGHT];
				key_map[? KEYBIND_MAP.RIGHT] = _keyLeft;
				_keyLeft = key_map[? KEYBIND_MAP.LEFT_GP];
				key_map[? KEYBIND_MAP.LEFT_GP] = key_map[? KEYBIND_MAP.RIGHT_GP];
				key_map[? KEYBIND_MAP.RIGHT_GP] = _keyLeft;
				//keyshoot = noone; //Cannot shoot
				team = local_owner.team; //Same team as caster
				shootable_map[?SHOOTABLE_MAP.TEAM] = local_owner.shootable_map[? SHOOTABLE_MAP.TEAM];
				display = false; //No ui
				//player_map[? PLAYER_MAP.HEALTH] = 1; //One hit kill
				shootable_map[? SHOOTABLE_MAP.HEALTH_BASE] = 1; //One hit kill
				shootable_map[? SHOOTABLE_MAP.HEALTH_BASE_ORIGINAL] = 1;
				shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR] = 0; //One hit kill
				shootable_map[? SHOOTABLE_MAP.HEALTH_ARMOR_ORIGINAL] = 0;
				shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD] = 0; //One hit kill
				shootable_map[? SHOOTABLE_MAP.HEALTH_SHIELD_ORIGINAL] = 0;
				despawn = true; //Despawn player if dead
				walksp += random_range(-2, 2);
				owner = local_owner; //Owner of this clone
				if (local_owner.player_map[? "clones"] == undefined)
					local_owner.player_map[? "clones"] = 0;
				local_owner.player_map[? "clones"]++;
				player_map[? PLAYER_MAP.DESTROY_SCRIPT] = scUltimateClone_Destroy;
				player_map[?PLAYER_MAP.CHARACTER_INFO] = local_owner.player_map[?PLAYER_MAP.CHARACTER_INFO];
				isClone = true;
				clone_timer_max = 5;
				alarm[1] = 1;
			}
		}
	}


}