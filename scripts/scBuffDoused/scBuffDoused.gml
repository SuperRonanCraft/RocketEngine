///@desc The "BurnRush" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map
function scBuffDoused(argument0, argument1) {

	var owner = argument0;
	var dsBuff = argument1;

	//define the internal clock
	var clock = dsBuff[? BUFF_MAP.CLOCK];


	//If the internal clock reaches the time in seconds, expire
	if (clock > dsBuff[? BUFF_MAP.TIME]) {
		//Remove Doused
		color_overlay = c_white;
		scBuffRemove(owner, dsBuff);
	} else {
		color_overlay = c_olive;
		//Remove if they die
		if (owner.shootable_map[? SHOOTABLE_MAP.HEALTH] <= 0)
			dsBuff[? BUFF_MAP.CLOCK] = dsBuff[? BUFF_MAP.TIME];
		
		if(dsBuff[? BUFF_MAP.CLOCK] % 8 == 0)
			scParticleDistribute(owner.x-30, owner.x+30, owner.y-30, owner.y+30, oParticleHandler.ds_part[? PARTICLES.DRIP1], 3);
		
		//When hit, this buff "changes" into BURNING
		if(owner.shootable_map[? SHOOTABLE_MAP.TIME_SINCE_DAMAGE] <= 1 && clock > 1){
			dsBuff[? BUFF_MAP.CLOCK] = dsBuff[? BUFF_MAP.TIME];	
			scBuffAdd([BUFFTYPE.BURNING], owner, dsBuff[?BUFF_MAP.GIVEN_BY]);
		}
		
		//Also, increaase the clock. Essential for every buff.
		dsBuff[? BUFF_MAP.CLOCK]++;
	}
		


}
