  /// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*		0			1					2				3			4			5	     6			7
	<Unit>, <production amount>, <metal price>, <energy price>	<Unit Name>	<Sprite> <Available> <Icon>
*/

unitData = [
			[Ark_Beta_Fighter, 5, 32, 5, "Beta Fighter", Fighter, true, com_button_ability1.id,],					// 0
			[Ark_Omg_Bomber, 10, 35, 10, "Omega Gunship", Omega_Bomber, true, com_button_ability2.id,],				// 1
			[Ark_Zet_Platform, 12, 42, 30,"Zeta Platform", Zeta_Mobile_Turret, false, com_button_ability3.id,],		// 2
			[Ark_Sig_Ace, 15, 30, 40, "Sigma Ace", Sigma_Ace, false, com_button_ability4.id,],						// 3
			[Ark_Xi_Support, 20, 25, 50, "Xi Support", Xi_Support, false, com_button_ability5.id,]					// 4
			];

//Check Construction Requirements met			
for(var i = 0; i < instance_number(Ark_Shipyard_Light); i++)
{
	if(instance_find(Ark_Shipyard_Light, i).faction_number == faction_number)
	{
		unitData[4, 6] = true;	// Xi
		
		i = instance_number(Ark_Shipyard_Light);
	}
}

for(var i = 0; i < instance_number(Ark_Facility); i++)
{
	if(instance_find(Ark_Facility, i).faction_number == faction_number)
	{
		unitData[3, 6] = true;	// Sigma
		unitData[2, 6] = true;	// Zeta
		
		i = instance_number(Ark_Facility);
	}
}
			
minimapIcon = icon_light_structure;

ds_list_clear(buttons);

ds_list_add(buttons, com_button_ability1.id, com_button_ability2.id, com_button_ability3.id, com_button_ability4.id, com_button_ability5.id);

maxSprites = 0;

sprite = FighterDock;

selectSprite = FighterDockSelect;

rally_x = x+ 75; 

rally_y = y;

for(var i = 0; i < instance_number(Ark_HQ); i++)
{
	if(instance_find(Ark_HQ, i).faction_number == faction_number)
	{
		var _u = instance_find(Ark_HQ, i);
		
		_u.unitData[5, 4] = true;
		_u.unitData[6, 4] = true;
		
		i = instance_number(Ark_HQ);
	}
}