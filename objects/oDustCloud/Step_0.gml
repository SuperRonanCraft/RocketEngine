/// @description  

timer --;




//Slow down

if(vsp != 0)
	vsp -= 0.1 * sign(vsp);

if(hsp != 0)
	hsp -= 0.1 * sign(hsp);



x += hsp;
y += vsp;


for (var i = 0; i < ds_list_size(hitList); i++) {
    if(owner != noone)
		scBuffAdd([BUFFTYPE.INVISIBLE], hitList[|i], owner);
}

image_alpha = timer/maxtimer;

if(timer == 0)
	instance_destroy();
