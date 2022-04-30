/// @description  

if(instance_exists(Wall1)){
	instance_destroy(Wall1);	
}

if(shocked && instance_exists(killer)){
	var elec = instance_create_depth(x,y,depth,oUltimateLightning);
	elec.owner = killer;
	elec.stopped = true;
	//elec.light_range /= 2;
	elec.dmg = 5;
	
	for (var i = 0; i < 10; i++) {
	    scSpawnParticle(x+irandom_range(-10,10), y + irandom_range(-10,10),1, 100, s_pdustOG, WORLDPART_TYPE.SHIELD);
	}
	
}

if(slimed && instance_exists(killer)){
	scSpawnParticle(x+irandom_range(-5,5),y+irandom_range(-5,5),32,1,spSlime,WORLDPART_TYPE.SLIME);
	var _enemy = instance_create_depth(x, bbox_top, depth, oEnemy);
	
	with(_enemy){
		scEnemyCharacterChange(CHARACTER_ENEMY.ZOMBIE);
		var char_info = player_map[? PLAYER_MAP.CHARACTER_INFO];
		char_info[? CHARACTER_MAP.PALETTE_INDEX] = 2;
	}
	_enemy.shootable_map[?SHOOTABLE_MAP.TEAM] = killer.team;
	_enemy.team = _enemy.shootable_map[?SHOOTABLE_MAP.TEAM]
	
}

if(statue){
	var spNum = corpseMap[?ANIMATIONSTATE.GIBS];
	for (var g = 0; g < sprite_get_number(spNum); g++) {
		var giblets = instance_create_depth(x + irandom_range(-10,10), y + irandom_range(0,10), depth,oCorpse);
		ds_map_copy(giblets.playerMap, playerMap);
		giblets.currentSprite = spNum;
		giblets.animationVar = g;
		giblets.gib = true;
		giblets.owner = owner;
		giblets.rotate = true;
		giblets.color = c_aqua;
		giblets.sticky = false;
		giblets.bleed = WORLDPART_TYPE.ICE;
		giblets.bleedSprite = spIce;
		giblets.hsp_real = irandom_range(-20,20) + hsp_real;
		giblets.vsp_real = irandom_range(-20,5) + vsp_real;
		giblets.friction_base = 1;
	}
	
	for (var i = 0; i < irandom_range(4,15); i++) {
	    scSpawnParticle(x+irandom_range(-5,5),y+irandom_range(-5,5),10,10,spIce,WORLDPART_TYPE.ICE);
		scPlaySound(SOUND.ULT_SHIELD_BREAK);
	}	
}
