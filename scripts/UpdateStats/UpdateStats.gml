// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UpdateStats(upgrade, unitaffected, _faction_number){
	//Arkeyevich
	if(_faction_number == 0)
	{
		//Secondary Generators
		if(upgrade == 0)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.stunResist = 1.5;
				}
			}
		}
		
		//Damage Increase, not relevant to units
		/*else if(upgrade == 1)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.damage++;
				}
			}
		}*/
		
		//Navigational Thrusters
		else if(upgrade == 2)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.turnRate += 5;
					_unit.move_speed += 0.25;
				}
			}
		}
		//Heavier Payloads
		/*else if(upgrade == 3)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.damage++;
				}
			}
		}*/
		//Streamlined Igniters
		else if(upgrade == 4)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.move_speed += 1;
				}
			}
		}
		//Missile Boosters
		else if(upgrade == 5)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.range += 100;
				}
			}
		}
		//Enhanced Exciters
		else if(upgrade == 6)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.range += 50;
				}
			}
		}
		//Optic Resonators
		/*else if(upgrade == 7)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.damage += 0.25;
				}
			}
		}*/
		
		//Personal Shielding
		else if(upgrade == 8)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.hasShield = true;
				}
			}
		}
		
		//Weak Force Modulators
		else if(upgrade == 9)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.range += 500;
				}
			}
		}
		
		//Platform Shielding
		else if(upgrade == 10)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.hasShield = true;
				}
			}
		}
		//Turret Rotators
		else if(upgrade == 11)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.turretTurnAngle = 60;
				}
			}
		}
		
		//Jet Engines
		
		else if(upgrade == 12)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.move_speed += 2.5;
				}
			}
		}
		
		//Heavier Plating
		
		else if(upgrade == 13)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.block += 1;
				}
			}
		}
		
		//Missile Pods
		
		else if(upgrade == 14)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					array_insert( _unit.main_weapon_list, 0, 
					[Ark_Corot_Missile, 300, 180, 90, 2, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, -45, -12, 0]
					)
					
					array_insert( _unit.main_weapon_list, 0, 
					[Ark_Corot_Missile, 300, 180, 90, 2, 0, 1, 0, 0, 0, 0, false, 0, 0, 0, 45, -12, 0]
					)
				}
			}
		}
		
		//Structural Destablizers
		//Enables bonuses, does not affect the unit directly. 
		/*
		else if(upgrade == 15)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.bonus = "ship"
				}
			}
		}*/
		
		//Torpedo Boosters
		//Increases missile speed, so has no affect on the ships directly.
		/*
		else if(upgrade == 16)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					
				}
			}
		}*/
		
		//Refined Fuel
		
		else if(upgrade == 17)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.move_speed += 1;
				}
			}
		}
		
		//Focus Beams
		else if(upgrade == 18)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.canSwap = true;
				}
			}
		}
		
		//Long Range Projectors
		else if(upgrade == 19)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					for(var _w = 0; _w < array_length(_unit.multiShot); _w++)
					{
						_unit.multiShot[_w, 1] += 100; 
					}
					
					for(var _w = 0; _w < array_length(_unit.focusWeapons); _w++)
					{
						_unit.focusWeapons[_w, 1] += 200; 
					}
					
					if(_unit.focusShot)
					{
						_unit.main_weapon_list = _unit.focusWeapons;
					}
					else
					{
						_unit.main_weapon_list = _unit.multiShot;
					}
				}
			}
		}
		
		//Enhanced Engines
		else if(upgrade == 20)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.move_speed += 1.5;
				}
			}
		}
		
		//Force Dispersers
		else if(upgrade == 21)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.dmgReduction = 0.75;
				}
			}
		}
		
		//Ion Stablizers
		else if(upgrade == 22)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					for(var _w = 0; _w < array_length(_unit.main_weapon_list); _w++)
					{
						_unit.main_weapon_list[_w, 1] += 200; 
					}
				}
			}
		}
		
		//Stronger Shield
		else if(upgrade == 23)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.maxShield += 25;
					_unit.shieldReduction = 0.75;
					_unit.rechargeRate += 1;
				}
			}
		}
		
		//Railgun Accelerators
		else if(upgrade == 24)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					for(var _w = 0; _w < array_length(_unit.longShot); _w++)
					{
						_unit.longShot[_w, 4] -= 2; 
					}
					
					for(var _w = 0; _w < array_length(_unit.fastShot); _w++)
					{
						_unit.fastShot[_w, 1] = 0.1; 
					}
					
					if(_unit.slowShot)
					{
						_unit.main_weapon_list = _unit.longShot;
					}
					else
					{
						_unit.main_weapon_list = _unit.fastShot;
					}
				}
			}
		}
		
		//Shield Generator
		else if(upgrade == 25)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.hasShield = true;
				}
			}
		}
		
		//Superior Engines
		else if(upgrade == 26)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.move_speed += 0.6;
				}
			}
		}
		
		//Heavier Plating
		else if(upgrade == 27)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.block += 2;
				}
			}
		}
		
		//Energy Shielding
		else if(upgrade == 28)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.hasShield = true;
				}
			}
		}
		
		//Self-Repair Systems
		else if(upgrade == 29)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.self_repair = true;
				}
			}
		}
		
		//Enhanced Lasers
		else if(upgrade == 31)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					for(var _w = 0; _w < array_length(_unit.main_weapon_list); _w++)
					{
						_unit.main_weapon_list[_w, 1] += 500; 
					}
				}
			}
		}
		
		//Jet Boosters
		else if(upgrade == 32)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.move_speed += 2;
				}
			}
		}
		
		//Energy Shields
		else if(upgrade == 33)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.hasShield = true;
				}
			}
		}
		
		//Disruption Field
		else if(upgrade == 36)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.abilities[0, 14] = true;
				}
			}
		}
		
		//Nuclear Generators -> No changes since it affects only the weapon
		
		//Long-Range Projectors
		else if(upgrade == 38)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					for(var _w = 0; _w < array_length(_unit.main_weapon_list); _w++)
					{
						_unit.main_weapon_list[_w, 1] += 700; 
					}
				}
			}
		}
		
		//Decimating Barrage
		else if(upgrade == 39)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.abilities[0, 12] = true;
				}
			}
		}
		
		//Creeping Barrage
		else if(upgrade == 40)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.abilities[1, 12] = true;
				}
			}
		}
		
		//Concetrated Barrage
		else if(upgrade == 41)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.abilities[2, 12] = true;
				}
			}
		}
		
		//Particle Stablizers
		else if(upgrade == 42)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					for(var _w = 0; _w < array_length(_unit.main_weapon_list); _w++)
					{
						_unit.main_weapon_list[_w, 1] += 300; 
					}
				}
			}
		}
		
		//Strong Force Dampners 43 -> Improves effects, no affect on the units
		
		//Rocket Boosters
		else if(upgrade == 44)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					_unit.move_speed += 1;
				}
			}
		}
		
		
		
		//Build EMP Missile
		else if(upgrade == 95)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					array_insert(_unit.ammo, 0, Ark_Kepler_EMP_Missile)
					_unit.abilities[0, 5] = true
					_unit.abilities[0, 9] = true
					
					if(array_length(_unit.ammo) >= _unit.storage)
					{
						for(var i = 0; i < array_length(_unit.unitData); i++)
						{
							_unit.unitData[i, 6] = false
						}
					}
					else
					{
						_unit.unitData[0, 6] = true
					}
					
				}
			}
		}
		
		//Build Plasma Missile
		else if(upgrade == 100)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					array_insert(_unit.ammo, 0, Ark_Kepler_Plasma_Missile)
					_unit.abilities[1, 5] = true
					_unit.abilities[1, 9] = true
					
					if(array_length(_unit.ammo) >= _unit.storage)
					{
						for(var i = 0; i < array_length(_unit.unitData); i++)
						{
							_unit.unitData[i, 6] = false
						}
					}
					else
					{
						_unit.unitData[1, 6] = true
					}
					
				}
			}
		}
		
		//Build AntiShield Missile
		else if(upgrade == 105)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					array_insert(_unit.ammo, 0, Ark_Kepler_AntiShield)
					_unit.abilities[2, 5] = true
					_unit.abilities[2, 9] = true
					
					if(array_length(_unit.ammo) >= _unit.storage)
					{
						for(var i = 0; i < array_length(_unit.unitData); i++)
						{
							_unit.unitData[i, 6] = false
						}
					}
					else
					{
						_unit.unitData[2, 6] = true
					}
					
				}
			}
		}
		
		//Build Slow Missile
		else if(upgrade == 110)
		{
			for(var _u = 0; _u < instance_number(unitaffected); _u++)
			{
				var _unit = instance_find(unitaffected, _u);
				
				if(_unit.faction_number == _faction_number)
				{
					array_insert(_unit.ammo, 0, Ark_Kepler_SlowField)
					_unit.abilities[3, 5] = true
					_unit.abilities[3, 9] = true
					
					if(array_length(_unit.ammo) >= _unit.storage)
					{
						for(var i = 0; i < array_length(_unit.unitData); i++)
						{
							_unit.unitData[i, 6] = false
						}
					}
					else
					{
						_unit.unitData[3, 6] = true
					}
					
				}
			}
		}
	}
}