/// @description Make a text file

file = file_text_open_write(working_directory + "data.txt");
file_text_write_string(file, "DATA COLLECTION");
file_text_writeln(file);
file_text_close(file);

games = 0;

timeToHit = ds_list_create();
timer = 0;
beginCount = false;