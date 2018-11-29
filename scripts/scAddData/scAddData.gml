///@desc Add data to the text file
///@arg data The string to add

var data = argument[0];
var file = file_text_open_append(working_directory+"data.txt");

file_text_write_string(file, data);

file_text_writeln(file);

file_text_close(file);