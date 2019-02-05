//No need to send us downward if we are going to stay still
//Note: Not how physics works in real life
if (!standing)
	vsp_move = clamp(vsp_move + ((grv * time_dialation) * grv_dir), -32, 32);
standing = scCollisionO();
x += hsp;
y += vsp;
hsp_carry = 0;
vsp_carry = 0;

hsp_override = 0;
vsp_override = 0;