global.factions = ds_list_create();

ds_list_add(global.factions, "player", "ai");

global.metal = ds_list_create();

global.energy = ds_list_create();

global.energyUsed = ds_list_create();

global.plans = ds_list_create()

ds_list_add(global.metal, 5000, 250);

ds_list_add(global.energy, 0, 0);

ds_list_add(global.energyUsed, 0, 0);

ds_list_add(global.plans, "none", "none");

//Upgrades;

global.upgrades = [];

for(var i = 0; i < 2; i++)
{
	for(var u = 0; u < 48; u++)
	{
		//0 = not researched, 2 being researched, 1 complete
		global.upgrades[i, u] = 0;
	}
}

global.combatData = [];

for(var i = 0; i < 2; i++)
{
	for(var u = 0; u < 17; u++)
	{
		//0 = not researched, 2 being researched, 1 complete
		global.combatData[i, u] = 0;
	}
}

global.upgrades[0, 39] = 1;
global.upgrades[0, 40] = 1;
global.upgrades[0, 41] = 1;

// 0 -Beta, 1 - Omega, 2 - Sigma, 3 - Zeta, -> Facility
// 4 - Corot, 5 - Luten, 6 - Gliese, 7 - Mancri, -> Tech Lab
// 8 - Ross	9 - Eridani 10 - Neegarden 11 - Xi  -> Heavy Generator
// 12 - Tau Ceti, 13 - Kepler, 14 - Hapten, 16 - Dappist -> Experimental Centre

var ui = instance_create_layer(2100, 1224, "instances", UI_Back);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(-100, 0, "instances", com_button_atk);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(-100, 0, "instances", com_button_move);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(-100, 0, "instances", com_button_stop);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(2000, 1224, "instances", com_button_dash);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(2000, 1224, "instances", com_button_deploy);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(2000, 1224, "instances", com_button_ability1);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(2000, 1224, "instances", com_button_ability2);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(2000, 1224, "instances", com_button_ability3);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(2000, 1224, "instances", com_button_ability4);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(2000, 1224, "instances", com_button_ability5);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(2000, 1224, "instances", com_button_ability6);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(2000, 1224, "instances", com_button_ability7);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(2000, 1224, "instances", com_button_ability8);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(2000, 1224, "instances", com_button_ability9);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(2000, 1224, "instances", com_button_ability10);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(2000, 1224, "instances", com_button_ability11);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(2000, 1224, "instances", com_button_ability12);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(2000, 1224, "instances", com_button_patrol);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(2000, 1224, "instances", com_button_swap);

ui.faction_number = ds_list_find_index(global.factions, "player");

var cursor =  instance_create_layer(0, 0, "instances", obj_cursor);

cursor.faction_number = ds_list_find_index(global.factions, "player");

//Unit Production

var ui = instance_create_layer(-100, 0, "instances", Ark_Produce_Fighter_Bay);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(-100, 0, "instances", Ark_Produce_Power_Plant);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(-100, 0, "instances", Ark_Produce_Refinery);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(-100, 0, "instances", Ark_Produce_Shipyard_Light);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(-100, 0, "instances", Ark_Produce_Capital_Docks);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(-100, 0, "instances", Ark_Produce_Facility);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(-100, 0, "instances", Ark_Produce_Heavy_Generator);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(-100, 0, "instances", Ark_Produce_TechLab);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(-100, 0, "instances", Ark_Produce_ExperimentalCentre);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(-100, 0, "instances", Ark_Produce_Arms_Storage);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(-100, 0, "instances", Ark_Produce_Supply_Base);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(-100, 0, "instances", Ark_Plan_Production);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(-100, 0, "instances", Ark_Plan_Construction);

ui.faction_number = ds_list_find_index(global.factions, "player");

var ui = instance_create_layer(-100, 0, "instances", Ark_Plan_Extraction);

ui.faction_number = ds_list_find_index(global.factions, "player");

if(ds_list_find_index(global.factions, "player") == 0)
{
	draw_set_font(Arkeyevich);
}

//Union
for(var a = 0; a < 4; a++)
{
	var mate = instance_create_layer(1000 + a%4 * 75, 1000 + 100 * floor(a/4), "instances", Ark_Gliese_Destroyer);
	mate.faction_number = ds_list_find_index(global.factions, "player");
	
}

global.battlegroup1 = ds_list_create()
global.battlegroup2 = ds_list_create()

for(var e = 0; e < 16; e++)
{
	var _uni = instance_create_layer(0 -  e % 4 * 100, room_height/2 -  100* floor(e/4), "instances", Prox_Sword_Fighter);
	
	_uni.faction_number = ds_list_find_index(global.factions, "ai");
	
	//ds_list_add(global.battlegroup1, _uni);
	
	
	_uni.target = Ark_Gliese_Destroyer.id;
				
	_uni.atkOrder = true;
				
	_uni.if_move = 3;

}
	
//instance_create_layer(0, 0, "instances", com_ai);


//spawn asteroid elements
for(var a = 0; a < 50; a++)
{
	randomize();
	
	var asteroidsNum = random_range(0, 20);
	var regionXMin = random_range(0, room_width - 20*asteroidsNum);
	var regionXMax = random_range(0, asteroidsNum*20);
	var regionYMin = random_range(0, room_height - 20*asteroidsNum);
	var regionYMax = random_range(0, asteroidsNum*20);
	
	/*for(var s = 0; s < asteroidsNum; s++)
	{
		instance_create_layer(random_range(regionXMin, regionXMin+regionXMax), random_range(regionYMin, regionYMin+regionYMax), "instances", com_asteroid_small);
	}*/
	
	if(a % 5 == 0)
	{
		instance_create_layer(random_range(regionXMin, regionXMin+regionXMax), random_range(regionYMin, regionYMin+regionYMax), "instances", com_asteroid_large);
	
	}
	
	else
	{
	
		var regionRadius = random_range(0, 200);
	
		for(var s = 0; s < asteroidsNum; s++)
		{
			var angle = random_range(0, 360);
			var rad = random_range(0, regionRadius);
		
			var x_coord = rad * cos(degtorad(angle));
			var y_coord = rad * sin(degtorad(angle));
		
			instance_create_layer(regionXMin + x_coord, regionYMin + y_coord, "instances", com_asteroid_small);
		}	
	}
}



//instance_create_layer(0, 0, "instances", MusicPlayer);