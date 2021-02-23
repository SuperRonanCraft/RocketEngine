/// @description  

uptime = round(uptime);

var isPlayer = other.object_index == oPlayer;

if(!destroy && (isPlayer ? owner.team != other.team : true)){
	scShootableDamage(owner, other, false, false, 5 + uptime);
	
	scBuffAdd([BUFFTYPE.SLEEP], other, owner, (room_speed*1) + uptime);
	
	destroy = true;

	sprite_index = sbrickBall_explode;

	vsp = 0;
	hsp = 0;
	scSpawnParticle(x, y, 13, 5, spDebris,WORLDPART_TYPE.DEBRIS);
	scPlaySound(SOUND.EFFECT_EXP);
}
