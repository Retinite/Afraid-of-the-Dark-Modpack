#priority 1

// "Afraid of the Dark" Minecraft modpack, by Retinite.
// 
// This file defines all tags used by other AotD scripts.

import crafttweaker.api.tag.MCTag;

// AotD-specific tags ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<tag:items: aotdextras:any_rotten>.add([<item: minecraft:rotten_flesh>, <item: born_in_chaos_v1:rotten_fish>, <item: rottencreatures:magma_rotten_flesh>, <item: rottencreatures:frozen_rotten_flesh>, <item: born_in_chaos_v1:monster_flesh>, <item: minecraft:poisonous_potato>, <item: minecraft:spider_eye>]);
<tag:items: aotdextras:rotten>.add([<item: born_in_chaos_v1:rotten_fish>, <item: rottencreatures:magma_rotten_flesh>, <item: rottencreatures:frozen_rotten_flesh>, <item: born_in_chaos_v1:monster_flesh>, <item: minecraft:poisonous_potato>, <item: minecraft:spider_eye>]);
<tag:items: aotdextras:raw_meat>.add([<item: minecraft:porkchop>, <item: minecraft:beef>, <item: minecraft:chicken>, <item: minecraft:rabbit>, <item: minecraft:mutton>, <item: born_in_chaos_v1:corpse_maggot>]);
<tag:items: aotdextras:raw_fish>.add([<item: minecraft:cod>, <item: minecraft:salmon>, <item: minecraft:tropical_fish>, <item: minecraft:pufferfish>, <item: illuminative:glow_fish_item>, <item: upgrade_aquatic:pike>, <item: upgrade_aquatic:lionfish>, <item: upgrade_aquatic:perch>, <item: aquamirae:spinefish>]);
<tag:items: aotdextras:sticky>.add([<item: minecraft:slime_ball>, <item: minecraft:cobweb>]);
<tag:items: aotdextras:rare_drops>.add([<item: born_in_chaos_v1:seedof_chaos>, <item: undead_unleashed:necrotic_dust>, <item: minecraft:ghast_tear>, <item: apotheosis:epic_material>, <item:undead_unleashed:lost_soul>]);
<tag:items: aotdextras:evil_ingots>.add([<item: born_in_chaos_v1:dark_metal_ingot>, <item: undead_unleashed:grave_metal_ingot>, <item: graveyard:dark_iron_ingot>]);
<tag:items: aotdextras:epic_drops>.add([<item: majruszsdifficulty:cerberus_fang>, <item: deep_dark_regrowth:plasmatic_sculk>, <item: deep_dark_regrowth:etherium_gem>, <item: deep_dark_regrowth:aware_lens>, <item: apotheosis:mythic_material>, <item: unusualend:shiny_crystal>]);
<tag:items: aotdextras:boss_drops>.add([<item: minecraft:nether_star>, <item: deep_dark_regrowth:soul_of_the_depths>, <item: aquamirae:abyssal_amethyst>, <item: whisperwoods:hirschgeist_skull>, <item: apotheosis:warden_tendril>]);
// for iron paxel crafting alternatives
<tag:items:aotdextras:iron_level_pickaxe>.add([<item:minecraft:iron_pickaxe>, <item:enemyexpansion:troll_molar>]);
<tag:items:aotdextras:iron_level_axe>.add([<item:minecraft:iron_axe>, <item:undead_unleashed:grave_metal_axe>, <item:born_in_chaos_v1:wood_splitter_axe>]);
<tag:items:aotdextras:iron_level_shovel>.add([<item:minecraft:iron_shovel>, <item:undead_unleashed:tombdigger_maul>]);

// cross-mod compatibility ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// group trident tip types
<tag:items: upgrade_aquatic:trident_tip>.add([<item: upgrade_aquatic:thrasher_tooth>, <item: undead_unleashed:demon_horn>]);
// group TNT types
<tag:items: minecraft:tnt>.add([<item:minecraft:tnt>, <item:rottencreatures:tnt_barrel>]);
// create tag for substituting Wasp Thoraxs for Angler's Fangs
<tag:items: aotdextras:poisoner>.add([<item: aquamirae:anglers_fang>, <item: enemyexpansion:wasp_thorax>]);
// group various eye drops
<tag:items: aotdextras:large_eyes>.add([<item: born_in_chaos_v1:sea_terror_eye>, <item: observed:observereye>, <item: upgrade_aquatic:elder_eye>]);

// Apotheosis ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// for trident-related enchanted book recipes
<tag:items:aotdextras:trident_as_ingredient>.add([<item:minecraft:trident>, <item:apotheosis:inert_trident>]);
// lowest-tier gem recipe components
<tag:items:aotdextras:mining_tool_example>.add([<item:minecraft:stone_pickaxe>, <item:minecraft:stone_shovel>]);
<tag:items:aotdextras:upper_armor_example>.add([<item:minecraft:leather_helmet>, <item:minecraft:leather_chestplate>]);
<tag:items:aotdextras:core_armor_example>.add([<item:minecraft:leather_chestplate>, <item:minecraft:leather_leggings>]);
<tag:items:aotdextras:lower_armor_example>.add([<item:minecraft:leather_leggings>, <item:minecraft:leather_boots>]);
<tag:items:aotdextras:melee_weapon_example>.add([<item:minecraft:stone_sword>, <item:minecraft:stone_axe>]);
<tag:items:aotdextras:light_and_ranged_example>.add([<item:minecraft:stone_sword>, <item:minecraft:bow>]);
<tag:items:aotdextras:tool_example>.add([<item:minecraft:stone_sword>, <item:minecraft:stone_axe>, <item:minecraft:bow>, <item:minecraft:stone_pickaxe>, <item:minecraft:stone_shovel>]);

// Born in Chaos ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// unify charms
<tag:items: born_in_chaos_v1:charms>.add([<item:born_in_chaos_v1:charmof_fury>, <item:born_in_chaos_v1:charmof_endurance>, <item:born_in_chaos_v1:charmof_stealth>, <item:born_in_chaos_v1:charmof_resistance>, <item:born_in_chaos_v1:charmof_power>]);
// apply missing tags for Marigolds
<tag:items:minecraft:small_flowers>.add([<item: born_in_chaos_v1:marigolds>]);
<tag:items:minecraft:flowers>.add([<item: born_in_chaos_v1:marigolds>]);

// Mekanism ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// armored variants for module crafting
<tag:items: mekanism:free_runners>.add([<item: mekanism:free_runners>, <item: mekanism:free_runners_armored>]);
<tag:items: mekanism:jetpack>.add([<item: mekanism:jetpack>, <item: mekanism:jetpack_armored>]);
// logs for sawmill
<tag:items: born_in_chaos_v1:scorched_log>.add([<item: born_in_chaos_v1:scorched_log>, <item: born_in_chaos_v1:scorched_wood>, <item: born_in_chaos_v1:stripped_scorched_log>, <item: born_in_chaos_v1:stripped_scorched_wood>]);
<tag:items: born_in_chaos_v1:smoldering_scorched_log>.add([<item: born_in_chaos_v1:smoldering_scorched_log>, <item: born_in_chaos_v1:smoldering_scorched_wood>]);
<tag:items: gardens_of_the_dead:soulblight_stem>.add([<item: gardens_of_the_dead:soulblight_stem>, <item: gardens_of_the_dead:soulblight_hyphae>, <item: gardens_of_the_dead:stripped_soulblight_stem>, <item: gardens_of_the_dead:stripped_soulblight_hyphae>]);
