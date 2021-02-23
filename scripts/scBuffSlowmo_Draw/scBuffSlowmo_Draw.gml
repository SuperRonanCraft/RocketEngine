///@desc The "Speed" Buff Draw event
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map
function scBuffSlowmo_Draw() {

	var owner = argument[0];
	var dsBuff = argument[1];

	var map = dsBuff[? "steps"];
	for (var i = 0; i < ds_list_size(map); i++) {
		var steps = map[| i];
		scDrawSpriteExt(steps[0], steps[1], steps[2], steps[3], noone, steps[4], steps[5], steps[6]);
		steps[4] -= 0.05;
		map[| i] = steps;
	}

	//Change time dialation before player is drawn
	owner.time_dialation *= dsBuff[? "dialation"];


}
