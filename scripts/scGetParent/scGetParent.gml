/// @desc Check to see if object is a child another
/// @arg object
/// @arg object-to-check

var _parent = argument[0];
var _object = argument[1];

if (object_is_ancestor(_parent, _object.object_index))
	return true;
else
	return _parent == _object.object_index;

/*var _parent = _check.object_index;
while(object_get_parent(_parent) != -100 && 
		object_get_parent(_parent) != -1) {
	_parent = object_get_parent(_parent);
	show_debug_message("Finding parent for " + string(_parent));
	if (_parent == _object)
		return true;
}
show_debug_message("Could not find " + string(_parent) + " == " + string(_object))
return _parent == _object;