///@desc The "BurnRush" Buff
///@arg owner Owner of buff
///@arg buff Parent Buff DS Map
function scBuffBurnDoT(argument0, argument1) {

	var owner = argument0;
	var dsBuff = argument1;

	//define the internal clock
	var clock = dsBuff[? BUFF_MAP.CLOCK];


	//If the internal clock reaches the time in seconds, expire
	if (clock > dsBuff[? BUFF_MAP.TIME]) {
		//Remove Doused
		scBuffRemove(owner, dsBuff);
	} else {
		//Create a new item in the DS Map so that it isn't saved to the object
		if (owner.shootable_map[? SHOOTABLE_MAP.HEALTH_BASE] <= 0)
			dsBuff[? BUFF_MAP.CLOCK] = dsBuff[? BUFF_MAP.TIME];
		
		dsBuff[? "damage_crt"]--;
		scParticleDistribute(owner.x-30, owner.x+30, owner.y-30, owner.y+30, oParticleHandler.ds_part[? PARTICLES.FIRE1], 5);
		if (dsBuff[? "damage_crt"] < 0) {
			scShootableDamage(dsBuff[? BUFF_MAP.GIVEN_BY], owner, false, true, dsBuff[? "damage"], noone, DAMAGE_TYPE.SPLASH, false);
			scPlaySound(SOUND.EFFECT_SHOOT,random_range(1.3,1.5));

			dsBuff[? "damage_crt"] = dsBuff[? "damage_cd"];
		}
		
		//Also, increaase the clock. Essential for every buff.
		dsBuff[? BUFF_MAP.CLOCK]++;
	}


}
