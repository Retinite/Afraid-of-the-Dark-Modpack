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

function removeTools(material as string) as void {
craftingTable.remove(BracketHandlers.getItem(material + "_axe"));
craftingTable.remove(BracketHandlers.getItem(material + "_hoe"));
craftingTable.remove(BracketHandlers.getItem(material + "_pickaxe"));
craftingTable.remove(BracketHandlers.getItem(material + "_shovel"));
craftingTable.remove(BracketHandlers.getItem(material + "_sword"));
smithing.remove(BracketHandlers.getItem(material + "_axe"));
smithing.remove(BracketHandlers.getItem(material + "_hoe"));
smithing.remove(BracketHandlers.getItem(material + "_pickaxe"));
smithing.remove(BracketHandlers.getItem(material + "_shovel"));
smithing.remove(BracketHandlers.getItem(material + "_sword"));
}

function addToolsCraftingSuite(material as string, primaryMaterial as IIngredient, core as IIngredient) as void {
craftingTable.addShaped("aotd_crafting_"+primaryMaterial.items[0].registryName.path+"_sword", BracketHandlers.getItem(material + "_sword"),
	[[primaryMaterial],
	 [primaryMaterial],
	 [core]]);
craftingTable.addShaped("aotd_crafting_"+primaryMaterial.items[0].registryName.path+"_shovel", BracketHandlers.getItem(material + "_shovel"),
	[[primaryMaterial],
	 [core],
	 [<tag:items:forge:rods/wooden>]]);
craftingTable.addShaped("aotd_crafting_"+primaryMaterial.items[0].registryName.path+"_pickaxe", BracketHandlers.getItem(material + "_pickaxe"),
	[[primaryMaterial,                primaryMaterial,               primaryMaterial], 
	 [IIngredientEmpty.getInstance(), core,                          IIngredientEmpty.getInstance()],
	 [IIngredientEmpty.getInstance(), <tag:items:forge:rods/wooden>, IIngredientEmpty.getInstance()]]);
craftingTable.addShapedMirrored("aotd_crafting_"+primaryMaterial.items[0].registryName.path+"_axe", MirrorAxis.VERTICAL, BracketHandlers.getItem(material + "_axe"),
	[[primaryMaterial,                primaryMaterial,               IIngredientEmpty.getInstance()],
	 [primaryMaterial,                core,                          IIngredientEmpty.getInstance()],
	 [IIngredientEmpty.getInstance(), <tag:items:forge:rods/wooden>, IIngredientEmpty.getInstance()]]);
craftingTable.addShapedMirrored("aotd_crafting_"+primaryMaterial.items[0].registryName.path+"_hoe", MirrorAxis.VERTICAL, BracketHandlers.getItem(material + "_hoe"),
	[[primaryMaterial,                primaryMaterial,               IIngredientEmpty.getInstance()],
	 [IIngredientEmpty.getInstance(), core,                          IIngredientEmpty.getInstance()],
	 [IIngredientEmpty.getInstance(), <tag:items:forge:rods/wooden>, IIngredientEmpty.getInstance()]]);
}

function addRecyclingToolsSuite(material as string, rawMaterial as IItemStack) as void {
addCrusherRecycling(BracketHandlers.getItem(material + "_sword"), rawMaterial * 1);
addCrusherRecycling(BracketHandlers.getItem(material + "_shovel"), rawMaterial * 1);
addCrusherRecycling(BracketHandlers.getItem(material + "_pickaxe"), rawMaterial * 1);
addCrusherRecycling(BracketHandlers.getItem(material + "_axe"), rawMaterial * 1);
addCrusherRecycling(BracketHandlers.getItem(material + "_hoe"), rawMaterial * 1);
}

function addCrusherRecycling(itemIn as IIngredient, itemOut as IItemStack) as void {
<recipetype:mekanism:crushing>.addRecipe("aotd_crusher_recycling." + itemIn.items[0].registryName.path, itemIn.anyDamage(), itemOut);
}

// TOOLS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// STONE LEVEL -------------------------------------------------------------------------------------------------------------------------------
addRecyclingToolsSuite("minecraft:golden", <item:mekanism:dust_gold>);
addRecyclingToolsSuite("mekanismtools:lapis_lazuli", <item:mekanism:dust_lapis_lazuli>);
addRecyclingToolsSuite("mekanismtools:refined_glowstone", <item:minecraft:glowstone_dust>);

// allow daggers to be available early game
craftingTable.remove(<item:unusualend:shiny_dagger>);
craftingTable.remove(<item:unusualend:moult_dagger>);
craftingTable.remove(<item:born_in_chaos_v1:dark_ritual_dagger>);
smithing.addRecipe("unusualend.shiny_dagger", <item:unusualend:shiny_dagger>, <item:graveyard:bone_dagger>, <item:minecraft:ghast_tear>);
smithing.addRecipe("unusualend.moult_dagger", <item:unusualend:moult_dagger>, <item:graveyard:bone_dagger>, <item:minecraft:fermented_spider_eye>);
smithing.addRecipe("born_in_chaos_v1.dark_ritual_dagger", <item:born_in_chaos_v1:dark_ritual_dagger>, <item:graveyard:bone_dagger>, <item:born_in_chaos_v1:nightmare_claw>);

// IRON LEVEL --------------------------------------------------------------------------------------------------------------------------------
addRecyclingToolsSuite("minecraft:iron", <item:mekanism:dust_iron>);

craftingTable.remove(<item:undead_unleashed:grave_metal_sword>);
craftingTable.remove(<item:undead_unleashed:grave_metal_axe>);
craftingTable.remove(<item:undead_unleashed:tombdigger_maul>);
smithing.addRecipe("undead_unleashed.grave_metal_sword", <item:undead_unleashed:grave_metal_sword>, <item:minecraft:iron_sword>, <item:undead_unleashed:grave_metal_ingot>);
smithing.addRecipe("undead_unleashed.grave_metal_axe", <item:undead_unleashed:grave_metal_axe>, <item:minecraft:iron_axe>, <item:undead_unleashed:grave_metal_ingot>);
smithing.addRecipe("undead_unleashed.tombdigger", <item:undead_unleashed:tombdigger_maul>, <item:minecraft:iron_shovel>, <item:undead_unleashed:necrotic_dust>);
addCrusherRecycling(<item:undead_unleashed:grave_metal_sword>, <item:undead_unleashed:grave_metal_scrap> * 2);
addCrusherRecycling(<item:undead_unleashed:grave_metal_axe>, <item:undead_unleashed:grave_metal_scrap> * 2);
addCrusherRecycling(<item:undead_unleashed:tombdigger_maul>, <item:undead_unleashed:necrotic_dust>);

addCrusherRecycling(<item:born_in_chaos_v1:wood_splitter_axe>, <item:mekanism:dust_iron>);
addCrusherRecycling(<item:born_in_chaos_v1:spiritual_sword>, <item:born_in_chaos_v1:seedof_chaos>);
addCrusherRecycling(<item:born_in_chaos_v1:shell_mace>, <item:born_in_chaos_v1:spiny_shell>);

// BRONZE LEVEL ------------------------------------------------------------------------------------------------------------------------------
removeTools("mekanismtools:bronze");
addToolsCraftingSuite("mekanismtools:bronze", <item:mekanism:ingot_bronze>, <item:aotdextras:obscurium_ingot>);
addRecyclingToolsSuite("mekanismtools:bronze", <item:mekanism:dust_bronze>);

craftingTable.remove(<item:aquamirae:remnants_saber>);
craftingTable.remove(<item:aquamirae:terrible_sword>);
craftingTable.remove(<item:aquamirae:poisoned_blade>);
craftingTable.remove(<item:aquamirae:fin_cutter>);
craftingTable.addShaped("aquamirae.remnants_saber", <item:aquamirae:remnants_saber>, [[IIngredientEmpty.getInstance(), IIngredientEmpty.getInstance(), <item:aquamirae:sharp_bones>], [<item:minecraft:leather>, <item:aquamirae:sharp_bones>, IIngredientEmpty.getInstance()], [<item:mekanismtools:bronze_sword>.anyDamage(), IIngredientEmpty.getInstance(), IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("aquamirae.terrible_sword", <item:aquamirae:terrible_sword>, [[IIngredientEmpty.getInstance(), <item:minecraft:iron_ingot>, <tag:items: aotdextras:poisoner>], [IIngredientEmpty.getInstance(), <item:aquamirae:ship_graveyard_echo>, <item:minecraft:iron_ingot>], [<item:aquamirae:remnants_saber>.anyDamage(), IIngredientEmpty.getInstance(), IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("aquamirae.poisoned_blade", <item:aquamirae:poisoned_blade>, [[IIngredientEmpty.getInstance(), <tag:items: aotdextras:poisoner>, <item:minecraft:iron_ingot>], [<tag:items: aotdextras:poisoner>, <item:minecraft:iron_ingot>, <tag:items: aotdextras:poisoner>], [<item:aquamirae:remnants_saber>.anyDamage(), <tag:items: aotdextras:poisoner>, IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("aquamirae.fin_cutter", <item:aquamirae:fin_cutter>, [[IIngredientEmpty.getInstance(), <item:aquamirae:ship_graveyard_echo>, <item:aquamirae:abyssal_amethyst>], [<item:aquamirae:ship_graveyard_echo>, <item:minecraft:diamond>, <item:aquamirae:fin>], [<item:aquamirae:remnants_saber>.anyDamage(), <item:aquamirae:fin>, <item:aquamirae:fin>]]);
addCrusherRecycling(<item:aquamirae:remnants_saber>, <item:aquamirae:sharp_bones>);
addCrusherRecycling(<item:aquamirae:terrible_sword>, <item:aquamirae:ship_graveyard_echo>);
addCrusherRecycling(<item:aquamirae:poisoned_blade>, <item:aquamirae:anglers_fang> * 2);
addCrusherRecycling(<item:aquamirae:fin_cutter>, <item:aquamirae:ship_graveyard_echo>);

// STEEL LEVEL -------------------------------------------------------------------------------------------------------------------------------
removeTools("mekanismtools:steel");
addToolsCraftingSuite("mekanismtools:steel", <item:mekanism:ingot_steel>, <item:aotdextras:obscurium_block>);
addRecyclingToolsSuite("mekanismtools:steel", <item:mekanism:dust_steel>);

craftingTable.remove(<item:tenebrous_lands:siege_sword>);
craftingTable.remove(<item:monsterplus:crystal_sword>);
craftingTable.remove(<item:tenebrous_lands:ash_scythe>);
craftingTable.remove(<item:undead_unleashed:reaping_scythe>);
craftingTable.remove(<item:born_in_chaos_v1:nightmare_scythe>);
craftingTable.addShaped("tenebrous_lands.siege_sword", <item:tenebrous_lands:siege_sword>, [[IIngredientEmpty.getInstance(), <item:tenebrous_lands:zenyr>, <item:minecraft:blackstone>], [<item:tenebrous_lands:zenyr>, <item:minecraft:blackstone>, <item:tenebrous_lands:zenyr>], [<item:mekanismtools:steel_sword>.anyDamage(), <item:tenebrous_lands:zenyr>, IIngredientEmpty.getInstance()]]);
<recipetype:mekanism:combining>.addRecipe("monsterplus.crystal_sword", <item:mekanismtools:steel_sword>.anyDamage(), <item:monsterplus:ancient_crystal> * 2, <item:monsterplus:crystal_sword>);
smithing.addRecipe("tenebrous_lands.ash_scythe", <item:tenebrous_lands:ash_scythe>, <item:mekanismtools:steel_hoe>.anyDamage(), <item:minecraft:netherite_ingot>);
smithing.addRecipe("undead_unleashed.reaping_scythe", <item:undead_unleashed:reaping_scythe>, <item:tenebrous_lands:ash_scythe>.anyDamage(), <item:undead_unleashed:necrotic_dust>);
<recipetype:mekanism:combining>.addRecipe("born_in_chaos_v1.nightmare_scythe_k", <item:tenebrous_lands:ash_scythe>.anyDamage(), <item:born_in_chaos_v1:nightmare_claw> * 2, <item:born_in_chaos_v1:nightmare_scythe>);
addCrusherRecycling(<item:tenebrous_lands:siege_sword>, <item:tenebrous_lands:zenyr> * 2);
addCrusherRecycling(<item:monsterplus:crystal_sword>, <item:monsterplus:ancient_crystal>);
addCrusherRecycling(<item:tenebrous_lands:ash_scythe>, <item:minecraft:netherite_scrap> * 2);
addCrusherRecycling(<item:undead_unleashed:reaping_scythe>, <item:undead_unleashed:necrotic_dust>);
addCrusherRecycling(<item:born_in_chaos_v1:nightmare_scythe>, <item:born_in_chaos_v1:nightmare_claw>);

// DIAMOND LEVEL -----------------------------------------------------------------------------------------------------------------------------
removeTools("minecraft:diamond");
addToolsCraftingSuite("minecraft:diamond", <item:minecraft:diamond>, <item:aotdextras:occultium_ingot>);
addRecyclingToolsSuite("minecraft:diamond", <item:mekanism:dust_diamond>);

craftingTable.remove(<item:born_in_chaos_v1:great_reaper_axe>);
craftingTable.remove(<item:born_in_chaos_v1:skullbreaker_hammer>);
craftingTable.remove(<item:born_in_chaos_v1:sharpened_dark_metal_sword>);
craftingTable.remove(<item:born_in_chaos_v1:intoxicating_dagger>);
craftingTable.remove(<item:born_in_chaos_v1:soul_cutlass>);
craftingTable.remove(<item:born_in_chaos_v1:darkwarblade>);
<recipetype:mekanism:combining>.addRecipe("born_in_chaos_v1.great_reaper_axe", <item:minecraft:diamond_axe>.anyDamage(), <item:born_in_chaos_v1:dark_metal_ingot> * 3, <item:born_in_chaos_v1:great_reaper_axe>);
smithing.addRecipe("born_in_chaos_v1.skullbreaker_hammer", <item:born_in_chaos_v1:skullbreaker_hammer>, <item:minecraft:diamond_shovel>.anyDamage(), <item:born_in_chaos_v1:dark_metal_block>);
<recipetype:mekanism:combining>.addRecipe("born_in_chaos_v1.sharpened_dark_metal_sword", <item:minecraft:diamond_sword>.anyDamage(), <item:born_in_chaos_v1:dark_metal_ingot> * 2, <item:born_in_chaos_v1:sharpened_dark_metal_sword>);
<recipetype:mekanism:combining>.addRecipe("born_in_chaos_v1.intoxicating_dagger", <item:born_in_chaos_v1:sharpened_dark_metal_sword>.anyDamage(), <item:born_in_chaos_v1:intoxicating_decoction> * 3, <item:born_in_chaos_v1:intoxicating_dagger>);
<recipetype:mekanism:combining>.addRecipe("born_in_chaos_v1.soul_saber", <item:born_in_chaos_v1:sharpened_dark_metal_sword>.anyDamage(), <item:born_in_chaos_v1:nightmare_claw> * 2, <item:born_in_chaos_v1:soul_cutlass>);
smithing.addRecipe("born_in_chaos_v1.darkwarblade", <item:born_in_chaos_v1:darkwarblade>, <item:born_in_chaos_v1:sharpened_dark_metal_sword>.anyDamage(), <item:born_in_chaos_v1:dark_metal_block>);
addCrusherRecycling(<item:born_in_chaos_v1:great_reaper_axe>, <item:born_in_chaos_v1:pileof_dark_metal>);
addCrusherRecycling(<item:born_in_chaos_v1:skullbreaker_hammer>, <item:born_in_chaos_v1:pileof_dark_metal> * 4);
addCrusherRecycling(<item:born_in_chaos_v1:sharpened_dark_metal_sword>, <item:born_in_chaos_v1:pileof_dark_metal>);
addCrusherRecycling(<item:born_in_chaos_v1:intoxicating_dagger>, <item:born_in_chaos_v1:intoxicating_decoction>);
addCrusherRecycling(<item:born_in_chaos_v1:soul_cutlass>, <item:born_in_chaos_v1:nightmare_claw>);
addCrusherRecycling(<item:born_in_chaos_v1:darkwarblade>, <item:born_in_chaos_v1:pileof_dark_metal> * 4);

// NETHERITE LEVEL ---------------------------------------------------------------------------------------------------------------------------
removeTools("minecraft:netherite");
addToolsCraftingSuite("minecraft:netherite", <item:minecraft:netherite_ingot>, <item:aotdextras:occultium_block>);
addRecyclingToolsSuite("minecraft:netherite", <item:minecraft:netherite_ingot>);

craftingTable.remove(<item:tenebrous_lands:undead_sword>);
<recipetype:mekanism:combining>.addRecipe("tenebrous_lands.bone_sword", <item:minecraft:netherite_sword>.anyDamage(), <item:minecraft:bone_block> * 64, <item:tenebrous_lands:undead_sword>);
addCrusherRecycling(<item:tenebrous_lands:undead_sword>, <item:minecraft:bone_meal> * 64);

addCrusherRecycling(<item:undead_unleashed:moonlight_greatsword>, <item:minecraft:netherite_scrap> * 2);

// OSMIUM LEVEL ------------------------------------------------------------------------------------------------------------------------------
removeTools("mekanismtools:osmium");
addToolsCraftingSuite("mekanismtools:osmium", <item:mekanism:block_osmium>, <item:aotdextras:nihilum_ingot>);
addRecyclingToolsSuite("mekanismtools:osmium", <item:mekanism:dust_osmium>);

craftingTable.remove(<item:aquamirae:whisper_of_the_abyss>);
craftingTable.remove(<item:tenebrous_lands:axe_of_the_forgotten>);
craftingTable.remove(<item:aquamirae:divider>);
craftingTable.addShaped("aquamirae.whisper_of_the_abyss", <item:aquamirae:whisper_of_the_abyss>, [[<item:aquamirae:ship_graveyard_echo>, <item:aquamirae:abyssal_amethyst>, <item:aquamirae:abyssal_amethyst>], [<item:minecraft:netherite_ingot>, <item:mekanismtools:osmium_sword>.anyDamage(), <item:aquamirae:abyssal_amethyst>], [<item:minecraft:stick>, <item:minecraft:netherite_ingot>, <item:aquamirae:ship_graveyard_echo>]]);
craftingTable.addShaped("tenebrous_lands.axe_of_the_forgotten_recipe", <item:tenebrous_lands:axe_of_the_forgotten>, [[IIngredientEmpty.getInstance(), <item:minecraft:netherite_ingot>, <item:minecraft:wither_rose>], [IIngredientEmpty.getInstance(), <item:mekanismtools:osmium_axe>.anyDamage(), <item:minecraft:netherite_ingot>], [<item:minecraft:stick>, IIngredientEmpty.getInstance(), IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("aquamirae.divider", <item:aquamirae:divider>, [[<item:aquamirae:ship_graveyard_echo>, <item:aquamirae:abyssal_amethyst>, <item:minecraft:netherite_ingot>], [<item:aquamirae:abyssal_amethyst>, <item:minecraft:netherite_ingot>, <item:aquamirae:abyssal_amethyst>], [<item:mekanismtools:osmium_sword>.anyDamage(), <item:aquamirae:abyssal_amethyst>, <item:aquamirae:ship_graveyard_echo>]]);
addCrusherRecycling(<item:aquamirae:whisper_of_the_abyss>, <item:minecraft:netherite_scrap> * 4);
addCrusherRecycling(<item:tenebrous_lands:axe_of_the_forgotten>, <item:minecraft:netherite_scrap> * 4);
addCrusherRecycling(<item:aquamirae:divider>, <item:minecraft:netherite_scrap> * 4);

craftingTable.removeByName("mekanism:atomic_disassembler");
craftingTable.addShaped("mekanism.atomic_disassembler", <item:mekanism:atomic_disassembler>,
	[[<tag:items:mekanism:alloys/infused>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:efficiency"}, {lvl: 5, id: "minecraft:sharpness"}, {lvl: 1, id: "minecraft:mending"}]}), <tag:items:mekanism:alloys/infused>],
	[<item:solarpanels:improved_energy_tablet>, <item:mekanismtools:osmium_paxel>.anyDamage(), <item:solarpanels:improved_energy_tablet>],
	[IIngredientEmpty.getInstance(), <item:mekanismtools:osmium_sword>.anyDamage(), IIngredientEmpty.getInstance()]]);

// ENDERIUM LEVEL ----------------------------------------------------------------------------------------------------------------------------
removeTools("majruszsdifficulty:enderium");
addToolsCraftingSuite("majruszsdifficulty:enderium", <item:majruszsdifficulty:enderium_ingot>, <item:aotdextras:nihilum_block>);
addRecyclingToolsSuite("majruszsdifficulty:enderium", <item:majruszsdifficulty:enderium_ingot>);

craftingTable.addShaped("monsterplus.gnawing_jaw", <item:monsterplus:gnawing_jaw>, [[IIngredientEmpty.getInstance(), <item:minecraft:splash_potion>.withTag({Potion: "minecraft:harming"}), <item:unusualend:shiny_dagger>], [<item:minecraft:splash_potion>.withTag({Potion: "minecraft:healing"}), <item:minecraft:blaze_rod>, <item:minecraft:splash_potion>.withTag({Potion: "minecraft:healing"})], [<item:majruszsdifficulty:enderium_sword>.anyDamage(), <item:minecraft:splash_potion>.withTag({Potion: "minecraft:harming"}), IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("monsterplus.darkstar", <item:monsterplus:darkstar>, [[IIngredientEmpty.getInstance(), <item:monsterplus:ancient_crystal>, <item:unusualend:moult_dagger>], [<item:monsterplus:ancient_crystal>, <item:minecraft:blaze_rod>, <item:monsterplus:ancient_crystal>], [<item:majruszsdifficulty:enderium_sword>.anyDamage(), <item:monsterplus:ancient_crystal>, IIngredientEmpty.getInstance()]]);
addCrusherRecycling(<item:monsterplus:darkstar>, <item:monsterplus:ancient_crystal> * 2);

// REFINED OBSIDIAN LEVEL --------------------------------------------------------------------------------------------------------------------
removeTools("mekanismtools:refined_obsidian");
smithing.addRecipe("aotd_smithing.refined_obsidian_sword", <item:mekanismtools:refined_obsidian_sword>, <item:majruszsdifficulty:enderium_sword>, <item:mekanism:block_refined_obsidian>);
smithing.addRecipe("aotd_smithing.refined_obsidian_shovel", <item:mekanismtools:refined_obsidian_shovel>, <item:majruszsdifficulty:enderium_shovel>, <item:mekanism:block_refined_obsidian>);
smithing.addRecipe("aotd_smithing.refined_obsidian_pickaxe", <item:mekanismtools:refined_obsidian_pickaxe>, <item:majruszsdifficulty:enderium_pickaxe>, <item:mekanism:block_refined_obsidian>);
smithing.addRecipe("aotd_smithing.refined_obsidian_axe", <item:mekanismtools:refined_obsidian_axe>, <item:majruszsdifficulty:enderium_axe>, <item:mekanism:block_refined_obsidian>);
smithing.addRecipe("aotd_smithing.refined_obsidian_hoe", <item:mekanismtools:refined_obsidian_hoe>, <item:majruszsdifficulty:enderium_hoe>, <item:mekanism:block_refined_obsidian>);
addRecyclingToolsSuite("mekanismtools:refined_obsidian", <item:mekanism:dust_refined_obsidian>);

craftingTable.remove(<item:mekaweapons:katana_blade>);
craftingTable.addShaped("mekaweapons.katana_blade", <item:mekaweapons:katana_blade>,
	[[IIngredientEmpty.getInstance(),             IIngredientEmpty.getInstance(),  <item:aotdextras:nihilum_ingot>],
	[<item:mekanism:alloy_atomic>,                <item:aotdextras:nihilum_ingot>, IIngredientEmpty.getInstance()],
	[<item:mekanismtools:refined_obsidian_sword>, <item:mekanism:alloy_atomic>,    IIngredientEmpty.getInstance()]]);

craftingTable.remove(<item:mekaweapons:mekatana>);
craftingTable.addShaped("mekaweapons.mekatana", <item:mekaweapons:mekatana>,
	[[<tag:items:forge:circuits/ultimate>, <item:mekaweapons:katana_blade>,      <tag:items:forge:circuits/ultimate>],
	[<item:mekanism:hdpe_sheet>,           <item:aotdextras:nihilum_block>,      <item:mekanism:hdpe_sheet>],
	[<item:mekanism:pellet_polonium>,      <item:mekanism:basic_induction_cell>, <item:mekanism:pellet_polonium>]]);

craftingTable.remove(<item:mekanism:electric_bow>);
craftingTable.addShaped("mekanism.electric_bow", <item:mekanism:electric_bow>,
	[[IIngredientEmpty.getInstance(),     <tag:items:mekanism:alloys/infused>, <item:mekaweapons:bow_limb>],
	[<tag:items:mekanism:alloys/infused>, <item:mekanism:energy_tablet>,       <item:mekaweapons:bow_limb>],
	[IIngredientEmpty.getInstance(),      <tag:items:mekanism:alloys/infused>, <item:mekaweapons:bow_limb>]]);
craftingTable.remove(<item:mekaweapons:bow_riser>);
craftingTable.addShaped("mekaweapons.bow_riser", <item:mekaweapons:bow_riser>,
	[[<tag:items:forge:circuits/ultimate>,      <item:mekanism:alloy_atomic>,         <tag:items:forge:circuits/ultimate>],
	[<tag:items:forge:ingots/refined_obsidian>, <item:mekanism:basic_induction_cell>, <tag:items:forge:ingots/refined_obsidian>]]);
craftingTable.remove(<item:mekaweapons:mekabow>);
craftingTable.addShaped("mekaweapons.mekabow", <item:mekaweapons:mekabow>,
	[[<item:mekanism:pellet_polonium>,          <item:mekaweapons:bow_riser>,    <item:mekanism:pellet_polonium>],
	[<tag:items:forge:ingots/steel>,            <item:aotdextras:nihilum_block>, <tag:items:forge:ingots/steel>],
	[<tag:items:forge:ingots/refined_obsidian>, <item:mekanism:electric_bow>,    <tag:items:forge:ingots/refined_obsidian>]]);

craftingTable.remove(<item:bhc:blade_of_vitality>);
craftingTable.addShaped("bhc.blade_of_vitality", <item:bhc:blade_of_vitality>, [[IIngredientEmpty.getInstance(), <item:bhc:canister>, <item:bhc:canister>], [<item:bhc:canister>, <item:bhc:soul_heart_crystal>, <item:bhc:canister>], [<item:mekanismtools:refined_obsidian_sword>, <item:bhc:canister>, IIngredientEmpty.getInstance()]]);
addCrusherRecycling(<item:bhc:blade_of_vitality>, <item:bhc:soul_heart_crystal>);

craftingTable.removeByName("mekanism:meka_tool");
craftingTable.addShaped("mekanism.meka_tool", <item:mekanism:meka_tool>,
	[[<tag:items:forge:circuits/ultimate>, <item:mekanismtools:refined_obsidian_paxel>, <tag:items:forge:circuits/ultimate>],
	[<item:mekanism:hdpe_sheet>,           <item:mekanism:atomic_disassembler>,         <item:mekanism:hdpe_sheet>],
	[<item:mekanism:pellet_polonium>,      <item:mekanism:basic_induction_cell>,        <item:mekanism:pellet_polonium>]]);

// PAXELS ------------------------------------------------------------------------------------------------------------------------------------
craftingTable.remove(<item:mekanismtools:iron_paxel>);
craftingTable.remove(<item:mekanismtools:bronze_paxel>);
craftingTable.remove(<item:mekanismtools:steel_paxel>);
craftingTable.remove(<item:mekanismtools:diamond_paxel>);
smithing.remove(<item:mekanismtools:netherite_paxel>);
craftingTable.remove(<item:mekanismtools:osmium_paxel>);
craftingTable.remove(<item:mekanismtools:refined_obsidian_paxel>);
craftingTable.addShaped("mekanismtools.iron_paxel", <item:mekanismtools:iron_paxel>, [[<tag:items:aotdextras:iron_level_axe>, <tag:items:aotdextras:iron_level_pickaxe>, <tag:items:aotdextras:iron_level_shovel>], [IIngredientEmpty.getInstance(), <item:minecraft:stick>, IIngredientEmpty.getInstance()], [IIngredientEmpty.getInstance(), <item:minecraft:stick>, IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("mekanismtools.bronze_paxel", <item:mekanismtools:bronze_paxel>, [[<item:mekanismtools:bronze_axe>.anyDamage(), <item:mekanismtools:bronze_pickaxe>.anyDamage(), <item:mekanismtools:bronze_shovel>.anyDamage()], [IIngredientEmpty.getInstance(), <item:mekanismtools:iron_paxel>.anyDamage(), IIngredientEmpty.getInstance()], [IIngredientEmpty.getInstance(), <item:aotdextras:obscurium_ingot>, IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("mekanismtools.steel_paxel", <item:mekanismtools:steel_paxel>, [[<item:mekanismtools:steel_axe>.anyDamage(), <item:mekanismtools:steel_pickaxe>.anyDamage(), <item:mekanismtools:steel_shovel>.anyDamage()], [IIngredientEmpty.getInstance(), <item:mekanismtools:bronze_paxel>.anyDamage(), IIngredientEmpty.getInstance()], [IIngredientEmpty.getInstance(), <item:aotdextras:obscurium_block>, IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("mekanismtools.diamond_paxel", <item:mekanismtools:diamond_paxel>, [[<item:minecraft:diamond_axe>.anyDamage(), <item:minecraft:diamond_pickaxe>.anyDamage(), <item:minecraft:diamond_shovel>.anyDamage()], [IIngredientEmpty.getInstance(), <item:mekanismtools:steel_paxel>.anyDamage(), IIngredientEmpty.getInstance()], [IIngredientEmpty.getInstance(), <item:aotdextras:occultium_ingot>, IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("mekanismtools.netherite_paxel", <item:mekanismtools:netherite_paxel>, [[<item:minecraft:netherite_axe>.anyDamage(), <item:minecraft:netherite_pickaxe>.anyDamage(), <item:minecraft:netherite_shovel>.anyDamage()], [IIngredientEmpty.getInstance(), <item:mekanismtools:diamond_paxel>.anyDamage(), IIngredientEmpty.getInstance()], [IIngredientEmpty.getInstance(), <item:aotdextras:occultium_block>, IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("mekanismtools.osmium_paxel", <item:mekanismtools:osmium_paxel>, [[<item:mekanismtools:osmium_axe>.anyDamage(), <item:mekanismtools:osmium_pickaxe>.anyDamage(), <item:mekanismtools:osmium_shovel>.anyDamage()], [IIngredientEmpty.getInstance(), <item:mekanismtools:netherite_paxel>.anyDamage(), IIngredientEmpty.getInstance()], [IIngredientEmpty.getInstance(), <item:aotdextras:nihilum_ingot>, IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("mekanismtools.refined_obsidian_paxel", <item:mekanismtools:refined_obsidian_paxel>, [[<item:mekanismtools:refined_obsidian_axe>.anyDamage(), <item:mekanismtools:refined_obsidian_pickaxe>.anyDamage(), <item:mekanismtools:refined_obsidian_shovel>.anyDamage()], [IIngredientEmpty.getInstance(), <item:mekanismtools:osmium_paxel>.anyDamage(), IIngredientEmpty.getInstance()], [IIngredientEmpty.getInstance(), <item:aotdextras:nihilum_block>, IIngredientEmpty.getInstance()]]);
addCrusherRecycling(<item:mekanismtools:gold_paxel>, <item:mekanism:dust_gold> * 3);
addCrusherRecycling(<item:mekanismtools:lapis_lazuli_paxel>, <item:mekanism:dust_lapis_lazuli> * 3);
addCrusherRecycling(<item:mekanismtools:refined_glowstone_paxel>, <item:minecraft:glowstone_dust> * 3);
addCrusherRecycling(<item:mekanismtools:iron_paxel>, <item:mekanism:dust_iron> * 3);
addCrusherRecycling(<item:mekanismtools:bronze_paxel>, <item:mekanism:dust_bronze> * 3);
addCrusherRecycling(<item:mekanismtools:steel_paxel>, <item:mekanism:dust_steel> * 3);
addCrusherRecycling(<item:mekanismtools:diamond_paxel>, <item:mekanism:dust_diamond> * 3);
addCrusherRecycling(<item:mekanismtools:netherite_paxel>, <item:minecraft:netherite_scrap> * 14);
addCrusherRecycling(<item:mekanismtools:osmium_paxel>, <item:mekanism:dust_osmium> * 3);
addCrusherRecycling(<item:mekanismtools:refined_obsidian_paxel>, <item:mekanism:dust_refined_obsidian> * 3);

// SHIELDS -----------------------------------------------------------------------------------------------------------------------------------
craftingTable.removeByName("unusualend:end_blob_shield");
craftingTable.remove(<tag:items: forge:tools/shields>);
craftingTable.addShaped("mekanismtools.lapis_lazuli_shield", <item: mekanismtools:lapis_lazuli_shield>,
	[[<tag:items: minecraft:planks>,  <item:aotdextras:obscurium_ingot>, <tag:items: minecraft:planks>],
	 [<item: minecraft:lapis_lazuli>, <tag:items: minecraft:planks>,     <item: minecraft:lapis_lazuli>],
	 [IIngredientEmpty.getInstance(), <item: minecraft:lapis_lazuli>,    IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("mekanismtools.refined_glowstone_shield", <item: mekanismtools:refined_glowstone_shield>,
	[[<tag:items: minecraft:planks>,            <item:aotdextras:obscurium_ingot>,        <tag:items: minecraft:planks>],
	 [<item: mekanism:ingot_refined_glowstone>, <tag:items: minecraft:planks>,            <item: mekanism:ingot_refined_glowstone>],
	 [IIngredientEmpty.getInstance(),           <item: mekanism:ingot_refined_glowstone>, IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("minecraft.shield", <item: minecraft:shield>,
	[[<tag:items: minecraft:planks>,  <item:aotdextras:obscurium_ingot>, <tag:items: minecraft:planks>],
	 [<item: minecraft:iron_ingot>,   <tag:items: minecraft:planks>,     <item: minecraft:iron_ingot>],
	 [IIngredientEmpty.getInstance(), <item: minecraft:iron_ingot>,      IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("mekanismtools.bronze_shield", <item: mekanismtools:bronze_shield>,
	[[<tag:items: minecraft:planks>,  <item:aotdextras:obscurium_ingot>, <tag:items: minecraft:planks>],
	 [<item: mekanism:ingot_bronze>,  <tag:items: minecraft:planks>,     <item: mekanism:ingot_bronze>],
	 [IIngredientEmpty.getInstance(), <item: mekanism:ingot_bronze>,     IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("mekanismtools.steel_shield", <item: mekanismtools:steel_shield>,
	[[<tag:items: minecraft:planks>,  <item:aotdextras:obscurium_ingot>, <tag:items: minecraft:planks>],
	 [<item: mekanism:ingot_steel>,   <tag:items: minecraft:planks>,     <item: mekanism:ingot_steel>],
	 [IIngredientEmpty.getInstance(), <item: mekanism:ingot_steel>,      IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("mekanismtools.osmium_shield", <item: mekanismtools:osmium_shield>,
	[[<tag:items: minecraft:planks>,  <item:aotdextras:obscurium_ingot>, <tag:items: minecraft:planks>],
	 [<item: mekanism:ingot_osmium>,  <tag:items: minecraft:planks>,     <item: mekanism:ingot_osmium>],
	 [IIngredientEmpty.getInstance(), <item: mekanism:ingot_osmium>,     IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("mekanismtools.refined_obsidian_shield", <item: mekanismtools:refined_obsidian_shield>,
	[[<tag:items: minecraft:planks>,           <item:aotdextras:obscurium_ingot>,       <tag:items: minecraft:planks>],
	 [<item: mekanism:ingot_refined_obsidian>, <tag:items: minecraft:planks>,           <item: mekanism:ingot_refined_obsidian>],
	 [IIngredientEmpty.getInstance(),          <item: mekanism:ingot_refined_obsidian>, IIngredientEmpty.getInstance()]]);
smithing.addRecipe("unusualend.end_blob_shield_smthing", <item:unusualend:blob_shield>.withTag({Enchantments: [{lvl: 5, id: "apotheosis:shield_bash"}, {lvl: 3, id: "minecraft:unbreaking"}]}), <item:mekanismtools:lapis_lazuli_shield>, <item: unusualend:enderblob_block>);
addCrusherRecycling(<item:mekanismtools:lapis_lazuli_shield>, <item:mekanism:dust_lapis_lazuli>);
addCrusherRecycling(<item:mekanismtools:refined_glowstone_shield>, <item:minecraft:glowstone_dust>);
addCrusherRecycling(<item:minecraft:shield>, <item:mekanism:dust_iron>);
addCrusherRecycling(<item:mekanismtools:bronze_shield>, <item:mekanism:dust_bronze>);
addCrusherRecycling(<item:mekanismtools:steel_shield>, <item:mekanism:dust_steel>);
addCrusherRecycling(<item:mekanismtools:osmium_shield>, <item:mekanism:dust_osmium>);
addCrusherRecycling(<item:mekanismtools:refined_obsidian_shield>, <item:mekanism:dust_refined_obsidian>);

// MISC ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// create functions for Apotheosis salvaging
function addSalvagingRecipe1(itemIn as IIngredient, minCount as int, maxCount as int, itemOut as IIngredient) as void {
<recipetype:apotheosis:salvaging>.addJsonRecipe("aotd_salvaging_recycling." + itemIn.items[0].registryName.path, {
	"type": "apotheosis:salvaging",
	"conditions": [{
		"type": "apotheosis:module",
		"module": "adventure"
	}],
	"input": {
		"item": itemIn.items[0].registryName
	},
	"outputs": [{
		"min_count": minCount,
		"max_count": maxCount,
		"stack": {
			"item": itemOut.items[0].registryName
		}
	}]
});}
function addSalvagingRecipe2(itemIn as IIngredient, minCount as int[], maxCount as int[], itemOut as IIngredient[]) as void {
<recipetype:apotheosis:salvaging>.addJsonRecipe("aotd_salvaging_recycling." + itemIn.items[0].registryName.path, {
	"type": "apotheosis:salvaging",
	"conditions": [{
		"type": "apotheosis:module",
		"module": "adventure"
	}],
	"input": {
		"item": itemIn.items[0].registryName
	},
	"outputs": [{
		"min_count": minCount[0],
		"max_count": maxCount[0],
		"stack": {
			"item": itemOut[0].items[0].registryName
		}
	},
	{
		"min_count": minCount[1],
		"max_count": maxCount[1],
		"stack": {
			"item": itemOut[1].items[0].registryName
		}
	}]
});}

// traps
addSalvagingRecipe1(<item:born_in_chaos_v1:spiny_shell_trap>, 0, 2, <item:born_in_chaos_v1:spiny_shell>);
addCrusherRecycling(<item:born_in_chaos_v1:spiny_shell_trap>, <item:born_in_chaos_v1:spiny_shell>);
addSalvagingRecipe2(<item:born_in_chaos_v1:hound_trap>, [1,1], [3,4], [<item:mekanism:dust_iron>, <item:born_in_chaos_v1:fangofthe_hound_leader>]);
addCrusherRecycling(<item:born_in_chaos_v1:hound_trap>, <item:born_in_chaos_v1:fangofthe_hound_leader> * 2);

// chakrams
craftingTable.remove(<item:aquamirae:poisoned_chakra>);
craftingTable.addShaped("aquamirae.poisoned_chakra", <item:aquamirae:poisoned_chakra>,
	[[<tag:items:aotdextras:poisoner>, <item:minecraft:diamond>,       <tag:items:aotdextras:poisoner>],
	 [<item:minecraft:diamond>,        IIngredientEmpty.getInstance(), <item:minecraft:diamond>],
	 [<tag:items:aotdextras:poisoner>, <item:minecraft:diamond>,       <tag:items:aotdextras:poisoner>]]);
addCrusherRecycling(<item:aquamirae:poisoned_chakra>, <item:mekanism:dust_diamond> * 2);
addCrusherRecycling(<item:aquamirae:maze_rose>, <item:aquamirae:abyssal_amethyst> * 2);

// minecarts
addSalvagingRecipe1(<item:minecraft:minecart>, 1, 5, <item:mekanism:dust_iron>);
addCrusherRecycling(<item:minecraft:minecart>, <item:mekanism:dust_iron> * 2);
addSalvagingRecipe1(<item:minecraft:chest_minecart>, 1, 5, <item:mekanism:dust_iron>);
addCrusherRecycling(<item:minecraft:chest_minecart>, <item:mekanism:dust_iron> * 2);
addSalvagingRecipe1(<item:minecraft:furnace_minecart>, 1, 5, <item:mekanism:dust_iron>);
addCrusherRecycling(<item:minecraft:furnace_minecart>, <item:mekanism:dust_iron> * 2);
addSalvagingRecipe1(<item:minecraft:tnt_minecart>, 1, 5, <item:mekanism:dust_iron>);
addCrusherRecycling(<item:minecraft:tnt_minecart>, <item:mekanism:dust_iron> * 2);
addSalvagingRecipe1(<item:minecraft:hopper_minecart>, 2, 10, <item:mekanism:dust_iron>);
addCrusherRecycling(<item:minecraft:hopper_minecart>, <item:mekanism:dust_iron> * 5);

// pressure plates
addSalvagingRecipe1(<item:minecraft:light_weighted_pressure_plate>, 1, 2, <item:mekanism:dust_gold>);
addCrusherRecycling(<item:minecraft:light_weighted_pressure_plate>, <item:mekanism:dust_gold>);
addSalvagingRecipe1(<item:minecraft:heavy_weighted_pressure_plate>, 1, 2, <item:mekanism:dust_iron>);
addCrusherRecycling(<item:minecraft:heavy_weighted_pressure_plate>, <item:mekanism:dust_iron>);

// staffs
addCrusherRecycling(<item:born_in_chaos_v1:staffof_magic_arrows>, <item:born_in_chaos_v1:seedof_chaos>);
addCrusherRecycling(<item:born_in_chaos_v1:staffofthe_summoner>, <item:born_in_chaos_v1:orbofthe_summoner>);

// trident
addCrusherRecycling(<item:minecraft:trident>, <item:upgrade_aquatic:thrasher_tooth>);
