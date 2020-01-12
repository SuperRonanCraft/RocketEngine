///@arg filename

var _filename = argument0;

var _buf = buffer_load(_filename);
var _str = buffer_read(_buf, buffer_string);
buffer_delete(_buf);

var _json = json_decode(_str);
return _json;