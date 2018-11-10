//No need to send us downward if we are going to stay still
//Note: Not how physics works in real life
if(!standing)
	vsp_move += grv;
standing = scCollisionO();
x += hsp;
y += vsp;
hsp_carry = 0;
vsp_carry = 0;