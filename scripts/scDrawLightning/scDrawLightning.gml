/// @arg x
/// @arg y
/// @arg x2
/// @arg y2
/// @arg branches
/// @arg colour)
//
//draws a lightning bolt from the given starting location to the given end location
//
//x = x of the bolt's start
//y = y of the bolt's start
//x2 = x of the bolt's end
//y2 = y of the bolt's end
//branches = true or false, if the lightning bolt branches into multiple smaller ones
//colour = colour of the glow
//
//amusudan 23/5/2016
//
//feel free to use this in your project!
//
var dir = point_direction(argument0,argument1,argument2,argument3);
var length = point_distance(argument0,argument1,argument2,argument3);
var colour = argument5;

//make different segments
var i = 0;
var i2 = 1;
var point;
point[0] = 0;
do
    {
    i++;
    if random(1) < .06
        {
        point[i2] = i;
        i2++;
        }
    }
until i >= length
point[i2] = length;
var points = array_length_1d(point);

//draw segments
var i = 0;
var i2 = 1
var difx = 0;
var difx2 = 0;
var dify = 0;
var dify2 = 0;

do //loop through and draw all the segments
    {
    difx = random_range(-7,7)
    dify = random_range(-7,7)
    
    var xx = argument0 + lengthdir_x(point[i2 - 1],dir);
    var yy = argument1 + lengthdir_y(point[i2 - 1],dir);
    var xx2 = argument0 + lengthdir_x(point[i2],dir);
    var yy2 = argument1 + lengthdir_y(point[i2],dir);
    
    //create a branch
    if random(1) < .15 && argument4
        {
        var bdir = dir + choose(random_range(-45,-25),random_range(45,25));
        var blength = random_range(5,30);
        scDrawLightning(xx + difx2, yy + dify2, xx + difx2 + lengthdir_x(blength,bdir), yy + dify2 + lengthdir_y(blength,bdir), false,colour)
        }
    
    var size = random_range(.1,1);
    //draw the glow of the lightning
    draw_set_alpha(.1)
    draw_line_width_colour(xx + difx2,yy + dify2,xx2 + difx,yy2 + dify, size + 5,colour,colour);
    draw_line_width_colour(xx + difx2,yy + dify2,xx2 + difx,yy2 + dify, size + 3,c_white,c_white);
    draw_line_width_colour(xx + difx2,yy + dify2,xx2 + difx,yy2 + dify, size + 1,c_white,c_white);
    draw_set_alpha(1)
    //draw the white center of the lightning
    draw_line_width_colour(xx + difx2,yy + dify2,xx2 + difx,yy2 + dify, size,c_white,c_white);
    
    i2++;
    difx2 = difx;
    dify2 = dify;
    }
until i2 = points

//draw a glowing circle
if argument4
    {
    var size = random_range(1,2)
    draw_set_alpha(.1)
    draw_circle_colour(argument0,argument1,size + 2.5,colour,colour,false);
    draw_circle_colour(argument0,argument1,size + 1.5,colour,colour,false);
    draw_circle_colour(argument0,argument1,size + .5,colour,colour,false);
    draw_set_alpha(1)
    draw_circle_colour(argument0,argument1,size,c_white,c_white,false);
    }
