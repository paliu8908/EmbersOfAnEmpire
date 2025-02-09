/// @description Insert description here
// You can write your code in this editor

if(other.faction_number != faction_number && string_ends_with(other.type, "ship"))
{
	damage += other.block * bonusMultiplier;
}

// Inherit the parent event
event_inherited();

