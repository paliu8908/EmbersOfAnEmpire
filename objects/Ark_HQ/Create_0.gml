/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

/*		0			1					2			3			   4		5	     6			7	
	<unit>, <production amount>, <metal price>, <energy price>	<Name>	<Sprite> <Available> <Icon>
*/

event_inherited();

unitData = [
			[Ark_Fighter_Bay, 20, 400, 50, false, "Fighter Bay Ship", ],				//0
			[Ark_Power_Plant, 10, 200, 0, true, "Generator Ship"],						// 1
			[Ark_Refinery, 25, 400, 25, true, "Metal Refinery Ship"],					// 2
			[Ark_Shipyard_Light, 45, 750, 30, false, "Shipyard Ship"],					// 3
			[Ark_Capital_Docks, 75, 1000, 70, false, "Capital Docks Ship"],				// 4
			[Ark_Facility, 40, 300, 50, false, "Facility Ship"],						// 5
			[Ark_Heavy_Generator, 35, 450, 50, false, "Heavy Generator Ship"],			// 6
			[Ark_Tech_Lab, 60, 550, 150, false, "Tech Lab Ship"],						// 7
			[Ark_Experimental_Centre, 60, 350, 150, false, "Experimental Centre Ship"],	// 8
			[Ark_Arms_Storage, 30, 375, 120, false, "Arms Storage Ship"],				// 9
			[Ark_Supply_Base, 45, 450, 90, false, "Supply Base Ship"]					// 10
			];
		
			
//Check Construction Requirements met			
for(var i = 0; i < instance_number(Ark_Refinery); i++)
{
	if(instance_find(Ark_Refinery, i).faction_number == faction_number)
	{
		unitData[0, 4] = true; // Fighter Bay
		unitData[3, 4] = true; // Shipyard
	}
}

for(var i = 0; i < instance_number(Ark_Shipyard_Light); i++)
{
	if(instance_find(Ark_Shipyard_Light, i).faction_number == faction_number)
	{
		unitData[4, 4] = true; // Capital Docks
		unitData[6, 4] = true; // Heavy Generator
		unitData[7, 4] = true; // Tech Lab
	}
}

for(var i = 0; i < instance_number(Ark_Fighter_Bay); i++)
{
	if(instance_find(Ark_Fighter_Bay, i).faction_number == faction_number)
	{
		unitData[5, 4] = true; // Facility
		unitData[6, 4] = true; // Heavy Generator
	}
}

for(var i = 0; i < instance_number(Ark_Capital_Docks); i++)
{
	if(instance_find(Ark_Capital_Docks, i).faction_number == faction_number)
	{
		unitData[8, 4] = true; // Experimental Centre
	}
}

for(var i = 0; i < instance_number(Ark_Heavy_Generator); i++)
{
	if(instance_find(Ark_Heavy_Generator, i).faction_number == faction_number)
	{
		unitData[9, 4] = true; // Arms Storage
	}
}

for(var i = 0; i < instance_number(Ark_Arms_Storage); i++)
{
	if(instance_find(Ark_Arms_Storage, i).faction_number == faction_number)
	{
		unitData[10, 4] = true; // Supply Base
	}
}

for(var i = 0; i < instance_number(Ark_Tech_Lab); i++)
{
	if(instance_find(Ark_Tech_Lab, i).faction_number == faction_number)
	{
		unitData[10, 4] = true; // Supply Base
	}
}

minimapIcon = icon_light_structure;

ds_list_clear(buttons);

ds_list_add(buttons, Ark_Produce_Power_Plant.id, Ark_Produce_Refinery.id, Ark_Produce_Fighter_Bay.id, Ark_Produce_Facility.id, Ark_Produce_Shipyard_Light.id, Ark_Produce_Capital_Docks.id, Ark_Produce_Heavy_Generator.id, Ark_Produce_TechLab.id, Ark_Produce_ExperimentalCentre.id,
			Ark_Produce_Arms_Storage.id, Ark_Produce_Supply_Base.id, Ark_Plan_Production.id, Ark_Plan_Construction.id, Ark_Plan_Extraction.id);

unPackTime = ds_list_create();

maxSprites = 6;

sprite = HQ;

selectSprite = HQ_Select;

rally_x = x + 500;

rally_y = y;

productionName = ds_list_create();

planEnergy = 25;

multipliers = [2, 2, 2];