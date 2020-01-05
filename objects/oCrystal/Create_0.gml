/// @description  
owner = noone;

crystal = irandom_range(0,2);

image_index = random_range(0.2,0.5);
startX = x;
startY = y;

switch (crystal) {
    case 0:
        sprite_index = s_pcrystal1;
        break;
    case 1:
        sprite_index = s_pcrystal2;
        break;
	case 2:
		sprite_index = s_pcrystal3;
		break;
}