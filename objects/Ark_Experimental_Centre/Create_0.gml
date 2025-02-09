/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*		0			1					2				3				4				5	     6			7			8
	<Research>, <production amount>, <metal price>, <energy price>	<Research Name>	<Sprite> <Available> <Icon>	<Unit Affected>
*/

baseData = [];

unitData = [
			
			[36, 30, 125, 25, "Disruption Field", icon_Ark_DisruptionField, true, com_button_ability1.id, Ark_Tau_Ceti_Battleship],
			[37, 55, 275, 50, "Nuclear Generators", icon_Ark_NuclearGenerators, true, com_button_ability2.id, Ark_Tau_Ceti_Battleship],
			[38, 45, 200, 25, "Long-Range Projectors", icon_Ark_LongRangeProjectors, true, com_button_ability3.id, Ark_Tau_Ceti_Battleship],
			[39, 30, 225, 50, "Decimating Barrage", icon_Ark_Decimate, true, com_button_ability4.id, Ark_Hapten_Dreadnought],
			[40, 30, 225, 50, "Creeping Barrage", icon_Ark_Creeping, true, com_button_ability5.id, Ark_Hapten_Dreadnought],
			[41, 30, 225, 50, "Hurricane Barrage", icon_Ark_Concentrate, true, com_button_ability6.id, Ark_Hapten_Dreadnought],
			[42, 45, 325, 50, "Particle Stablizers", icon_Ark_WeakForceModulators, true, com_button_ability7.id, Ark_Dappist_Artillery],
			[43, 60, 275, 50, "Strong Force Dampners", icon_Ark_EnhancedExciters, true, com_button_ability8.id, Ark_Dappist_Artillery],
			[44, 50, 150, 75, "Rocket Boosters", icon_Ark_Missile_Boosters, true, com_button_ability9.id, Ark_Dappist_Artillery]
			
			];
			
baseData = variable_clone(unitData);

//Enable Ships
for(var i = 0; i < instance_number(Ark_Capital_Docks); i++)
{
	if(instance_find(Ark_Capital_Docks, i).faction_number == faction_number)
	{
		Ark_Capital_Docks.unitData[2, 6] = true;
		Ark_Capital_Docks.unitData[3, 6] = true;
	}
}
			
minimapIcon = icon_light_structure;

ds_list_clear(buttons);

ds_list_add(buttons,);

maxSprites = 0;

sprite = ExperimentalCentre;

selectSprite = ExperimentalCentre_Select;

rally_x = x + 75;

rally_y = y;

ds_list_clear(buttons);

ds_list_add(buttons, com_button_ability1, com_button_ability2, com_button_ability3, com_button_ability4, com_button_ability5, com_button_ability6, com_button_ability7, com_button_ability8, com_button_ability9);
