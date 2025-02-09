 /// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*		0			1					2			3
	<unit>, <production amount>, <metal price>, <energy price>
*/

unitData = [
			[Ark_Gliese_Destroyer, 55, 450, 50, "Gliese Destroyer", spr_Gliese_Destroyer, true, com_button_ability1.id],
			[Ark_Corot_Corvette, 30, 200, 35, "Corot Corvette", spr_corot_corvette, true, com_button_ability2.id],
			[Ark_Luten_Frigate, 45, 180, 45, "Luten Frigate", spr_luten_frigate, true, com_button_ability3.id],
			[Ark_Mancri_Crusier, 55, 275, 40, "Mancri Crusier", spr_cancri_crusier, false, com_button_ability4.id],
			[Ark_Ross_Crusier, 60, 230, 70, "Ross Crusier", spr_ross_crusier_old, false, com_button_ability5.id],
			[Ark_Eridani_Battlecrusier, 75, 425, 80, "Eridani Battlecrusier", spr_Eridani_battlecruiser, false, com_button_ability6.id],
			[Ark_Neegarden_Artillery, 90, 200, 70, "Neegarden Heavy Laser", spr_Neegarden_artillery, false, com_button_ability7.id],
			];
			
minimapIcon = icon_light_structure;

ds_list_clear(buttons);

ds_list_add(buttons, com_button_ability1.id, com_button_ability2.id, com_button_ability3.id, com_button_ability4.id, com_button_ability5.id, com_button_ability6.id, com_button_ability7.id);

maxSprites = 0;

sprite = Shipyard_Light;

selectSprite = Shipyard_Light_Select;

rally_x = x+ 150;

rally_y = y;

//Update Tech Requirements for all Fighter Bays		
for(var i = 0; i < instance_number(Ark_Fighter_Bay); i++)
{
	
	var _u = instance_find(Ark_Fighter_Bay, i);
	
	if(_u.faction_number == faction_number)
	{
		_u.unitData[4, 6] = true; // Xi
	}
}

//Update Tech Requirements for all HQs	
for(var i = 0; i < instance_number(Ark_HQ); i++)
{
	
	var _u = instance_find(Ark_HQ, i);
	
	if(_u.faction_number == faction_number)
	{
		_u.unitData[4, 4] = true;
		_u.unitData[6, 4] = true;
		_u.unitData[7, 4] = true;
	}
}

//Enable Ships
for(var i = 0; i < instance_number(Ark_Tech_Lab); i++)
{
	if(instance_find(Ark_Tech_Lab, i).faction_number == faction_number)
	{
		unitData[3, 6] = true;
		unitData[4, 6] = true;
		unitData[5, 6] = true;
	}
}

for(var i = 0; i < instance_number(Ark_Heavy_Generator); i++)
{
	if(instance_find(Ark_Heavy_Generator, i).faction_number == faction_number)
	{
		unitData[6, 6] = true;
	}
}

image_angle = 0