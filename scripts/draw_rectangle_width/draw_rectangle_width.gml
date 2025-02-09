// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_rectangle_frame_width(x1, y1, x2, y2, colour, width){
	draw_line_width_color(x1, y1, x1, y2, width, colour, colour);
	draw_line_width_color(x1, y1, x2, y1, width, colour, colour);
	draw_line_width_color(x2, y1, x2, y2, width, colour, colour);
	draw_line_width_color(x1, y2, x2, y2, width, colour, colour);
}