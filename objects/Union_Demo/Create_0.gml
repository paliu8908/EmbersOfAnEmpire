/// @description Insert description here
// You can write your code in this editor
global.battlegroup1 = ds_list_create(); 
global.battlegroup2 = ds_list_create(); 

if_atk = false;

atkChance = 0;

frames = 30;

timePassed = -3 * 30 * frames;
sec_per_min = 60;

spawn_units = ds_list_create();

spawn_units_wave2 = ds_list_create();

spawn_units_wave3 = ds_list_create();

spawn_units_wave4 = ds_list_create();

waveTimes = 1;

ds_list_add(spawn_units, Prox_Sword_Fighter, Prox_Sword_Fighter, Prox_Sword_Fighter);

ds_list_add(spawn_units_wave3, Prox_Arrow_Bomber, Prox_Arrow_Bomber);

ds_list_add(spawn_units_wave2, Prox_Ambition_3Rate, Prox_Reaper_3Rate);

ds_list_add(spawn_units_wave4, Prox_Catalyst_Raider, Prox_Catalyst_Raider);