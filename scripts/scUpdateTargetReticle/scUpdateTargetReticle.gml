///scUpdateTargetReticle()
///
function scUpdateTargetReticle() {

	if(!auto_aim){
		aim_target_x = mouse_x;
		aim_target_y = mouse_y;
	}
	else{
		aim_target_x = scFindTarget(team).x;
		aim_target_y = scFindTarget(team).y;
	}


}
