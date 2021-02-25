/// @desc create menu pages
/// @arg ["Name", type, entries...]
function scUICreateMenuPage() {

	var arg, i = 0;
	for (var i = 0; i < argument_count; i++)
		arg[i] = argument[i];

	var ds_grid_id = ds_grid_create(8, argument_count);

	for (var i = 0; i < argument_count; i++) {
		var array = arg[i];
		var array_len = array_length(array);
		var xx = 0;
		repeat (array_len) {
			ds_grid_id[# xx, i] = array[xx];
			xx++;
		}
	}

	return ds_grid_id;


}
