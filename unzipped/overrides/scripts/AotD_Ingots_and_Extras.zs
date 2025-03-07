// "Afraid of the Dark" Minecraft modpack, by Retinite.
// 
// This file adds a variety of crossover recipes, usually to Mekanism machines.

import crafttweaker.api.ingredient.type.IIngredientEmpty;

// AotD Extras resources ---------------------------------------------------------------------------------------------------------------------

craftingTable.addShapeless("aotdextras.obscurium_ingot", <item: aotdextras:obscurium_ingot> * 2,
	[<tag:items: aotdextras:any_rotten>, <tag:items: aotdextras:raw_meat>, <tag:items: aotdextras:any_rotten>,
	 <tag:items: aotdextras:raw_fish>,   <tag:items: aotdextras:sticky>,   <tag:items: aotdextras:raw_fish>,
	 <tag:items: aotdextras:any_rotten>, <tag:items: aotdextras:raw_meat>, <tag:items: aotdextras:any_rotten>]);
craftingTable.addShapeless("aotdextras.obscurium_ingot_alt", <item: aotdextras:obscurium_ingot>,
	[<tag:items: aotdextras:any_rotten>, <tag:items: aotdextras:raw_meat>, <tag:items: aotdextras:any_rotten>,
	 <tag:items: aotdextras:raw_fish>,   <item: minecraft:bone_meal>,      <tag:items: aotdextras:raw_fish>,
	 <tag:items: aotdextras:any_rotten>, <tag:items: aotdextras:raw_meat>, <tag:items: aotdextras:any_rotten>]);
<recipetype:mekanism:metallurgic_infusing>.addRecipe("rotten_into_obscurium", <tag:items: aotdextras:rotten> * 4, <tag:mekanism/infuse_type:mekanism:bio> * 320, <item: aotdextras:obscurium_ingot>);
<recipetype:mekanism:metallurgic_infusing>.addRecipe("meat_into_obscurium", <tag:items: aotdextras:raw_meat> * 2, <tag:mekanism/infuse_type:mekanism:bio> * 320, <item: aotdextras:obscurium_ingot>);
<recipetype:mekanism:metallurgic_infusing>.addRecipe("fish_into_obscurium", <tag:items: aotdextras:raw_fish> * 2, <tag:mekanism/infuse_type:mekanism:bio> * 320, <item: aotdextras:obscurium_ingot>);
<recipetype:mekanism:metallurgic_infusing>.addRecipe("bone_meal_into_obscurium", <item: minecraft:bone_meal> * 32, <tag:mekanism/infuse_type:mekanism:bio> * 640, <item: aotdextras:obscurium_ingot>);
<recipetype:mekanism:metallurgic_infusing>.addRecipe("sticky_into_obscurium", <tag:items: aotdextras:sticky>, <tag:mekanism/infuse_type:mekanism:bio> * 320, <item: aotdextras:obscurium_ingot>);
// harder recipe for Rotten Flesh specifically due to abundance
<recipetype:mekanism:enriching>.addRecipe("enriching_rotten_flesh_into_leather", <item: minecraft:rotten_flesh> * 4, <item: minecraft:leather>);
<recipetype:mekanism:enriching>.addRecipe("enriching_leather_into_obscurium", <item: minecraft:leather> * 32, <item: aotdextras:obscurium_ingot>);
// easier recipe for all other "rotten" items
<recipetype:mekanism:enriching>.addRecipe("enriching_rotten_into_obscurium", <tag:items: aotdextras:rotten> * 32, <item: aotdextras:obscurium_ingot>);
<recipetype:mekanism:enriching>.addRecipe("enriching_meat_into_obscurium", <tag:items: aotdextras:raw_meat> * 32, <item: aotdextras:obscurium_ingot>);
<recipetype:mekanism:enriching>.addRecipe("enriching_fish_into_obscurium", <tag:items: aotdextras:raw_fish> * 32, <item: aotdextras:obscurium_ingot>);
<recipetype:mekanism:enriching>.addRecipe("enriching_sticky_into_obscurium", <tag:items: aotdextras:sticky> * 16, <item: aotdextras:obscurium_ingot>);
<recipetype:mekanism:enriching>.addRecipe("enriching_bone_into_obscurium", <item: minecraft:bone_block> * 16, <item: aotdextras:obscurium_ingot>);
<item: aotdextras:obscurium_ingot>.burnTime = 3200;

craftingTable.remove(<item: aotdextras:occultium_ingot>);
craftingTable.remove(<item: aotdextras:occultium_block>);
craftingTable.addShapeless("aotdextras.occultium_ingot", <item: aotdextras:occultium_ingot> * 2,
	[<tag:items: aotdextras:evil_ingots>, <tag:items: aotdextras:rare_drops>, <tag:items: aotdextras:evil_ingots>,
	 <tag:items: aotdextras:rare_drops>,  <item: aotdextras:obscurium_block>, <tag:items: aotdextras:rare_drops>,
	 <tag:items: aotdextras:evil_ingots>, <tag:items: aotdextras:rare_drops>, <tag:items: aotdextras:evil_ingots>]);
craftingTable.addShaped("aotdextras.occultium_block", <item: aotdextras:occultium_block>,
	[[<item: aotdextras:occultium_ingot>, <item: aotdextras:occultium_ingot>],
	 [<item: aotdextras:occultium_ingot>, <item: aotdextras:occultium_ingot>]]);
craftingTable.addShapeless("aotdextras.occultium_block_decompress", <item: aotdextras:occultium_ingot> * 4, [<item: aotdextras:occultium_block>]);

craftingTable.remove(<item:aotdextras:luxum_lamp>);
craftingTable.removeByName("aotdextras:luxum_lamp_decompress");
craftingTable.addShapeless("aotdextras.luxum_ingot", <item: aotdextras:luxum_ingot> * 2,
	[<item: illuminative:glow_inc_sac_block>,        <item: illuminative:glow_fish_item>, <item: illuminative:glowstone_torch>,
	 <item: gardens_of_the_dead:glowing_soul_spore>, <item: aotdextras:obscurium_ingot>,       <item: minecraft:glow_lichen>,
	 <item: aquamirae:luminescent_lamp>,	         <item: observed:observereye>,             <item: minecraft:shroomlight>]);

craftingTable.addShaped("aotdextras.nihilum_ingot", <item: aotdextras:nihilum_ingot> * 2,
	[[<item: deep_dark_regrowth:galm>,          <item: aotdextras:occultium_ingot>, <item: born_in_chaos_v1:black_argillite>],
	 [<item: aotdextras:occultium_ingot>,       <item: aotdextras:luxum_block>,      <item: aotdextras:occultium_ingot>],
	 [<item: born_in_chaos_v1:black_argillite>, <item: aotdextras:occultium_ingot>, <item: deep_dark_regrowth:galm>]]);
craftingTable.addShaped("aotdextras.nihilum_ingot_alt", <item: aotdextras:nihilum_ingot> * 2,
	[[<tag:items: aotdextras:boss_drops>, <tag:items: aotdextras:epic_drops>, <tag:items: aotdextras:boss_drops>],
	 [<tag:items: aotdextras:epic_drops>, <item: aotdextras:obscurium_block>, <tag:items: aotdextras:epic_drops>],
	 [<tag:items: aotdextras:boss_drops>, <tag:items: aotdextras:epic_drops>, <tag:items: aotdextras:boss_drops>]]);
craftingTable.addShaped("aotdextras.nihilum_ingot_alt_b", <item: aotdextras:nihilum_ingot> * 3,
	[[<tag:items: aotdextras:boss_drops>, <tag:items: aotdextras:epic_drops>, <tag:items: aotdextras:boss_drops>],
	 [<tag:items: aotdextras:epic_drops>, <item: aotdextras:occultium_block>, <tag:items: aotdextras:epic_drops>],
	 [<tag:items: aotdextras:boss_drops>, <tag:items: aotdextras:epic_drops>, <tag:items: aotdextras:boss_drops>]]);
<recipetype:mekanism:combining>.addRecipe("aotd.nihilum_from_astral", <item:aotdextras:luxum_ingot> * 4, <item:obscure_api:astral_dust>, <item:aotdextras:nihilum_ingot> * 4);
<recipetype:mekanism:combining>.addRecipe("aotd.nihilum_from_luxum", <item:aotdextras:luxum_ingot> * 16, <item:mekanism:pellet_antimatter>, <item:aotdextras:nihilum_ingot> * 4);
<recipetype:mekanism:combining>.addRecipe("aotd.nihilum_from_luxum_block", <item:aotdextras:luxum_block> * 16, <item:mekanism:pellet_antimatter>, <item:aotdextras:nihilum_block> * 4);

// Component resources -----------------------------------------------------------------------------------------------------------------------

smithing.addRecipe("born_in_chaos_v1.black_argillite", <item: born_in_chaos_v1:black_argillite>, <tag:items:forge:stone>, <item:graveyard:corruption>);
smithing.addRecipe("deep_dark_regrowth.corrupted_matter", <item:deep_dark_regrowth:corrupted_matter>, <item:deep_dark_regrowth:galm>, <item:deep_dark_regrowth:plasmatic_sculk>);

craftingTable.remove(<item:monsterplus:ancient_crystal>);
craftingTable.addShaped("monsterplus.ancient_crystal", <item:monsterplus:ancient_crystal>,
	[[<item:minecraft:amethyst_shard>, <item:monsterplus:crystal_shard>, <item:minecraft:amethyst_shard>],
	 [<item:monsterplus:crystal_shard>,<item:monsterplus:crystal_clump>, <item:monsterplus:crystal_shard>],
	 [<item:minecraft:amethyst_shard>, <item:monsterplus:crystal_shard>, <item:minecraft:amethyst_shard>]]);

craftingTable.remove(<item:bhc:soul_heart_crystal>);
craftingTable.addShaped("bhc.soul_heart_crystal", <item:bhc:soul_heart_crystal>,
	[[<item:minecraft:echo_shard>, <item:bhc:red_heart>,           <item:minecraft:echo_shard>],
	 [<item:bhc:yellow_heart>,     <item:bhc:soul_heart_canister>, <item:bhc:green_heart>],
	 [<item:minecraft:echo_shard>, <item:bhc:blue_heart>,          <item:minecraft:echo_shard>]]);

craftingTable.remove(<item:graveyard:dark_iron_ingot>);
craftingTable.addShaped("graveyard.dark_iron_ingot", <item:graveyard:dark_iron_ingot>,
	[[<item:graveyard:corruption>, <item:graveyard:corruption>,  <item:graveyard:corruption>],
	 [<item:graveyard:corruption>, <item:tenebrous_lands:zenyr>, <item:graveyard:corruption>],
	 [<item:graveyard:corruption>, <item:graveyard:corruption>,  <item:graveyard:corruption>]]);

craftingTable.remove(<item:undead_unleashed:grave_metal_ingot>);
craftingTable.addShaped("undead_unleashed.grave_metal_ingot", <item:undead_unleashed:grave_metal_ingot>,
	[[<item:undead_unleashed:grave_metal_scrap>, <item:undead_unleashed:grave_metal_scrap>, <item:undead_unleashed:grave_metal_scrap>],
	 [<item:undead_unleashed:grave_metal_scrap>, <item:tenebrous_lands:zenyr>,              <item:undead_unleashed:grave_metal_scrap>],
	 [<item:undead_unleashed:grave_metal_scrap>, <item:undead_unleashed:grave_metal_scrap>, <item:undead_unleashed:grave_metal_scrap>]]);

<recipetype:mekanism:combining>.addRecipe("dark_metal_into_dark_iron", <item: born_in_chaos_v1:dark_metal_ingot>, <item: graveyard:corruption>, <item: graveyard:dark_iron_ingot>);
<recipetype:mekanism:combining>.addRecipe("dark_metal_into_grave", <item: born_in_chaos_v1:dark_metal_ingot>, <item: undead_unleashed:grave_metal_scrap>, <item: undead_unleashed:grave_metal_ingot>);
<recipetype:mekanism:combining>.addRecipe("grave_into_dark_iron", <item: undead_unleashed:grave_metal_ingot>, <item: graveyard:corruption>, <item: graveyard:dark_iron_ingot>);
<recipetype:mekanism:combining>.addRecipe("grave_into_dark_metal", <item: undead_unleashed:grave_metal_ingot>, <item: born_in_chaos_v1:pieceofdarkmetal>, <item: born_in_chaos_v1:dark_metal_ingot>);
<recipetype:mekanism:combining>.addRecipe("dark_iron_into_grave", <item: graveyard:dark_iron_ingot>, <item: undead_unleashed:grave_metal_scrap>, <item: undead_unleashed:grave_metal_ingot>);
<recipetype:mekanism:combining>.addRecipe("dark_iron_into_dark_metal", <item: graveyard:dark_iron_ingot>, <item: born_in_chaos_v1:pieceofdarkmetal>, <item: born_in_chaos_v1:dark_metal_ingot>);
<recipetype:mekanism:enriching>.addRecipe("zenyr_into_iron", <item: tenebrous_lands:zenyr>, <item: minecraft:iron_ingot> * 2);
<recipetype:mekanism:enriching>.addRecipe("dark_iron_into_steel", <item: graveyard:dark_iron_ingot>, <item: mekanism:ingot_steel> * 2);
<recipetype:mekanism:enriching>.addRecipe("grave_into_steel", <item: undead_unleashed:grave_metal_ingot>, <item: mekanism:ingot_steel> * 2);
<recipetype:mekanism:enriching>.addRecipe("dark_metal_into_steel", <item: born_in_chaos_v1:dark_metal_ingot>, <item: mekanism:ingot_steel> * 2);

// Miscellaneous -----------------------------------------------------------------------------------------------------------------------------

// add Glow TNT
craftingTable.remove(<item:aotdextras:glow_tnt>);
craftingTable.addShaped("aotdextras.glow_tnt", <item:aotdextras:glow_tnt> * 8,
	[[<item:minecraft:tnt>, <item:minecraft:tnt>,          <item:minecraft:tnt>],
	 [<item:minecraft:tnt>, <item:aotdextras:luxum_ingot>, <item:minecraft:tnt>],
	 [<item:minecraft:tnt>, <item:minecraft:tnt>,          <item:minecraft:tnt>]]);

// adjust Lunar Token recipe
craftingTable.remove(<item:aotdextras:lunar_token>);
craftingTable.addShaped("aotdextras.lunar_token", <item:aotdextras:lunar_token> * 4,
	[[IIngredientEmpty.getInstance(), <item:minecraft:quartz>,           IIngredientEmpty.getInstance()],
	 [<item:minecraft:quartz>,        <item:aotdextras:obscurium_ingot>, <item:minecraft:quartz>],
	 [IIngredientEmpty.getInstance(), <item:minecraft:quartz>,           IIngredientEmpty.getInstance()]]);

// incorporate nature's compass recipe
craftingTable.remove(<item: naturescompass:naturescompass>);
craftingTable.addShaped("naturescompass.naturescompass", <item: naturescompass:naturescompass>,
	[[<item:aotdextras:obscurium_block>, <tag:items:minecraft:logs>, <item:aotdextras:obscurium_block>],
	 [<tag:items:minecraft:logs>,        <item:minecraft:compass>,   <tag:items:minecraft:logs>],
	 [<item:aotdextras:obscurium_block>, <tag:items:minecraft:logs>, <item:aotdextras:obscurium_block>]]);

// incorporate explorer's compass recipe
craftingTable.remove(<item: explorerscompass:explorerscompass>);
craftingTable.addShaped("explorerscompass.explorerscompass", <item: explorerscompass:explorerscompass>,
	[[<item:unusualend:ancient_shard>,   <item:aotdextras:occultium_block>, <item:unusualend:ancient_shard>],
	 [<item:aotdextras:occultium_block>, <item:minecraft:compass>,          <item:aotdextras:occultium_block>],
	 [<item:unusualend:ancient_shard>,   <item:aotdextras:occultium_block>, <item:unusualend:ancient_shard>]]);

// add bone staff fragment duplication recipes
smithing.addRecipe("upper_bone_staff_dupe", <item:graveyard:upper_bone_staff> * 2, <item:graveyard:upper_bone_staff>, <item:aotdextras:occultium_ingot>);
smithing.addRecipe("middle_bone_staff_dupe", <item:graveyard:middle_bone_staff> * 2, <item:graveyard:middle_bone_staff>, <item:aotdextras:occultium_ingot>);
smithing.addRecipe("lower_bone_staff_dupe", <item:graveyard:lower_bone_staff> * 2, <item:graveyard:lower_bone_staff>, <item:aotdextras:occultium_ingot>);
