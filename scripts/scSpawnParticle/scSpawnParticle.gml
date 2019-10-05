///@arg x
///@arg y
///@arg amount
///@arg speed
///@arg sprite
///@arg type

var xx = argument0;
var yy = argument1;
var amt = argument2;
var spd = argument3;
var sprite = argument4;
var type = argument5;


repeat(amt){
	var worldPart = instance_create_depth(xx, yy, depth + 1, oPartGravParent);
	worldPart.sprite_index = sprite;
	worldPart.type = type;
	switch (type) {
	    case WORLDPART_TYPE.BLOOD:
		
			with (worldPart) {
				weight = random_range(0.2, 0.85);
				friction_base = random_range(0.2, 1);
				hsp_real = random_range(-10, 10);
				vsp_real = random_range(-20, 2);
				timer += irandom_range(-25, 25);
				sticky = true;
				image_alpha = 0.8;
				image_xscale = .5;
				image_yscale = .5;
			}
			
	        break;
			
	    case WORLDPART_TYPE.DEBRIS:
			
			with (worldPart) {
				weight = random_range(0.7, 0.95);
				friction_base = random_range(0.8, 1);
				hsp_real = random_range(-spd/2, spd/2);
				vsp_real = random_range(-spd/2, spd/4);
				timer += irandom_range(-25, 25);
				rotate = true;
				bounce_coeff = 0.5;
				image_xscale = 1;
				image_yscale = 1;
				image_index = irandom_range(0,image_number-1);
			}			
			
	        break;
			
	    case WORLDPART_TYPE.SLIME:
		
			with (worldPart) {
				weight = random_range(0.2, 0.85);
				friction_base = random_range(0.2, 1);
				hsp_real = random_range(-10, 10);
				vsp_real = random_range(-20, 2);
				timer += irandom_range(-25, 25);
				sticky = true;
				image_alpha = 0.8;
				image_xscale = .5;
				image_yscale = .5;
			}
			
	        break;
	}
	
}
	
enum WORLDPART_TYPE{
		BLOOD, DEBRIS, SLIME,
}