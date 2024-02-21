// "Afraid of the Dark" Minecraft modpack, by Retinite.
// 
// This file adds a variety of crossover recipes, usually to Mekanism machines.

import crafttweaker.api.ingredient.type.IIngredientEmpty;
import mods.jeitweaker.Jei;
import crafttweaker.api.tag.MCTag;

<recipetype:apotheosis:fletching>.addJsonRecipe("apotheosis.crystal_arrow_fletching", {
	"type": "apotheosis:fletching",
	"conditions": [{
		"type": "apotheosis:module",
		"module": "village"
	}],
	"ingredients": [{
			"item": "monsterplus:crystal_shard"
		},
		{
			"item": "minecraft:bone"
		},
		{
			"item": "minecraft:feather"
		}
	],
	"result": {
		"item": "monsterplus:crystal_arrow",
		"count": 8
	}
});

<recipetype:apotheosis:fletching>.addJsonRecipe("unusualend.phantom_arrow_fletching", {
	"type": "apotheosis:fletching",
	"conditions": [{
		"type": "apotheosis:module",
		"module": "village"
	}],
	"ingredients": [{
			"item": "minecraft:flint"
		},
		{
			"item": "minecraft:stick"
		},
		{
			"item": "minecraft:phantom_membrane"
		}
	],
	"result": {
		"item": "unusualend:phantom_arrow",
		"count": 4
	}
});

// add basic chainmail recipes
craftingTable.addShaped("minecraft.chainmail_helmet", <item:minecraft:chainmail_helmet>,
	[[<item:minecraft:iron_bars>,    <item:minecraft:iron_bars>,     <item:minecraft:iron_bars>],
	[<item:minecraft:iron_bars>,     IIngredientEmpty.getInstance(), <item:minecraft:iron_bars>]]);
craftingTable.addShaped("minecraft.chainmail_chestplate", <item:minecraft:chainmail_chestplate>,
	[[<item:minecraft:iron_bars>, IIngredientEmpty.getInstance(), <item:minecraft:iron_bars>],
	[<item:minecraft:iron_bars>,  <item:minecraft:iron_bars>,     <item:minecraft:iron_bars>],
	[<item:minecraft:iron_bars>,  <item:minecraft:iron_bars>,     <item:minecraft:iron_bars>]]);
craftingTable.addShaped("minecraft.chainmail_leggings", <item:minecraft:chainmail_leggings>,
	[[<item:minecraft:iron_bars>, <item:minecraft:iron_bars>,     <item:minecraft:iron_bars>],
	[<item:minecraft:iron_bars>,  IIngredientEmpty.getInstance(), <item:minecraft:iron_bars>],
	[<item:minecraft:iron_bars>,  IIngredientEmpty.getInstance(), <item:minecraft:iron_bars>]]);
craftingTable.addShaped("minecraft.chainmail_boots", <item:minecraft:chainmail_boots>,
	[[<item:minecraft:iron_bars>, IIngredientEmpty.getInstance(), <item:minecraft:iron_bars>],
	[<item:minecraft:iron_bars>,  IIngredientEmpty.getInstance(), <item:minecraft:iron_bars>]]);

// allow mob drop conversions into other resources
furnace.removeByName("undead_unleashed:iron_smelting");
blastFurnace.removeByName("undead_unleashed:iron_blasting");
smithing.addRecipe("dark_metal_into_grave", <item: undead_unleashed:grave_metal_ingot>, <item: born_in_chaos_v1:dark_metal_ingot>, <item: undead_unleashed:grave_metal_scrap>);
smithing.addRecipe("grave_into_dark_metal", <item: born_in_chaos_v1:dark_metal_ingot>, <item: undead_unleashed:grave_metal_ingot>, <item: born_in_chaos_v1:pieceofdarkmetal>);
<recipetype:mekanism:enriching>.addRecipe("dark_metal_into_steel", <item: born_in_chaos_v1:dark_metal_ingot>, <item: mekanism:ingot_steel>);
<recipetype:mekanism:enriching>.addRecipe("grave_into_steel", <item: undead_unleashed:grave_metal_ingot>, <item: mekanism:ingot_steel>);
<recipetype:mekanism:enriching>.addRecipe("zenyr_into_iron", <item: tenebrous_lands:zenyr>, <item: minecraft:iron_ingot> * 2);
<recipetype:mekanism:enriching>.addRecipe("dark_iron_into_steel", <item: graveyard:dark_iron_ingot>, <item: mekanism:ingot_steel>);
<recipetype:mekanism:enriching>.addRecipe("gem_into_diamond", <item: john_mod_reborn:immortalitygem>, <item: minecraft:diamond>);
<recipetype:mekanism:enriching>.addRecipe("tear_into_scrap", <item: john_mod_reborn:bloody_tear>, <item: minecraft:netherite_scrap>);
<recipetype:mekanism:enriching>.addRecipe("crystal_into_diamond", <item: monsterplus:ancient_crystal>, <item: minecraft:diamond>);

// add born_in_chaos smoking/blasting recipes to mekanism smelters
<recipetype:mekanism:smelting>.addRecipe("born_in_chaos_v1.dark_metalngot_k", <item: born_in_chaos_v1:pileof_dark_metal>, <item: born_in_chaos_v1:dark_metal_ingot>);
<recipetype:mekanism:smelting>.addRecipe("born_in_chaos_v1.smoked_flesh_k", <item: minecraft:rotten_flesh>, <item: born_in_chaos_v1:smoked_flesh>);
<recipetype:mekanism:smelting>.addRecipe("born_in_chaos_v1.smoked_monster_flesh_k", <item: born_in_chaos_v1:monster_flesh>, <item: born_in_chaos_v1:smoked_monster_flesh>);
<recipetype:mekanism:smelting>.addRecipe("born_in_chaos_v1.smoked_fish_k", <item: born_in_chaos_v1:rotten_fish>, <item: born_in_chaos_v1:smoked_fish>);

// add Mekanism sawmill recipes for new logs (requires new tags)
<recipetype:mekanism:sawing>.addRecipe("sawing.river", <tag:items: upgrade_aquatic:river_logs>, <item: upgrade_aquatic:river_planks> * 6, <item: mekanism:sawdust>, 0.25);
<recipetype:mekanism:sawing>.addRecipe("sawing.driftwood", <tag:items: upgrade_aquatic:driftwood_logs>, <item: upgrade_aquatic:driftwood_planks> * 6, <item: mekanism:sawdust>, 0.25);
<tag:items: born_in_chaos_v1:scorched_log>.add([<item: born_in_chaos_v1:scorched_log>, <item: born_in_chaos_v1:scorched_wood>, <item: born_in_chaos_v1:stripped_scorched_log>, <item: born_in_chaos_v1:stripped_scorched_wood>]);
<recipetype:mekanism:sawing>.addRecipe("sawing.scorched", <tag:items: born_in_chaos_v1:scorched_log>, <item: born_in_chaos_v1:scorched_planks> * 6, <item: mekanism:sawdust>, 0.25);
<tag:items: born_in_chaos_v1:smoldering_scorched_log>.add([<item: born_in_chaos_v1:smoldering_scorched_log>, <item: born_in_chaos_v1:smoldering_scorched_wood>]);
<recipetype:mekanism:sawing>.addRecipe("sawing.smoldering", <tag:items: born_in_chaos_v1:smoldering_scorched_log>, <item: born_in_chaos_v1:scorched_planks> * 6, <item: born_in_chaos_v1:fire_dust>, 0.25);
<tag:items: gardens_of_the_dead:soulblight_stem>.add([<item: gardens_of_the_dead:soulblight_stem>, <item: gardens_of_the_dead:soulblight_hyphae>, <item: gardens_of_the_dead:stripped_soulblight_stem>, <item: gardens_of_the_dead:stripped_soulblight_hyphae>]);
<recipetype:mekanism:sawing>.addRecipe("sawing.soulblight", <tag:items: gardens_of_the_dead:soulblight_stem>, <item: gardens_of_the_dead:soulblight_planks> * 6, <item: gardens_of_the_dead:soulblight_sprouts>, 0.25);

// add armored variant to jetpack module recipe because it feels like it's missing
craftingTable.removeByName("mekanism:module_jetpack_unit");
<tag:items: mekanism:jetpack>.add([<item: mekanism:jetpack>, <item: mekanism:jetpack_armored>]);
craftingTable.addShaped("mekanism.module_jetpack_unit", <item:mekanism:module_jetpack_unit>,
	[[<tag:items:forge:alloys/elite>,    <tag:items: mekanism:jetpack>,      <tag:items:forge:alloys/elite>],
	[<tag:items:forge:alloys/elite>,     <item:mekanism:module_base>,        <tag:items:forge:alloys/elite>],
	[<tag:items:forge:pellets/polonium>, <tag:items:forge:pellets/polonium>, <tag:items:forge:pellets/polonium>]]);

// add recipe for budding amethyst
craftingTable.addShaped("aotd.budding_amethyst", <item: minecraft:budding_amethyst>,
	[[<item: minecraft:amethyst_block>, <item: minecraft:amethyst_block>,    <item: minecraft:amethyst_block>],
	[<item: minecraft:amethyst_block>,  <item: monsterplus:ancient_crystal>, <item: minecraft:amethyst_block>],
	[<item: minecraft:amethyst_block>,  <item: minecraft:amethyst_block>,    <item: minecraft:amethyst_block>]]);

// add recipe for wither skeleton skull to give wither bones more utility
craftingTable.addShaped("aotd.wither_skeleton_skull", <item: minecraft:wither_skeleton_skull>,
	[[<item: bhc:wither_bone>, <item: bhc:wither_bone>,          <item: bhc:wither_bone>],
	[ <item: bhc:wither_bone>, <item: minecraft:skeleton_skull>, <item: bhc:wither_bone>],
	[ <item: bhc:wither_bone>, <item: bhc:wither_bone>,          <item: bhc:wither_bone>]]);

// add recipe for Unusual End's Void Totem
craftingTable.addShapeless("unusualend.void_totem", <item: unusualend:void_totem>,
	[<item: minecraft:totem_of_undying>, <item: born_in_chaos_v1:death_totem>, <item: unusualend:wandering_pearl>, <item: unusualend:end_blob_jelly>]);

// add recipe for ghast tears since ghasts are very rare
<recipetype:mekanism:enriching>.addRecipe("corruption_into_tear", <item: graveyard:corruption> * 8, <item: minecraft:ghast_tear>);

// add recipes for Aquamirae's Coral Lance and Sweet Lance transmutations
smithing.addRecipe("aquamirae.coral_transmutation", <item:aquamirae:coral_lance>, <item:aquamirae:sweet_lance>, <item:born_in_chaos_v1:transmuting_elixir>);
smithing.addRecipe("aquamirae.sweet_transmutation", <item:aquamirae:sweet_lance>, <item:aquamirae:coral_lance>, <item:born_in_chaos_v1:transmuting_elixir>);

// add renewable recipes for Deep Dark Regrowth's Galm and Born in Chaos's Black Argillite, used in Nihilum ingots
smithing.addRecipe("deep_dark_regrowth.galm", <item: deep_dark_regrowth:galm>, <item: minecraft:sculk>, <item: graveyard:corruption>);
smithing.addRecipe("born_in_chaos_v1.black_argillite", <item: born_in_chaos_v1:black_argillite>, <item: minecraft:stone>, <item: graveyard:corruption>);

// add Mekanism recipes for Illuminative's Glowing Mushrooms and Deep Dark Regrowth Infected Mushrooms
<recipetype:mekanism:crushing>.addRecipe("glowing_into_biofuel", <item: illuminative:glowing_mushroom>, <item: mekanism:bio_fuel> * 5);
<recipetype:mekanism:crushing>.addRecipe("glowing_block_into_biofuel", <item: illuminative:glowing_mushroom_block>, <item: mekanism:bio_fuel> * 45);
<recipetype:mekanism:infusion_conversion>.addRecipe("glowing_into_fungi", <item: illuminative:glowing_mushroom>, <infuse_type:mekanism:fungi> * 10);
<recipetype:mekanism:infusion_conversion>.addRecipe("infected_into_fungi", <item: deep_dark_regrowth:infected_mushroom>, <infuse_type:mekanism:fungi> * 10);
<recipetype:mekanism:infusion_conversion>.addRecipe("short_infected_into_fungi", <item: deep_dark_regrowth:short_infected_mushroom>, <infuse_type:mekanism:fungi> * 8);
<recipetype:mekanism:infusion_conversion>.addRecipe("large_infected_into_fungi", <item: deep_dark_regrowth:large_infected_mushroom>, <infuse_type:mekanism:fungi> * 15);

// add Illuminative's (missing?) Glow Ink Sac decompression recipe
craftingTable.addShapeless("illuminative.glow_decompress", <item: minecraft:glow_ink_sac> * 9, [<item: illuminative:glow_inc_sac_block>]);

// add Born in Chaos's Staff of Blindness
smithing.addRecipe("born_in_chaos_v1.staffof_blindness", <item: born_in_chaos_v1:staffof_blindness>, <item: minecraft:blaze_rod>, <item: born_in_chaos_v1:transmuting_elixir>);

// modify Apotheosis's rarity materials to be converted back and forth
craftingTable.addShapeless("apotheosis.uncommon_material", <item: apotheosis:uncommon_material>,
	[<item: apotheosis:common_material>, <item: apotheosis:common_material>, <item: apotheosis:common_material>]);
craftingTable.addShapeless("apotheosis.rare_material", <item: apotheosis:rare_material>,
	[<item: apotheosis:uncommon_material>, <item: apotheosis:uncommon_material>, <item: apotheosis:uncommon_material>]);
craftingTable.addShapeless("apotheosis.epic_material", <item: apotheosis:epic_material>,
	[<item: apotheosis:rare_material>, <item: apotheosis:rare_material>, <item: apotheosis:rare_material>]);
craftingTable.addShapeless("apotheosis.mythic_material", <item: apotheosis:mythic_material>,
	[<item: apotheosis:epic_material>, <item: apotheosis:epic_material>, <item: apotheosis:epic_material>]);
craftingTable.addShapeless("apotheosis.mythic_material_decompress", <item: apotheosis:epic_material> * 3, [<item: apotheosis:mythic_material>]);
craftingTable.addShapeless("apotheosis.epic_material_decompress", <item: apotheosis:rare_material> * 3, [<item: apotheosis:epic_material>]);
craftingTable.addShapeless("apotheosis.rare_material_decompress", <item: apotheosis:uncommon_material> * 3, [<item: apotheosis:rare_material>]);
craftingTable.addShapeless("apotheosis.uncommon_material_decompress", <item: apotheosis:common_material> * 3, [<item: apotheosis:uncommon_material>]);

// make the wooden paxel count as fuel
<item: mekanismtools:wood_paxel>.burnTime = 400;

// allow extra Soul Jars to be converted into Lost Souls
<recipetype:mekanism:crushing>.addRecipe("soul_jar_into_lost_soul", <item: majruszsdifficulty:soul_jar>, <item: undead_unleashed:lost_soul>);

// add chemical injection recipe for Unusual End's Shiny Gloopstone
<recipetype:mekanism:injecting>.addRecipe("unusualend.shiny_gloopstone", <item:unusualend:shiny_gloopstone>, <gas:mekanism:hydrogen_chloride>, <item:unusualend:shiny_crystal> * 2);

// add early Unusual End's Golem Orb recipe
smithing.addRecipe("unusualend.golem_orb", <item:unusualend:golem_orb>, <item:born_in_chaos_v1:orbofthe_summoner>, <item:deep_dark_regrowth:heart_goo>);

// add sculk soil recipe
craftingTable.addShapeless("deep_dark_regrowth.sculk_soil", <item:deep_dark_regrowth:sculk_soil>, [<item:minecraft:soul_soil>, <item:minecraft:sculk>]);