#loader mekanismcontent

// "Afraid of the Dark" Minecraft modpack, by Retinite.
// 
// This file adds Mekanism recipes that require the mekanismcontent loader.

import mods.mekanism.content.builder.GasBuilder;
import mods.mekanism.content.builder.SlurryBuilder;

GasBuilder.builder().color(0x14574C).build("end_essence");
SlurryBuilder.dirty().color(0x332139).build("dirty_enderium");
SlurryBuilder.clean().color(0x67436D).build("clean_enderium");