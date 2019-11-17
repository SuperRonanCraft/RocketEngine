/// @description  Move Arrow


//Run special step script and override movement

var arrow_map = weapon_map[? WEAPON_MAP.MAP];
var time = arrow_map[? ARROW_MAP.TIMER];
var checkroom = arrow_map[? ARROW_MAP.SHURIKEN_AUTO_DESTROY_ROOM];


//If there is a special script to run, nullify all else and run it instead
if (arrow_map[? ARROW_MAP.SHURIKEN_STEP] != noone)
	script_execute(arrow_map[? ARROW_MAP.SHURIKEN_STEP]);
	//---===NO MAP REQUESTS AFTER THIS LINE===---

var targetAngle = 270;
if(grv_dir == -1){
	targetAngle = 90;
}



if(!deactivate){
	hsp = spd * facing;
	vsp += (arrow_map[? ARROW_MAP.WEIGHT] * grv_dir)/room_speed;
}

var bonusSPD = abs(hsp)+abs(vsp);
if(bonusSPD >= spd){
	fullPower = true;	
}
var bonusDMG = ceil(bonusSPD/4+ dmg);
var bonusKB = bonusSPD/4 + kb;


if(!deactivate){
	
	scProjectileMove(arrow_map, touching);

	for (var i = 0; i < ds_list_size(touching); i++) {
    
		var obj = touching[|i];
		
		if(scGetParent(oWall, obj)){
			if(obj.shootable || obj.is_wall ){
				deactivate = true;
				event_user(0);
				break;
			}
		}
		
		var isPlayer = scGetParent(oPlayer, obj);
		show_debug_message("isplayer " + string(isPlayer));
		
		if(isPlayer){
			var _team = owner.shootable_map[? SHOOTABLE_MAP.TEAM]; //Owner Team
			var _oteam = obj.shootable_map[? SHOOTABLE_MAP.TEAM]; //Entity Team
		
			if(_team != _oteam){
				if (ds_list_find_index(confirmList, obj) == -1) { //We've never hit this player before
					ds_list_add(confirmList, obj);
					ds_list_add(hitList, obj);
		
					if (!obj.shootable_map[? SHOOTABLE_MAP.CAN_INTERACT]) exit; //Do nothing to the player, don't allow shuriken to interact
				
					
					//Knockback
					obj.gravity_map[? GRAVITY_MAP.HSP_MOVE_MOD] += facing * (spd / 2 + bonusKB);

		
					//Damage player
		
					if (scShootableDamage(owner, obj, false, true, bonusDMG) && isPlayer)
						obj.causeOfDeath = arrow_map[? ARROW_MAP.DEATHCAUSE];
		
					if (arrow_map[? ARROW_MAP.ULTIMATE_CHARGE_GIVE])
						scUltimateAddCharge(owner, DAMAGETYPE.DIRECT, arrow_map[? ARROW_MAP.ULTIMATE_CHARGE_MULTIPLIER]); //Add direct ult charge
					scPlaySound(SOUND.EFFECT_SHUR_PLAYER);
					scScreenShake(25,5);

				}
			}
		}
	
	}
	
	direction = darctan2(vsp * -grv_dir,hsp);
	image_angle = direction;

}

if(deactivate){
	event_user(0);	
}

x += hsp;
y += vsp;


//Despawn if out of room.
if (checkroom)
	if ((x > room_width + 20 || x < -20 || y > room_height + 20 || y < -20))
		instance_destroy();