if(other.faction_number != faction_number)
{

	other.shieldHealth = 0;
	
	var _ex = instance_create_layer(x, y, "instances", explodeType);
		
	_ex.image_xscale = scaleUp;
	_ex.image_yscale = scaleUp;
		
	instance_destroy();
}