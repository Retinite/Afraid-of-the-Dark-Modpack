// "Afraid of the Dark" Minecraft modpack, by Retinite.
// 
// This file provides recipes related to AotD_Custom_Materials.

import mods.mekanism.api.ingredient.ItemStackIngredient;
import crafttweaker.api.ingredient.type.IIngredientEmpty;
import crafttweaker.api.ingredient.IIngredient;

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

// Essence of Light
function addLightRecipe(itemIn as IIngredient, count as int) as void {
<recipetype:mekanism:reaction>.addRecipe("light_essence_from_" + itemIn.items[0].registryName.path, ItemStackIngredient.from(itemIn), <fluid:mekanism:hydrofluoric_acid> * 100, <gas:crafttweaker:end_essence> * 4, 2000, <gas:crafttweaker:light_essence> * count*20, 1000);
}
addLightRecipe(<item:minecraft:glow_berries>, 3);
addLightRecipe(<item:minecraft:ochre_froglight>, 12);
addLightRecipe(<item:minecraft:verdant_froglight>, 12);
addLightRecipe(<item:minecraft:pearlescent_froglight>, 12);
addLightRecipe(<item:minecraft:shroomlight>, 12);
addLightRecipe(<item:minecraft:glow_lichen>, 2);
addLightRecipe(<item:minecraft:glowstone_dust>, 12);
addLightRecipe(<item:minecraft:glowstone>, 48);
addLightRecipe(<item:minecraft:glow_ink_sac>, 1);
addLightRecipe(<item:observed:observereye>, 18);
addLightRecipe(<item:gardens_of_the_dead:glowing_soul_spore>, 2);
addLightRecipe(<item:aquamirae:esca>, 8);
addLightRecipe(<item:aotdextras:luxum_lamp>, 512);

<recipetype:mekanism:crystallizing>.addRecipe("glowstone_dust_from_light", <gas:crafttweaker:light_essence> * 1200, <item:minecraft:glowstone_dust>);
<recipetype:mekanism:injecting>.addRecipe("luminescent_lamp_injection", <item:upgrade_aquatic:prismarine_rod>, <gas:crafttweaker:light_essence>, <item:aquamirae:luminescent_lamp>);
<recipetype:mekanism:injecting>.addRecipe("luminescent_bubble_injection", <item:aquamirae:oxygelium>, <gas:crafttweaker:light_essence>, <item:aquamirae:luminescent_bubble> * 3);
<recipetype:mekanism:injecting>.addRecipe("luxum_ingot_injection", <item:aotdextras:occultium_ingot>, <gas:crafttweaker:light_essence> * 16, <item:aotdextras:luxum_ingot>);
<recipetype:mekanism:injecting>.addRecipe("luxum_ingot_injection_alt", <item:aotdextras:obscurium_ingot>, <gas:crafttweaker:light_essence> * 512, <item:aotdextras:luxum_ingot>);
<recipetype:mekanism:injecting>.addRecipe("luxum_lamp_injection", <item:minecraft:redstone_lamp>, <gas:crafttweaker:light_essence> * 512, <item:aotdextras:luxum_lamp>);
<recipetype:mekanism:injecting>.addRecipe("glow_tnt_injection", <item:minecraft:tnt>, <gas:crafttweaker:light_essence> * 5, <item:aotdextras:glow_tnt>);

<recipetype:mekanism:chemical_infusing>.addRecipe("bleach", <gas:mekanism:sodium>, <gas:mekanism:chlorine>, <gas:crafttweaker:bleach>);
<recipetype:mekanism:injecting>.addRecipe("bleach_bottle", <item:minecraft:glass_bottle>, <gas:crafttweaker:bleach> * 1, <item: luminousworld:bleach>);