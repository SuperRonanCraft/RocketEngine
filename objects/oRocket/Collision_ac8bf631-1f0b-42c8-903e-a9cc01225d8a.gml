/// @desc hit another rocket
//If the rocket is not from the same shooter

if(specialCollideRocket != noone){
	script_execute(specialCollideRocket, other);	
}
else{

	if (other.owner != owner) {
		instance_change(oHitSpark, true);
		if(other.specialCollideRocket == noone){
			with (other)
				instance_change(oHitSpark, true);
		}
		else{
			with(other)
				script_execute(specialCollideRocket,other);
		}
	}

}