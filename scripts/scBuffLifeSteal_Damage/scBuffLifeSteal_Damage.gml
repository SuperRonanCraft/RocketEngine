///@desc The "Life-Steal" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map
function scBuffLifeSteal_Damage() {

	//var owner = argument0;
	var dsBuff = argument[1];
	var arry = argument[2];

	var inst = arry[0];
	var dmg = arry[1];

	if (shootable_map[? SHOOTABLE_MAP.CAN_HEAL]) {
		scShootableHeal(id, dmg, true, false);
		//repeat (dmg)
		//	if (shootable_map[? SHOOTABLE_MAP.HEALTH] + 1 <= shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL])
		//		shootable_map[? SHOOTABLE_MAP.HEALTH]++;
		//hp_scale += 2;
		var updated = false; //Have we updated a previous player?
	
		var list = dsBuff[? "players_hit"];
		for (var i = 0; i < ds_list_size(list); i++) {
			var map = list[| i];
			if (map[? "player"] == inst) {
				map[? "image_index"] = 0;
				updated = true;
				break;
			}
		}
	
		if (!updated) {
			var newPlr = ds_map_create();
			newPlr[? "x"] = inst.x;
			newPlr[? "y"] = inst.y;
			newPlr[? "yscale"] = choose(-1, 1);
			newPlr[? "image_index"] = 0;
			ds_list_add(list, newPlr);
		}
	}


}
