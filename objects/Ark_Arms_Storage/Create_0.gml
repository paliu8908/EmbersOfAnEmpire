/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

/*		0			1					2				3				4				5	     6			7			8
	<Research>, <production amount>, <metal price>, <energy price>	<Research Name>	<Sprite> <Available> <Icon>	<Unit Affected>
*/


unitData = [
			[95, 25, 100, 50, "Build EMP Missile", icon_Ark_EMP_Build, true, com_button_ability1.id, self],
			[100, 25, 100, 50, "Build Plasma Missile", Icon_Ark_Plasma_Build, true, com_button_ability2.id, self],
			[105, 25, 100, 50, "Build Anti Shield Missile", icon_Ark_AntiShield_Build, true, com_button_ability3.id, self],
			[110, 25, 100, 50, "Build Slow Missile", Icon_Ark_Slow_Build, true, com_button_ability4.id, self]
			];

baseData = variable_clone(unitData);

//Enable Ships
for(var i = 0; i < instance_number(Ark_Capital_Docks); i++)
{
	if(instance_find(Ark_Capital_Docks, i).faction_number == faction_number)
	{
		Ark_Capital_Docks.unitData[1, 6] = true;
	}
}
			
minimapIcon = icon_light_structure;

ds_list_clear(buttons);
ds_list_add(buttons, com_button_ability1.id, com_button_ability2.id, com_button_ability3.id, com_button_ability4.id, 
	com_button_ability5.id, com_button_ability6.id, com_button_ability7.id, com_button_ability8.id)

maxSprites = 1;

sprite = Arms_Storage;

selectSprite = Arms_Storage_Select;

rally_x = x + 75;

rally_y = y;

abilities = [

			[Ark_Kepler_EMP_Missile, "AmmoSplashMissile", 60 * 45, 0, false, false, icon_Ark_EMP, 15, 2000, true],
			[Ark_Kepler_Plasma_Missile, "AmmoSplashMissile", 60 * 45, 0, false, false, Icon_Ark_Plasma, 15, 2000, true],
			[Ark_Kepler_AntiShield, "AmmoSplashMissile", 60 * 45, 0, false, false, icon_Ark_AntiShield, 15, 2000, true],
			[Ark_Kepler_SlowField, "AmmoSplashMissile", 60 * 45, 0, false, false, Icon_Ark_Slow, 15, 2000, true]
			
			];

		//		weapon	type	reload	counter	deploys recharged sprite  duration range available
		//			0	  1			2		3	   4		5		6		7		8		9
		
ammo = []

storage = 3