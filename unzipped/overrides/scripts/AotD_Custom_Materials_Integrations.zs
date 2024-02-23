// "Afraid of the Dark" Minecraft modpack, by Retinite.
// 
// This file provides recipes related to AotD_Custom_Materials.

import crafttweaker.api.ingredient.type.IIngredientEmpty;
import crafttweaker.api.tag.MCTag;

// Essence of the End
craftingTable.remove(<item:minecraft:ender_eye>);
craftingTable.remove(<item:minecraft:ender_chest>);
craftingTable.remove(<item:apotheosis:ender_lead>);
craftingTable.removeByName("majruszsdifficulty:enderium_ingot_vertical");
craftingTable.removeByName("majruszsdifficulty:enderium_ingot_horizontal");
<recipetype:mekanism:oxidizing>.addRecipe("oxidize_ender_pearl", <item:minecraft:ender_pearl>, <gas:crafttweaker:end_essence>* 8);
<recipetype:mekanism:oxidizing>.addRecipe("oxidize_end_shard", <item:unusualend:ancient_shard>, <gas:crafttweaker:end_essence> * 64);
<recipetype:mekanism:crystallizing>.addRecipe("end_shard_from_gas", <gas:crafttweaker:end_essence> * 64, <item:unusualend:ancient_shard>);
<recipetype:mekanism:injecting>.addRecipe("aotd.ender_eye", <item:minecraft:blaze_powder>, <gas:crafttweaker:end_essence>, <item:minecraft:ender_eye>);
<recipetype:mekanism:injecting>.addRecipe("aotd.ender_chest", <tag:items:balm:wooden_chests>, <gas:crafttweaker:end_essence> * 2, <item:minecraft:ender_chest>);
<recipetype:mekanism:injecting>.addRecipe("majruszsdifficulty.enderium_ingot", <item:majruszsdifficulty:enderium_shard>, <gas:crafttweaker:end_essence> * 8, <item:majruszsdifficulty:enderium_ingot>);
<recipetype:mekanism:injecting>.addRecipe("apotheosis.ender_lead", <item:minecraft:lead>, <gas:crafttweaker:end_essence> * 4, <item:apotheosis:ender_lead>);

// Enderium Slurry
<recipetype:mekanism:dissolution>.addRecipe("enderium_slurry_from_ore", <item:majruszsdifficulty:enderium_shard_ore>, <gas:mekanism:sulfuric_acid>, <slurry:crafttweaker:dirty_enderium> * 1000);
<recipetype:mekanism:washing>.addRecipe("cleaning_enderium_slurry", <tag:fluids:minecraft:water> * 5, <slurry:crafttweaker:dirty_enderium>, <slurry:crafttweaker:clean_enderium>);
<recipetype:mekanism:crystallizing>.addRecipe("enderium_shard_from_slurry", <slurry:crafttweaker:clean_enderium> * 200, <item:majruszsdifficulty:enderium_shard>);