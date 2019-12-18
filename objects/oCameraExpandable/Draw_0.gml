/// @desc 
if (!full) exit;
var _xx = x - view_w_half;
var _yy = y - view_h_half
scDrawRect(_xx, _yy, _xx + RES_W, _yy + RES_H, c_red, false, 0.5);
/*scDrawLine(_xx, _yy, _xx, _yy + RES_H, c_red, 5, 1); //left
scDrawLine(_xx, _yy, _xx + RES_W, _yy, c_red, 5, 1); //top
scDrawLine(_xx + RES_W, _yy, _xx + RES_W, _yy + RES_H, c_red, 5, 1); //right
scDrawLine(_xx, _yy + RES_H, _xx + RES_W, _yy + RES_H, c_red, 5, 1); //bottom