/// @description  

standing = instance_place(x,bbox_bottom+5,oWall);

if(bleed != noone){
	if(floor(timer) % 30 == 0 && timer > 60){
		scSpawnParticle(x, y, 1, 2,  bleedSprite, bleed);	
	}
}


//Normal Corpse "Ragdoll"
if(!ds_map_empty(corpseMap) && !gib && !statue && !specialAnimation){

	if(instance_exists(owner)){
		hsp_real = owner.gravity_map[?GRAVITY_MAP.HSP];
		vsp_real = owner.gravity_map[?GRAVITY_MAP.VSP];
	}

	if(sign(facing) == sign(hsp_real) || sign(hsp_real) == 0){
		currentSprite = corpseMap[? ANIMATIONSTATE.DEAD];
	}
	else{
		currentSprite = corpseMap[? ANIMATIONSTATE.DEAD2];	
	}
	if(standing != noone)
		animationVar+= image_speed;
	
	if(animationVar > sprite_get_number(currentSprite)-1){
		animationVar = sprite_get_number(currentSprite)-1;	
	}
}

//Slimed
if(slimed){
	if(!moving){
		if(floor(timer) %2 == 0){
			var crystal = instance_create_depth(x + irandom_range(-20,20),y + irandom_range(-20,20),depth-1,oCrystal);
			crystal.owner = id;
			crystal.startX = x - crystal.x;
			crystal.startY = y - crystal.y;
			crystal.sprite1 = sShuriken_Slime_Hit1;
			crystal.sprite2 = sShuriken_Slime_Hit2;
			crystal.sprite3 = sShuriken_Slime_Hit3;
		}	
	}
}

//Ice statue crystals
if(statue){
	if(floor(timer) %5 == 0 && timer != 0){
		//Because screw conventional randomness
		if(irandom_range(0,10) == 5){
			var crystal = instance_create_depth(x + irandom_range(-20,20),y + irandom_range(-20,20),depth-1,oCrystal);
			crystal.owner = id;
			crystal.startX = x - crystal.x;
			crystal.startY = y - crystal.y;
		}
	}
	
	//Lock to grid and make blocks
	if(!moving){
		x = BLOCK_SIZE * ( x div BLOCK_SIZE);
		y = BLOCK_SIZE * ( y div BLOCK_SIZE);
		if(Wall1 == noone && collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,pEntity,false,true) == noone){
			Wall1 = instance_create_depth(x-BLOCK_SIZE,y-BLOCK_SIZE,depth,oWall);	
			Wall1.visible = false;
			Wall1.image_yscale = 2;
			Wall1.image_xscale = 2;
		}
	}
}

if(slice && specialAnimation){
	//Left & Right
	if(gibID == 6 || gibID == 1 || gibID == 4){
		//show_debug_message("animate");
		image_speed = 0.1 + (0.006 * power(min(animationVar-4),2));
		//hsp_real = 0;
		if(standing != noone){
			animationVar+= image_speed;
		}
		if(animationVar > sprite_get_number(currentSprite)-1){
			animationVar = sprite_get_number(currentSprite)-1;	
		}
	}
	else if(gibID == 2){
		image_speed = 0.1 + (0.006 * power(min(animationVar-4),2));
		animationVar+= image_speed;
		
		if(standing == noone && animationVar > sprite_get_number(currentSprite)-1){
			animationVar = sprite_get_number(currentSprite)-1;	
		}
		else if(standing != noone){
			currentSprite = corpseMap[? ANIMATIONSTATE.SLICEANIMT2];	
			if(is_undefined(currentSprite))
				currentSprite = corpseMap[? ANIMATIONSTATE.DEAD];
			if(animationVar >= sprite_get_number(currentSprite)-1){
				animationVar = 0;
				hsp_real += 5*facing;
				moving = true;
			}
		}
	}
	
}


if (stuck || !moving) exit; //stuck to a wall?

var offset = 1;
if (instance_place(x, y + (offset + grv), oWall) == noone)
	vsp_real = clamp(vsp_real + (grv * time_dialation), -32, 32);
else
	hsp_real = lerp(hsp_real, 0, friction_base / friction_offset);

hsp = hsp_real * time_dialation;
vsp = vsp_real * time_dialation;

var touchingx = instance_place(x + hsp, y, oWall); //get the instance of the wall in the future in the horizontal
if (touchingx != noone) { //If touching a wall in the horizontal 
	//Normal wall collision
	if (hsp > 0) //Going Right
		x = floor(touchingx.bbox_left + (x - bbox_right) - offset);
	else if (hsp < 0) //Going Left
		x = ceil(touchingx.bbox_right + (x - bbox_left) + offset);
	
	hsp = (hsp * weight) * -1 * bounce_coeff; //bounce
	hsp_real = hsp;
}

var touchingy = instance_place(x, y + vsp, oWall); //get the instance of the wall in the future in the vertical
if (touchingy != noone) { //If touching a wall in the vertical
	if (vsp > 0){ //Falling
		y = floor(touchingy.bbox_top + (y - bbox_bottom) - offset);
		
		if(abs(vsp) > 20 && statue){
			instance_destroy(id,true);
		}
		
	}
	else if (vsp < 0) //Going up
		y = ceil(touchingy.bbox_bottom + (y - bbox_top) + offset);
	
	vsp = (vsp * weight) * -1 * bounce_coeff; //bounce
	vsp_real = vsp;
}

if ((touchingx != noone && touchingy == noone) && sticky){ //Hit a wall? Get stuck maybe?
	if(abs(hsp_real) + abs(vsp_real) > 30){
		stuck = true;
	}
	else{
		stuck = random(1) < stuck_chance;
	}
}



//Rotate if moving
if (rotate && hsp != 0)
	angle += hsp;


if (stuck) exit;
//Start moving
x += hsp;
y += vsp;

if (touchingy != noone && abs(vsp) < 3)
	vsp_real = 0;

if (abs(hsp) <= 0.1 && abs(vsp) <= 0.1 && standing != noone)
	moving = false;
