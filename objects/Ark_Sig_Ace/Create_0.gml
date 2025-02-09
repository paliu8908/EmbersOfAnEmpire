 /// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

selectSprite = Sigma_Ace_Select;

maxSprites = 4;

weapon = Ark_Sig_Phosphor;

sprite = Sigma_Ace;

dmgReduction = 1;

p_num = random_range(0, 3);

//shields

rechargeRate = 1;

shieldHealth = 0;

maxShield = 10;

shieldReduction = 1;

rechargeCounter = 0;

shieldSpriteRadius = 556;

shieldWidth = sprite_width + 10;

shieldHeight = sprite_height + 10;

shieldSprite = AlternateShield;

if(global.upgrades[faction_number][6] == 1)
{
	range += 50;
}

if(global.upgrades[faction_number][8] == 1)
{
	hasShield = true;
}