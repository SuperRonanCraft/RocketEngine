///scBaseDamageResistances(health_type)
///@arg health
///@arg damage
function scBaseDamageResistances() {

	var _health_type = argument[0];
	var _damage_type = argument[1];
	var multiplier = 1;

	switch (_health_type) {
	    case SHOOTABLE_MAP.HEALTH_SHIELD:
	
			if(_damage_type == DAMAGE_TYPE.SPLASH){
					multiplier *= 1;
			}		
	
	        break;
	    case SHOOTABLE_MAP.HEALTH_ARMOR:
	
			if(_damage_type == DAMAGE_TYPE.STAB){
					multiplier *= 1;
			}
			if(_damage_type == DAMAGE_TYPE.SPLASH){
					multiplier *= 1;
			}	
	
	        break;
		case SHOOTABLE_MAP.HEALTH_BASE:
	
			if(_damage_type == DAMAGE_TYPE.STAB){
					multiplier *= 1;
			}	
	
		default:
	
			break;
	}

	return multiplier;


}
