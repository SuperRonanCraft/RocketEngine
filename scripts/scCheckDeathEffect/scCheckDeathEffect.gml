///scCheckDeathEffect(status, killed,killer)
///@arg status_effect
///@arg killed_id
///@arg killer_id
///@arg is_base_type
///@desc Script runs within a pEntity (pShootable child)
function scCheckDeathEffect() {

	var status = argument[0];
	var deadGuy = argument[1];
	var killerGuy = argument[2];
	var baseType = argument[3];

	if(!baseType){
	
		switch (status) {
		
			case DAMAGE_ELEMENT.COLD:
		        var corpse = instance_create_depth(deadGuy.x + irandom_range(-10,10), deadGuy.y + irandom_range(-10,10), deadGuy.depth+200,oCorpse);
			
				corpse.x = BLOCK_SIZE * (corpse.x div BLOCK_SIZE);
				corpse.y = BLOCK_SIZE * (corpse.y div BLOCK_SIZE);
				corpse.mask_index = sIceStatue;
			
				ds_map_copy(corpse.corpseMap, deadGuy.characterSprites);
				ds_map_copy(corpse.playerMap, deadGuy.player_map);
				corpse.currentSprite = deadGuy.characterSprites[?ANIMATIONSTATE.DEADFROZEN];
				corpse.color = c_aqua;
				corpse.animationVar = irandom_range(0, sprite_get_number(corpse.currentSprite) -1);
				corpse.statue = true;
				corpse.rotate = false;
				corpse.facing = deadGuy.facing;
				corpse.friction_base = 0.4;
				corpse.bounce_coeff = 0;
				corpse.sticky = false;
				corpse.owner = deadGuy;
				corpse.hsp_real = deadGuy.gravity_map[? GRAVITY_MAP.HSP];
				corpse.vsp_real = deadGuy.gravity_map[? GRAVITY_MAP.VSP];
			
	
			
				corpse.owner = deadGuy;
				corpse.image_speed = 0;			
				break;
			
			case DAMAGE_ELEMENT.FIRE:
				var rangeToSpawn = 32;
				part_emitter_region(global.ParticleSystem1, global.Emitter1, deadGuy.bbox_left, deadGuy.bbox_right, deadGuy.bbox_top, deadGuy.bbox_bottom, ps_shape_ellipse, ps_distr_gaussian);
				part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? PARTICLES.ASH], rangeToSpawn);
			
		        for (var i = 0; i < rangeToSpawn; i++) {
				    scSpawnParticle(x+irandom_range(-rangeToSpawn,rangeToSpawn), y + irandom_range(-rangeToSpawn,rangeToSpawn),1, deadGuy.gravity_map[? GRAVITY_MAP.HSP], spAsh, WORLDPART_TYPE.ASH);
				}
				break;
		
		    case DAMAGE_ELEMENT.INFECTED:
	
				if(scGetParent(oPlayer,deadGuy)){
					var infected = instance_create_depth(x, y, depth, oPlayer);
				}
				else{
					var infected = instance_create_depth(x, y, depth, oEnemy);
				}
		
				with(infected){
				
					var map = deadGuy.player_map[? PLAYER_MAP.CHARACTER_INFO];
					if(scGetParent(oPlayer,deadGuy)){
						scPlayerCharacterChange( map[?CHARACTER_MAP.TYPE],false,false);
					}
					else{
						scEnemyCharacterChange( map[?CHARACTER_MAP.TYPE]);
					}
				}
		
				infected.team = killerGuy.team;
		        break;
			default:
				break;
		}

	}

	else{
		switch (status) {
			
			
			case DAMAGE_TYPE.SLICE:
				#region
				/*
				var spNum = deadGuy.characterSprites[? ANIMATIONSTATE.SLICE];
			
				var halfSpNum = (sprite_get_number(spNum)-1)/2;
				var randInd = irandom_range(1, halfSpNum);
				var confirmSlice = false;
			
				for (var s = 0; s < 2; s++) {
					scSpawnParticle(deadGuy.x, deadGuy.y, 5, 5,  spBlood, WORLDPART_TYPE.BLOOD);	
					var giblets = instance_create_depth(deadGuy.x, deadGuy.y, deadGuy.depth+200,oCorpse);
					ds_map_copy(giblets.corpseMap, deadGuy.characterSprites);
					confirmSlice = false;
					if(irandom_range(0,3) == 1 && randInd+(s*halfSpNum) != 0 && randInd+(s*halfSpNum) != 3 && randInd+(s*halfSpNum) != 5){
						confirmSlice = true;
						giblets.specialAnimation = true;
						giblets.gibID = randInd+(s*halfSpNum);
						giblets.rotate = false;
						giblets.hsp_real = 0;
						giblets.vsp_real = 0;
						giblets.image_speed = deadGuy.image_speed;
						switch (randInd+(s*halfSpNum)) {
							case 1:
								if(deadGuy.gravity_map[?GRAVITY_MAP.STANDING]){
									giblets.currentSprite = deadGuy.characterSprites[? ANIMATIONSTATE.SLICEANIML1];
								}
								else{
									confirmSlice = false;	
									giblets.specialAnimation = false;
								}
								break;
							case 2:
							    giblets.currentSprite = deadGuy.characterSprites[? ANIMATIONSTATE.SLICEANIMT1];
								giblets.hsp_real = irandom_range(-10,10);
								giblets.vsp_real = irandom_range(-15,-10);
							    break;
							case 4:
								if(deadGuy.gravity_map[?GRAVITY_MAP.STANDING]){
									giblets.currentSprite = deadGuy.characterSprites[? ANIMATIONSTATE.SLICEANIMR1];
								}
								else{
									confirmSlice = false;	
									giblets.specialAnimation = false;
								}
					        
								break;
							case 6:
								if(deadGuy.gravity_map[?GRAVITY_MAP.STANDING]){
									giblets.currentSprite = deadGuy.characterSprites[? ANIMATIONSTATE.SLICEANIMB1];
								}
								else{
									confirmSlice = false;	
									giblets.specialAnimation = false;
								}
							    break;
						}
					}
					if(!confirmSlice){
						giblets.currentSprite = spNum;
						giblets.animationVar = randInd+(s*halfSpNum);
						giblets.gib = true;
						giblets.rotate = true;
						giblets.hsp_real = irandom_range(-10,10);
						giblets.vsp_real = irandom_range(-10,5);
					}
					giblets.slice = true;
					giblets.owner = deadGuy;
					giblets.sticky = false;
					giblets.bleed = WORLDPART_TYPE.BLOOD;
					giblets.friction_base = 1;
				}
				*/
		        #endregion
		
			case DAMAGE_TYPE.SPLASH:
			
				if(DAMAGE_TYPE.SPLASH == status && irandom_range(0,3) == 1){
					var spNum = deadGuy.characterSprites[? ANIMATIONSTATE.GIBS];
					for (var g = 0; g < sprite_get_number(spNum); g++) {
					    var giblets = instance_create_depth(deadGuy.x + irandom_range(-10,10), deadGuy.y + irandom_range(0,10), deadGuy.depth+200,oCorpse);
						ds_map_copy(giblets.playerMap, deadGuy.player_map);
						giblets.currentSprite = spNum;
						giblets.animationVar = g;
						giblets.gib = true;
						giblets.owner = deadGuy;
						giblets.rotate = true;
						giblets.sticky = true;
						giblets.bleed = WORLDPART_TYPE.BLOOD;
						giblets.hsp_real = irandom_range(-20,20);
						giblets.vsp_real = irandom_range(-20,5);
						giblets.friction_base = 1;
					}
					break;
				}
				//Else, do:
		    case DAMAGE_TYPE.POUND:
		        var corpse = instance_create_depth(deadGuy.x, deadGuy.y, deadGuy.depth+200,oCorpse);
			
			
				ds_map_copy(corpse.corpseMap, deadGuy.characterSprites);
				ds_map_copy(corpse.playerMap, deadGuy.player_map);
				corpse.facing = deadGuy.facing;
				corpse.friction_base = 0.8;
				corpse.sticky = false;
				corpse.owner = deadGuy;
				corpse.hsp_real = deadGuy.gravity_map[? GRAVITY_MAP.HSP];
				corpse.vsp_real = deadGuy.gravity_map[? GRAVITY_MAP.VSP];
			
	
			
				corpse.owner = deadGuy;
				corpse.image_speed = deadGuy.image_speed;
				break;
				
		
		    case DAMAGE_TYPE.STAB:
		        var corpse = instance_create_depth(deadGuy.x + irandom_range(-10,10), deadGuy.y + irandom_range(-10,10), deadGuy.depth+200,oCorpse);
			
			
				ds_map_copy(corpse.corpseMap, deadGuy.characterSprites);
				ds_map_copy(corpse.playerMap, deadGuy.player_map);
				corpse.facing = deadGuy.facing;
				corpse.friction_base = 0.8;
				corpse.sticky = true;
				corpse.owner = deadGuy;
				corpse.hsp_real = deadGuy.gravity_map[? GRAVITY_MAP.HSP];
				corpse.vsp_real = deadGuy.gravity_map[? GRAVITY_MAP.VSP];
			
			
			
				corpse.owner = deadGuy;
				corpse.image_speed = deadGuy.image_speed;
		        break;
			
		}	
	}





}
