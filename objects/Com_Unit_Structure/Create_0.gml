/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

if(canResearch || canProduce)
{
	production = ds_list_create();
	productionAmount = ds_list_create();

	fullProduction = ds_list_create();
	energyProduction = ds_list_create();
}

if(canResearch)
{
	unitAffected = ds_list_create();
}

unitData = [];

/*
	<unit>, <production amount>, <metal price>, <energy price>
*/

ds_list_replace(global.energy, faction_number, ds_list_find_value(global.energy, faction_number) + energyProvided);
ds_list_insert(global.energyUsed, faction_number, ds_list_find_value(global.energyUsed, faction_number) + energyExpended);

show = 0; 

if(energyExpended > 0)
{

	blurb += "Expends " + string(energyExpended) + " Energy";
}
else if(energyProvided > 0)
{

	blurb += "Provides " + string(energyProvided) + " Energy";
}

/*
rechargeRate = 10;

shieldHealth = 200;

maxShield = shieldHealth;

shieldReduction = 1;

rechargeCounter = 0;

hasShield = true;

shieldSpriteRadius = 200;

shieldWidth = sprite_width + 500;

shieldHeight = sprite_height + 500;

shieldSprite = Shield;*/