/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

event_inherited();

if(hp >= 0 && unpacking)
{
	if_move = 7;
	
	speed = 0;
	
	direction = 0;
	
	image_angle = direction;
	
	if(ds_list_find_value(global.plans, faction_number) == "construction")
	{
		producedTime -= producedSpeed * Ark_HQ.multipliers[0];
		
	}
	else
	{
		producedTime -= producedSpeed;
		
	}
	
	
	
	if(producedTime <= 0)
	{
		var _struct = instance_create_layer(x, y, "instances", produced_structure);
		
		_struct.faction_number = faction_number
		
		if(_struct.canProduce && ds_list_find_value(global.plans, faction_number) == "production")
		{
			_struct.productionSpeed *= Ark_HQ.multipliers[0]
		}
		
		instance_destroy();
	}
}
 
if(collision_circle(x, y, max(sprite_height, sprite_width) div 2, Com_Unit_Structure, false, false))
{
	canUnpack = false;
	
	if(ds_list_find_index(global.selection, self.id) != -1)
	{
		com_button_unpack.if_able = false;
	}
}

else if(collision_circle(x, y, max(sprite_height, sprite_width) div 2, Ark_Constructor, false, true))
{
	canUnpack = false;
	
	if(ds_list_find_index(global.selection, self.id) != -1)
	{
		com_button_unpack.if_able = false;
	}
}

else if(produced_structure == Ark_Refinery && collision_circle(x, y, 500, com_asteroid, false, false))
{
	canUnpack = false;
	
	if(ds_list_find_index(global.selection, self.id) != -1)
	{
		com_button_unpack.if_able = false;
	}
}

else
{
	canUnpack = true;
	
	if(ds_list_find_index(global.selection, self.id) != -1)
	{
		com_button_unpack.if_able = true;
	}
}
