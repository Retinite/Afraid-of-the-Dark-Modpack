// "Afraid of the Dark" Minecraft modpack, by Retinite.
// 
// This file overhauls MekaSuit armor and upgrades to require Apotheosis enchantments.

import crafttweaker.api.ingredient.type.IIngredientEmpty;
import mods.jeitweaker.Jei;
import crafttweaker.api.tag.MCTag;


// Component recipes

craftingTable.removeByName("mekanism:free_runners");
craftingTable.addShaped("mekanism.free_runners", <item:mekanism:free_runners>,
	[[<tag:items:forge:circuits/basic>, IIngredientEmpty.getInstance(), <tag:items:forge:circuits/basic>],
	[<tag:items:mekanism:alloys/infused>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 4, id: "minecraft:feather_falling"}, {lvl: 3, id: "minecraft:unbreaking"}, {lvl: 1, id: "minecraft:mending"}]}), <tag:items:mekanism:alloys/infused>],
	[<item:mekanism:energy_tablet>, IIngredientEmpty.getInstance(), <item:mekanism:energy_tablet>]]);

craftingTable.removeByName("mekanism:jetpack");
craftingTable.addShaped("mekanism.jetpack", <item:mekanism:jetpack>,
	[[<tag:items:forge:ingots/steel>, <tag:items:forge:circuits/elite>, <tag:items:forge:ingots/steel>],
	[<item:mekanism:advanced_chemical_tank>, <item:minecraft:netherite_ingot>, <item:mekanism:advanced_chemical_tank>],
	[IIngredientEmpty.getInstance(), <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "minecraft:unbreaking"}, {lvl: 1, id: "minecraft:mending"}]}), IIngredientEmpty.getInstance()]]);

// Modules

craftingTable.removeByName("mekanism:module_radiation_shielding_unit");
craftingTable.addShaped("mekanism.module_radiation_shielding_unit", <item:mekanism:module_radiation_shielding_unit>,
	[[<tag:items:forge:alloys/advanced>, <tag:items:forge:storage_blocks/lead>, <tag:items:forge:alloys/advanced>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "minecraft:blast_protection"}, {lvl: 1, id: "apotheosis:obliteration"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "minecraft:blast_protection"}, {lvl: 1, id: "apotheosis:obliteration"}]})],
	[<item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>]]);

craftingTable.removeByName("mekanism:module_laser_dissipation_unit");
craftingTable.addShaped("mekanism.module_laser_dissipation_unit", <item:mekanism:module_laser_dissipation_unit>,
	[[<tag:items:forge:alloys/advanced>, <item:mekanism:laser_amplifier>, <tag:items:forge:alloys/advanced>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "apotheosis:chromatic"}, {lvl: 1, id: "apotheosis:splitting"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "apotheosis:chromatic"}, {lvl: 1, id: "apotheosis:splitting"}]})],
	[<item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>]]);

craftingTable.removeByName("mekanismgenerators:module_solar_recharging_unit");
craftingTable.addShaped("mekanismgenerators.module_solar_recharging_unit", <item:mekanismgenerators:module_solar_recharging_unit>,
	[[<tag:items:forge:alloys/elite>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2, id: "apotheosis:life_mending"}]}), <tag:items:forge:alloys/elite>],
	[<item:mekanismgenerators:solar_generator>, <item:mekanism:module_base>, <item:mekanismgenerators:solar_generator>],
	[<item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>]]);
craftingTable.addShaped("mekanismgenerators.module_solar_recharging_unit_2", <item:mekanismgenerators:module_solar_recharging_unit> *2,
	[[<tag:items:forge:alloys/elite>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "apotheosis:life_mending"}]}), <tag:items:forge:alloys/elite>],
	[<item:mekanismgenerators:solar_generator>, <item:mekanism:module_base>, <item:mekanismgenerators:solar_generator>],
	[<item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>]]);

craftingTable.removeByName("mekanismgenerators:module_geothermal_generator_unit");
craftingTable.addShaped("mekanismgenerators.module_geothermal_generator_unit", <item:mekanismgenerators:module_geothermal_generator_unit>,
	[[<tag:items:forge:alloys/elite>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "minecraft:fire_protection"}]}), <tag:items:forge:alloys/elite>],
	[<item:mekanismgenerators:heat_generator>, <item:mekanism:module_base>, <item:mekanismgenerators:heat_generator>],
	[<item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>]]);
craftingTable.addShaped("mekanismgenerators.module_geothermal_generator_unit_2", <item:mekanismgenerators:module_geothermal_generator_unit> *2,
	[[<tag:items:forge:alloys/elite>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:fire_protection"}]}), <tag:items:forge:alloys/elite>],
	[<item:mekanismgenerators:heat_generator>, <item:mekanism:module_base>, <item:mekanismgenerators:heat_generator>],
	[<item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>]]);

craftingTable.removeByName("mekanism:module_energy_unit");
craftingTable.addShaped("mekanism.module_energy_unit", <item:mekanism:module_energy_unit>,
	[[<tag:items:forge:alloys/advanced>, <item:mekanism:basic_induction_cell>, <tag:items:forge:alloys/advanced>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "minecraft:unbreaking"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "minecraft:unbreaking"}]})],
	[<item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>]]);
craftingTable.addShaped("mekanism.module_energy_unit_2", <item:mekanism:module_energy_unit> *2,
	[[<tag:items:forge:alloys/advanced>, <item:mekanism:basic_induction_cell>, <tag:items:forge:alloys/advanced>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "minecraft:unbreaking"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "minecraft:unbreaking"}]})],
	[<item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>]]);
craftingTable.addShaped("mekanism.module_energy_unit_4", <item:mekanism:module_energy_unit> *4,
	[[<tag:items:forge:alloys/advanced>, <item:mekanism:basic_induction_cell>, <tag:items:forge:alloys/advanced>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:unbreaking"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:unbreaking"}]})],
	[<item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>]]);


// Helmet modules

craftingTable.removeByName("mekanism:module_electrolytic_breathing_unit");
craftingTable.addShaped("mekanism.module_electrolytic_breathing_unit", <item:mekanism:module_electrolytic_breathing_unit>,
	[[<tag:items:forge:alloys/advanced>, <item:mekanism:electrolytic_core>, <tag:items:forge:alloys/advanced>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "minecraft:respiration"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "minecraft:respiration"}]})],
	[<item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>]]);
craftingTable.addShaped("mekanism.module_electrolytic_breathing_unit_2", <item:mekanism:module_electrolytic_breathing_unit> *2,
	[[<tag:items:forge:alloys/advanced>, <item:mekanism:electrolytic_core>, <tag:items:forge:alloys/advanced>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:respiration"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:respiration"}]})],
	[<item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>]]);

craftingTable.removeByName("mekanism:module_inhalation_purification_unit");
craftingTable.addShaped("mekanism.module_inhalation_purification_unit", <item:mekanism:module_inhalation_purification_unit>,
	[[<tag:items:forge:alloys/elite>, <item:apotheosis:prismatic_web>, <tag:items:forge:alloys/elite>],
	[<item:apotheosis:prismatic_web>, <item:mekanism:module_base>, <item:apotheosis:prismatic_web>],
	[<item:mekanism:pellet_polonium>, <item:minecraft:milk_bucket>, <item:mekanism:pellet_polonium>]]);

craftingTable.removeByName("mekanism:module_nutritional_injection_unit");
craftingTable.addShaped("mekanism.module_nutritional_injection_unit", <item:mekanism:module_nutritional_injection_unit>,
	[[<tag:items:forge:alloys/elite>, <item:mekanism:canteen>, <tag:items:forge:alloys/elite>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "apotheosis:growth_serum"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "apotheosis:growth_serum"}]})],
	[<tag:items:forge:pellets/polonium>, <tag:items:forge:pellets/polonium>, <tag:items:forge:pellets/polonium>]]);


// Leggings modules

craftingTable.removeByName("mekanism:module_gyroscopic_stabilization_unit");
craftingTable.addShaped("mekanism.module_gyroscopic_stabilization_unit", <item:mekanism:module_gyroscopic_stabilization_unit>,
	[[<tag:items:forge:alloys/elite>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "minecraft:aqua_affinity"}, {lvl: 1, id: "apotheosis:stable_footing"}]}), <tag:items:forge:alloys/elite>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "minecraft:aqua_affinity"}, {lvl: 1, id: "apotheosis:stable_footing"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "minecraft:aqua_affinity"}, {lvl: 1, id: "apotheosis:stable_footing"}]})],
	[<item:mekanism:pellet_polonium>, <item:minecraft:obsidian>, <item:mekanism:pellet_polonium>]]);

craftingTable.removeByName("mekanism:module_hydrostatic_repulsor_unit");
craftingTable.addShaped("mekanism.module_hydrostatic_repulsor_unit", <item:mekanism:module_hydrostatic_repulsor_unit>,
	[[<tag:items:forge:alloys/elite>, <item:minecraft:lightning_rod>, <tag:items:forge:alloys/elite>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "minecraft:depth_strider"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "minecraft:depth_strider"}]})],
	[<item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>]]);
craftingTable.addShaped("mekanism.module_hydrostatic_repulsor_unit_2", <item:mekanism:module_hydrostatic_repulsor_unit> *2,
	[[<tag:items:forge:alloys/elite>, <item:minecraft:lightning_rod>, <tag:items:forge:alloys/elite>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:depth_strider"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:depth_strider"}]})],
	[<item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>]]);

craftingTable.removeByName("mekanism:module_locomotive_boosting_unit");
craftingTable.addShaped("mekanism.module_locomotive_boosting_unit", <item:mekanism:module_locomotive_boosting_unit>,
	[[<tag:items:forge:alloys/elite>, <item:minecraft:diamond_leggings>, <tag:items:forge:alloys/elite>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2, id: "minecraft:quick_charge"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2, id: "minecraft:quick_charge"}]})],
	[<item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>]]);
craftingTable.addShaped("mekanism.module_locomotive_boosting_unit_2", <item:mekanism:module_locomotive_boosting_unit> *2,
	[[<tag:items:forge:alloys/elite>, <item:minecraft:diamond_leggings>, <tag:items:forge:alloys/elite>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 4, id: "minecraft:quick_charge"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 4, id: "minecraft:quick_charge"}]})],
	[<item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>]]);

craftingTable.removeByName("mekanism:module_motorized_servo_unit");
craftingTable.addShaped("mekanism.module_motorized_servo_unit", <item:mekanism:module_motorized_servo_unit>,
	[[<tag:items:forge:alloys/elite>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2, id: "minecraft:swift_sneak"}]}), <tag:items:forge:alloys/elite>],
	[<item:minecraft:blue_ice>, <item:mekanism:module_base>, <item:minecraft:blue_ice>],
	[<item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>]]);
craftingTable.addShaped("mekanism.module_motorized_servo_unit_2", <item:mekanism:module_motorized_servo_unit> *2,
	[[<tag:items:forge:alloys/elite>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 4, id: "minecraft:swift_sneak"}]}), <tag:items:forge:alloys/elite>],
	[<item:minecraft:blue_ice>, <item:mekanism:module_base>, <item:minecraft:blue_ice>],
	[<item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>]]);


// Boots modules

// add armored variant to hydraulic propulsion module recipe because it feels like it's missing
craftingTable.removeByName("mekanism:module_hydraulic_propulsion_unit");
<tag:items: mekanism:free_runners>.add([<item: mekanism:free_runners>, <item: mekanism:free_runners_armored>]);
craftingTable.addShaped("mekanism.module_hydraulic_propulsion_unit", <item:mekanism:module_hydraulic_propulsion_unit>,
	[[<tag:items:forge:alloys/elite>, <tag:items: mekanism:free_runners>, <tag:items:forge:alloys/elite>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "minecraft:riptide"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "minecraft:riptide"}]})],
	[<item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>]]);
craftingTable.addShaped("mekanism.module_hydraulic_propulsion_unit_2", <item:mekanism:module_hydraulic_propulsion_unit> *2,
	[[<tag:items:forge:alloys/elite>, <tag:items: mekanism:free_runners>, <tag:items:forge:alloys/elite>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:riptide"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:riptide"}]})],
	[<item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>]]);

craftingTable.removeByName("mekanism:module_magnetic_attraction_unit");
craftingTable.addShaped("mekanism.module_magnetic_attraction_unit", <item:mekanism:module_magnetic_attraction_unit>,
	[[<tag:items:forge:alloys/elite>, <item:minecraft:iron_bars>, <tag:items:forge:alloys/elite>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "minecraft:loyalty"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "minecraft:loyalty"}]})],
	[<item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>]]);
craftingTable.addShaped("mekanism.module_magnetic_attraction_unit_2", <item:mekanism:module_magnetic_attraction_unit> *2,
	[[<tag:items:forge:alloys/elite>, <item:minecraft:iron_bars>, <tag:items:forge:alloys/elite>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:loyalty"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:loyalty"}]})],
	[<item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>, <item:mekanism:pellet_polonium>]]);

craftingTable.removeByName("mekanism:module_frost_walker_unit");
craftingTable.addShaped("mekanism.module_frost_walker_unit", <item:mekanism:module_frost_walker_unit>,
	[[<tag:items:forge:alloys/elite>, <item:mekanism:hydrogen_bucket>, <tag:items:forge:alloys/elite>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2, id: "minecraft:frost_walker"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2, id: "minecraft:frost_walker"}]})],
	[<item:mekanism:pellet_polonium>, <item:mekanism:hydrogen_bucket>, <item:mekanism:pellet_polonium>]]);


// Meka-Tool modules

craftingTable.removeByName("mekanism:module_farming_unit");
craftingTable.addShaped("mekanism.module_farming_unit", <item:mekanism:module_farming_unit>,
	[[<tag:items:forge:alloys/advanced>, <item:minecraft:iron_hoe>, <tag:items:forge:alloys/advanced>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "apotheosis:natures_blessing"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "apotheosis:natures_blessing"}]})],
	[<item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>]]);
craftingTable.addShaped("mekanism.module_farming_unit_2", <item:mekanism:module_farming_unit> *2,
	[[<tag:items:forge:alloys/advanced>, <item:minecraft:iron_hoe>, <tag:items:forge:alloys/advanced>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "apotheosis:natures_blessing"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "apotheosis:natures_blessing"}]})],
	[<item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>]]);

craftingTable.removeByName("mekanism:module_shearing_unit");
craftingTable.addShaped("mekanism.module_shearing_unit", <item:mekanism:module_shearing_unit>,
	[[<tag:items:forge:alloys/advanced>, <item:minecraft:shears>, <tag:items:forge:alloys/advanced>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "apotheosis:exploitation"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "apotheosis:exploitation"}]})],
	[<item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>]]);

craftingTable.removeByName("mekanism:module_silk_touch_unit");
craftingTable.addShaped("mekanism.module_silk_touch_unit", <item:mekanism:module_silk_touch_unit>,
	[[<tag:items:forge:alloys/elite>, <tag:items:forge:storage_blocks/refined_glowstone>, <tag:items:forge:alloys/elite>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "minecraft:silk_touch"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "minecraft:silk_touch"}]})],
	[<tag:items:forge:pellets/polonium>, <tag:items:forge:pellets/polonium>, <tag:items:forge:pellets/polonium>]]);

craftingTable.removeByName("mekanism:module_fortune_unit");
craftingTable.addShaped("mekanism.module_fortune_unit", <item:mekanism:module_fortune_unit>,
	[[<tag:items:forge:alloys/elite>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "minecraft:fortune"}]}), <tag:items:forge:alloys/elite>],
	[<tag:items:forge:storage_blocks/diamond>, <item:mekanism:module_base>, <tag:items:forge:storage_blocks/diamond>],
	[<tag:items:forge:pellets/polonium>, <tag:items:forge:pellets/polonium>, <tag:items:forge:pellets/polonium>]]);
craftingTable.addShaped("mekanism.module_fortune_unit_2", <item:mekanism:module_fortune_unit> *2,
	[[<tag:items:forge:alloys/elite>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:fortune"}]}), <tag:items:forge:alloys/elite>],
	[<tag:items:forge:storage_blocks/diamond>, <item:mekanism:module_base>, <tag:items:forge:storage_blocks/diamond>],
	[<tag:items:forge:pellets/polonium>, <tag:items:forge:pellets/polonium>, <tag:items:forge:pellets/polonium>]]);

craftingTable.removeByName("mekanism:module_excavation_escalation_unit");
craftingTable.addShaped("mekanism.module_excavation_escalation_unit", <item:mekanism:module_excavation_escalation_unit>,
	[[<tag:items:forge:alloys/advanced>, <item:minecraft:iron_pickaxe>, <tag:items:forge:alloys/advanced>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "minecraft:efficiency"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3, id: "minecraft:efficiency"}]})],
	[<item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>]]);
craftingTable.addShaped("mekanism.module_excavation_escalation_unit_2", <item:mekanism:module_excavation_escalation_unit> *2,
	[[<tag:items:forge:alloys/advanced>, <item:minecraft:iron_pickaxe>, <tag:items:forge:alloys/advanced>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:efficiency"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5, id: "minecraft:efficiency"}]})],
	[<item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>]]);

craftingTable.removeByName("mekanism:module_attack_amplification_unit");
craftingTable.addShaped("mekanism.module_attack_amplification_unit", <item:mekanism:module_attack_amplification_unit>,
	[[<tag:items:forge:alloys/advanced>, <item:minecraft:iron_sword>, <tag:items:forge:alloys/advanced>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 4, id: "minecraft:sharpness"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 4, id: "minecraft:sharpness"}]})],
	[<item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>]]);
craftingTable.addShaped("mekanism.module_attack_amplification_unit_2", <item:mekanism:module_attack_amplification_unit> *2,
	[[<tag:items:forge:alloys/advanced>, <item:minecraft:iron_sword>, <tag:items:forge:alloys/advanced>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 6, id: "minecraft:sharpness"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 6, id: "minecraft:sharpness"}]})],
	[<item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>, <item:mekanism:hdpe_sheet>]]);

craftingTable.removeByName("mekanism:module_vein_mining_unit");
craftingTable.addShaped("mekanism.module_vein_mining_unit", <item:mekanism:module_vein_mining_unit>,
	[[<tag:items:forge:alloys/elite>, <item:mekanismtools:diamond_paxel>, <tag:items:forge:alloys/elite>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "apotheosis:chainsaw"}, {lvl: 1, id: "apotheosis:splitting"}, {lvl: 3, id: "apotheosis:miners_fervor"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "apotheosis:chainsaw"}, {lvl: 1, id: "apotheosis:splitting"}, {lvl: 3, id: "apotheosis:miners_fervor"}]})],
	[<tag:items:forge:pellets/polonium>, <tag:items:forge:pellets/polonium>, <tag:items:forge:pellets/polonium>]]);
craftingTable.addShaped("mekanism.module_vein_mining_unit_2", <item:mekanism:module_vein_mining_unit> *2,
	[[<tag:items:forge:alloys/elite>, <item:mekanismtools:diamond_paxel>, <tag:items:forge:alloys/elite>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "apotheosis:chainsaw"}, {lvl: 1, id: "apotheosis:splitting"}, {lvl: 5, id: "apotheosis:miners_fervor"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "apotheosis:chainsaw"}, {lvl: 1, id: "apotheosis:splitting"}, {lvl: 5, id: "apotheosis:miners_fervor"}]})],
	[<tag:items:forge:pellets/polonium>, <tag:items:forge:pellets/polonium>, <tag:items:forge:pellets/polonium>]]);

craftingTable.removeByName("mekanism:module_blasting_unit");
craftingTable.addShaped("mekanism.module_blasting_unit", <item:mekanism:module_blasting_unit>,
	[[<tag:items:forge:alloys/ultimate>, <item:minecraft:tnt>, <tag:items:forge:alloys/ultimate>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "apotheosis:obliteration"}, {lvl: 3, id: "minecraft:sweeping"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "apotheosis:obliteration"}, {lvl: 3, id: "minecraft:sweeping"}]})],
	[<tag:items:forge:pellets/polonium>, <tag:items:forge:pellets/polonium>, <tag:items:forge:pellets/polonium>]]);
craftingTable.addShaped("mekanism.module_blasting_unit_2", <item:mekanism:module_blasting_unit> *2,
	[[<tag:items:forge:alloys/ultimate>, <item:minecraft:tnt>, <tag:items:forge:alloys/ultimate>],
	[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "apotheosis:obliteration"}, {lvl: 5, id: "minecraft:sweeping"}]}), <item:mekanism:module_base>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "apotheosis:obliteration"}, {lvl: 5, id: "minecraft:sweeping"}]})],
	[<tag:items:forge:pellets/polonium>, <tag:items:forge:pellets/polonium>, <tag:items:forge:pellets/polonium>]]);
