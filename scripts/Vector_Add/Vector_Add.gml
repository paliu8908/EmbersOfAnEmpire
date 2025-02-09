// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Vector_Add(v1_mag, v1_dir, v2_mag, v2_dir){
	v1_x = v1_mag * cos(degtorad(v1_dir));
	v1_y = -v1_mag * sin(degtorad(v1_dir));
	
	v2_x = v2_mag * cos(degtorad(v2_dir));
	v2_y = -v2_mag * sin(degtorad(v2_dir));
	
	new_x = v1_x + v2_x;
	new_y = v1_y + v2_y;
	new_speed = point_distance(0, 0, new_x, new_y);
	
	if(abs(new_x) < 0.0001 && v2_y > 0)
	{
		new_angle = -90;
	}
	
	else if(abs(new_x) < 0.0001)
	{
		new_angle = 90;
	}

	else if(v2_x < 0)
	{
		new_angle = 180 -radtodeg(arctan(new_y/new_x));
		
	} else {
		new_angle = -radtodeg(arctan(new_y/new_x));
	}

	return [new_speed, new_angle];
}