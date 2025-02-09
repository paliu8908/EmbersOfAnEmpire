/// @description Insert description here
// You can write your code in this editor
if(ds_list_find_index(global.primarySelect, self.id) != -1 && canSwap)
{

	//projectile, range, fireAngle, shootAngle, reload_time, burst_delay, burst, reload_counter, burst_counter, if_burst, if_reload, if_shoot, target, target_x, target_y, offset_x, offset_y
	//  0			1		2			3			4				5		6			7				8			9			10		11		  12		13		14		   15		16

	if(focusShot)
	{
		main_weapon_list = multiShot;
					
		weapon = Ark_Destroyer_Beam;
		
		blurb = "Anti-fighter destroyer. In multi-target mode."
	}
	else
	{
		main_weapon_list = focusWeapons;
					
		weapon = Ark_Destroyer_BeamFocus;
		
		blurb = "Anti-fighter destroyer. In focus mode."
	}

	focusShot = !focusShot;
	
	ShowButtons(self);
}