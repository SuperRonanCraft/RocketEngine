///scCheckDeathEffect(status, killed,killer)
///@arg status_effect
///@arg killed_id
///@arg killer_id
///@arg is_base_type
///@desc Script runs within a pEntity (pShootable child)

var status = argument[0];
var deadGuy = argument[1];
var killerGuy = argument[2];
var baseType = argument[3];

if(!baseType){
	
	switch (status) {
	    case DAMAGE_ELEMENT.INFECTED:
	
			if(scGetParent(oPlayer,deadGuy)){
				var infected = instance_create_depth(x, y, depth, oPlayer);
				infected.system_inventory = false;
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
	    case DAMAGE_TYPE.SPLASH:
			var spNum = deadGuy.characterSprites[? ANIMATIONSTATE.GIBS];
			for (var g = 0; g < sprite_get_number(spNum); g++) {
			    var giblets = instance_create_depth(deadGuy.x + irandom_range(-10,10), deadGuy.y + irandom_range(0,10), deadGuy.depth+200,oCorpse);
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
	    case DAMAGE_TYPE.STAB:
	        var corpse = instance_create_depth(deadGuy.x + irandom_range(-10,10), deadGuy.y + irandom_range(-10,10), deadGuy.depth+200,oCorpse);
			
			
			ds_map_copy(corpse.corpseMap, deadGuy.characterSprites);
			corpse.facing = deadGuy.facing;
			corpse.friction_base = 0.8;
			corpse.sticky = true;
			corpse.owner = deadGuy;
			corpse.hsp_real = deadGuy.gravity_map[? GRAVITY_MAP.HSP];
			corpse.vsp_real = deadGuy.gravity_map[? GRAVITY_MAP.VSP];
			
			show_debug_message(corpse.hsp_real);
			
			corpse.owner = deadGuy;
			corpse.image_speed = deadGuy.image_speed;
	        break;
	}	
}


