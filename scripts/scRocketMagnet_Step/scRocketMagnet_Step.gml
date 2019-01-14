///Magnet Step

if(direction == 0 || direction == 180){

	with(target){
	
		if((other.x > x - 25 && other.x < x + 25) ){
			if(y > other.y){
				other.direction = 270;
			}	
			else{
				other.direction = 90;	
			}
		}
	
	}

}	
	

image_angle = direction;

x += lengthdir_x(rocket_map[? ROCKET_MAP.SPEED], direction);
y += lengthdir_y(rocket_map[? ROCKET_MAP.SPEED], direction);