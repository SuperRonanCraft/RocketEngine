///@desc Projectile collision/movement script
///@arg map
///@arg ds_list
function scProjectileMove() {

	var map = argument[0];
	var touching = argument[1];

	var _hsp = hsp*time_dialation;
	var _vsp = vsp*time_dialation;

	var x_change = _hsp;
	var y_change = _vsp;


	var touching_amt;

	var _dis = floor(point_distance(x, y, x + _hsp, y + _vsp));

	var magicNum = 16;

	var touchingList = ds_list_create();

	ds_list_clear(touching);


	var inter = 1;

	if (_dis >= magicNum) {
		inter = _dis / magicNum;
	}

	for (var i = 0; i < inter+1; i++) {
		x_change = point_distance(x, y, x + (_hsp / inter) * i, y) * sign(_hsp);
		y_change = point_distance(x, y, x, y + (_vsp / inter) * i) * sign(_vsp);
		
		touching_amt = instance_place_list(x + x_change, y + y_change, pPhysical,touchingList,true); //get the instance of the wall in the future in the horizontal
		newX = x + x_change;
		newY = y + y_change;
		for (var c = 0; c < touching_amt; c++) {
			if(ds_list_find_index(touching,touchingList[|c]) == -1){ 
				ds_list_add(touching,touchingList[|c]);
			}
		}
		ds_list_clear(touchingList);
		
	}


	ds_list_destroy(touchingList);




}
