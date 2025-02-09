/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*		0			1					2			3
	<unit>, <production amount>, <metal price>, <energy price>
*/
			
minimapIcon = icon_light_structure;

ds_list_clear(buttons);

maxSprites = 0;

sprite = AdvancedPowerPlant;

selectSprite = AdvancedPowerPlant_Select;

//Enable Ships

for(var i = 0; i < instance_number(Ark_Shipyard_Light); i++)
{
	if(instance_find(Ark_Shipyard_Light, i).faction_number == faction_number)
	{
		Ark_Shipyard_Light.unitData[6, 6] = true;
	}
}

for(var i = 0; i < instance_number(Ark_HQ); i++)
{
	if(instance_find(Ark_HQ, i).faction_number == faction_number)
	{
		Ark_HQ.unitData[9, 4] = true;
	}
}



baseData = [];

unitData = [
			[24, 55, 275, 50, "Railgun Accelerators", icon_Ark_Railgun_Accelerators, true, com_button_ability1.id, Ark_Ross_Crusier],
			[25, 45, 125, 25, "Shield Generator", icon_Ark_Shield, true, com_button_ability2.id, Ark_Ross_Crusier],
			[26, 40, 145, 25, "Superior Engines", icon_Ark_Navigational_Thrusters, true, com_button_ability3.id, Ark_Ross_Crusier],
			[27, 35, 100, 25, "Increased Plating", icon_Ark_Heavier_Plating, true, com_button_ability4.id, Ark_Eridani_Battlecrusier],
			[28, 50, 225, 75, "Energy Shielding", icon_Ark_Shield_Stronger, true, com_button_ability5.id, Ark_Eridani_Battlecrusier],
			[29, 40, 145, 50, "Self-Repair Systems", icon_Ark_SelfRepair, true, com_button_ability6.id, Ark_Eridani_Battlecrusier],
			[30, 35, 100, 25, "Energy Shields", icon_Ark_Shield, true, com_button_ability7.id, Ark_Neegarden_Artillery],
			[31, 50, 225, 75, "Enhanced Lasers", icon_Ark_Strong_Laser, true, com_button_ability8.id, Ark_Neegarden_Artillery],
			[32, 40, 145, 50, "Jet Boosters", icon_Ark_Streamlined_Igniters, true, com_button_ability9.id, Ark_Neegarden_Artillery],
			[33, 45, 100, 50, "Energy Shields", icon_Ark_Shield, true, com_button_ability10.id, Ark_Xi_Support],
			//[34, 50, 225, 75, "Enhanced Lasers", icon_Ark_Strong_Laser, true, com_button_ability5.id, Ark_Neegarden_Artillery],
			//[35, 40, 145, 50, "Jet Boosters", icon_Ark_Streamlined_Igniters, true, com_button_ability6.id, Ark_Neegarden_Artillery]

			];
			
baseData = variable_clone(unitData);

ds_list_clear(buttons);

ds_list_add(buttons, com_button_ability1, com_button_ability2, com_button_ability3, com_button_ability4, com_button_ability5, com_button_ability6, 
					com_button_ability7, com_button_ability8, com_button_ability9, com_button_ability10);