/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if(if_ready = false && instance_exists(owner))
{
	/*
	target = owner.target;
	
	if_ready = true;
	
	faction_number = owner.faction_number;*/
	
	image_angle = direction;

}
else if(!instance_exists(owner))
{
	instance_destroy();
}

if(if_ready)
{
	direction = owner.direction - 90;

	ty1 = -sqrt(sqr(rect[0])+sqr(rect[1])) * sin(degtorad((darctan2(rect[0], rect[1]) + direction)));
	tx1 = sqrt(sqr(rect[0])+sqr(rect[1])) * cos(degtorad((darctan2(rect[0], rect[1]) + direction)));

	ty2 = -sqrt(sqr(rect[3])+sqr(rect[4])) * sin(degtorad((darctan2(rect[3], rect[4]) + direction)));
	tx2 = sqrt(sqr(rect[3])+sqr(rect[4])) * cos(degtorad((darctan2(rect[3], rect[4]) + direction)));

	ty3 = -sqrt(sqr(rect[3])+sqr(rect[1])) * sin(degtorad((darctan2(rect[3], rect[1]) + direction)));
	tx3 = sqrt(sqr(rect[3])+sqr(rect[1])) * cos(degtorad((darctan2(rect[3], rect[1]) + direction)));

	ty4 = -sqrt(sqr(rect[0])+sqr(rect[2])) * sin(degtorad((darctan2(rect[0], rect[2]) + direction)));
	tx4 = sqrt(sqr(rect[0])+sqr(rect[2])) * cos(degtorad((darctan2(rect[0], rect[2]) + direction)));

	ty5 = -sqrt(sqr(rect[3])+sqr(rect[2])) * sin(degtorad((darctan2(rect[3], rect[2]) + direction)));
	tx5 = sqrt(sqr(rect[3])+sqr(rect[2])) * cos(degtorad((darctan2(rect[3], rect[2]) + direction)));

	ty6 = -sqrt(sqr(rect[3])+sqr(rect[5])) * sin(degtorad((darctan2(rect[3], rect[5]) + direction)));
	tx6 = sqrt(sqr(rect[3])+sqr(rect[5])) * cos(degtorad((darctan2(rect[3], rect[5]) + direction)));	
	
	if(dmgCounter == 0)
	{
		dmgCounter = floor(damageTime* 60);
		
		for(var i = 0; i < instance_number(com_unit); i++)
		{
			var _unit = instance_find(com_unit, i);
			
			if(instance_exists(_unit) && _unit.faction_number != faction_number && point_in_triangle(_unit.x, _unit.y, owner.x + tx1, owner.y + ty1, owner.x + tx2, owner.y + ty2, owner.x + tx3, owner.y + ty3))
			{
				if(_unit.type != "asteroid" && !if_affected(_unit.effects, "TauCeti"))
				{
			
					array_insert(_unit.effects, 0, ["TauCetiArmourReduce", (damageTime + 2) * 60, -1]);
					_unit.block--;
				}
				
				DealDamageLaser(self, _unit)
			}
			
			else if(_unit.faction_number != faction_number && point_in_triangle(_unit.x, _unit.y, owner.x + tx1, owner.y + ty1, owner.x + tx3, owner.y + ty3, owner.x + tx4, owner.y + ty4))
			{
				if(!if_affected(_unit.effects, "TauCeti") && _unit.type != "asteroid")
				{
			
					array_insert(_unit.effects, 0, ["TauCetiArmourReduce", (damageTime + 2) * 60, -1]);
					_unit.block--;
				}
				
				DealDamageLaser(self, _unit)
			}
			
			else if(_unit.faction_number != faction_number && point_in_triangle(_unit.x, _unit.y, owner.x + tx3, owner.y + ty3, owner.x + tx4, owner.y + ty4, owner.x + tx5, owner.y + ty5))
			{
				if(!if_affected(_unit.effects, "TauCeti") && _unit.type != "asteroid")
				{
			
					array_insert(_unit.effects, 0, ["TauCetiArmourReduce", (damageTime + 2) * 60, -1]);
					_unit.block--;
				}
				
				DealDamageLaser(self, _unit)
			}
			
			else if(instance_exists(_unit) && _unit.faction_number != faction_number && point_in_triangle(_unit.x, _unit.y, owner.x + tx5, owner.y + ty5, owner.x + tx6, owner.y + ty6, owner.x + tx4, owner.y + ty4))
			{
				if(!if_affected(_unit.effects, "TauCeti") && _unit.type != "asteroid")
				{
			
					array_insert(_unit.effects, 0, ["TauCetiArmourReduce", (damageTime + 2) * 60, -1]);
					_unit.block--;
				}
				
				DealDamageLaser(self, _unit)
			}
		}
		
	}
	
	if(timeAlive >= existingTime* 60)
	{
		instance_destroy();
	}
	
	timeAlive++;
	
	dmgCounter--;
}