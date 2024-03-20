// "Afraid of the Dark" Minecraft modpack, by Retinite.
// 
// This file restructures tools, weapons, and armor into a linear progression.
// Apotheosis Salvaging recipes are also included, however it 50/50 overrides the rarity materials scrapping.
// The majority of added scrapping recipes have been disabled until rarity materials can still be obtained.

import crafttweaker.api.ingredient.type.IIngredientEmpty;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.data.IData;
import crafttweaker.api.util.random.Percentaged;
import crafttweaker.api.recipe.MirrorAxis;
import crafttweaker.api.bracket.BracketHandlers;

function removeArmor(material as string) as void {
craftingTable.remove(BracketHandlers.getItem(material + "_helmet"));
craftingTable.remove(BracketHandlers.getItem(material + "_chestplate"));
craftingTable.remove(BracketHandlers.getItem(material + "_leggings"));
craftingTable.remove(BracketHandlers.getItem(material + "_boots"));
smithing.remove(BracketHandlers.getItem(material + "_helmet"));
smithing.remove(BracketHandlers.getItem(material + "_chestplate"));
smithing.remove(BracketHandlers.getItem(material + "_leggings"));
smithing.remove(BracketHandlers.getItem(material + "_boots"));
}

function addArmorCraftingSuite(material as string, primaryMaterial as IIngredient, core as IIngredient) as void {
craftingTable.addShaped("aotd_crafting_"+primaryMaterial.items[0].registryName.path+"_helmet", BracketHandlers.getItem(material + "_helmet"),
	[[primaryMaterial, primaryMaterial, primaryMaterial],
	 [primaryMaterial, core,            primaryMaterial]]);
craftingTable.addShaped("aotd_crafting_"+primaryMaterial.items[0].registryName.path+"_chestplate", BracketHandlers.getItem(material + "_chestplate"),
	[[primaryMaterial, core,            primaryMaterial],
	 [primaryMaterial, primaryMaterial, primaryMaterial],
	 [primaryMaterial, primaryMaterial, primaryMaterial]]);
craftingTable.addShaped("aotd_crafting_"+primaryMaterial.items[0].registryName.path+"_leggings", BracketHandlers.getItem(material + "_leggings"),
	[[primaryMaterial, primaryMaterial,                primaryMaterial], 
	 [primaryMaterial, core,                           primaryMaterial],
	 [primaryMaterial, IIngredientEmpty.getInstance(), primaryMaterial]]);
craftingTable.addShaped("aotd_crafting_"+primaryMaterial.items[0].registryName.path+"_boots", BracketHandlers.getItem(material + "_boots"),
	[[primaryMaterial, IIngredientEmpty.getInstance(), primaryMaterial],
	 [primaryMaterial, core,                           primaryMaterial]]);
}

function addSubArmorCraftingSuite(material as string, primaryMaterial as IIngredient, base as string) as void {
craftingTable.addShaped("aotd_crafting_"+primaryMaterial.items[0].registryName.path+"_helmet", BracketHandlers.getItem(material + "_helmet"),
	[[primaryMaterial, primaryMaterial,                           primaryMaterial],
	 [primaryMaterial, BracketHandlers.getItem(base + "_helmet"), primaryMaterial]]);
craftingTable.addShaped("aotd_crafting_"+primaryMaterial.items[0].registryName.path+"_chestplate", BracketHandlers.getItem(material + "_chestplate"),
	[[primaryMaterial, BracketHandlers.getItem(base + "_chestplate"), primaryMaterial],
	 [primaryMaterial, primaryMaterial,                               primaryMaterial],
	 [primaryMaterial, primaryMaterial,                               primaryMaterial]]);
craftingTable.addShaped("aotd_crafting_"+primaryMaterial.items[0].registryName.path+"_leggings", BracketHandlers.getItem(material + "_leggings"),
	[[primaryMaterial, primaryMaterial,                             primaryMaterial], 
	 [primaryMaterial, BracketHandlers.getItem(base + "_leggings"), primaryMaterial],
	 [primaryMaterial, IIngredientEmpty.getInstance(),              primaryMaterial]]);
craftingTable.addShaped("aotd_crafting_"+primaryMaterial.items[0].registryName.path+"_boots", BracketHandlers.getItem(material + "_boots"),
	[[primaryMaterial, IIngredientEmpty.getInstance(),           primaryMaterial],
	 [primaryMaterial, BracketHandlers.getItem(base + "_boots"), primaryMaterial]]);
}

function addRecyclingArmorSuite(material as string, rawMaterial as IItemStack) as void {
addCrusherRecycling(BracketHandlers.getItem(material + "_helmet"), rawMaterial * 2);
addCrusherRecycling(BracketHandlers.getItem(material + "_chestplate"), rawMaterial * 4);
addCrusherRecycling(BracketHandlers.getItem(material + "_leggings"), rawMaterial * 3);
addCrusherRecycling(BracketHandlers.getItem(material + "_boots"), rawMaterial * 2);
}

function addRecyclingArmorShearsSuite(material as string, rawMaterial as IItemStack) as void {
addShearsRecycling(BracketHandlers.getItem(material + "_helmet"), rawMaterial * 2);
addShearsRecycling(BracketHandlers.getItem(material + "_chestplate"), rawMaterial * 4);
addShearsRecycling(BracketHandlers.getItem(material + "_leggings"), rawMaterial * 3);
addShearsRecycling(BracketHandlers.getItem(material + "_boots"), rawMaterial * 2);
}

function addShearsRecycling(itemIn as IIngredient, itemOut as IItemStack) as void {
craftingTable.addShapeless("aotd_shears_recycling." + itemIn.items[0].registryName.path, itemOut,
	[itemIn.anyDamage(), <item:minecraft:shears>.anyDamage().transformDamage(itemOut.amount * 10)]);
<recipetype:mekanism:sawing>.addRecipe("aotd_sawmill_recycling." + itemIn.items[0].registryName.path, itemIn.anyDamage(), itemOut);
}

function addCrusherRecycling(itemIn as IIngredient, itemOut as IItemStack) as void {
<recipetype:mekanism:crushing>.addRecipe("aotd_crusher_recycling." + itemIn.items[0].registryName.path, itemIn.anyDamage(), itemOut);
}

// ARMORS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
addRecyclingArmorShearsSuite("minecraft:leather", <item:minecraft:leather>);
craftingTable.remove(<item:majruszsdifficulty:cloth>);
addRecyclingArmorShearsSuite("majruszsdifficulty:tattered", <item:majruszsdifficulty:cloth>);
addRecyclingArmorSuite("mekanismtools:lapis_lazuli", <item:mekanism:dust_lapis_lazuli>);
addRecyclingArmorSuite("minecraft:golden", <item:mekanism:dust_gold>);
addShearsRecycling(<item:minecraft:turtle_helmet>, <item:minecraft:scute> * 2);
addRecyclingArmorSuite("mekanismtools:refined_glowstone", <item:minecraft:glowstone_dust>);

// roughly accurate conversion from iron bars to nugget cost for chainmail recycling
addCrusherRecycling(<item:minecraft:chainmail_helmet>, <item:minecraft:iron_nugget> * 7);
addCrusherRecycling(<item:minecraft:chainmail_chestplate>, <item:minecraft:iron_nugget> * 12);
addCrusherRecycling(<item:minecraft:chainmail_leggings>, <item:minecraft:iron_nugget> * 10);
addCrusherRecycling(<item:minecraft:chainmail_boots>, <item:minecraft:iron_nugget> * 6);


// IRON TIER ---------------------------------------------------------------------------------------------------------------------------------
removeArmor("minecraft:iron");
addArmorCraftingSuite("minecraft:iron", <item:minecraft:iron_ingot>, <item:aotdextras:obscurium_ingot>);
addRecyclingArmorSuite("minecraft:iron", <item:mekanism:dust_iron>);

craftingTable.remove(<item:mining_helmet:mining_helmet>);
craftingTable.addShaped("mining_helmet.mining_helmet", <item:mining_helmet:mining_helmet>, [[IIngredientEmpty.getInstance(), <item:minecraft:lantern>, IIngredientEmpty.getInstance()], [<item:minecraft:leather>, <item:minecraft:iron_ingot>, <item:minecraft:leather>], [<item:minecraft:iron_ingot>, <item:minecraft:leather_helmet>.anyDamage(), <item:minecraft:iron_ingot>]]);
addCrusherRecycling(<item:mining_helmet:mining_helmet>, <item:mekanism:dust_iron> * 2);

craftingTable.remove(<item:born_in_chaos_v1:spiny_shell_armor_helmet>);
craftingTable.remove(<item:born_in_chaos_v1:spiny_shell_armor_chestplate>);
craftingTable.addShaped("born_in_chaos_v1.spiny_shell_helm_k", <item:born_in_chaos_v1:spiny_shell_armor_helmet>, [[<item:born_in_chaos_v1:spiny_shell>, <item:born_in_chaos_v1:spiny_shell>, <item:born_in_chaos_v1:spiny_shell>], [<item:born_in_chaos_v1:spiny_shell>, <item:minecraft:iron_helmet>.anyDamage(), <item:born_in_chaos_v1:spiny_shell>]]);
craftingTable.addShaped("born_in_chaos_v1.spiny_shell_chestplate_k", <item:born_in_chaos_v1:spiny_shell_armor_chestplate>, [[<item:born_in_chaos_v1:spiny_shell>, <item:minecraft:iron_chestplate>.anyDamage(), <item:born_in_chaos_v1:spiny_shell>], [<item:born_in_chaos_v1:spiny_shell>, <item:born_in_chaos_v1:spiny_shell>, <item:born_in_chaos_v1:spiny_shell>], [<item:born_in_chaos_v1:spiny_shell>, <item:born_in_chaos_v1:spiny_shell>, <item:born_in_chaos_v1:spiny_shell>]]);
addCrusherRecycling(<item:born_in_chaos_v1:spiny_shell_armor_helmet>, <item:born_in_chaos_v1:spiny_shell> * 2);
addCrusherRecycling(<item:born_in_chaos_v1:spiny_shell_armor_chestplate>, <item:born_in_chaos_v1:spiny_shell> * 4);

removeArmor("aquamirae:terrible");
craftingTable.addShaped("aquamirae.terrible_helmet", <item:aquamirae:terrible_helmet>, [[<tag:items: aotdextras:poisoner>, IIngredientEmpty.getInstance(), <tag:items: aotdextras:poisoner>], [<item:aquamirae:fin>, <item:minecraft:iron_ingot>, <item:aquamirae:fin>], [<item:minecraft:iron_ingot>, <item:minecraft:iron_helmet>.anyDamage(), <item:minecraft:iron_ingot>]]);
craftingTable.addShaped("aquamirae.terrible_chestplate", <item:aquamirae:terrible_chestplate>, [[<tag:items: aotdextras:poisoner>, <item:minecraft:iron_chestplate>.anyDamage(), <tag:items: aotdextras:poisoner>], [<item:aquamirae:fin>, <item:minecraft:iron_ingot>, <item:aquamirae:fin>], [<item:minecraft:iron_ingot>, <item:aquamirae:ship_graveyard_echo>, <item:minecraft:iron_ingot>]]);
craftingTable.addShaped("aquamirae.terrible_leggings", <item:aquamirae:terrible_leggings>, [[<tag:items: aotdextras:poisoner>, <item:minecraft:iron_ingot>, <tag:items: aotdextras:poisoner>], [<item:aquamirae:fin>, <item:minecraft:iron_leggings>.anyDamage(), <item:aquamirae:fin>], [<item:minecraft:iron_ingot>, IIngredientEmpty.getInstance(), <item:minecraft:iron_ingot>]]);
craftingTable.addShaped("aquamirae.terrible_boots", <item:aquamirae:terrible_boots>, [[<tag:items: aotdextras:poisoner>, IIngredientEmpty.getInstance(), <tag:items: aotdextras:poisoner>], [<item:minecraft:iron_ingot>, <item:minecraft:iron_boots>.anyDamage(), <item:minecraft:iron_ingot>], [<item:aquamirae:fin>, IIngredientEmpty.getInstance(), <item:aquamirae:fin>]]);
addRecyclingArmorSuite("aquamirae:terrible", <item:mekanism:dust_iron>);

craftingTable.remove(<item:unusualend:chorus_helmet>);
craftingTable.remove(<item:unusualend:enderling_scrap_leggings>);
craftingTable.addShaped("unusualend.chorus_helmet_recipe", <item:unusualend:chorus_helmet>, [[<item:minecraft:chorus_fruit>, <item:unusualend:chorus_petal>, <item:minecraft:chorus_fruit>], [<item:unusualend:end_blob>, <item:minecraft:iron_helmet>.anyDamage(), <item:unusualend:end_blob>]]);
craftingTable.addShaped("unusualend.enderling_scrap_recipe", <item:unusualend:enderling_scrap_leggings>, [[<item:unusualend:enderling_scrap>, <item:unusualend:enderling_scrap>, <item:unusualend:enderling_scrap>], [<item:unusualend:enderling_scrap>, <item:minecraft:iron_leggings>.anyDamage(), <item:unusualend:enderling_scrap>], [<item:minecraft:phantom_membrane>, IIngredientEmpty.getInstance(), <item:minecraft:phantom_membrane>]]);
craftingTable.addShaped("unusualend.bolok_scale_boots", <item:unusualend:bolok_scale_boots>, [[<item:unusualend:bolok_scale>, IIngredientEmpty.getInstance(), <item:unusualend:bolok_scale>], [<item:unusualend:bolok_scale>, <item:minecraft:iron_boots>.anyDamage(), <item:unusualend:bolok_scale>]]);
addCrusherRecycling(<item:unusualend:enderling_scrap_leggings>, <item:unusualend:enderling_scrap> * 3);
addCrusherRecycling(<item:unusualend:bolok_scale_boots>, <item:unusualend:bolok_scale> * 2);

// BRONZE TIER -------------------------------------------------------------------------------------------------------------------------------
removeArmor("mekanismtools:bronze");
addArmorCraftingSuite("mekanismtools:bronze", <item:mekanism:ingot_bronze>, <item:aotdextras:obscurium_block>);
addRecyclingArmorSuite("mekanismtools:bronze", <item:mekanism:dust_bronze>);

removeArmor("undead_unleashed:shadow");
addSubArmorCraftingSuite("undead_unleashed:shadow", <item:undead_unleashed:cursed_cloth>, "mekanismtools:bronze");
addRecyclingArmorShearsSuite("undead_unleashed:shadow", <item:undead_unleashed:cursed_cloth>);

removeArmor("born_in_chaos_v1:nightmare_mantleofthe_night");
craftingTable.addShaped("born_in_chaos_v1.nightmare_mask_k", <item:born_in_chaos_v1:nightmare_mantleofthe_night_helmet>, [[<item:born_in_chaos_v1:monster_skin>, <item:born_in_chaos_v1:monster_skin>, <item:born_in_chaos_v1:monster_skin>], [<item:born_in_chaos_v1:monster_skin>, <item:born_in_chaos_v1:nightmare_stalker_skull>, <item:born_in_chaos_v1:monster_skin>], [<item:born_in_chaos_v1:pieceofdarkmetal>, <item:mekanismtools:bronze_helmet>.anyDamage(), <item:born_in_chaos_v1:pieceofdarkmetal>]]);
craftingTable.addShaped("born_in_chaos_v1.nightmare_robe_k", <item:born_in_chaos_v1:nightmare_mantleofthe_night_chestplate>, [[<item:born_in_chaos_v1:dark_metal_ingot>, <item:mekanismtools:bronze_chestplate>.anyDamage(), <item:born_in_chaos_v1:dark_metal_ingot>], [<item:born_in_chaos_v1:monster_skin>, <item:born_in_chaos_v1:monster_skin>, <item:born_in_chaos_v1:monster_skin>], [<item:born_in_chaos_v1:monster_skin>, <item:born_in_chaos_v1:monster_skin>, <item:born_in_chaos_v1:monster_skin>]]);
craftingTable.addShaped("born_in_chaos_v1.nightmare_pantsk", <item:born_in_chaos_v1:nightmare_mantleofthe_night_leggings>, [[<item:born_in_chaos_v1:monster_skin>, <item:born_in_chaos_v1:dark_metal_ingot>, <item:born_in_chaos_v1:monster_skin>], [<item:born_in_chaos_v1:monster_skin>, <item:mekanismtools:bronze_leggings>.anyDamage(), <item:born_in_chaos_v1:monster_skin>], [<item:born_in_chaos_v1:monster_skin>, IIngredientEmpty.getInstance(), <item:born_in_chaos_v1:monster_skin>]]);
craftingTable.addShaped("born_in_chaos_v1.nightmare_boots_k", <item:born_in_chaos_v1:nightmare_mantleofthe_night_boots>, [[<item:born_in_chaos_v1:pieceofdarkmetal>, IIngredientEmpty.getInstance(), <item:born_in_chaos_v1:pieceofdarkmetal>], [<item:born_in_chaos_v1:monster_skin>, <item:mekanismtools:bronze_boots>.anyDamage(), <item:born_in_chaos_v1:monster_skin>]]);
addRecyclingArmorShearsSuite("born_in_chaos_v1:nightmare_mantleofthe_night", <item:born_in_chaos_v1:monster_skin>);

// STEEL TIER --------------------------------------------------------------------------------------------------------------------------------
removeArmor("mekanismtools:steel");
addArmorCraftingSuite("mekanismtools:steel", <item:mekanism:ingot_steel>, <item:aotdextras:occultium_ingot>);
addRecyclingArmorSuite("mekanismtools:steel", <item:mekanism:dust_steel>);

removeArmor("minecraft:diamond");
<recipetype:mekanism:combining>.addRecipe("minecraft.diamond_helmet", <item:mekanismtools:steel_helmet>.anyDamage(), <item:mekanism:dust_diamond> * 5, <item:minecraft:diamond_helmet>);
<recipetype:mekanism:combining>.addRecipe("minecraft.diamond_chestplate", <item:mekanismtools:steel_chestplate>.anyDamage(), <item:mekanism:dust_diamond> * 8, <item:minecraft:diamond_chestplate>);
<recipetype:mekanism:combining>.addRecipe("minecraft.diamond_leggings", <item:mekanismtools:steel_leggings>.anyDamage(), <item:mekanism:dust_diamond> * 7, <item:minecraft:diamond_leggings>);
<recipetype:mekanism:combining>.addRecipe("minecraft.diamond_boots", <item:mekanismtools:steel_boots>.anyDamage(), <item:mekanism:dust_diamond> * 4, <item:minecraft:diamond_boots>);
addRecyclingArmorSuite("minecraft:diamond", <item:mekanism:dust_diamond>);

craftingTable.remove(<item:deep_dark_regrowth:void_collar_chestplate>);
craftingTable.addShaped("deep_dark_regrowth.void_collar_chestplate", <item:deep_dark_regrowth:void_collar_chestplate>, [[<item:minecraft:string>, <item:minecraft:polished_deepslate>, <item:minecraft:string>], [<item:minecraft:polished_deepslate>, <item:deep_dark_regrowth:plasma>, <item:minecraft:polished_deepslate>], [IIngredientEmpty.getInstance(), <item:minecraft:polished_deepslate>, IIngredientEmpty.getInstance()]]);
addShearsRecycling(<item:deep_dark_regrowth:void_collar_chestplate>, <item:deep_dark_regrowth:plasma_chunk> * 2);
removeArmor("deep_dark_regrowth:phantom_armor");
craftingTable.addShaped("deep_dark_regrowth.phantom_armor_helmet", <item:deep_dark_regrowth:phantom_armor_helmet>, [[<item:deep_dark_regrowth:plasma_chunk>, <item:deep_dark_regrowth:plasma_chunk>, <item:deep_dark_regrowth:plasma_chunk>], [<item:deep_dark_regrowth:plasma_chunk>, <item:mekanismtools:steel_helmet>.anyDamage(), <item:deep_dark_regrowth:plasma_chunk>]]);
craftingTable.addShaped("deep_dark_regrowth.phantom_armor_chestplate", <item:deep_dark_regrowth:phantom_armor_chestplate>, [[<item:deep_dark_regrowth:plasma_chunk>, <item:deep_dark_regrowth:void_collar_chestplate>.anyDamage(), <item:deep_dark_regrowth:plasma_chunk>], [<item:deep_dark_regrowth:plasma_chunk>, <item:mekanismtools:steel_chestplate>, <item:deep_dark_regrowth:plasma_chunk>], [<item:deep_dark_regrowth:plasma_chunk>, <item:deep_dark_regrowth:plasma_chunk>, <item:deep_dark_regrowth:plasma_chunk>]]);
craftingTable.addShaped("deep_dark_regrowth.phantom_armor_leggings", <item:deep_dark_regrowth:phantom_armor_leggings>, [[<item:deep_dark_regrowth:plasma_chunk>, <item:deep_dark_regrowth:plasma_chunk>, <item:deep_dark_regrowth:plasma_chunk>], [<item:deep_dark_regrowth:plasma_chunk>, <item:mekanismtools:steel_leggings>.anyDamage(), <item:deep_dark_regrowth:plasma_chunk>], [<item:deep_dark_regrowth:plasma_chunk>, IIngredientEmpty.getInstance(), <item:deep_dark_regrowth:plasma_chunk>]]);
craftingTable.addShaped("deep_dark_regrowth.phantom_armor_boots", <item:deep_dark_regrowth:phantom_armor_boots>, [[<item:deep_dark_regrowth:plasma_chunk>, IIngredientEmpty.getInstance(), <item:deep_dark_regrowth:plasma_chunk>], [<item:deep_dark_regrowth:plasma_chunk>, <item:mekanismtools:steel_boots>.anyDamage(), <item:deep_dark_regrowth:plasma_chunk>]]);
addRecyclingArmorShearsSuite("deep_dark_regrowth:phantom_armor", <item:deep_dark_regrowth:plasma_chunk>);

removeArmor("minecraft:netherite");
addSubArmorCraftingSuite("minecraft:netherite", <item:minecraft:netherite_scrap>, "minecraft:diamond");
addRecyclingArmorSuite("minecraft:netherite", <item:minecraft:netherite_scrap>);

removeArmor("undead_unleashed:grave_metal");
addSubArmorCraftingSuite("undead_unleashed:grave_metal", <item:undead_unleashed:grave_metal_ingot>, "minecraft:diamond");
addRecyclingArmorSuite("undead_unleashed:grave_metal", <item:undead_unleashed:grave_metal_ingot>);

removeArmor("monsterplus:crystal");
addSubArmorCraftingSuite("monsterplus:crystal", <item:monsterplus:ancient_crystal>, "deep_dark_regrowth:phantom_armor");
addRecyclingArmorSuite("monsterplus:crystal", <item:monsterplus:ancient_crystal>);

removeArmor("deep_dark_regrowth:corruption");
smithing.addRecipe("deep_dark_regrowth.corruption_helmet", <item:deep_dark_regrowth:corruption_helmet>, <item:deep_dark_regrowth:phantom_armor_helmet>, <item:deep_dark_regrowth:corrupted_matter>);
smithing.addRecipe("deep_dark_regrowth.corruption_chestplate", <item:deep_dark_regrowth:corruption_chestplate>, <item:deep_dark_regrowth:phantom_armor_chestplate>, <item:deep_dark_regrowth:corrupted_matter>);
smithing.addRecipe("deep_dark_regrowth.corruption_leggings", <item:deep_dark_regrowth:corruption_leggings>, <item:deep_dark_regrowth:phantom_armor_leggings>, <item:deep_dark_regrowth:corrupted_matter>);
smithing.addRecipe("deep_dark_regrowth.corruption_boots", <item:deep_dark_regrowth:corruption_boots>, <item:deep_dark_regrowth:phantom_armor_boots>, <item:deep_dark_regrowth:corrupted_matter>);
addShearsRecycling(<item:deep_dark_regrowth:corruption_helmet>, <item:deep_dark_regrowth:corrupted_matter>);
addShearsRecycling(<item:deep_dark_regrowth:corruption_chestplate>, <item:deep_dark_regrowth:corrupted_matter>);
addShearsRecycling(<item:deep_dark_regrowth:corruption_leggings>, <item:deep_dark_regrowth:corrupted_matter>);
addShearsRecycling(<item:deep_dark_regrowth:corruption_boots>, <item:deep_dark_regrowth:corrupted_matter>);

// three-bolt suit
craftingTable.remove(<item:aquamirae:three_bolt_suit>);
craftingTable.addShaped("aquamirae.three_bolt_suit", <item: aquamirae:three_bolt_suit>,
	[[<item: mekanism:ingot_bronze>, <item: mekanism:block_bronze>,                    <item: mekanism:ingot_bronze>],
	 [<item: aquamirae:oxygen_tank>, <item: minecraft:leather_chestplate>.anyDamage(), <item: aquamirae:oxygen_tank>],
	 [<item: mekanism:ingot_bronze>, <item:aotdextras:occultium_ingot>,                <item: mekanism:ingot_bronze>]]);
craftingTable.addShaped("aquamirae.three_bolt_suit_from_scuba", <item: aquamirae:three_bolt_suit>,
	[[<item: mekanism:ingot_bronze>, <item: mekanism:block_bronze>,     <item: mekanism:ingot_bronze>],
	 [<item: minecraft:leather>,     <item: mekanism:scuba_tank>,       <item: minecraft:leather>],
	 [<item: mekanism:ingot_bronze>, <item:aotdextras:occultium_ingot>, <item: mekanism:ingot_bronze>]]);
addShearsRecycling(<item:aquamirae:three_bolt_suit>, <item:mekanism:block_bronze>);
craftingTable.remove(<item:aquamirae:three_bolt_leggings>);
craftingTable.addShaped("aquamirae.three_bolt_leggings", <item:aquamirae:three_bolt_leggings>,
	[[<item: mekanism:ingot_bronze>, <item: mekanism:ingot_bronze>,                  <item: mekanism:ingot_bronze>],
	 [<item: mekanism:ingot_bronze>, <item: minecraft:leather_leggings>.anyDamage(), <item: mekanism:ingot_bronze>],
	 [<item: mekanism:ingot_bronze>, <item:aotdextras:occultium_ingot>,              <item: mekanism:ingot_bronze>]]);
addShearsRecycling(<item:aquamirae:three_bolt_leggings>, <item:mekanism:ingot_bronze> * 3);
craftingTable.remove(<item:aquamirae:three_bolt_boots>);
craftingTable.addShaped("aquamirae.three_bolt_boots", <item:aquamirae:three_bolt_boots>,
	[[<item: mekanism:ingot_bronze>, <item:aotdextras:occultium_ingot>,             <item: mekanism:ingot_bronze>],
	 [<item: mekanism:block_bronze>, <item: minecraft:leather_boots>.anyDamage(),   <item: mekanism:block_bronze>]]);
addShearsRecycling(<item:aquamirae:three_bolt_boots>, <item:mekanism:block_bronze> * 2);

// OSMIUM TIER -------------------------------------------------------------------------------------------------------------------------------
removeArmor("mekanismtools:osmium");
addArmorCraftingSuite("mekanismtools:osmium", <item:mekanism:block_osmium>, <item:aotdextras:nihilum_ingot>);
addRecyclingArmorSuite("mekanismtools:osmium", <item:mekanism:dust_osmium>);

removeArmor("tenebrous_lands:siege_armor");
<recipetype:mekanism:combining>.addRecipe("tenebrous_lands.siege_armor_helmet", <item:mekanismtools:osmium_helmet>.anyDamage(), <item:tenebrous_lands:zenyr> * 20, <item:tenebrous_lands:siege_armor_helmet>);
<recipetype:mekanism:combining>.addRecipe("tenebrous_lands.siege_armor_chestplate", <item:mekanismtools:osmium_chestplate>.anyDamage(), <item:tenebrous_lands:zenyr> * 32, <item:tenebrous_lands:siege_armor_chestplate>);
<recipetype:mekanism:combining>.addRecipe("tenebrous_lands.siege_armor_leggings", <item:mekanismtools:osmium_leggings>.anyDamage(), <item:tenebrous_lands:zenyr> * 28, <item:tenebrous_lands:siege_armor_leggings>);
<recipetype:mekanism:combining>.addRecipe("tenebrous_lands.siege_armor_boots", <item:mekanismtools:osmium_boots>.anyDamage(), <item:tenebrous_lands:zenyr> * 16, <item:tenebrous_lands:siege_armor_boots>);
addRecyclingArmorSuite("tenebrous_lands:siege_armor", <item:tenebrous_lands:zenyr>);

removeArmor("deep_dark_regrowth:ancient");
craftingTable.addShaped("deep_dark_regrowth.ancient_mask_r", <item:deep_dark_regrowth:ancient_helmet>, [[<item:deep_dark_regrowth:sculk_remnants>, IIngredientEmpty.getInstance(), <item:deep_dark_regrowth:sculk_remnants>], [<item:deep_dark_regrowth:sculk_carapace_piece>, <item:mekanismtools:osmium_helmet>.anyDamage(), <item:deep_dark_regrowth:sculk_carapace_piece>]]);
craftingTable.addShaped("deep_dark_regrowth.ancient_heartplate_r", <item:deep_dark_regrowth:ancient_chestplate>, [[<item:deep_dark_regrowth:sculk_remnants>, <item:mekanismtools:osmium_chestplate>.anyDamage(), <item:deep_dark_regrowth:sculk_remnants>], [<item:deep_dark_regrowth:soul_of_the_depths>, <item:deep_dark_regrowth:sculk_heart>, <item:deep_dark_regrowth:soul_of_the_depths>], [<item:deep_dark_regrowth:sculk_remnants>, <item:minecraft:netherite_ingot>, <item:deep_dark_regrowth:sculk_remnants>]]);
craftingTable.addShaped("deep_dark_regrowth.ancient_leggings_r", <item:deep_dark_regrowth:ancient_leggings>, [[<item:deep_dark_regrowth:sculk_remnants>, <item:minecraft:netherite_ingot>, <item:deep_dark_regrowth:sculk_remnants>], [<item:deep_dark_regrowth:sculk_carapace_piece>, <item:mekanismtools:osmium_leggings>.anyDamage(), <item:deep_dark_regrowth:sculk_carapace_piece>], [<item:deep_dark_regrowth:sculk_remnants>, IIngredientEmpty.getInstance(), <item:deep_dark_regrowth:sculk_remnants>]]);
craftingTable.addShaped("deep_dark_regrowth.ancient_boots_r", <item:deep_dark_regrowth:ancient_boots>, [[<item:deep_dark_regrowth:sculk_carapace_piece>, IIngredientEmpty.getInstance(), <item:deep_dark_regrowth:sculk_carapace_piece>], [<item:deep_dark_regrowth:sculk_remnants>, <item:mekanismtools:osmium_boots>.anyDamage(), <item:deep_dark_regrowth:sculk_remnants>]]);
addCrusherRecycling(<item:deep_dark_regrowth:ancient_helmet>, <item:deep_dark_regrowth:sculk_remnants> * 2);
addCrusherRecycling(<item:deep_dark_regrowth:ancient_chestplate>, <item:deep_dark_regrowth:sculk_remnants> * 4);
addCrusherRecycling(<item:deep_dark_regrowth:ancient_leggings>, <item:deep_dark_regrowth:sculk_remnants> * 3);
addCrusherRecycling(<item:deep_dark_regrowth:ancient_boots>, <item:deep_dark_regrowth:sculk_remnants> * 2);

// ENDERIUM TIER -----------------------------------------------------------------------------------------------------------------------------
removeArmor("majruszsdifficulty:enderium");
addArmorCraftingSuite("majruszsdifficulty:enderium", <item:majruszsdifficulty:enderium_ingot>, <item:aotdextras:nihilum_block>);
addRecyclingArmorSuite("majruszsdifficulty:enderium", <item:majruszsdifficulty:enderium_ingot>);

craftingTable.remove(<item:aquamirae:abyssal_heaume>);
craftingTable.remove(<item:aquamirae:abyssal_tiara>);
craftingTable.remove(<item:aquamirae:abyssal_brigantine>);
craftingTable.remove(<item:aquamirae:abyssal_leggings>);
craftingTable.remove(<item:aquamirae:abyssal_boots>);
craftingTable.addShaped("aquamirae.abyssal_heaume", <item:aquamirae:abyssal_heaume>, [[<item:aquamirae:abyssal_amethyst>, <item:aquamirae:abyssal_amethyst>, <item:aquamirae:abyssal_amethyst>], [<item:minecraft:netherite_ingot>, <item:majruszsdifficulty:enderium_helmet>.anyDamage(), <item:minecraft:netherite_ingot>]]);
craftingTable.addShaped("aquamirae.abyssal_tiara", <item:aquamirae:abyssal_tiara>, [[<item:aquamirae:abyssal_amethyst>, IIngredientEmpty.getInstance(), <item:aquamirae:abyssal_amethyst>], [<item:aquamirae:abyssal_amethyst>, <item:minecraft:netherite_ingot>, <item:aquamirae:abyssal_amethyst>], [IIngredientEmpty.getInstance(), <item:majruszsdifficulty:enderium_helmet>.anyDamage(), IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("aquamirae.abyssal_brigantine", <item:aquamirae:abyssal_brigantine>, [[<item:aquamirae:abyssal_amethyst>, <item:majruszsdifficulty:enderium_chestplate>.anyDamage(), <item:aquamirae:abyssal_amethyst>], [<item:aquamirae:abyssal_amethyst>, <item:obscure_api:astral_dust>, <item:aquamirae:abyssal_amethyst>], [<item:minecraft:netherite_ingot>, <item:aquamirae:abyssal_amethyst>, <item:minecraft:netherite_ingot>]]);
craftingTable.addShaped("aquamirae.abyssal_leggings", <item:aquamirae:abyssal_leggings>, [[<item:minecraft:netherite_ingot>, <item:aquamirae:abyssal_amethyst>, <item:minecraft:netherite_ingot>], [<item:aquamirae:abyssal_amethyst>, <item:majruszsdifficulty:enderium_leggings>.anyDamage(), <item:aquamirae:abyssal_amethyst>], [<item:aquamirae:abyssal_amethyst>, IIngredientEmpty.getInstance(), <item:aquamirae:abyssal_amethyst>]]);
craftingTable.addShaped("aquamirae.abyssal_boots", <item:aquamirae:abyssal_boots>, [[<item:aquamirae:abyssal_amethyst>, IIngredientEmpty.getInstance(), <item:aquamirae:abyssal_amethyst>], [<item:minecraft:netherite_ingot>, <item:majruszsdifficulty:enderium_boots>.anyDamage(), <item:minecraft:netherite_ingot>]]);
addCrusherRecycling(<item:aquamirae:abyssal_heaume>, <item:aquamirae:abyssal_amethyst> * 2);
addCrusherRecycling(<item:aquamirae:abyssal_tiara>, <item:aquamirae:abyssal_amethyst> * 2);
addCrusherRecycling(<item:aquamirae:abyssal_brigantine>, <item:aquamirae:abyssal_amethyst> * 4);
addCrusherRecycling(<item:aquamirae:abyssal_leggings>, <item:aquamirae:abyssal_amethyst> * 3);
addCrusherRecycling(<item:aquamirae:abyssal_boots>, <item:aquamirae:abyssal_amethyst> * 2);

removeArmor("born_in_chaos_v1:dark_metal_armor");
addSubArmorCraftingSuite("born_in_chaos_v1:dark_metal_armor", <item:born_in_chaos_v1:dark_metal_ingot>, "majruszsdifficulty:enderium");
addRecyclingArmorSuite("born_in_chaos_v1:dark_metal_armor", <item:born_in_chaos_v1:pileof_dark_metal>);

removeArmor("mekanismtools:refined_obsidian");
addSubArmorCraftingSuite("mekanismtools:refined_obsidian", <item:mekanism:block_refined_obsidian>, "majruszsdifficulty:enderium");
addRecyclingArmorSuite("mekanismtools:refined_obsidian", <item:mekanism:dust_refined_obsidian>);

craftingTable.removeByName("mekanism:mekasuit_helmet");
craftingTable.removeByName("mekanism:mekasuit_bodyarmor");
craftingTable.removeByName("mekanism:mekasuit_pants");
craftingTable.removeByName("mekanism:mekasuit_boots");
craftingTable.addShaped("mekanism.mekasuit_helmet", <item:mekanism:mekasuit_helmet>,
	[[<item:mekanism:hdpe_sheet>, <tag:items:forge:circuits/ultimate>, <item:mekanism:hdpe_sheet>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:protection"}, {lvl: 5, id: "minecraft:blast_protection"}, {lvl: 3, id: "minecraft:unbreaking"}, {lvl: 1, id: "minecraft:mending"}]}), <item:majruszsdifficulty:enderium_helmet>.anyDamage(), <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:protection"}, {lvl: 5, id: "minecraft:projectile_protection"}, {lvl: 3, id: "minecraft:unbreaking"}, {lvl: 1, id: "minecraft:mending"}]})],
	[<item:mekanism:pellet_polonium>, <item:mekanism:basic_induction_cell>, <item:mekanism:pellet_polonium>]]);
craftingTable.addShaped("mekanism.mekasuit_bodyarmor", <item:mekanism:mekasuit_bodyarmor>,
	[[<item:mekanism:hdpe_sheet>, <tag:items:forge:circuits/ultimate>, <item:mekanism:hdpe_sheet>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:protection"}, {lvl: 5, id: "minecraft:blast_protection"}, {lvl: 3, id: "minecraft:unbreaking"}, {lvl: 1, id: "minecraft:mending"}]}), <item:majruszsdifficulty:enderium_chestplate>.anyDamage(), <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:protection"}, {lvl: 5, id: "minecraft:projectile_protection"}, {lvl: 3, id: "minecraft:unbreaking"}, {lvl: 1, id: "minecraft:mending"}]})],
	[<item:mekanism:pellet_polonium>, <item:mekanism:basic_induction_cell>, <item:mekanism:pellet_polonium>]]);
craftingTable.addShaped("mekanism.mekasuit_pants", <item:mekanism:mekasuit_pants>,
	[[<item:mekanism:hdpe_sheet>, <tag:items:forge:circuits/ultimate>, <item:mekanism:hdpe_sheet>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:protection"}, {lvl: 5, id: "minecraft:blast_protection"}, {lvl: 3, id: "minecraft:unbreaking"}, {lvl: 1, id: "minecraft:mending"}]}), <item:majruszsdifficulty:enderium_leggings>.anyDamage(), <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:protection"}, {lvl: 5, id: "minecraft:projectile_protection"}, {lvl: 3, id: "minecraft:unbreaking"}, {lvl: 1, id: "minecraft:mending"}]})],
	[<item:mekanism:pellet_polonium>, <item:mekanism:basic_induction_cell>, <item:mekanism:pellet_polonium>]]);
craftingTable.addShaped("mekanism.mekasuit_boots", <item:mekanism:mekasuit_boots>,
	[[<item:mekanism:hdpe_sheet>, <tag:items:forge:circuits/ultimate>, <item:mekanism:hdpe_sheet>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:feather_falling"}, {lvl: 5, id: "minecraft:protection"}, {lvl: 5, id: "minecraft:blast_protection"}, {lvl: 3, id: "minecraft:unbreaking"}, {lvl: 1, id: "minecraft:mending"}]}), <item:majruszsdifficulty:enderium_boots>.anyDamage(), <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:feather_falling"}, {lvl: 5, id: "minecraft:protection"}, {lvl: 5, id: "minecraft:projectile_protection"}, {lvl: 3, id: "minecraft:unbreaking"}, {lvl: 1, id: "minecraft:mending"}]})],
	[<tag:items:forge:pellets/polonium>, <item:mekanism:basic_induction_cell>, <tag:items:forge:pellets/polonium>]]);

// MISC ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// horse armor
smithing.addRecipe("minecraft.iron_horse_armor", <item:minecraft:iron_horse_armor>, <item:minecraft:leather_horse_armor>, <item:minecraft:iron_block>);
smithing.addRecipe("minecraft.golden_horse_armor", <item:minecraft:golden_horse_armor>, <item:minecraft:leather_horse_armor>, <item:minecraft:gold_block>);
smithing.addRecipe("minecraft.diamond_horse_armor", <item:minecraft:diamond_horse_armor>, <item:minecraft:leather_horse_armor>, <item:minecraft:diamond_block>);
addShearsRecycling(<item:minecraft:leather_horse_armor>, <item:minecraft:leather> * 3);
addCrusherRecycling(<item:minecraft:iron_horse_armor>, <item:mekanism:dust_iron> * 2);
addCrusherRecycling(<item:minecraft:golden_horse_armor>, <item:mekanism:dust_gold> * 2);
addCrusherRecycling(<item:minecraft:diamond_horse_armor>, <item:mekanism:dust_diamond> * 2);

// upgraded backpacks
addShearsRecycling(<item:sophisticatedbackpacks:copper_backpack>, <item:minecraft:copper_ingot> * 6);
addShearsRecycling(<item:sophisticatedbackpacks:iron_backpack>, <item:minecraft:iron_ingot> * 6);
addShearsRecycling(<item:sophisticatedbackpacks:gold_backpack>, <item:minecraft:gold_ingot> * 6);
addShearsRecycling(<item:sophisticatedbackpacks:diamond_backpack>, <item:minecraft:diamond> * 6);
addShearsRecycling(<item:sophisticatedbackpacks:netherite_backpack>, <item:minecraft:netherite_ingot>);
