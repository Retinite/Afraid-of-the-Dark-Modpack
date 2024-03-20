// "Afraid of the Dark" Minecraft modpack, by Retinite.
// 
// This file overhauls all "night vision" items and potions for more control over progression. 

import crafttweaker.api.ingredient.type.IIngredientEmpty;
import mods.jeitweaker.Jei;
import crafttweaker.api.item.alchemy.Potion;
import crafttweaker.api.recipe.Brewing;

// remove vanilla night vision potions
brewing.removeRecipeByReagent(<item:minecraft:golden_carrot>);
brewing.removeRecipeByInputPotion(<potion:minecraft:night_vision>);
Jei.hideIngredient(<item:minecraft:potion>.withTag({Potion: "minecraft:long_night_vision"}));
Jei.hideIngredient(<item:minecraft:splash_potion>.withTag({Potion: "minecraft:long_night_vision"}));
Jei.hideIngredient(<item:minecraft:lingering_potion>.withTag({Potion: "minecraft:long_night_vision"}));
Jei.hideIngredient(<item:minecraft:tipped_arrow>.withTag({Potion: "minecraft:long_night_vision"}));
Jei.hideIngredient(<item:apotheosis:potion_charm>.withTag({Potion: "minecraft:long_night_vision"}));

// replace with more expensive recipe
brewing.addRecipe(<item:minecraft:potion>.withTag({Potion: "minecraft:night_vision"}), <item:aotdextras:luxum_block>, <item:minecraft:potion>.withTag({Potion: "minecraft:awkward"}));

// adjust Drink Beer Refill's Night Howl Kvass recipe
<recipetype:drinkbeer:brewing>.removeByName("drinkbeer:beer_mug_night_howl_kvass");
<recipetype:drinkbeer:brewing>.addJsonRecipe("drinkbeer.beer_mug_night_howl_kvass", {
  "type": "drinkbeer:brewing",
  "ingredients": [
    {"item": "minecraft:bread"},                         {"item": "minecraft:bread"},
    {"item": "born_in_chaos_v1:fangofthe_hound_leader"}, {"item": "aotdextras:luxum_ingot"}
  ],
  "cup": {
    "item": "drinkbeer:empty_beer_mug",
    "count": 4
  },
  "brewing_time": 18000,
  "result": {
    "item": "drinkbeer:beer_mug_night_howl_kvass",
    "count": 4
  }
});

// add recipe for Phantom Eyes
craftingTable.remove(<item:enemyexpansion:phantom_eye>);
craftingTable.addShaped("enemyexpansion.phantom_eye", <item:enemyexpansion:phantom_eye> * 2,
	[[<item:aotdextras:luxum_ingot>,     <tag:items:aotdextras:large_eyes>, <item:aotdextras:luxum_ingot>],
	 [<tag:items:aotdextras:large_eyes>, <item:enemyexpansion:healing_eye>, <tag:items:aotdextras:large_eyes>],
	 [<item:aotdextras:luxum_ingot>,     <tag:items:aotdextras:large_eyes>, <item:aotdextras:luxum_ingot>]]);

// increase night vision moduel cost
craftingTable.remove(<item: mekanism:module_vision_enhancement_unit>);
craftingTable.addShaped("mekanism.module_vision_enhancement_unit", <item: mekanism:module_vision_enhancement_unit>,
	[[<tag:items:forge:alloys/elite>,    <item:enemyexpansion:phantom_eye>, <tag:items:forge:alloys/elite>],
	 [<item:enemyexpansion:phantom_eye>, <item:mekanism:module_base>,       <item:enemyexpansion:phantom_eye>],
	 [<item:mekanism:pellet_polonium>,   <item:aotdextras:luxum_lamp>,      <item:mekanism:pellet_polonium>]]);

// add craftable Night Vision Ability Totem
craftingTable.addShaped("aotd.night_vision_totem", <item:everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{name: "everlastingabilities:effect/night_vision", level: 1}]}),
	[[<item:aotdextras:luxum_ingot>,                  <item:enemyexpansion:phantasm_helmet>.anyDamage(), <item:aotdextras:luxum_ingot>],
	 [<item:mekanism:module_vision_enhancement_unit>, <item:aotdextras:luxum_block>,                     <item:mekanism:module_vision_enhancement_unit>],
	 [<item:mekanism:module_vision_enhancement_unit>, <item:aotdextras:luxum_block>,                     <item:mekanism:module_vision_enhancement_unit>]]);

// add conversions between unbreakable charms and night vision Ability
craftingTable.addShapeless("aotd.night_vision_totem_to_charm", <item:apotheosis:potion_charm>.withTag({Unbreakable: 1, Potion: "minecraft:night_vision"}),
	[<item:everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{name: "everlastingabilities:effect/night_vision", level: 1}]})]);
craftingTable.addShapeless("aotd.night_vision_charm_to_totem", <item:everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{name: "everlastingabilities:effect/night_vision", level: 1}]}),
	[<item:apotheosis:potion_charm>.withTag({Unbreakable: 1, Potion: "minecraft:night_vision"})]);

// make Lenses of the Observer more expensive to not bypass progression
craftingTable.remove(<item: observed:observer_lenses>);
craftingTable.addShaped("observed.lenses", <item: observed:observer_lenses>,
	[[<item:minecraft:stick>,                                                     IIngredientEmpty.getInstance(),  <item:minecraft:stick>],
	 [<item:apotheosis:potion_charm>.withTag({Potion: "minecraft:night_vision"}), <item:aotdextras:nihilum_ingot>, <item:apotheosis:potion_charm>.withTag({Potion: "minecraft:night_vision"})],
	 [IIngredientEmpty.getInstance(),                                             IIngredientEmpty.getInstance(),  IIngredientEmpty.getInstance()]]);

// Phantasm Armor ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// add Curse of Binding to Phantasm Cowl by default
craftingTable.remove(<item:enemyexpansion:phantasm_helmet>);
craftingTable.remove(<item:enemyexpansion:phantasm_chestplate>);
craftingTable.remove(<item:enemyexpansion:phantasm_leggings>);
craftingTable.remove(<item:enemyexpansion:phantasm_boots>);
craftingTable.addShaped("enemyexpansion.phantasm_cowl_recipe", <item:enemyexpansion:phantasm_helmet>.withTag({Enchantments: [{lvl: 1, id: "minecraft:binding_curse"}]}),
	[[<item:minecraft:phantom_membrane>, <item:aotdextras:luxum_ingot>,     <item:minecraft:phantom_membrane>],
	 [<item:enemyexpansion:phantom_eye>, <item:minecraft:phantom_membrane>, <item:enemyexpansion:phantom_eye>],
	 [<item:minecraft:phantom_membrane>, IIngredientEmpty.getInstance(),    <item:minecraft:phantom_membrane>]]);
craftingTable.addShaped("enemyexpansion.phantasm_cape", <item:enemyexpansion:phantasm_chestplate>,
	[[<item:aotdextras:luxum_ingot>,     IIngredientEmpty.getInstance(),    <item:aotdextras:luxum_ingot>],
	 [<item:minecraft:phantom_membrane>, <item:aotdextras:luxum_ingot>,     <item:minecraft:phantom_membrane>],
	 [<item:minecraft:phantom_membrane>, <item:minecraft:phantom_membrane>, <item:minecraft:phantom_membrane>]]);
craftingTable.addShaped("enemyexpansion.phantasm_leggings", <item:enemyexpansion:phantasm_leggings>,
	[[<item:aotdextras:luxum_ingot>,     <item:aotdextras:luxum_ingot>, <item:aotdextras:luxum_ingot>],
	 [<item:minecraft:phantom_membrane>, IIngredientEmpty.getInstance(), <item:minecraft:phantom_membrane>],
	 [<item:minecraft:phantom_membrane>, IIngredientEmpty.getInstance(), <item:minecraft:phantom_membrane>]]);
craftingTable.addShaped("enemyexpansion.phantasm_boots", <item:enemyexpansion:phantasm_boots>,
	[[<item:minecraft:phantom_membrane>, IIngredientEmpty.getInstance(), <item:minecraft:phantom_membrane>],
	 [<item:aotdextras:luxum_ingot>,     IIngredientEmpty.getInstance(), <item:aotdextras:luxum_ingot>],
	 [<item:minecraft:phantom_membrane>, IIngredientEmpty.getInstance(), <item:minecraft:phantom_membrane>]]);
