/// @desc Sludge ult has been casted

owner = noone; //owner of ultimate

sludge_despawn = 10 * room_speed; //Uptime of sludge
sludge_timer = 0;
sludge_grv = 0.4;
sludge_hsp = 10;
sludge_vsp = -4;
sludge_buff = BUFFTYPE.SLIME;

image_index = irandom(image_number - 1); //Randomize the first frame

standing = false;
