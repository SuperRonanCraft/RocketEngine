///@arg seed
///@arg range

var _seed = argument0;
var _range = argument1;
var _num = argument2 + argument3;
_seed += _num;

random_set_seed(_seed);
return irandom_range(0, _range);