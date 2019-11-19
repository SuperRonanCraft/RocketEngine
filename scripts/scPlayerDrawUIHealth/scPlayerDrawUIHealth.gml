//DRAW PLAYER HEALTH
var _hmap = health_map;
var _len = _hmap[? HEALTH_MAP.LENGTH]; //Length of bar
var _hei = _hmap[? HEALTH_MAP.HEIGHT]; //Height of bar
var _dmgList = _hmap[? HEALTH_MAP.DAMAGE_MAP];
var _offset = 0;
if (shootable_map[? SHOOTABLE_MAP.HEALTH] <= 2)
	_offset = scMovementWave(-3, 3, 1);
var _side = team == TEAM.LEFT ? 1 : -1;
var _x = _side == 1 ? _hmap[? HEALTH_MAP.X] : RES_W - _hmap[? HEALTH_MAP.X];
var _y = _hmap[? HEALTH_MAP.Y];
var _mul = shootable_map[? SHOOTABLE_MAP.HEALTH] / shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL];
var _x2 = _x + ((_len * _mul) * _side);
scDrawRect(_x, _y, _x2, _y + _hei, c_green, false, 1); //Health

//Healed
if (_hmap[? HEALTH_MAP.HEAL] > 0) {
	var _per = _hmap[? HEALTH_MAP.HEAL] / shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL]; 
	scDrawRect(_x2, _y, _x2 + (_len * _per) * -_side, _y + _hei, c_yellow, false, 1);
	_hmap[? HEALTH_MAP.HEAL] = lerp(_hmap[? HEALTH_MAP.HEAL], -0.05, 0.05);
} else
	_hmap[? HEALTH_MAP.HEAL] = 0;

//Damaged
var _dmgListRemove = ds_list_create();
var _dmgx = _x2;
for (var i = ds_list_size(_dmgList) - 1; i >= 0; i--) {
	var _dmgMap = _dmgList[| i];
	if (_dmgMap[? "size"] == 1)
		_dmgMap[? "x"] = _dmgx;
	var _dmg = _dmgMap[? "dmg"] / shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL];;
	var _alpha = _dmgMap[? "alpha"];
	var _size = _dmgMap[? "size"];
	var _dis = ((_len * _dmg) * _side)
	scDrawRect(_dmgMap[? "x"], _y - _size / 2, _dmgMap[? "x"] + _dis, _y + _hei + _size / 2, c_red, false, _alpha);
	_dmgMap[? "size"] += 2;
	_dmgMap[? "alpha"] -= 0.05;
	if (_dmgMap[? "alpha"] <= 0)
		ds_list_add(_dmgListRemove, i);
	_dmgx += _dis;
	/*if (_hmap[? HEALTH_MAP.DAMAGE] > 0) { //Damaged
		var _per = _hmap[? HEALTH_MAP.DAMAGE] / shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL];
		scDrawRect(_x2, _y, _x2 + (_len * _per) * _side, _y + _hei, c_red, false, 1);
		_hmap[? HEALTH_MAP.DAMAGE] = lerp(_hmap[? HEALTH_MAP.DAMAGE], -0.05, _hmap[? HEALTH_MAP.DAMAGE_MUL]);
	} else
		_hmap[? HEALTH_MAP.DAMAGE] = 0;*/
}

for (var i = 0; i < ds_list_size(_dmgListRemove); i++)
	ds_list_delete(_dmgList, _dmgListRemove[| i]);
ds_list_destroy(_dmgListRemove);

//FRAME
scDrawRect(_x, _hmap[? HEALTH_MAP.Y], _x + _len * _side, _hmap[? HEALTH_MAP.Y] + _hei, c_black, true, 1);
//TEXT
scDrawText(_x + (_len / 2) * _side, _y + _hei / 2, string(shootable_map[? SHOOTABLE_MAP.HEALTH]) + "/" + string(shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL]), noone, 0.3)

//_hmap[? HEALTH_MAP.FLASH_ALPHA] = max(_hmap[? HEALTH_MAP.FLASH_ALPHA] - _hmap[? HEALTH_MAP.FLASH_ALPHA_REDUCE], 0);