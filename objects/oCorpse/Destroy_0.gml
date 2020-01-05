/// @description  

if(instance_exists(Wall1)){
	instance_destroy(Wall1);	
}

if(statue){
	var spNum = corpseMap[?ANIMATIONSTATE.GIBS];
	for (var g = 0; g < sprite_get_number(spNum); g++) {
		var giblets = instance_create_depth(x + irandom_range(-10,10), y + irandom_range(0,10), depth+5,oCorpse);
		giblets.currentSprite = spNum;
		giblets.animationVar = g;
		giblets.gib = true;
		giblets.owner = owner;
		giblets.rotate = true;
		giblets.color = c_aqua;
		giblets.sticky = false;
		giblets.bleed = WORLDPART_TYPE.ICE;
		giblets.bleedSprite = spIce;
		giblets.hsp_real = irandom_range(-20,20) + hsp_real;
		giblets.vsp_real = irandom_range(-20,5) + vsp_real;
		giblets.friction_base = 1;
	}
	
	for (var i = 0; i < irandom_range(4,15); i++) {
	    scSpawnParticle(x+irandom_range(-5,5),y+irandom_range(-5,5),2,10,spIce,WORLDPART_TYPE.ICE);
		scPlaySound(SOUND.ULT_SHIELD_BREAK);
	}	
}
