if(other.faction_number != faction_number && ds_list_find_index(hasDamaged, other) == -1)
{
	
	ds_list_add(hasDamaged, other);
	DealDamageLaser(self, other);
}