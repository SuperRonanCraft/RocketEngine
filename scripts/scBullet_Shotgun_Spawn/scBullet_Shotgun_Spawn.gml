function scBullet_Shotgun_Spawn(){
	var i = 4;
	var spreadSign = 1;
	var realDir = 0;
	
	repeat i{
		spreadSign *= -1;
		var dir = team == TEAM.LEFT ? 0 : 180;// point_direction(x,y,aim_target_x,aim_target_y);
		var bullet_map = weapon_map[?WEAPON_MAP.MAP];
		if (auto_aim || team == TEAM.NONE)
			dir = scAutoAim();
		facing = dir > -90 && dir <= 90 ? 1 : -1;
					
					
		var bullet = scSpawnBullet(x,y,depth+1,dir,id,weapon_map);
	
		with(bullet){
			if (!instance_exists(target)){
				target = scFindTarget(owner.team);
				if(i==4 && instance_exists(target)){
					realDir = point_direction(x,y,target.x,target.bbox_top);
					dir = realDir;
				}
				else
					dir = realDir + (i*10*spreadSign);
			}	
			hsp = lengthdir_x(spd, dir);
			vsp = lengthdir_y(spd, dir);
		}
	
		gravity_map[? GRAVITY_MAP.HSP_MOVE_MOD] -= facing*abs(bullet.hsp)*.2 * bullet_map[? BULLET_MAP.RECOIL];
		gravity_map[? GRAVITY_MAP.VSP_MOVE] -= facing*abs(bullet.vsp)*.2 * bullet_map[? BULLET_MAP.RECOIL];
					
		scPlaySound(SOUND.EFFECT_SHUR_THROW);
	
		i--;
	
		weapon_map[? WEAPON_MAP.POWER] = 0;
	}
}