// "Afraid of the Dark" Minecraft modpack, by Retinite.
// 
// This file adds a variety of crossover recipes, usually to Mekanism machines.

import crafttweaker.api.ingredient.type.IIngredientEmpty;
import crafttweaker.api.item.alchemy.Potion;
import crafttweaker.api.recipe.Brewing;

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
<recipetype:mekanism:enriching>.addRecipe("crystal_into_diamond", <item: monsterplus:ancient_crystal>, <item: minecraft:diamond>);
craftingTable.addShapeless("majruszsdifficulty.fang_into_bone_meal", <item: minecraft:bone_meal> * 16, [<item: majruszsdifficulty:cerberus_fang>]);
craftingTable.addShapeless("enemyexpansion.wasp_thorax_into_bone_meal", <item: minecraft:bone_meal> * 12, [<item: enemyexpansion:wasp_thorax>]);

// add born_in_chaos smoking/blasting recipes to mekanism smelters
<recipetype:mekanism:smelting>.addRecipe("born_in_chaos_v1.dark_metalngot_k", <item: born_in_chaos_v1:pileof_dark_metal>, <item: born_in_chaos_v1:dark_metal_ingot>);
<recipetype:mekanism:smelting>.addRecipe("born_in_chaos_v1.smoked_flesh_k", <item: minecraft:rotten_flesh>, <item: born_in_chaos_v1:smoked_flesh>);
<recipetype:mekanism:smelting>.addRecipe("born_in_chaos_v1.smoked_monster_flesh_k", <item: born_in_chaos_v1:monster_flesh>, <item: born_in_chaos_v1:smoked_monster_flesh>);
<recipetype:mekanism:smelting>.addRecipe("born_in_chaos_v1.smoked_fish_k", <item: born_in_chaos_v1:rotten_fish>, <item: born_in_chaos_v1:smoked_fish>);

// add Mekanism sawmill recipes for new logs
<recipetype:mekanism:sawing>.addRecipe("sawing.river", <tag:items: upgrade_aquatic:river_logs>, <item: upgrade_aquatic:river_planks> * 6, <item: mekanism:sawdust>, 0.25);
<recipetype:mekanism:sawing>.addRecipe("sawing.driftwood", <tag:items: upgrade_aquatic:driftwood_logs>, <item: upgrade_aquatic:driftwood_planks> * 6, <item: mekanism:sawdust>, 0.25);
<recipetype:mekanism:sawing>.addRecipe("sawing.scorched", <tag:items: born_in_chaos_v1:scorched_log>, <item: born_in_chaos_v1:scorched_planks> * 6, <item: mekanism:sawdust>, 0.25);
<recipetype:mekanism:sawing>.addRecipe("sawing.smoldering", <tag:items: born_in_chaos_v1:smoldering_scorched_log>, <item: born_in_chaos_v1:scorched_planks> * 6, <item: born_in_chaos_v1:fire_dust>, 0.25);
<recipetype:mekanism:sawing>.addRecipe("sawing.soulblight", <tag:items: gardens_of_the_dead:soulblight_stem>, <item: gardens_of_the_dead:soulblight_planks> * 6, <item: gardens_of_the_dead:soulblight_sprouts>, 0.25);
<recipetype:mekanism:sawing>.addRecipe("sawing.white_oak", <tag:items: luminousworld:white_oak_log>, <item: luminousworld:white_oak_plank> * 6, <item: mekanism:sawdust>, 0.25);
<recipetype:mekanism:sawing>.addRecipe("mekanism.sawing/fence_gate/white_oak", <item: luminousworld:white_oakfencegate>, <item: luminousworld:white_oak_plank> * 2, <item: minecraft:stick> * 4, 1.00);
<recipetype:mekanism:sawing>.addRecipe("mekanism.sawing/door/white_oak", <item: luminousworld:white_oak_door>, <item: luminousworld:white_oak_plank> * 2);
<recipetype:mekanism:sawing>.addRecipe("mekanism.sawing/trapdoor/white_oak", <item: luminousworld:whiteoaktrapdoor>, <item: luminousworld:white_oak_plank> * 3);
<recipetype:mekanism:sawing>.addRecipe("sawing.palm", <tag:items: luminousworld:palm_log>, <item: luminousworld:palmplank> * 6, <item: mekanism:sawdust>, 0.25);
<recipetype:mekanism:sawing>.addRecipe("mekanism.sawing/fence_gate/palm", <item: luminousworld:palm_fencegate>, <item: luminousworld:palmplank> * 2, <item: minecraft:stick> * 4, 1.00);
<recipetype:mekanism:sawing>.addRecipe("mekanism.sawing/door/palm", <item: luminousworld:palm_door>, <item: luminousworld:palmplank> * 2);
<recipetype:mekanism:sawing>.addRecipe("mekanism.sawing/trapdoor/palm", <item: luminousworld:palmtrapdoor>, <item: luminousworld:palmplank> * 3);
<recipetype:mekanism:sawing>.addRecipe("sawing.auburn", <tag:items: luminousworld:auburn_log>, <item: luminousworld:autumnplank> * 6, <item: mekanism:sawdust>, 0.25);
<recipetype:mekanism:sawing>.addRecipe("mekanism.sawing/fence_gate/auburn", <item: luminousworld:autumnfencegate>, <item: luminousworld:autumnplank> * 2, <item: minecraft:stick> * 4, 1.00);
<recipetype:mekanism:sawing>.addRecipe("mekanism.sawing/door/auburn", <item: luminousworld:auburn_door>, <item: luminousworld:autumnplank> * 2);
<recipetype:mekanism:sawing>.addRecipe("mekanism.sawing/trapdoor/auburn", <item: luminousworld:auburntrapdoor>, <item: luminousworld:autumnplank> * 3);
<recipetype:mekanism:sawing>.addRecipe("sawing.baobab", <tag:items: luminousworld:baobab_log>, <item: luminousworld:baobab_plank> * 6, <item: mekanism:sawdust>, 0.25);
<recipetype:mekanism:sawing>.addRecipe("mekanism.sawing/fence_gate/baobab", <item: luminousworld:baobab_fence_gate>, <item: luminousworld:baobab_plank> * 2, <item: minecraft:stick> * 4, 1.00);
<recipetype:mekanism:sawing>.addRecipe("mekanism.sawing/door/baobab", <item: luminousworld:baobab_door>, <item: luminousworld:baobab_plank> * 2);
<recipetype:mekanism:sawing>.addRecipe("mekanism.sawing/trapdoor/baobab", <item: luminousworld:baobabtrapdoor>, <item: luminousworld:baobab_plank> * 3);
craftingTable.addShapeless("newbirch_rec_2", <item: minecraft:birch_planks> * 4, [<item: luminousworld:tall_birch_wood>]);
<recipetype:mekanism:sawing>.addRecipe("sawing.soft_birch", <tag:items: luminousworld:soft_birch_log>, <item: minecraft:birch_planks> * 6, <item: mekanism:sawdust>, 0.25);

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
	[<item: minecraft:totem_of_undying>, <item: born_in_chaos_v1:death_totem>, <item: unusualend:wandering_pearl>]);

// add recipe for ghast tears since ghasts are very rare
<recipetype:mekanism:enriching>.addRecipe("corruption_into_tear", <item: graveyard:corruption> * 8, <item: minecraft:ghast_tear>);

// add recipes for Aquamirae's Coral Lance and Sweet Lance transmutations
smithing.addRecipe("aquamirae.coral_transmutation", <item:aquamirae:coral_lance>, <item:aquamirae:sweet_lance>, <item:born_in_chaos_v1:transmuting_elixir>);
smithing.addRecipe("aquamirae.sweet_transmutation", <item:aquamirae:sweet_lance>, <item:aquamirae:coral_lance>, <item:born_in_chaos_v1:transmuting_elixir>);

// add Mekanism recipes for Deep Dark Regrowth Infected Mushrooms
<recipetype:mekanism:infusion_conversion>.addRecipe("infected_into_fungi", <item: deep_dark_regrowth:infected_mushroom>, <infuse_type:mekanism:fungi> * 10);
<recipetype:mekanism:infusion_conversion>.addRecipe("short_infected_into_fungi", <item: deep_dark_regrowth:short_infected_mushroom>, <infuse_type:mekanism:fungi> * 8);
<recipetype:mekanism:infusion_conversion>.addRecipe("large_infected_into_fungi", <item: deep_dark_regrowth:large_infected_mushroom>, <infuse_type:mekanism:fungi> * 15);

// add Born in Chaos's Staff of Blindness
smithing.addRecipe("born_in_chaos_v1.staffof_blindness", <item: born_in_chaos_v1:staffof_blindness>, <item: minecraft:blaze_rod>, <item: born_in_chaos_v1:transmuting_elixir>);

// modify Apotheosis's rarity materials to be converted back and forth
craftingTable.addShapeless("apotheosis.uncommon_material", <item: apotheosis:uncommon_material>,
	[<item: apotheosis:common_material>, <item: apotheosis:common_material>, <item: apotheosis:common_material>,
	 <item: apotheosis:common_material>, <item: apotheosis:common_material>, <item: apotheosis:common_material>,
	 <item: apotheosis:common_material>, <item: apotheosis:common_material>]);
craftingTable.addShapeless("apotheosis.rare_material", <item: apotheosis:rare_material>,
	[<item: apotheosis:uncommon_material>, <item: apotheosis:uncommon_material>, <item: apotheosis:uncommon_material>,
	 <item: apotheosis:uncommon_material>, <item: apotheosis:uncommon_material>, <item: apotheosis:uncommon_material>,
	 <item: apotheosis:uncommon_material>, <item: apotheosis:uncommon_material>]);
craftingTable.addShapeless("apotheosis.epic_material", <item: apotheosis:epic_material>,
	[<item: apotheosis:rare_material>, <item: apotheosis:rare_material>, <item: apotheosis:rare_material>,
	 <item: apotheosis:rare_material>, <item: apotheosis:rare_material>, <item: apotheosis:rare_material>,
	 <item: apotheosis:rare_material>, <item: apotheosis:rare_material>]);
craftingTable.addShapeless("apotheosis.mythic_material", <item: apotheosis:mythic_material>,
	[<item: apotheosis:epic_material>, <item: apotheosis:epic_material>, <item: apotheosis:epic_material>,
	 <item: apotheosis:epic_material>, <item: apotheosis:epic_material>, <item: apotheosis:epic_material>,
	 <item: apotheosis:epic_material>, <item: apotheosis:epic_material>]);
craftingTable.addShapeless("apotheosis.mythic_material_decompress", <item: apotheosis:epic_material> * 8, [<item: apotheosis:mythic_material>]);
craftingTable.addShapeless("apotheosis.epic_material_decompress", <item: apotheosis:rare_material> * 8, [<item: apotheosis:epic_material>]);
craftingTable.addShapeless("apotheosis.rare_material_decompress", <item: apotheosis:uncommon_material> * 8, [<item: apotheosis:rare_material>]);
craftingTable.addShapeless("apotheosis.uncommon_material_decompress", <item: apotheosis:common_material> * 8, [<item: apotheosis:uncommon_material>]);

// make the wooden paxel count as fuel
<item: mekanismtools:wood_paxel>.burnTime = 800;

// allow extra Soul Jars to be converted into Lost Souls
<recipetype:mekanism:crushing>.addRecipe("soul_jar_into_lost_soul", <item: majruszsdifficulty:soul_jar>, <item: undead_unleashed:lost_soul>);

// add chemical injection recipe for Unusual End's Shiny Gloopstone
<recipetype:mekanism:injecting>.addRecipe("unusualend.shiny_gloopstone", <item:unusualend:shiny_gloopstone>, <gas:mekanism:hydrogen_chloride>, <item:unusualend:shiny_crystal> * 2);

// add sculk soil recipe
craftingTable.addShapeless("deep_dark_regrowth.sculk_soil", <item:deep_dark_regrowth:sculk_soil>, [<item:minecraft:soul_soil>, <item:minecraft:sculk>]);

// add Born in Chaos's Marigolds to appropriate tags
<recipetype:mekanism:enriching>.addRecipe("enrich_marigold", <item: born_in_chaos_v1:marigolds>, <item: minecraft:orange_dye> * 2);

// add Minecraft Saddle recipe & recycle
craftingTable.addShaped("aotd.saddle", <item:minecraft:saddle>,
	[[<item:minecraft:leather>,       <item:minecraft:leather>,       <item:minecraft:leather>],
	 [<item:minecraft:leather>,       IIngredientEmpty.getInstance(), <item:minecraft:leather>],
	 [<item:minecraft:tripwire_hook>, IIngredientEmpty.getInstance(), <item:minecraft:tripwire_hook>]]);
<recipetype:mekanism:sawing>.addRecipe("aotd_saddle_recycling", <item:minecraft:saddle>, <item:minecraft:leather> * 3, <item:minecraft:tripwire_hook> * 2, 0.5);

// add various Amethyst recipes
<recipetype:mekanism:crushing>.addRecipe("amethyst_block_crushing", <item:minecraft:amethyst_block>, <item:minecraft:amethyst_shard> * 4);
<recipetype:mekanism:crushing>.addRecipe("small_amethyst_bud_crushing", <item:minecraft:small_amethyst_bud>, <item:minecraft:amethyst_shard>);
<recipetype:mekanism:crushing>.addRecipe("medium_amethyst_bud_crushing", <item:minecraft:medium_amethyst_bud>, <item:minecraft:amethyst_shard> * 2);
<recipetype:mekanism:crushing>.addRecipe("large_amethyst_bud_crushing", <item:minecraft:large_amethyst_bud>, <item:minecraft:amethyst_shard> * 3);
<recipetype:mekanism:crushing>.addRecipe("amethyst_cluster_crushing", <item:minecraft:amethyst_cluster>, <item:minecraft:amethyst_shard> * 5);

// add recipes to use/recycle Born in Chaos's Charms
<recipetype:mekanism:crushing>.addRecipe("fury_charm_crushing", <item:born_in_chaos_v1:charmof_fury>.anyDamage(), <item:born_in_chaos_v1:ethereal_spirit> * 3);
<recipetype:mekanism:crushing>.addRecipe("endurance_charm_crushing", <item:born_in_chaos_v1:charmof_endurance>.anyDamage(), <item:born_in_chaos_v1:ethereal_spirit> * 2);
<recipetype:mekanism:crushing>.addRecipe("stealth_charm_crushing", <item:born_in_chaos_v1:charmof_stealth>.anyDamage(), <item:born_in_chaos_v1:ethereal_spirit> * 2);
<recipetype:mekanism:crushing>.addRecipe("resistance_charm_crushing", <item:born_in_chaos_v1:charmof_resistance>.anyDamage(), <item:born_in_chaos_v1:ethereal_spirit> * 2);
<recipetype:mekanism:crushing>.addRecipe("power_charm_crushing", <item:born_in_chaos_v1:charmof_power>.anyDamage(), <item:born_in_chaos_v1:ethereal_spirit> * 2);
smithing.addRecipe("unusualend.golem_orb", <item:unusualend:golem_orb>, <item:born_in_chaos_v1:orbofthe_summoner>, <tag:items: born_in_chaos_v1:charms>);

// allow Enemy Expansion's Healing Eye to make regen potions
brewing.addRecipe(<item:minecraft:potion>.withTag({Potion: "minecraft:regeneration"}), <item:enemyexpansion:healing_eye>, <item:minecraft:potion>.withTag({Potion: "minecraft:water"}));

// add Etherium Gem recipes
<recipetype:mekanism:crushing>.addRecipe("deep_dark_regrowth.etherium_block_decompress", <item:deep_dark_regrowth:etherium_block>, <item:deep_dark_regrowth:etherium_gem> * 2);
<recipetype:mekanism:enriching>.addRecipe("enrich_enlightened_deepslate", <item:deep_dark_regrowth:enlightened_deepslate>, <item:deep_dark_regrowth:etherium_gem> * 2);

// add a recipe for the Luminous Bestiary
craftingTable.addShapeless("luminousworld.bestiary", <item: luminousworld:beastiary>, [<item: ftbquests:book>, <item: patchouli:guide_book>.withTag({"patchouli:book": "apotheosis:apoth_chronicle"})]);

// add Twisted Horrors compressed recipes
craftingTable.addShaped("twisted_horrors.flint_block", <item: twisted_horrors:block_of_flint>,
	[[<item: minecraft:flint>, <item: minecraft:flint>, <item: minecraft:flint>],
	 [<item: minecraft:flint>, <item: minecraft:flint>, <item: minecraft:flint>],
	 [<item: minecraft:flint>, <item: minecraft:flint>, <item: minecraft:flint>]]);
craftingTable.addShapeless("twisted_horrors.flint_decompress", <item: minecraft:flint> * 9, [<item: twisted_horrors:block_of_flint>]);
craftingTable.addShapeless("twisted_horrors.charcoal_decompress", <item: minecraft:charcoal> * 9, [<item: twisted_horrors:block_of_charcoal>]);

// various iron recycling recipes ------------------------------------------------------------------------------------------------------------

<recipetype:mekanism:crushing>.addRecipe("aotd_blast_recycling", <item:minecraft:blast_furnace>, <item:mekanism:dust_iron> * 3);
// related: smoker recycling
<recipetype:mekanism:sawing>.addRecipe("aotd_smoker_recycling", <item:minecraft:smoker>, <item:minecraft:furnace>, <item:mekanism:sawdust> * 8);

<recipetype:mekanism:crushing>.addRecipe("aotd_compass_recycling", <item:minecraft:compass>, <item:mekanism:dust_iron> * 2);
// related: clock recycling
<recipetype:mekanism:crushing>.addRecipe("aotd_clock_recycling", <item:minecraft:clock>, <item:mekanism:dust_gold> * 2);
// related: recovery compass recycling
<recipetype:mekanism:crushing>.addRecipe("aotd_recovery_compass_recycling", <item:minecraft:recovery_compass>, <item:minecraft:echo_shard> * 6);

<recipetype:mekanism:crushing>.addRecipe("aotd_anvil_recycling", <item:minecraft:anvil>, <item:mekanism:dust_iron> * 27);
<recipetype:mekanism:crushing>.addRecipe("aotd_chipped_anvil_recycling", <item:minecraft:chipped_anvil>, <item:mekanism:dust_iron> * 18);
<recipetype:mekanism:crushing>.addRecipe("aotd_damaged_anvil_recycling", <item:minecraft:damaged_anvil>, <item:mekanism:dust_iron> * 9);

<recipetype:mekanism:crushing>.addRecipe("aotd_chain_recycling", <item:minecraft:chain>, <item:mekanism:dust_iron>);
<recipetype:mekanism:crushing>.addRecipe("aotd_iron_bars_recycling", <item:minecraft:iron_bars>, <item:minecraft:iron_nugget> * 8);
<recipetype:mekanism:crushing>.addRecipe("aotd_iron_door_recycling", <item:minecraft:iron_door>, <item:mekanism:dust_iron>);
<recipetype:mekanism:crushing>.addRecipe("aotd_iron_trapdoor_recycling", <item:minecraft:iron_trapdoor>, <item:mekanism:dust_iron> * 2);

<recipetype:mekanism:crushing>.addRecipe("aotd_cauldron_recycling", <item:minecraft:cauldron>, <item:mekanism:dust_iron> * 5);
<recipetype:mekanism:crushing>.addRecipe("aotd_hopper_recycling", <item:minecraft:hopper>, <item:mekanism:dust_iron> * 3);

<recipetype:mekanism:crushing>.addRecipe("aotd_crossbow_recycling", <item:minecraft:crossbow>.anyDamage(), <item:mekanism:dust_iron>);
<recipetype:mekanism:crushing>.addRecipe("aotd_flint_and_steel_recycling", <item:minecraft:flint_and_steel>.anyDamage(), <item:minecraft:iron_nugget> * 7);

<recipetype:mekanism:crushing>.addRecipe("aotd_rail_recycling", <item:minecraft:rail>, <item:minecraft:iron_nugget> * 6);
<recipetype:mekanism:crushing>.addRecipe("aotd_activator_rail_recycling", <item:minecraft:activator_rail>, <item:minecraft:iron_nugget> * 6);
<recipetype:mekanism:crushing>.addRecipe("aotd_detector_rail_recycling", <item:minecraft:detector_rail>, <item:minecraft:iron_nugget> * 6);
// related: powered rail recycling
<recipetype:mekanism:crushing>.addRecipe("aotd_powered_rail_recycling", <item:minecraft:powered_rail>, <item:minecraft:gold_nugget> * 6);
