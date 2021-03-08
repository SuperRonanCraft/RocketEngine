///scBaseDamageResistances(health_type)
///@arg health
///@arg damage
function scElementDamageResistances() {

	var _health_type = argument[0];
	var _damage_type = argument[1];
	var multiplier = 1;

	switch (_health_type) {
	    case SHOOTABLE_MAP.HEALTH_SHIELD:
	
		
	
	        break;
	    case SHOOTABLE_MAP.HEALTH_ARMOR:
	
			if(_damage_type == DAMAGE_ELEMENT.INFECTED){
					multiplier *= 1;
			}
	
	        break;
		case SHOOTABLE_MAP.HEALTH_BASE:
		default:
	
			if(_damage_type == DAMAGE_ELEMENT.INFECTED){
					multiplier *= 1;
			}	
	
			break;
	}

	return multiplier;


}
