//@desc Draw a Players health
///@arg x
///@arg y
///@arg length
///@arg height
///@arg side_respect*
///@arg alpha*
///@arg draw_health*
///@arg draw_frame*

var _x = argument[0];
var _y = argument[1];
var _len = argument[2]; //Length of bar
var _hei = argument[3]; //Height of bar
var _side_respect = argument_count > 4 ? (argument[4] != noone ? argument[4] : true) : true;
var _alpha = argument_count > 5 ? (argument[5] != noone ? argument[5] : 1) : 1;
var _draw_health = argument_count > 6 ? (argument[6] != noone ? argument[6] : true) : true;
var _side = 1;
var _draw_frame = argument_count > 7 ? (argument[7] != noone ? argument[7] : true) : true;
var _h = 16; //Height of sprite

//DRAW PLAYER HEALTH
var _map = shootable_map;
var _hmap = health_map;
var _health_max = _map[? SHOOTABLE_MAP.HEALTH_BASE_ORIGINAL] + _map[? SHOOTABLE_MAP.HEALTH_SHIELD_ORIGINAL] + _map[? SHOOTABLE_MAP.HEALTH_ARMOR_ORIGINAL];
var _offset = 0;
if (_map[? SHOOTABLE_MAP.HEALTH_BASE] <= 2)
	_offset = scMovementWave(-3, 3, 1);
if (_side_respect) {
	_side = team == TEAM.LEFT ? 1 : -1;
	_x = _side == 1 ? _hmap[? HEALTH_MAP.X] : RES_W - _hmap[? HEALTH_MAP.X];
}
var _mul = _map[? SHOOTABLE_MAP.HEALTH_BASE] / _health_max;
scDrawSpriteExt(_x, _y, sUIHealthNew, 0, noone, _alpha, _len * _mul * _side, _hei / _h); //Health
var _x2 = _x + ((_len * _mul) * _side); //Calculate next objects position

if (_map[? SHOOTABLE_MAP.HEALTH_ARMOR] > 0) {
	_mul = _map[? SHOOTABLE_MAP.HEALTH_ARMOR] / _health_max;
	scDrawSpriteExt(_x2, _y, sUIHealthNew, 2, noone, _alpha, _len * _mul * _side, _hei / _h); //Armor
	_x2 += ((_len * _mul) * _side);
}

if (_map[? SHOOTABLE_MAP.HEALTH_SHIELD] > 0) {
	var _mul = _map[? SHOOTABLE_MAP.HEALTH_SHIELD] / _health_max;
	scDrawSpriteExt(_x2, _y, sUIHealthNew, 3, noone, _alpha, _len * _mul * _side, _hei / _h); //Shield
	_x2 += ((_len * _mul) * _side);
}

scDrawRect(_x2, _y, _x + (_len * _side), _y + ((_hei / _h) * _h), c_dkgray, false, _alpha); //Background

//Healed BASE
if (_hmap[? HEALTH_MAP.HEAL] > 0) {
	var _per = _hmap[? HEALTH_MAP.HEAL] / _health_max;
	scDrawSpriteExt(_x2, _y, sUIHealthNew, 1, noone, _alpha, -(_len * _per) * _side, _hei / _h);
	//scDrawRect(_x2, _y, _x2 + (_len * _per) * -_side, _y + _hei, c_yellow, false, _alpha);
	_hmap[? HEALTH_MAP.HEAL] = lerp(_hmap[? HEALTH_MAP.HEAL], -0.1, 0.05);
} else
	_hmap[? HEALTH_MAP.HEAL] = 0;

//Frame
//scDrawRect(_x, _y, _x + _len * _side, _y + _hei, c_black, true, _alpha);
if (_draw_frame)
	scDrawSpriteExt(_x, _y, sUIHealthFrame, 0, noone, _alpha, _side, _hei / _h);

//Damaged
var _dmgList = _hmap[? HEALTH_MAP.DAMAGE_MAP];
var _dmg_listRemove = ds_list_create();
var _dmg_xStart = _x2;
for (var i = ds_list_size(_dmgList) - 1; i >= 0; i--) {
	var _dmgMap = _dmgList[| i];
	var _dmg_per = _dmgMap[? "dmg"] / _health_max;
	if (_dmgMap[? "size"] == 1) {
		_dmgMap[? "x"] = _dmg_xStart - _x;
		_dmgMap[? "alpha"] = _alpha;
		_dmgMap[? "change_size"] = 2 - (_dmg_per * 1.3);
		_dmgMap[? "change_alpha"] = 0.06 - min(_dmg_per * 0.10, 0.04);
	}
	var _dmg_alpha = _dmgMap[? "alpha"];
	var _dmg_size = _dmgMap[? "size"];
	var _dmg_dis = ((_len * _dmg_per) * _side);
	var _dmg_x = _dmgMap[? "x"] + _x;
	//scDrawSpriteExt(_dmg_x, _y - _dmg_size / 2, sUIHealthNew, 2, noone, _dmg_alpha, (_len * _dmg_per), _dmg_size);
	scDrawRect(_dmg_x, _y - _dmg_size / 2, _dmg_x + _dmg_dis, _y + _hei + _dmg_size / 2, c_red, false, _dmg_alpha);
	_dmgMap[? "size"] += _dmgMap[? "change_size"];
	_dmgMap[? "alpha"] -= _dmgMap[? "change_alpha"];
	if (_dmgMap[? "alpha"] <= 0)
		ds_list_add(_dmg_listRemove, i);
	_dmg_xStart += _dmg_dis;
}

for (var i = 0; i < ds_list_size(_dmg_listRemove); i++)
	ds_list_delete(_dmgList, _dmg_listRemove[| i]);
ds_list_destroy(_dmg_listRemove);

//TEXT
if (_draw_health) {
	var _health = abs(floor(_map[? SHOOTABLE_MAP.HEALTH_BASE] + _map[? SHOOTABLE_MAP.HEALTH_SHIELD] + 
		_map[? SHOOTABLE_MAP.HEALTH_ARMOR]));
	scDrawText(_x + (_len / 2) * _side, _y + (((_hei / _h) * _h) / 2), string(_health) + "/" + string(_health_max), noone, 0.5, noone, _alpha, fa_middle, fa_middle);
}
//_hmap[? HEALTH_MAP.FLASH_ALPHA] = max(_hmap[? HEALTH_MAP.FLASH_ALPHA] - _hmap[? HEALTH_MAP.FLASH_ALPHA_REDUCE], 0);