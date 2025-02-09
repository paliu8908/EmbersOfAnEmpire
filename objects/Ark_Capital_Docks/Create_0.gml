/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*		0			1					2			3				 4
	<unit>, <production amount>, <metal price>, <energy expended>	<Unlocked>
*/

unitData = [
			
			[Ark_Tau_Ceti_Battleship, 120, 875, 200, "Tau Ceti Battleship", BIgShip, true, com_button_ability1.id],
			[Ark_Kepler_Support, 120, 550, 250, "Kepler Support Ship", spr_Dappist_Cannon, true, com_button_ability2.id],
			[Ark_Hapten_Dreadnought, 150, 1050, 225, "Hapten Dreadnought", spr_Hapten_battleship, false, com_button_ability3.id],
			[Ark_Dappist_Artillery, 135, 1200, 300, "Dappist Annhilator", old, false, com_button_ability4.id]
			];
			
minimapIcon = icon_light_structure;

ds_list_clear(buttons);

ds_list_add(buttons, com_button_ability1.id, com_button_ability2.id, com_button_ability3.id, com_button_ability4.id);

maxSprites = 0;

sprite = Capital_Docks;

selectSprite = Capital_Docks_Select;
 
canProduce = true;

rally_x = x+ 150;

rally_y = y;

//Update Tech Requirements for all HQs
for(var i = 0; i < instance_number(Ark_HQ); i++)
{
	
	var _u = instance_find(Ark_HQ, i);
	
	if(_u.faction_number == faction_number)
	{
		_u.unitData[8, 4] = true; // Experimental Centre
	}
}

for(var i = 0; i < instance_number(Ark_Experimental_Centre); i++)
{
	if(instance_find(Ark_Experimental_Centre, i).faction_number == faction_number)
	{
		unitData[2, 4] = true; // Hapten
		unitData[3, 4] = true; // Dappist
	}
}