 /// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*		0			1					2				3				4				5	     6			7			8
	<Research>, <production amount>, <metal price>, <energy price>	<Research Name>	<Sprite> <Available> <Icon>	<Unit Affected>
*/

baseData = [];

unitData = [
				[0, 60, 200, 100, "Secondary Generators", icon_Ark_BackupGen, true, com_button_ability1.id, Ark_Beta_Fighter],
				[1, 80, 550, 250, "Beam Magnifiers", icon_Ark_Magnified_Beams, true, com_button_ability2.id, Ark_Beta_Fighter],
				[2, 67, 250, 130, "Navigational Thrusters", icon_Ark_Magnified_Beams, true, com_button_ability3.id, Ark_Beta_Fighter],
				[3, 70, 375, 175, "Heavier Payloads", icon_Ark_Heavier_Payload, true, com_button_ability4.id, Ark_Omg_Bomber],
				[4, 80, 440, 200, "Streamlined Igniters", icon_Ark_Streamlined_Igniters, true, com_button_ability5.id, Ark_Omg_Bomber],
				[5, 60, 315, 150, "Missile Boosters", icon_Ark_Missile_Boosters, true, com_button_ability6.id, Ark_Omg_Bomber],
				[6, 80, 500, 180, "Enhanced Exciters", icon_Ark_EnhancedExciters, true, com_button_ability7.id, Ark_Sig_Ace],
				[7, 67, 565, 300, "Optic Resonators", icon_Ark_OpticResonators, true, com_button_ability8.id, Ark_Sig_Ace],
				[8, 67, 450, 350, "Personal Shielding", icon_Ark_Shield, true, com_button_ability9.id, Ark_Sig_Ace],
				[9, 80, 525, 270, "Weak Force Modulators", icon_Ark_WeakForceModulators, true, com_button_ability10.id, Ark_Zet_Platform],
				[10, 60, 375, 200, "Platform Shields", icon_Ark_Shield, true, com_button_ability11.id, Ark_Zet_Platform],
				[11, 50, 400, 120, "Turret Rotators", icon_Ark_TurretRotators, true, com_button_ability12.id, Ark_Zet_Platform]
			];
			
baseData = variable_clone(unitData);

//Enable Fighters
for(var i = 0; i < instance_number(Ark_Fighter_Bay); i++)
{
	if(instance_find(Ark_Fighter_Bay, i).faction_number == faction_number)
	{
		Ark_Fighter_Bay.unitData[2, 6] = true; // Zeta
		Ark_Fighter_Bay.unitData[3, 6] = true; // Sigma
	}
}
			
minimapIcon = icon_light_structure;

ds_list_clear(buttons);

ds_list_add(buttons, com_button_ability1, com_button_ability2, com_button_ability3, com_button_ability4, com_button_ability5, com_button_ability6, com_button_ability7, com_button_ability8, com_button_ability9, com_button_ability10, com_button_ability11, com_button_ability12);

maxSprites = 0;

sprite = ResearchFacility;

selectSprite = ResearchFacility_Select;

rally_x = x + 75;

rally_y = y;