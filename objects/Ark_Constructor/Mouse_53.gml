/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(collision_circle(mouse_x, mouse_y, 20, com_button_unpack, false, false) && ds_list_find_index(global.selection, self.id) != -1 && canUnpack)
{
	if_move = 0;
	
	unpacking = true;
	
	if_shoot = false;
		
	if_move = 5;
	
	speed = 0;
	
	ds_list_clear(moveXList);
	ds_list_clear(moveYList);
	
	move_speed = 0;
	
	if(produced_structure == Ark_Fighter_Bay)
	{  
		sprite = FighterDock;
		
		selectSprite = FighterDockSelect;
	}
	
	else if(produced_structure == Ark_Power_Plant)
	{
		sprite = PowerPlant;
		
		selectSprite = PowerPlantSelect;
	}

	else if(produced_structure == Ark_Refinery)
	{
		sprite = Refinery;
		
		selectSprite = Refinery_Select;
	}
	
	else if(produced_structure == Ark_Shipyard_Light)
	{
		sprite = Shipyard_Light;
		
		selectSprite = Shipyard_Light_Select;
	}
	
	else if(produced_structure == Ark_Capital_Docks)
	{
		sprite = Capital_Docks;
		
		selectSprite = Capital_Docks_Select;
	}
	
	else if(produced_structure == Ark_Facility)
	{
		sprite = ResearchFacility;
		
		selectSprite = ResearchFacility_Select;
	}
	
	else if(produced_structure == Ark_Heavy_Generator)
	{
		sprite = AdvancedPowerPlant;
		
		selectSprite = AdvancedPowerPlant_Select;
	}
	else if(produced_structure == Ark_Tech_Lab)
	{
		sprite = TechLab;
		
		selectSprite = TechLab_Select;
	}
	else if(produced_structure == Ark_Experimental_Centre)
	{
		sprite = ExperimentalCentre;
		
		selectSprite = ExperimentalCentre_Select;
	}
	else if(produced_structure == Ark_Arms_Storage)
	{
		sprite = Arms_Storage;
		
		selectSprite = Arms_Storage_Select;
	}
	else if(produced_structure == Ark_Supply_Base)
	{
		sprite = ResupplyCentre;
		
		selectSprite = ResupplyCentre_Select;
	}
	
	acceleration = 0;
}