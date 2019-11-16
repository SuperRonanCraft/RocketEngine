/// @desc Check to see if object is a child another
/// @arg object
/// @arg object-to-check

var _object = argument[0];
var _check = argument[1];

var _parent = _check;
while(object_get_parent(_parent) != -100) {
	_parent = object_get_parent(_parent);
	if (_object == _parent)
		return true;
}
return _check == _object;