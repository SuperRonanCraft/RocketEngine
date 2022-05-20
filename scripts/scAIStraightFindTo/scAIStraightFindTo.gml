function scAIStraightFindTo(desiredX,desiredY,entity){
	if(!instance_exists(entity))
		exit;
	
	var beginNode = new pathNode(entity.x div BLOCK_SIZE, entity.y div BLOCK_SIZE);
	
}

function pathNode(px, py) constructor {
	nodeX = px;
	nodeY = py;
	nodePath = [];
}
