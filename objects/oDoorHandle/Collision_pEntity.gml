/// @description  
if(!instance_exists(oGMMSingle.mainPlayer.id)) exit;

if(other.id == oGMMSingle.mainPlayer.id && !activated && array_length(toKill) == 0){
	activated = true;
	event_user(0);
}
