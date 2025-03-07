// "Afraid of the Dark" Minecraft modpack, by Retinite.
// 
// This file provides a number of misc. recipe changes, usually for balance.

import crafttweaker.api.ingredient.type.IIngredientEmpty;

// unify all trident recipes
<recipetype:mekanism:nucleosynthesizing>.removeByName("mekanism:nucleosynthesizing/trident");
craftingTable.remove(<item: minecraft:trident>);
craftingTable.remove(<item: apotheosis:inert_trident>);
craftingTable.addShaped("apotheosis.inert_trident_a", <item: apotheosis:inert_trident>,
	[[IIngredientEmpty.getInstance(),         <tag:items: upgrade_aquatic:trident_tip>, <tag:items: upgrade_aquatic:trident_tip>],
	 [IIngredientEmpty.getInstance(),         <item: upgrade_aquatic:prismarine_rod>,   <tag:items: upgrade_aquatic:trident_tip>],
	 [<item: upgrade_aquatic:prismarine_rod>, IIngredientEmpty.getInstance(),           IIngredientEmpty.getInstance()]]);

// decrease prismarine bookshelf cost
craftingTable.remove(<item: apotheosis:seashelf>);
craftingTable.addShaped("apotheosis.seashelf", <item: apotheosis:seashelf>,
	[[<item: minecraft:prismarine_shard>,                            <item: minecraft:prismarine_shard>, <item: minecraft:prismarine_shard>],
	 [<item: minecraft:potion>.withTag({Potion: "minecraft:water"}), <tag: items:forge:bookshelves>,     <item: minecraft:pufferfish>],
	 [<item: minecraft:prismarine_shard>,                            <item: minecraft:prismarine_shard>, <item: minecraft:prismarine_shard>]]);

// increase cost of fluxnetworks wireless charging
// use removeByName to preserve the "wipe_fluxcontroller" recipe
craftingTable.removeByName("fluxnetworks:fluxcontroller");
craftingTable.addShaped("fluxnetworks.fluxcontroller", <item: fluxnetworks:flux_controller>,
	[[<item: fluxnetworks:flux_block>, <item: fluxnetworks:flux_point>,                  <item: fluxnetworks:flux_block>],
	 [<item: fluxnetworks:flux_plug>,  <item: mekanism:module_charge_distribution_unit>, <item: fluxnetworks:flux_plug>],
	 [<item: fluxnetworks:flux_block>, <item: mekanism:ultimate_induction_provider>,     <item: fluxnetworks:flux_block>]]);

// add multiple recipes for Tome of Scrapping
craftingTable.addShaped("apotheosis.scrap_tome_b", <item:apotheosis:scrap_tome> * 6,
	[[<item:minecraft:book>, <item:minecraft:book>,          <item:minecraft:book>],
	 [<item:minecraft:book>, <item:minecraft:chipped_anvil>, <item:minecraft:book>],
	 [<item:minecraft:book>, <item:minecraft:book>,          <item:minecraft:book>]]);
craftingTable.addShaped("apotheosis.scrap_tome_c", <item:apotheosis:scrap_tome> * 4,
	[[<item:minecraft:book>, <item:minecraft:book>,          <item:minecraft:book>],
	 [<item:minecraft:book>, <item:minecraft:damaged_anvil>, <item:minecraft:book>],
	 [<item:minecraft:book>, <item:minecraft:book>,          <item:minecraft:book>]]);
	 
// overhaul the enchantment library recipe
craftingTable.remove(<item: apotheosis:library>);
craftingTable.addShaped("apotheosis.library", <item: apotheosis:library>,
	[[<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "apotheosis:splitting"}]}),    <item:apotheosis:infused_seashelf>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "apotheosis:obliteration"}]})],
	 [<item:apotheosis:infused_hellshelf>,                                                                      <item:ironchests:obsidian_chest>,   <item:apotheosis:infused_hellshelf>],
	 [<item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "apotheosis:obliteration"}]}), <item:apotheosis:infused_seashelf>, <item:minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1, id: "apotheosis:splitting"}]})]]);

// balance the baubley heart canisters
craftingTable.remove(<item: bhc:canister>);
craftingTable.addShaped("bhc.canister", <item: bhc:canister>,
	[[<item: minecraft:iron_nugget>, <item: minecraft:iron_nugget>, <item: minecraft:iron_nugget>],
	[<item: minecraft:iron_nugget>,  <item: bhc:wither_bone>,       <item: minecraft:iron_nugget>],
	[<item: minecraft:iron_nugget>,  <item: minecraft:iron_nugget>, <item: minecraft:iron_nugget>]]);
craftingTable.remove(<item: bhc:red_heart_canister>);
craftingTable.addShapeless("bhc.red_heart_canister", <item: bhc:red_heart_canister>,
	[<item: bhc:canister>, <item: minecraft:golden_apple>, <item: bhc:red_heart>]);
craftingTable.remove(<item: bhc:yellow_heart_canister>);
craftingTable.addShapeless("bhc.yellow_heart_canister", <item: bhc:yellow_heart_canister>,
	[<item: bhc:canister>, <item: bhc:relic_apple>, <item: bhc:yellow_heart>]);
craftingTable.remove(<item: bhc:green_heart_canister>);
craftingTable.addShapeless("bhc.green_heart_canister", <item: bhc:green_heart_canister>,
	[<item: bhc:canister>, <item: minecraft:enchanted_golden_apple>, <item: bhc:green_heart>]);
craftingTable.remove(<item: bhc:blue_heart_canister>);
craftingTable.addShapeless("bhc.blue_heart_canister", <item: bhc:blue_heart_canister>,
	[<item: bhc:canister>, <item: minecraft:golden_apple>, <item: bhc:relic_apple>, <item: minecraft:enchanted_golden_apple>, <item: bhc:blue_heart>]);

// make Mekanism Scuba Tanks rely on Aquamirae Oxygen Tanks rely on Mekanism Advanced Chemical Tanks
craftingTable.remove(<item: mekanism:scuba_tank>);
craftingTable.remove(<item: aquamirae:oxygen_tank>);
craftingTable.addShaped("aquamirae.oxygen_tank", <item: aquamirae:oxygen_tank>,
	[[<item: mekanism:ingot_steel>, <item: aquamirae:oxygelium>,             <item: mekanism:ingot_steel>],
	[<item: mekanism:ingot_steel>,  <item: mekanism:advanced_chemical_tank>, <item: mekanism:ingot_steel>],
	[<item: mekanism:ingot_steel>,  <item: aquamirae:oxygelium>,             <item: mekanism:ingot_steel>]]);
craftingTable.addShaped("mekanism.scuba_tank", <item: mekanism:scuba_tank>.withTag({mekData: {GasTanks: [{Tank: 0, stored: {gasName: "mekanism:oxygen", amount: 64000}}]}}),
	[[IIngredientEmpty.getInstance(), <item: mekanism:basic_control_circuit>, IIngredientEmpty.getInstance()],
	[<item: aquamirae:oxygen_tank>,   <item: mekanism:alloy_infused>,         <item: aquamirae:oxygen_tank>],
	[<item: mekanism:ingot_steel>,    <item: mekanism:ingot_steel>,           <item: mekanism:ingot_steel>]]);

// force Mekanism Flamethrower to require the Advanced Chemical Tank
craftingTable.remove(<item: mekanism:flamethrower>);
craftingTable.addShaped("mekanism.flamethrower", <item: mekanism:flamethrower>,
	[[<tag:items:forge:ingots/tin>,   <tag:items:forge:ingots/tin>,           <tag:items:forge:ingots/tin>],
	[<tag:items:forge:ingots/tin>,    <item:mekanism:advanced_chemical_tank>, <item:minecraft:flint_and_steel>],
	[<tag:items:forge:ingots/bronze>, <tag:items:forge:circuits/advanced>,    <tag:items:forge:ingots/bronze>]]);

// make Mekanism's Teleportation Core more expensive
craftingTable.remove(<item: mekanism:teleportation_core>);
craftingTable.addShaped("mekanism.teleportation_core", <item: mekanism:teleportation_core>,
	[[<item: mekanism:alloy_reinforced>, <item: mekanism:alloy_atomic>, <item: mekanism:alloy_reinforced>],
	[<item: mekanism:alloy_atomic>,      <item: minecraft:lodestone>,   <item: mekanism:alloy_atomic>],
	[<item: mekanism:alloy_reinforced>,  <item: mekanism:alloy_atomic>, <item: mekanism:alloy_reinforced>]]);

// now reduce Mekanism Security Desk price to compensate
craftingTable.remove(<item: mekanism:security_desk>);
craftingTable.addShaped("mekanism.security_desk", <item: mekanism:security_desk>,
	[[<item: mekanism:ingot_steel>,          <tag:items:forge:glass>,       <item: mekanism:ingot_steel>],
	[<item: mekanism:elite_control_circuit>, <item: mekanism:steel_casing>, <item: mekanism:elite_control_circuit>],
	[<item: mekanism:ingot_steel>,           <item: minecraft:ender_eye>,   <item: mekanism:ingot_steel>]]);

// require budding amethyst for Waystones' Warp Dust
craftingTable.remove(<item: waystones:warp_dust>);
craftingTable.addShaped("waystones.warp_dust", <item: waystones:warp_dust> *4,
	[[<item: minecraft:ender_pearl>, <item: minecraft:ender_pearl>,      <item: minecraft:ender_pearl>],
	 [<item: minecraft:ender_pearl>, <item: minecraft:budding_amethyst>, <item: minecraft:ender_pearl>],
	 [<item: minecraft:ender_pearl>, <item: minecraft:ender_pearl>,      <item: minecraft:ender_pearl>]]);

// require Mekanism Teleporters to craft Waystones
craftingTable.remove(<item: waystones:warp_stone>);
craftingTable.remove(<item: waystones:waystone>);
craftingTable.removeByName("waystones:mossy_waystone");
craftingTable.remove(<item: waystones:sandy_waystone>);
craftingTable.removeByName("waystones:sharestone");
craftingTable.addShaped("waystones.warp_stone", <item:waystones:warp_stone>,
	[[<item: waystones:warp_dust>, <item: minecraft:ender_eye>,          <item: waystones:warp_dust>],
	[<item: minecraft:ender_eye>,  <item: mekanism:portable_teleporter>, <item: minecraft:ender_eye>],
	[<item: waystones:warp_dust>,  <item: minecraft:ender_eye>,          <item: waystones:warp_dust>]]);
craftingTable.addShaped("waystones.waystone", <item:waystones:waystone>,
	[[<item: mekanismgenerators:solar_generator>,   <item: waystones:warp_plate>,      <item: mekanismgenerators:solar_generator>],
	[<item:minecraft:stone_bricks>,                 <item: mekanism:teleporter>,       <item:minecraft:stone_bricks>],
	[<item: mekanism:teleporter_frame>,             <item: mekanism:teleporter_frame>, <item: mekanism:teleporter_frame>]]);
craftingTable.addShaped("waystones.mossy_waystone", <item:waystones:mossy_waystone>,
	[[<item: mekanismgenerators:solar_generator>,   <item: waystones:warp_plate>,      <item: mekanismgenerators:solar_generator>],
	[<item: minecraft:mossy_stone_bricks>,          <item: mekanism:teleporter>,       <item: minecraft:mossy_stone_bricks>],
	[<item: mekanism:teleporter_frame>,             <item: mekanism:teleporter_frame>, <item: mekanism:teleporter_frame>]]);
craftingTable.addShaped("waystones.sandy_waystone", <item:waystones:sandy_waystone>,
	[[<item: mekanismgenerators:solar_generator>,   <item: waystones:warp_plate>,      <item: mekanismgenerators:solar_generator>],
	[<item: minecraft:chiseled_sandstone>,          <item: mekanism:teleporter>,       <item: minecraft:chiseled_sandstone>],
	[<item: mekanism:teleporter_frame>,             <item: mekanism:teleporter_frame>, <item: mekanism:teleporter_frame>]]);
craftingTable.addShaped("waystones.sharestone", <item:waystones:sharestone>,
	[[<item: mekanismgenerators:solar_generator>, <item: waystones:warp_plate>,      <item: mekanismgenerators:solar_generator>],
	[IIngredientEmpty.getInstance(),              <item: mekanism:teleporter>,       IIngredientEmpty.getInstance()],
	[<item: mekanism:teleporter_frame>,           <item: mekanism:teleporter_frame>, <item: mekanism:teleporter_frame>]]);

// fix Illuminative's Magma Lamp
craftingTable.remove(<item: illuminative:magma_lamp>);
craftingTable.addShaped("illuminative.magma_lamp_recipe", <item: illuminative:magma_lamp>,
	[[IIngredientEmpty.getInstance(), <item: minecraft:iron_ingot>,  IIngredientEmpty.getInstance()],
	[<item: minecraft:iron_ingot>,    <item: minecraft:magma_block>, <item: minecraft:iron_ingot>],
	[IIngredientEmpty.getInstance(),  <item: minecraft:iron_ingot>,  IIngredientEmpty.getInstance()]]);

// remove Night Vision Potion dependency from Apotheosis's Shelf of Sight
craftingTable.remove(<item: apotheosis:sightshelf>);
craftingTable.addShaped("apotheosis.sightshelf", <item:apotheosis:sightshelf>,
	[[<item: minecraft:gold_block>,                                     <item: apotheosis:infused_hellshelf>, <item: minecraft:gold_block>],
	[<item:minecraft:potion>.withTag({Potion: "apotheosis:knowledge"}), <item: minecraft:ender_eye>,          <item: minecraft:spyglass>],
	[<item: minecraft:gold_block>,                                      <item: apotheosis:infused_hellshelf>, <item: minecraft:gold_block>]]);

// allow Deep Dark Regrowth's plasma chunks to be converted from diamonds
craftingTable.remove(<item:deep_dark_regrowth:pulse_flower>);
craftingTable.addShaped("deep_dark_regrowth.pulse_flower", <item:deep_dark_regrowth:pulse_flower>,
	[[IIngredientEmpty.getInstance(),              <item:deep_dark_regrowth:pulse_flower_petal>, IIngredientEmpty.getInstance()],
	[<item:deep_dark_regrowth:pulse_flower_petal>, <item:minecraft:diamond>,                     <item:deep_dark_regrowth:pulse_flower_petal>],
	[IIngredientEmpty.getInstance(),               <item:deep_dark_regrowth:pulse_flower_petal>, IIngredientEmpty.getInstance()]]);

// lock Lasers and Laser Amplifiers behind appropriate battery storage
craftingTable.remove(<item:mekanism:laser>);
craftingTable.addShaped("mekanism.laser", <item:mekanism:laser>,
	[[<tag:items:mekanism:alloys/reinforced>, <item:solarpanels:improved_energy_tablet>, IIngredientEmpty.getInstance()],
	 [<tag:items:mekanism:alloys/reinforced>, <item:mekanism:basic_induction_provider>,  <tag:items:forge:gems/diamond>],
	 [<tag:items:mekanism:alloys/reinforced>, <item:solarpanels:improved_energy_tablet>, IIngredientEmpty.getInstance()]]);
craftingTable.remove(<item:mekanism:laser_amplifier>);
craftingTable.addShaped("mekanism.laser_amplifier", <item:mekanism:laser_amplifier>,
	[[<item:mekanism:advanced_induction_cell>, <item:minecraft:quartz>,                     <item:mekanism:advanced_induction_cell>],
	 [<item:minecraft:quartz>,                 <item:mekanism:advanced_induction_provider>, <tag:items:forge:gems/diamond>],
	 [<item:mekanism:advanced_induction_cell>, <item:minecraft:quartz>,                     <item:mekanism:advanced_induction_cell>]]);

// slight change to FTBQuests' Task Screen to make use of the Quest Book
craftingTable.remove(<item:ftbquests:screen_1>);
craftingTable.addShaped("ftbquests.screen_1", <item:ftbquests:screen_1>,
	[[<tag:items:forge:stone>, <tag:items:forge:stone>, <tag:items:forge:stone>],
	 [<tag:items:forge:stone>, <item:ftbquests:book>,   <tag:items:forge:stone>],
	 [<tag:items:forge:stone>, <tag:items:forge:stone>, <tag:items:forge:stone>]]);

// incorporate Rotten Creatures' TNT Barrels into Mekanism Additions' Obsidian TNT recipe
craftingTable.remove(<item:mekanismadditions:obsidian_tnt>);
craftingTable.addShaped("mekanismadditions.obsidian_tnt", <item:mekanismadditions:obsidian_tnt>,
	[[<item:minecraft:obsidian>,  <item:minecraft:obsidian>,  <item:minecraft:obsidian>],
	 [<tag:items: minecraft:tnt>, <tag:items: minecraft:tnt>, <tag:items: minecraft:tnt>],
	 [<item:minecraft:obsidian>,  <item:minecraft:obsidian>,  <item:minecraft:obsidian>]]);

// incorporate Functional Storage into Mekanism QIO recipes
craftingTable.remove(<item:mekanism:qio_drive_array>);
craftingTable.remove(<item:mekanism:qio_dashboard>);
craftingTable.remove(<item:mekanism:qio_importer>);
craftingTable.remove(<item:mekanism:qio_exporter>);
craftingTable.remove(<item:mekanism:qio_redstone_adapter>);
craftingTable.remove(<item:mekanism:qio_drive_base>);
craftingTable.remove(<item:mekanism:qio_drive_hyper_dense>);
craftingTable.remove(<item:mekanism:qio_drive_time_dilating>);
craftingTable.remove(<item:mekanism:qio_drive_supermassive>);
craftingTable.addShaped("mekanism.qio_drive_array", <item:mekanism:qio_drive_array>,
	[[<tag:items:forge:pellets/polonium>,  <item:functionalstorage:ender_drawer>,       <tag:items:forge:pellets/polonium>],
	 [<tag:items:forge:circuits/ultimate>, <item:functionalstorage:storage_controller>, <tag:items:forge:circuits/ultimate>],
	 [<tag:items:forge:pellets/polonium>,  <item:mekanism:teleportation_core>,          <tag:items:forge:pellets/polonium>]]);
craftingTable.addShaped("mekanism.qio_dashboard", <item:mekanism:qio_dashboard>,
	[[<tag:items:forge:ingots/lead>,      <item:functionalstorage:ender_drawer>, <tag:items:forge:ingots/lead>],
	 [<tag:items:forge:pellets/polonium>, <tag:items:forge:glass_panes>,         <tag:items:forge:pellets/polonium>],
	 [<tag:items:forge:ingots/lead>,      <item:mekanism:teleportation_core>,    <tag:items:forge:ingots/lead>]]);
craftingTable.addShaped("mekanism.qio_importer", <item:mekanism:qio_importer>,
	[[<tag:items:forge:ingots/lead>,      <item:mekanism:teleportation_core>,      <tag:items:forge:ingots/lead>],
	 [<tag:items:forge:pellets/polonium>, <tag:items:forge:circuits/ultimate>,     <tag:items:forge:pellets/polonium>],
	 [IIngredientEmpty.getInstance(),     <item:functionalstorage:puller_upgrade>, IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("mekanism.qio_exporter", <item:mekanism:qio_exporter>,
	[[<tag:items:forge:ingots/lead>,      <item:mekanism:teleportation_core>,      <tag:items:forge:ingots/lead>],
	 [<tag:items:forge:pellets/polonium>, <tag:items:forge:circuits/ultimate>,     <tag:items:forge:pellets/polonium>],
	 [IIngredientEmpty.getInstance(),     <item:functionalstorage:pusher_upgrade>, IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("mekanism.qio_redstone_adapter", <item:mekanism:qio_redstone_adapter>,
	[[<tag:items:forge:pellets/polonium>,  <item:minecraft:redstone_torch>,           <tag:items:forge:pellets/polonium>],
	 [<tag:items:forge:circuits/ultimate>, <item:functionalstorage:redstone_upgrade>, <tag:items:forge:circuits/ultimate>],
	 [<tag:items:forge:pellets/polonium>,  <item:mekanism:teleportation_core>,        <tag:items:forge:pellets/polonium>]]);
craftingTable.addShaped("mekanism.qio_drive_base", <item:mekanism:qio_drive_base>,
	[[<tag:items:forge:ingots/lead>,            <item:mekanism:ultimate_control_circuit>, <tag:items:forge:ingots/lead>],
	 [<item:mekanism:ultimate_control_circuit>, <item:functionalstorage:copper_upgrade>,  <item:mekanism:ultimate_control_circuit>],
	 [<tag:items:forge:ingots/lead>,            <item:mekanism:ultimate_control_circuit>, <tag:items:forge:ingots/lead>]]);
craftingTable.addShaped("mekanism.qio_drive_hyper_dense", <item:mekanism:qio_drive_hyper_dense>,
	[[<tag:items:forge:ingots/lead>,  <item:mekanism:qio_drive_base>,        <tag:items:forge:ingots/lead>],
	 [<item:mekanism:qio_drive_base>, <item:functionalstorage:gold_upgrade>, <item:mekanism:qio_drive_base>],
	 [<tag:items:forge:ingots/lead>,  <item:mekanism:qio_drive_base>,        <tag:items:forge:ingots/lead>]]);
craftingTable.addShaped("mekanism.qio_drive_time_dilating", <item:mekanism:qio_drive_time_dilating>,
	[[<tag:items:forge:ingots/lead>,         <item:mekanism:qio_drive_hyper_dense>,    <tag:items:forge:ingots/lead>],
	 [<item:mekanism:qio_drive_hyper_dense>, <item:functionalstorage:diamond_upgrade>, <item:mekanism:qio_drive_hyper_dense>],
	 [<tag:items:forge:ingots/lead>,         <item:mekanism:qio_drive_hyper_dense>,    <tag:items:forge:ingots/lead>]]);
craftingTable.addShaped("mekanism.qio_drive_supermassive", <item:mekanism:qio_drive_supermassive>,
	[[<item:functionalstorage:netherite_upgrade>, <item:mekanism:qio_drive_time_dilating>, <item:functionalstorage:netherite_upgrade>],
	 [<item:mekanism:qio_drive_time_dilating>,    <tag:items:forge:pellets/antimatter>,    <item:mekanism:qio_drive_time_dilating>],
	 [<item:functionalstorage:netherite_upgrade>, <item:mekanism:qio_drive_time_dilating>, <item:functionalstorage:netherite_upgrade>]]);

// replace Steel in Mekanism's Thermal Evaporation Block with bronze
craftingTable.remove(<item:mekanism:thermal_evaporation_block>);
craftingTable.addShaped("mekanism.thermal_evaporation_block", <item:mekanism:thermal_evaporation_block> * 4,
	[[<tag:items:forge:ingots/bronze>, <tag:items:forge:ingots/bronze>, <tag:items:forge:ingots/bronze>],
	 [<tag:items:forge:ingots/bronze>, <tag:items:forge:ingots/copper>, <tag:items:forge:ingots/bronze>],
	 [<tag:items:forge:ingots/bronze>, <tag:items:forge:ingots/bronze>, <tag:items:forge:ingots/bronze>]]);

// replace some Mekanism Energy Tablets with larger tablets from More Solar Panels
craftingTable.remove(<item:mekanism:chargepad>);
craftingTable.remove(<item:mekanism:resistive_heater>);
craftingTable.remove(<item:mekanism:advanced_energy_cube>);
craftingTable.remove(<item:mekanism:advanced_induction_cell>);
craftingTable.remove(<item:mekanism:portable_teleporter>);
craftingTable.remove(<item:mekanism:elite_energy_cube>);
craftingTable.remove(<item:mekanism:elite_induction_cell>);
craftingTable.remove(<item:mekanism:ultimate_energy_cube>);
craftingTable.remove(<item:mekanism:ultimate_induction_cell>);
craftingTable.addShaped("mekanism.chargepad", <item:mekanism:chargepad>,
	[[<item:minecraft:polished_blackstone_pressure_plate>, <item:minecraft:polished_blackstone_pressure_plate>, <item:minecraft:polished_blackstone_pressure_plate>],
	 [<tag:items:forge:ingots/steel>,                      <item:solarpanels:improved_energy_tablet>,           <tag:items:forge:ingots/steel>]]);
craftingTable.addShaped("mekanism.resistive_heater", <item:mekanism:resistive_heater>,
	[[<tag:items:forge:ingots/tin>,     <tag:items:forge:dusts/redstone>,          <tag:items:forge:ingots/tin>],
	 [<tag:items:forge:dusts/redstone>, <item:mekanism:steel_casing>,              <tag:items:forge:dusts/redstone>],
	 [<tag:items:forge:ingots/tin>,     <item:solarpanels:improved_energy_tablet>, <tag:items:forge:ingots/tin>]]);
craftingTable.addShaped("mekanism.energy_cube/advanced", <item:mekanism:advanced_energy_cube>,
	[[<tag:items:mekanism:alloys/infused>, <item:solarpanels:improved_energy_tablet>, <tag:items:mekanism:alloys/infused>],
	 [<tag:items:forge:ingots/osmium>,     <item:mekanism:basic_energy_cube>,         <tag:items:forge:ingots/osmium>],
	 [<tag:items:mekanism:alloys/infused>, <item:solarpanels:improved_energy_tablet>, <tag:items:mekanism:alloys/infused>]]);
craftingTable.addShaped("mekanism.induction/cell/advanced", <item:mekanism:advanced_induction_cell>,
	[[<item:solarpanels:improved_energy_tablet>, <item:mekanism:basic_induction_cell>, <item:solarpanels:improved_energy_tablet>],
	 [<item:mekanism:basic_induction_cell>,      <item:mekanism:advanced_energy_cube>, <item:mekanism:basic_induction_cell>],
	 [<item:solarpanels:improved_energy_tablet>, <item:mekanism:basic_induction_cell>, <item:solarpanels:improved_energy_tablet>]]);
craftingTable.addShaped("mekanism.portable_teleporter", <item:mekanism:portable_teleporter>,
	[[IIngredientEmpty.getInstance(),   <item:solarpanels:quantum_energy_tablet>, IIngredientEmpty.getInstance()],
	 [<tag:items:forge:circuits/basic>, <item:mekanism:teleportation_core>,       <tag:items:forge:circuits/basic>],
	 [IIngredientEmpty.getInstance(),   <item:solarpanels:quantum_energy_tablet>, IIngredientEmpty.getInstance()]]);
craftingTable.addShaped("mekanism.energy_cube/elite", <item:mekanism:elite_energy_cube>,
	[[<tag:items:mekanism:alloys/reinforced>, <item:solarpanels:quantum_energy_tablet>, <tag:items:mekanism:alloys/reinforced>],
	 [<tag:items:forge:ingots/gold>,          <item:mekanism:advanced_energy_cube>,     <tag:items:forge:ingots/gold>],
	 [<tag:items:mekanism:alloys/reinforced>, <item:solarpanels:quantum_energy_tablet>, <tag:items:mekanism:alloys/reinforced>]]);
craftingTable.addShaped("mekanism.induction/cell/elite", <item:mekanism:elite_induction_cell>,
	[[<item:solarpanels:quantum_energy_tablet>, <item:mekanism:advanced_induction_cell>, <item:solarpanels:quantum_energy_tablet>],
	 [<item:mekanism:advanced_induction_cell>,  <item:mekanism:elite_energy_cube>,       <item:mekanism:advanced_induction_cell>],
	 [<item:solarpanels:quantum_energy_tablet>, <item:mekanism:advanced_induction_cell>, <item:solarpanels:quantum_energy_tablet>]]);
craftingTable.addShaped("mekanism.energy_cube/ultimate", <item:mekanism:ultimate_energy_cube>,
	[[<tag:items:mekanism:alloys/atomic>, <item:solarpanels:spectral_energy_tablet>, <tag:items:mekanism:alloys/atomic>],
	 [<tag:items:forge:gems/diamond>,     <item:mekanism:elite_energy_cube>,         <tag:items:forge:gems/diamond>],
	 [<tag:items:mekanism:alloys/atomic>, <item:solarpanels:spectral_energy_tablet>, <tag:items:mekanism:alloys/atomic>]]);
craftingTable.addShaped("mekanism.induction/cell/ultimate", <item:mekanism:ultimate_induction_cell>,
	[[<item:solarpanels:light_absorbing_energy_tablet>, <item:mekanism:elite_induction_cell>, <item:solarpanels:light_absorbing_energy_tablet>],
	 [<item:mekanism:elite_induction_cell>,             <item:mekanism:ultimate_energy_cube>, <item:mekanism:elite_induction_cell>],
	 [<item:solarpanels:light_absorbing_energy_tablet>, <item:mekanism:elite_induction_cell>, <item:solarpanels:light_absorbing_energy_tablet>]]);

// reduce cost of Unusual End's Purpur Tank
craftingTable.remove(<item:unusualend:purpur_tank>);
craftingTable.addShaped("unusualend.purpur_tank_recipe", <item:unusualend:purpur_tank>,
	[[<item:minecraft:purpur_block>, <item:minecraft:ender_pearl>, <item:minecraft:purpur_block>],
	 [<item:minecraft:end_stone>,    <item:minecraft:barrel>,      <item:minecraft:end_stone>],
	 [<item:minecraft:purpur_block>, <item:minecraft:end_stone>,   <item:minecraft:purpur_block>]]);

// reduce leather generation from Born in Chaos's Monster Skin
craftingTable.removeByName("born_in_chaos_v1:monster_skin_k");
craftingTable.addShapeless("born_in_chaos_v1.monster_skin_k", <item: minecraft:leather>,
	[<item:born_in_chaos_v1:monster_skin>, <item:born_in_chaos_v1:monster_skin>]);
<recipetype:mekanism:purifying>.addRecipe("purify_monster_skin", <item:born_in_chaos_v1:monster_skin>, <gas:mekanism:oxygen>, <item:minecraft:leather>);

// change Born in Chaos's Soul Soil recipe for balance
craftingTable.removeByName("born_in_chaos_v1:solsoil_k");
craftingTable.addShaped("born_in_chaos_v1.solsoil_k", <item:minecraft:soul_soil>,
	[[<item:born_in_chaos_v1:ethereal_spirit>, <item:born_in_chaos_v1:ethereal_spirit>, <item:born_in_chaos_v1:ethereal_spirit>],
	 [<item:born_in_chaos_v1:ethereal_spirit>, <tag:items:minecraft:sand>,              <item:born_in_chaos_v1:ethereal_spirit>],
	 [<item:born_in_chaos_v1:ethereal_spirit>, <item:born_in_chaos_v1:ethereal_spirit>, <item:born_in_chaos_v1:ethereal_spirit>]]);
