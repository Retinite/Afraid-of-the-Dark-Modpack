// "Afraid of the Dark" Minecraft modpack, by Retinite.
// 
// This file removes certain recipes.

import crafttweaker.api.ingredient.type.IIngredientEmpty;
import mods.jeitweaker.Jei;
import crafttweaker.api.tag.MCTag;


craftingTable.removeByName("john_mod_reborn:table_of_johns_recipe"); // does nothing?
Jei.hideIngredient(<item: john_mod_reborn:table_of_johns>);
craftingTable.removeByName("deep_dark_regrowth:life_fruit_r"); // currently bugged
Jei.hideIngredient(<item: deep_dark_regrowth:life_fruit>);
craftingTable.removeByName("mekanism:oredictionificator"); // no equivalent ore tags to use with
Jei.hideIngredient(<item: mekanism:oredictionificator>);

// remove UnusualEnd's waystones due to Waystones mod
craftingTable.removeByName("unusualend:upgrade_to_gilded");
craftingTable.removeByName("unusualend:clear_gilded_pearls");
Jei.hideIngredient(<item: unusualend:gilded_pearl>);
craftingTable.removeByName("unusualend:teleportation_anchor");
Jei.hideIngredient(<item: unusualend:teleportation_anchor>);

// remove flux network storage due to Mekanism storage options
craftingTable.removeByName("fluxnetworks:basicfluxstorage");
Jei.hideIngredient(<item: fluxnetworks:basic_flux_storage>);
craftingTable.removeByName("fluxnetworks:herculeanfluxstorage");
Jei.hideIngredient(<item: fluxnetworks:herculean_flux_storage>);
craftingTable.removeByName("fluxnetworks:gargantuanfluxstorage");
Jei.hideIngredient(<item: fluxnetworks:gargantuan_flux_storage>);

// remove Illuminative Magma Rod due to bugged placement
craftingTable.removeByName("illuminative:magma_rod_recipe");
Jei.hideIngredient(<item: illuminative:magma_rod>);

// remove Born in Chaos's Spawn Structures (removing from JEI doesn't work?)
/*Jei.hideIngredient(<item: born_in_chaos_v1:spawn_structures_firewell>);
Jei.hideIngredient(<item: born_in_chaos_v1:spawn_structures_lookout_tower>);
Jei.hideIngredient(<item: born_in_chaos_v1:spawn_structures_dark_tower>);
Jei.hideIngredient(<item: born_in_chaos_v1:spawn_structures_farm>);
Jei.hideIngredient(<item: born_in_chaos_v1:spawn_structures_clown_cart>);
Jei.hideIngredient(<item: born_in_chaos_v1:spawn_structure_mound_hounds>);*/

// remove Deep Dark Regrowth tools and items due to no clear way to acquire or progress
craftingTable.remove(<item:deep_dark_regrowth:void_breaker>);
Jei.hideIngredient(<item:deep_dark_regrowth:void_breaker>);
craftingTable.remove(<item:deep_dark_regrowth:ethereum_coin>);
Jei.hideIngredient(<item:deep_dark_regrowth:ethereum_coin>);
craftingTable.remove(<item:deep_dark_regrowth:plasma_pickaxe>);
Jei.hideIngredient(<item:deep_dark_regrowth:plasma_pickaxe>);
craftingTable.remove(<item:deep_dark_regrowth:plasma_axe>);
Jei.hideIngredient(<item:deep_dark_regrowth:plasma_axe>);
craftingTable.remove(<item:deep_dark_regrowth:plasma_shovel>);
Jei.hideIngredient(<item:deep_dark_regrowth:plasma_shovel>);
craftingTable.remove(<item:deep_dark_regrowth:plasma_hoe>);
Jei.hideIngredient(<item:deep_dark_regrowth:plasma_hoe>);
craftingTable.remove(<item:deep_dark_regrowth:ancient_illusioner_mask_helmet>);
craftingTable.remove(<item:deep_dark_regrowth:decomposing_echo_shard>);
Jei.hideIngredient(<item:deep_dark_regrowth:decomposing_echo_shard>);

// remove Born in Chaos's armor plate due to recipe changes
craftingTable.remove(<item:born_in_chaos_v1:armor_plate_from_dark_metal>);
Jei.hideIngredient(<item:born_in_chaos_v1:armor_plate_from_dark_metal>);

// remove Deep Dark Regrowth's Warden Helmet since it is unbalanced and unimplemented
Jei.hideIngredient(<item:deep_dark_regrowth:warden_helmet>);