///scBaseDamageResistances(health_type)
///@arg health
///@arg damage

var _health_type = argument[0];
var _damage_type = argument[1];
var multiplier = 1;

switch (_health_type) {
    case SHOOTABLE_MAP.HEALTH_SHIELD:
	
		
	
        break;
    case SHOOTABLE_MAP.HEALTH_ARMOR:
	
		if(_damage_type == DAMAGE_ELEMENT.INFECTED){
				multiplier *= 0.3;
		}
	
        break;
	case SHOOTABLE_MAP.HEALTH_BASE:
	default:
	
		if(_damage_type == DAMAGE_ELEMENT.INFECTED){
				multiplier *= 2.0;
		}	
	
		break;
}

return multiplier;