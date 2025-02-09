if(ds_list_find_index(global.primarySelect, self.id) != -1)
{

	slowShot = !slowShot;

	//projectile, range, fireAngle, shootAngle, reload_time, burst_delay, burst, reload_counter, burst_counter, if_burst, if_reload, if_shoot, target, target_x, target_y, offset_x, offset_y
	//  0			1		2			3			4				5		6			7				8			9			10		11		  12		13		14		   15		16

	if(slowShot)
	{
		for(var _w = 0; _w < array_length(longShot); _w++)
		{
			longShot[_w, 3] = main_weapon_list[0, 3]; 
		}
		
		main_weapon_list = longShot;
					
		weapon = Ark_Ross_Gauss;
		
		blurb = "Anti-ship crusier. In long-range mode.";
	}
	else
	{
		for(var _w = 0; _w < array_length(longShot); _w++)
		{
			fastShot[_w, 3] = main_weapon_list[0, 3]; 
		}
	    
		main_weapon_list = fastShot;
		
		blurb = "Anti-ship crusier. In rapid-fire mode.";
					
		weapon = Ark_Ross_GaussFast;
	}
	
	ShowButtons(self);
}