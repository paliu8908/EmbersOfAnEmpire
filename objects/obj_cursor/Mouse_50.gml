/// @description Insert description here
// You can write your code in this editor

if(!collision_circle(x, y, 20, com_button, false, true) && !keyboard_check(ord("Q")) && !keyboard_check(ord("W")) && !keyboard_check(ord("E")) && !keyboard_check(ord("R")))
{
	time_down++;
	
	if(global.mx == 0)
	{
		global.mx = mouse_x;
	}
	
	if(global.my == 0)
	{
		global.my = mouse_y;
	}
}