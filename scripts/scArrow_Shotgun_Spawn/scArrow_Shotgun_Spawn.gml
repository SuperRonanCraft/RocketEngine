// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scArrow_Shotgun_Spawn(){
	var map = weapon_map;
	var dir = team == TEAM.LEFT ? 0 : 180;// point_direction(x,y,aim_target_x,aim_target_y);

	if (auto_aim || team == TEAM.NONE)
		dir = scAutoAim();
	facing = dir > -90 && dir <= 90 ? 1 : -1;
	
	for (var a = -1; a < 2; a++) {
	    // code here
		var arrow = scSpawnArrow(x,y,depth+1,dir+a,id,map);
		arrow.dmg = ceil(arrow.dmg *	1.5 * ((map[? WEAPON_MAP.POWER])/100));
		arrow.spd = arrow.spd *  ((map[? WEAPON_MAP.POWER])/100);
		arrow.hsp = dcos(arrow.direction) * arrow.spd;
		arrow.vsp = -dsin(arrow.direction) * arrow.spd;
		arrow.kb = arrow.kb * ((map[? WEAPON_MAP.POWER])/800);
	}
	
	
	if (map[? WEAPON_MAP.AMMO] > 0)
		map[? WEAPON_MAP.AMMO]--;
	map[? WEAPON_MAP.POWER] = 100;
	
}