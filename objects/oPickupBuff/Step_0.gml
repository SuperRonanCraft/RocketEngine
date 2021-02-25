
if (!global.play) exit; //Dont start unless game has started

if (delay_current <= 0)
	if (timer_current <= 0) {
		var possible = 0;
		var index = 0;
		//Get a list of all possible GOOD buffs
		for (var i = 0; i < BUFFTYPE.LENGHT; i++) {
			var map = ds_map_create();
			scBuffGet(i, map);
			//If the buff is GOOD? Add it to the possible array
			if (map[? BUFF_MAP.GOOD] && map[? BUFF_MAP.ENABLED]) { //good and enabled buff
				possible[index] = i;
				index++;
			}
			ds_map_destroy(map);
		}
		//Pick a random buff from the possible GOOD buffs array
		var ind = possible[irandom_range(0, array_length(possible) - 1)];
		var map = ds_map_create();
		scBuffGet(ind, map);
		item = map[? BUFF_MAP.ICON];
		item_buff = map[? BUFF_MAP.TYPE];
		ds_map_destroy(map);
		timer_current = timer_org; //Reset the timer
		timer = timer_org;
	} else
		timer_current--;
else
	delay_current--;