/// @description Insert description here
// You can write your code in this editor
if(global.mx == 0)
{
	time_held += 1;
}

if(time_held > 0)
{
	time_held = 0;
	
	global.mx = 0;

	global.my = 0;

	global.releasex = 0;

	global.releasey = 0;
	
	global.ifmbdown = 0;
}

/*time_held = 0; 
	
global.mx = 0;

global.my = 0;

global.releasex = 0;

global.releasey = 0;
	
global.ifmbdown = 0;*/