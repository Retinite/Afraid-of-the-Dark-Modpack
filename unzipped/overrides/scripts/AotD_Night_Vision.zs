// "Afraid of the Dark" Minecraft modpack, by Retinite.
// 
// This file overhauls all "night vision" items and potions for more control over progression. 

import crafttweaker.api.ingredient.type.IIngredientEmpty;
import mods.jeitweaker.Jei;
import crafttweaker.api.tag.MCTag;
import crafttweaker.api.item.alchemy.Potion;
import crafttweaker.api.recipe.Brewing;

// change Phantasm Cowl recipe and nerf slightly
/* REMOVED UNTIL CRASH IS FIXED
craftingTable.remove(<item:enemyexpansion:phantasm_helmet>);
craftingTable.addShaped("enemyexpansion.phantasm_cowl_recipe", <item:enemyexpansion:phantasm_helmet>.withTag({Enchantments: [{lvl: 1, id: "minecraft:binding_curse"}]}),
	[[<item:minecraft:phantom_membrane>,  <item:minecraft:phantom_membrane>,       <item:minecraft:phantom_membrane>],
	 [<item:minecraft:ender_eye>,         <item:born_in_chaos_v1:spiritinabottle>, <item:minecraft:ender_eye>],
	 [<item:illuminative:glow_fish_item>, IIngredientEmpty.getInstance(),          <item:illuminative:glow_fish_item>]]);
*/

// remove vanilla night vision potions
brewing.removeRecipeByReagent(<item:minecraft:golden_carrot>);
brewing.removeRecipeByInputPotion(<potion:minecraft:night_vision> as Potion);
Jei.hideIngredient(<item:minecraft:potion>.withTag({Potion: "minecraft:long_night_vision"}));
Jei.hideIngredient(<item:minecraft:splash_potion>.withTag({Potion: "minecraft:night_vision"}));
Jei.hideIngredient(<item:minecraft:splash_potion>.withTag({Potion: "minecraft:long_night_vision"}));
Jei.hideIngredient(<item:minecraft:lingering_potion>.withTag({Potion: "minecraft:night_vision"}));
Jei.hideIngredient(<item:minecraft:lingering_potion>.withTag({Potion: "minecraft:long_night_vision"}));
Jei.hideIngredient(<item:minecraft:tipped_arrow>.withTag({Potion: "minecraft:night_vision"}));
Jei.hideIngredient(<item:minecraft:tipped_arrow>.withTag({Potion: "minecraft:long_night_vision"}));
Jei.hideIngredient(<item:apotheosis:potion_charm>.withTag({Potion: "minecraft:long_night_vision"}));

// replace with more expensive recipe
brewing.addRecipe(<item:minecraft:potion>.withTag({Potion: "minecraft:night_vision"}), <item:aotdextras:luxum_block>, <item:minecraft:potion>.withTag({Potion: "minecraft:awkward"}));

// adjust Drink Beer Refill's Night Howl Kvass recipe
<recipetype:drinkbeer:brewing>.removeByName("drinkbeer:beer_mug_night_howl_kvass");
<recipetype:drinkbeer:brewing>.addJsonRecipe("drinkbeer.beer_mug_night_howl_kvass", {
  "type": "drinkbeer:brewing",
  "ingredients": [
    {
      "item": "minecraft:bread"
    },
    {
      "item": "minecraft:bread"
    },
    {
      "item": "born_in_chaos_v1:fangofthe_hound_leader"
    },
    {
      "item": "aotdextras:luxum_ingot"
    }
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

// make Lenses of the Observer more expensive to not bypass progression
craftingTable.remove(<item: observed:observer_lenses>);
craftingTable.addShaped("observed.lenses", <item: observed:observer_lenses>,
	[[<item: minecraft:stick>,                                                    IIngredientEmpty.getInstance(),   <item: minecraft:stick>],
	 [<item:apotheosis:potion_charm>.withTag({Potion: "minecraft:night_vision"}), <item: aotdextras:nihilum_ingot>, <item:apotheosis:potion_charm>.withTag({Potion: "minecraft:night_vision"})],
	 [IIngredientEmpty.getInstance(),                                             IIngredientEmpty.getInstance(),   IIngredientEmpty.getInstance()]]);

// increase night vision moduel cost
craftingTable.remove(<item: mekanism:module_vision_enhancement_unit>);
craftingTable.addShaped("mekanism.module_vision_enhancement_unit", <item: mekanism:module_vision_enhancement_unit>,
	[[<tag:items:forge:alloys/elite>,   <item:aotdextras:luxum_lamp>,    <tag:items:forge:alloys/elite>],
	 [<item:upgrade_aquatic:elder_eye>, <item:mekanism:module_base>,     <item:born_in_chaos_v1:sea_terror_eye>],
	 [<item:mekanism:pellet_polonium>,  <item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>]]);

// add craftable Night Vision Ability Totem
craftingTable.addShaped("aotd.night_vision_totem", <item:everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{name: "everlastingabilities:effect/night_vision", level: 1}]}),
	[[<item: observed:observer_lenses>,                <item: mekanism:pellet_antimatter>, <item: observed:observer_lenses>],
	 [<item: mekanism:module_vision_enhancement_unit>, <item: aotdextras:nihilum_block>,   <item: mekanism:module_vision_enhancement_unit>],
	 [<item: mekanism:module_vision_enhancement_unit>, <item: aotdextras:luxum_block>,     <item: mekanism:module_vision_enhancement_unit>]]);

// add conversions between unbreakable charms and night vision Ability
craftingTable.addShapeless("aotd.night_vision_totem_to_charm", <item:apotheosis:potion_charm>.withTag({Unbreakable: 1, Potion: "minecraft:night_vision"}),
	[<item:everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{name: "everlastingabilities:effect/night_vision", level: 1}]})]);
craftingTable.addShapeless("aotd.night_vision_charm_to_totem", <item:everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{name: "everlastingabilities:effect/night_vision", level: 1}]}),
	[<item:apotheosis:potion_charm>.withTag({Unbreakable: 1, Potion: "minecraft:night_vision"})]);
