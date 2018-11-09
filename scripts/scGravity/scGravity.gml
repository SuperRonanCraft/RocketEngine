//No need to send us downward if we are going to stay still
//Note: Not how physics works in real life
if(!standing)
	vsp += grv;
standing = scCollisionO();
x += hsp;
y += vsp;