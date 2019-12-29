///scCheckDeathEffect(status, killed,killer)
///@arg status_effect
///@arg killed_id
///@arg killer_id
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


