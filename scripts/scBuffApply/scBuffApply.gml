	/// @desc Apply a buff type to a shootable
/// @arg buff-type
/// @arg target
/// @arg given-by
/// @arg time* of buff
function scBuffApply() {

	var buff = argument[0];
	var targ = argument[1];
	var from = argument[2];
	var time = argument_count > 3 ? (argument[3] != noone ? argument[3] : noone) : noone;

	var ds_map = ds_map_create();
	scBuffGet(buff, ds_map);
	if (time != noone)
		ds_map[? BUFF_MAP.TIME] = time;
	ds_map[? BUFF_MAP.GIVEN_BY] = from; //Set who gave this buff/debuff
	//Check if a buff from the target is the same TYPE, if not, add it, or if its stackable, just add it
	if (ds_map[? BUFF_MAP.ENABLED]) {
		var stack_info = ds_map[? BUFF_MAP.STACK_INFO];
		if (!scBuffFind(targ, ds_map[? BUFF_MAP.TYPE]) || stack_info[0] == BUFF_STACK_TYPE.MULTIPLE)
			ds_list_add(targ.buffs_map, ds_map);
		else if (stack_info[0] == BUFF_STACK_TYPE.COMBO) { //Combo stacking, add 1 to size
			var buff = scBuffFind(targ, ds_map[? BUFF_MAP.TYPE], true);
			if (buff != noone) {
				var stack_info = buff[? BUFF_MAP.STACK_INFO];
				if (stack_info[2] < stack_info[1]) {
					stack_info[2]++;
					stack_info[4] = 0;
					buff[? BUFF_MAP.STACK_INFO] = stack_info;
				} //else if (buff[? BUFF_MAP.CLOCK] > 0)
					//buff[? BUFF_MAP.CLOCK] = 1;
			}
			ds_map_destroy(ds_map);
		} else {
			/*for (var i = 0; i < ds_list_size(targ.buffs_map); i++) {
				var currentBuff = targ.buffs_map[| i];
				//If the types are equal
				if (currentBuff[? BUFF_MAP.TYPE] == ds_map[? BUFF_MAP.TYPE]) {
					if (currentBuff[? BUFF_MAP.CLOCK] > 0)
						currentBuff[? BUFF_MAP.CLOCK] = 1;
					break;
				}
			}*/
			var buff = scBuffFind(targ, ds_map[? BUFF_MAP.TYPE], true);
			if (buff != noone && buff[? BUFF_MAP.CLOCK] > 0)
				buff[? BUFF_MAP.CLOCK] = 1;
			ds_map_destroy(ds_map);
		}
	} else
		ds_map_destroy(ds_map);


}
