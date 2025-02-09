/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*		0			1					2				3				4				5	     6			7			8
	<Research>, <production amount>, <metal price>, <energy price>	<Research Name>	<Sprite> <Available> <Icon>	<Unit Affected>
*/

baseData = [];

unitData = [
				[12, 60, 300, 75, "Jet Engines", icon_Ark_Navigational_Thrusters, true, com_button_ability1.id, Ark_Corot_Corvette],
				[13, 60, 225, 25, "Heavier Plating", icon_Ark_Heavier_Plating, true, com_button_ability2.id, Ark_Corot_Corvette],
				[14, 50, 185, 50, "Extra Missile Pods", icon_Ark_Missile_Pods, true, com_button_ability3.id, Ark_Corot_Corvette],
				[15, 45, 75, 25, "Structural Destablizers", icon_Ark_Structural_Destablizer, true, com_button_ability4.id, Ark_Luten_Frigate],
				[16, 60, 225, 25, "Torpedo Boosters", icon_Ark_Missile_Boosters, true, com_button_ability5.id, Ark_Luten_Frigate],
				[17, 50, 185, 50, "Refined Fuel", icon_Ark_Streamlined_Igniters, true, com_button_ability6.id, Ark_Luten_Frigate],
				[18, 45, 100, 25, "Focus Beam", icon_Ark_Strong_Laser, true, com_button_ability7.id, Ark_Gliese_Destroyer],
				[19, 60, 175, 25, "Long Range Projectors", icon_Ark_Increased_Range, true, com_button_ability8.id, Ark_Gliese_Destroyer],
				[20, 50, 200, 25, "Enhanced Engines", icon_Ark_Streamlined_Igniters, true, com_button_ability9.id, Ark_Gliese_Destroyer],
				[21, 60, 275, 50, "Force Dispersers", icon_Ark_Heavier_Plating, true, com_button_ability10.id, Ark_Mancri_Crusier],
				[22, 30, 100, 25, "Ion Stablizers", icon_Ark_WeakForceModulators, true, com_button_ability11.id, Ark_Mancri_Crusier],
				[23, 45, 180, 25, "Enhanced Shields", icon_Ark_Shield_Stronger, true, com_button_ability12.id, Ark_Mancri_Crusier]

			];
			
baseData = variable_clone(unitData);

//Enable Ships
for(var i = 0; i < instance_number(Ark_Shipyard_Light); i++)
{
	if(instance_find(Ark_Shipyard_Light, i).faction_number == faction_number)
	{
		Ark_Shipyard_Light.unitData[3, 6] = true;
		Ark_Shipyard_Light.unitData[4, 6] = true;
		Ark_Shipyard_Light.unitData[5, 6] = true;
	}
}

for(var i = 0; i < instance_number(Ark_HQ); i++)
{
	if(instance_find(Ark_HQ, i).faction_number == faction_number)
	{
		Ark_HQ.unitData[10, 4] = true;
	}
}
			
minimapIcon = icon_light_structure;

ds_list_clear(buttons);

ds_list_add(buttons, com_button_ability1, com_button_ability2, com_button_ability3, com_button_ability4, com_button_ability5, com_button_ability6, 
					com_button_ability7, com_button_ability8, com_button_ability9, com_button_ability10, com_button_ability11, com_button_ability12);

maxSprites = 0;

sprite = TechLab;

selectSprite = TechLab_Select;

rally_x = x + 75;

rally_y = y;