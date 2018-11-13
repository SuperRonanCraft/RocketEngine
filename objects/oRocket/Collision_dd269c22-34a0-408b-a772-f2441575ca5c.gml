//Hit a shootable object

if(specialCollideShootable != noone){
	script_execute(specialCollideShootable, other);	
}

else{
	with (other)
		scHitShootable(other.owner, true, true);
	
}