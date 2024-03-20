// "Afraid of the Dark" Minecraft modpack, by Retinite.
// 
// This file adds a variety of crossover recipes, usually to Mekanism machines.

import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.ingredient.type.IIngredientEmpty;
import crafttweaker.api.recipe.MirrorAxis;

function addBookRecipe(modid as string, enchant as string, specialIngredient as IIngredient, cost as int) as void {
var dust_corners as IIngredient;
var dust_center as IIngredient;
if(cost != 2) {
	dust_center = <item:apotheosis:gem_dust>;
} else {
	dust_center = IIngredientEmpty.getInstance();
}
if(cost > 1) {
	dust_corners = <item:apotheosis:gem_dust>;
} else {
	dust_corners = IIngredientEmpty.getInstance();
}
craftingTable.addShaped("aotd." + enchant + "_book", <item:minecraft:enchanted_book>.withTag({StoredEnchantments:[{id:modid + ":" + enchant,lvl:1 as short}]}),
	[[dust_corners, specialIngredient.anyDamage(),     dust_corners],
	 [dust_center,  <item:minecraft:book>,             dust_center],
	 [dust_corners, specialIngredient.anyDamage(),     dust_corners]]);
}
function addBookRecipe2(modid as string, enchant as string, specialIngredient1 as IIngredient, specialIngredient2 as IIngredient, cost as int) as void {
var dust_corners as IIngredient;
var dust_center as IIngredient;
if(cost != 2) {
	dust_center = <item:apotheosis:gem_dust>;
} else {
	dust_center = IIngredientEmpty.getInstance();
}
if(cost > 1) {
	dust_corners = <item:apotheosis:gem_dust>;
} else {
	dust_corners = IIngredientEmpty.getInstance();
}
craftingTable.addShaped("aotd." + enchant + "_book", <item:minecraft:enchanted_book>.withTag({StoredEnchantments:[{id:modid + ":" + enchant,lvl:1 as short}]}),
	[[dust_corners, specialIngredient1.anyDamage(),    dust_corners],
	 [dust_center,  <item:minecraft:book>,             dust_center],
	 [dust_corners, specialIngredient2.anyDamage(),    dust_corners]]);
}

// Enchantment Recipes ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// general enchantments
addBookRecipe("minecraft", "unbreaking", <item:mekanism:ingot_steel>, 1);
addBookRecipe2("minecraft", "mending", <item:minecraft:anvil>, <item:apotheosis:mythic_material>, 3);
addBookRecipe2("minecraft", "vanishing_curse", IIngredientEmpty.getInstance(), <item:apotheosis:uncommon_material>, 3);
addBookRecipe2("undead_unleashed", "undertaker", <item:minecraft:iron_shovel>, <item:minecraft:dirt>, 1);
addBookRecipe2("unusualend", "everlasting", <item:minecraft:clock>, <item:apotheosis:rare_material>, 3);
addBookRecipe("unusualend", "boloks_fury", <item:minecraft:iron_axe>, 3);
addBookRecipe2("apotheosis", "life_mending", <item:minecraft:ghast_tear>, <item:minecraft:sponge>, 2);

// armor enchantments
addBookRecipe2("minecraft", "protection", <item:minecraft:chainmail_chestplate>, <item:minecraft:shield>, 2);
addBookRecipe2("minecraft", "fire_protection", <item:minecraft:flint_and_steel>, <item:minecraft:shield>, 2);
addBookRecipe2("minecraft", "blast_protection", <item:minecraft:tnt>, <item:minecraft:shield>, 2);
addBookRecipe2("minecraft", "projectile_protection", <item:minecraft:arrow>, <item:minecraft:shield>, 2);
addBookRecipe2("apotheosis", "berserkers_fury", <item:minecraft:golden_sword>, <item:minecraft:glass>, 2);
addBookRecipe2("minecraft", "binding_curse", <item:minecraft:chain>, <item:apotheosis:rare_material>, 3);
addBookRecipe2("apotheosis", "icy_thorns", <item:minecraft:cactus>, <item:minecraft:blue_ice>, 2);
addBookRecipe2("apotheosis", "rebounding", <item:minecraft:slime_block>, <item:minecraft:chainmail_chestplate>, 2);
addBookRecipe("minecraft", "thorns", <item:minecraft:cactus>, 2);
addBookRecipe("minecraft", "respiration", <item:minecraft:glass_bottle>, 2);
addBookRecipe2("minecraft", "aqua_affinity", <item:minecraft:glass_bottle>, <item:apotheosis:epic_material>, 3);
addBookRecipe2("minecraft", "swift_sneak", <item:minecraft:sculk_sensor>, <item:deep_dark_regrowth:soul_of_the_depths>, 3);
addBookRecipe2("minecraft", "feather_falling", <item:minecraft:feather>, <item:minecraft:phantom_membrane>, 2);
addBookRecipe2("minecraft", "depth_strider", <item:minecraft:leather_boots>, <item:minecraft:water_bucket>, 2);
addBookRecipe("minecraft", "frost_walker", <item:minecraft:packed_ice>, 2);
addBookRecipe2("apotheosis", "stable_footing", <item:minecraft:scaffolding>, <item:apotheosis:epic_material>, 3);
addBookRecipe2("minecraft", "soul_speed", <item:minecraft:netherite_scrap>, <item:minecraft:soul_sand>, 2);

// generic weapon enchantments
addBookRecipe2("minecraft", "sharpness", <item:minecraft:stone_sword>, <item:minecraft:iron_sword>, 2);
addBookRecipe2("minecraft", "smite", <item:minecraft:glowstone_dust>, <item:minecraft:iron_sword>, 2);
addBookRecipe2("minecraft", "bane_of_arthropods", <item:minecraft:fermented_spider_eye>, <item:minecraft:iron_sword>, 2);
addBookRecipe2("minecraft", "knockback", <item:minecraft:piston>, <item:minecraft:iron_sword>, 1);
addBookRecipe2("minecraft", "fire_aspect", <item:minecraft:flint_and_steel>, <item:minecraft:iron_sword>, 3);
addBookRecipe2("minecraft", "sweeping", <item:minecraft:wheat>, <item:minecraft:stick>, 2);
addBookRecipe2("minecraft", "looting", <item:minecraft:emerald>, <item:minecraft:iron_sword>, 3);
addBookRecipe("apotheosis", "scavenger", <item:apotheosis:epic_material>, 3);
addBookRecipe("apotheosis", "knowledge", <item:minecraft:experience_bottle>, 2);
addBookRecipe2("apotheosis", "bane_of_illagers", <item:minecraft:emerald>, <item:minecraft:iron_axe>, 2);
addBookRecipe2("apotheosis", "capturing", <item:minecraft:egg>, <item:apotheosis:epic_material>, 3);

// trident enchantments
addBookRecipe("minecraft", "impaling", <tag:items:upgrade_aquatic:trident_tip>, 2);
addBookRecipe2("minecraft", "loyalty", <item:minecraft:fishing_rod>, <tag:items:aotdextras:trident_as_ingredient>, 2);
addBookRecipe2("minecraft", "riptide", <item:minecraft:rabbit_foot>, <item:minecraft:water_bucket>, 2);
addBookRecipe2("minecraft", "channeling", <item:minecraft:lightning_rod>, <tag:items:aotdextras:trident_as_ingredient>, 3);
addBookRecipe2("apotheosis", "spearfishing", <tag:items:aotdextras:raw_fish>, <tag:items:aotdextras:trident_as_ingredient>, 1);

// bow enchantments
addBookRecipe2("minecraft", "power", <item:minecraft:redstone_torch>, <item:minecraft:bow>, 2);
addBookRecipe2("minecraft", "punch", <item:minecraft:piston>, <item:minecraft:bow>, 2);
addBookRecipe2("minecraft", "flame", <item:minecraft:fire_charge>, <item:apotheosis:epic_material>, 3);
addBookRecipe2("minecraft", "infinity", <item:minecraft:spawner>, <item:apotheosis:epic_material>, 3);
addBookRecipe2("apotheosis", "endless_quiver", <item:minecraft:spawner>, <item:apotheosis:mythic_material>, 3);

// crossbow enchantments
addBookRecipe2("minecraft", "quick_charge", <item:minecraft:sugar>, <item:minecraft:crossbow>, 2);
addBookRecipe2("minecraft", "multishot", <item:minecraft:amethyst_cluster>, <item:apotheosis:epic_material>, 3);
addBookRecipe2("minecraft", "piercing", <item:minecraft:pointed_dripstone>, <item:minecraft:crossbow>, 1);
addBookRecipe2("apotheosis", "crescendo", <item:minecraft:repeater>, <item:minecraft:crossbow>, 3);

// tool enchantments
addBookRecipe2("minecraft", "efficiency", <item:minecraft:sugar>, <item:minecraft:iron_pickaxe>, 1);
addBookRecipe("minecraft", "fortune", <item:minecraft:diamond>, 3);
addBookRecipe("minecraft", "silk_touch", <item:minecraft:grass_block>, 3);
addBookRecipe("apotheosis", "miners_fervor", <item:minecraft:golden_pickaxe>, 1);
addBookRecipe2("apotheosis", "tempting", <item:minecraft:golden_carrot>, <item:minecraft:hay_block>, 3);
addBookRecipe2("apotheosis", "earths_boon", <tag:items:forge:ores_in_ground/stone>, <item:minecraft:stone>, 3);
addBookRecipe2("apotheosis", "chainsaw", <item:minecraft:golden_axe>, <item:apotheosis:epic_material>, 3);

// fishing rod enchantments
addBookRecipe2("minecraft", "lure", <item:minecraft:sugar>, <item:minecraft:fishing_rod>, 1);
addBookRecipe2("minecraft", "luck_of_the_sea", <item:minecraft:rabbit_foot>, <item:minecraft:fishing_rod>, 2);

// misc enchantments
addBookRecipe2("apotheosis", "shield_bash", <item:minecraft:iron_sword>, <item:minecraft:shield>, 2);
addBookRecipe2("apotheosis", "reflective", <item:minecraft:cactus>, <item:minecraft:shield>, 2);
addBookRecipe2("apotheosis", "splitting", <item:minecraft:chipped_anvil>, <item:apotheosis:epic_material>, 3);
addBookRecipe2("apotheosis", "natures_blessing", <item:minecraft:bone_meal>, <item:minecraft:golden_hoe>, 3);
addBookRecipe2("apotheosis", "obliteration", <item:minecraft:damaged_anvil>, <item:apotheosis:epic_material>, 3);
addBookRecipe2("apotheosis", "chromatic", <item:mekanism:dye_base>, <item:apotheosis:rare_material>, 3);
addBookRecipe2("apotheosis", "exploitation", <item:minecraft:shears>, <item:apotheosis:rare_material>, 3);
addBookRecipe2("apotheosis", "growth_serum", <item:minecraft:shears>, <item:apotheosis:epic_material>, 3);

// Apotheosis Gem Recipes ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function addGemRecipe3(input1 as IIngredient, input2 as IIngredient, input3 as IIngredient, gemType as string, rarityType as string) as void {
craftingTable.addShapedMirrored("aotd." + gemType, MirrorAxis.ALL, <item:apotheosis:gem>.withTag({gem:"apotheosis:" + gemType,rarity:rarityType}),
	[[input1.anyDamage(),             <item:apotheosis:gem_dust>, IIngredientEmpty.getInstance()],
	 [<item:apotheosis:gem_dust>,     input2.anyDamage(),         <item:apotheosis:gem_dust>],
	 [IIngredientEmpty.getInstance(), <item:apotheosis:gem_dust>, input3.anyDamage()]]);
}
function addGemRecipe4(input1 as IIngredient, input2 as IIngredient, input3 as IIngredient, input4 as IIngredient, gemType as string, rarityType as string) as void {
craftingTable.addShapedMirrored("aotd." + gemType, MirrorAxis.ALL, <item:apotheosis:gem>.withTag({gem:"apotheosis:" + gemType,rarity:rarityType}),
	[[input1.anyDamage(),         <item:apotheosis:gem_dust>,     input2.anyDamage()],
	 [<item:apotheosis:gem_dust>, IIngredientEmpty.getInstance(), <item:apotheosis:gem_dust>],
	 [input3.anyDamage(),         <item:apotheosis:gem_dust>,     input4.anyDamage()]]);
}
function addGemRecipe5(input1 as IIngredient, input2 as IIngredient, input3 as IIngredient, input4 as IIngredient, input5 as IIngredient, gemType as string, rarityType as string) as void {
craftingTable.addShapedMirrored("aotd." + gemType, MirrorAxis.ALL, <item:apotheosis:gem>.withTag({gem:"apotheosis:" + gemType,rarity:rarityType}),
	[[input1.anyDamage(),         <item:apotheosis:gem_dust>, input2.anyDamage()],
	 [<item:apotheosis:gem_dust>, input3.anyDamage(),         <item:apotheosis:gem_dust>],
	 [input4.anyDamage(),         <item:apotheosis:gem_dust>, input5.anyDamage()]]);
}

<recipetype:mekanism:crushing>.addRecipe("aotd_crusher_gem_dust", <item:apotheosis:gem>, <item:apotheosis:gem_dust>);

var helmets = <item:minecraft:leather_helmet>;
var chestplates = <item:minecraft:leather_chestplate>;
var leggings = <item:minecraft:leather_leggings>;
var boots = <item:minecraft:leather_boots>;
var light_weapons = <item:minecraft:stone_sword>;
var heavy_weapons = <item:minecraft:stone_axe>;
var pickaxes = <item:minecraft:stone_pickaxe>;
var shields = <item:minecraft:shield>;
var ranged_weapons = <item:minecraft:bow>;

addGemRecipe4(light_weapons, heavy_weapons, <tag:items:aotdextras:mining_tool_example>, <tag:items:aotdextras:core_armor_example>, "core/ballast", "common");
addGemRecipe4(light_weapons, <tag:items:aotdextras:core_armor_example>, heavy_weapons, shields, "core/brawlers", "common");
addGemRecipe4(light_weapons, heavy_weapons, <tag:items:aotdextras:mining_tool_example>, ranged_weapons, "core/breach", "common");
addGemRecipe3(ranged_weapons, <tag:items:aotdextras:core_armor_example>, <tag:items:aotdextras:melee_weapon_example>, "core/combatant", "common");
addGemRecipe4(<tag:items:aotdextras:core_armor_example>, light_weapons, heavy_weapons, shields, "core/guardian", "common");
addGemRecipe3(ranged_weapons, <tag:items:aotdextras:mining_tool_example>, <tag:items:aotdextras:lower_armor_example>, "core/lightning", "common");
addGemRecipe3(light_weapons, <tag:items:aotdextras:core_armor_example>, boots, "core/lunar", "common");
addGemRecipe5(<tag:items:aotdextras:light_and_ranged_example>, heavy_weapons, <tag:items:aotdextras:lower_armor_example>, helmets, shields, "core/samurai", "common");
addGemRecipe3(ranged_weapons, <tag:items:aotdextras:mining_tool_example>, boots, "core/slipstream", "common");
addGemRecipe3(light_weapons, <tag:items:aotdextras:core_armor_example>, boots, "core/solar", "common");
addGemRecipe3(<tag:items:aotdextras:core_armor_example>, <tag:items:aotdextras:tool_example>, boots, "core/splendor", "common");
addGemRecipe4(heavy_weapons, light_weapons, <tag:items:aotdextras:core_armor_example>, shields, "core/tyrannical", "common");
addGemRecipe4(<tag:items:aotdextras:light_and_ranged_example>, heavy_weapons, chestplates, helmets, "core/warlord", "common");
addGemRecipe5(<tag:items:aotdextras:melee_weapon_example>, <item:apotheosis:epic_material>, <tag:items:aotdextras:core_armor_example>, <item:apotheosis:epic_material>, <tag:items:aotdextras:mining_tool_example>, "overworld/earth", "rare");
addGemRecipe5(helmets, pickaxes, <item:apotheosis:mythic_material>, ranged_weapons, shields, "overworld/royalty", "rare");
addGemRecipe5(<item:apotheosis:mythic_material>, <item:apotheosis:mythic_material>, <item:minecraft:experience_bottle>, <item:apotheosis:mythic_material>, <item:apotheosis:mythic_material>, "the_end/endersurge", "epic");
addGemRecipe5(light_weapons, heavy_weapons, <item:apotheosis:mythic_material>, helmets, shields, "the_end/mageslayer", "epic");
addGemRecipe5(<tag:items:aotdextras:melee_weapon_example>, chestplates, <item:apotheosis:mythic_material>, ranged_weapons, shields, "the_nether/blood_lord", "rare");
addGemRecipe5(heavy_weapons, chestplates, <item:apotheosis:mythic_material>, <tag:items:aotdextras:mining_tool_example>, helmets, "the_nether/inferno", "rare");