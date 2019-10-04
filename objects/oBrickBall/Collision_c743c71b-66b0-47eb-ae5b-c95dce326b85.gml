/// @description  

if(uptime > 1 && !destroy && other.shootable || other.is_wall){
	destroy = true;

	sprite_index = sbrickBall_explode;

	vsp = 0;
	hsp = 0;
	scSpawnParticle(x, y, 13, 5, spDebris,WORLDPART_TYPE.DEBRIS);
	scPlaySound(SOUND.EFFECT_EXP);
}