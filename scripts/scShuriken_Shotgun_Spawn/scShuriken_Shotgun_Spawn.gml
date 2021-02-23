function scShuriken_Shotgun_Spawn() {

	var map = weapon_map;
	var dir = team == TEAM.NONE ? (facing == 1 ? 0 : 180) : (team == TEAM.LEFT ? 0 : 180);



	if (auto_aim)
		dir = scAutoAim();

	facing = dir > -90 && dir <= 90 ? 1 : -1;

	scSpawnShuriken(x,y,depth+1,dir+2,id,map);
	scSpawnShuriken(x,y,depth+1,dir,id,map);
	scSpawnShuriken(x,y,depth+1,dir-2,id,map);
	scPlaySound(SOUND.EFFECT_SHUR_THROW);
	if (map[? WEAPON_MAP.AMMO] > 0)
		map[? WEAPON_MAP.AMMO]--;


}
