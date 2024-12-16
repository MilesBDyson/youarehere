if minetest.get_modpath("default") then


minetest.register_craft({
	output = "youarehere:xyz_sign",
	recipe = {
		{ "dye:black", "default:steel_ingot", "dye:yellow" },
		{ "default:steel_ingot", "default:sign_wall_steel",     "default:steel_ingot"          },
		{ "",          "default:steel_ingot",     ""          },
	}
})


minetest.register_craft({
	output = "youarehere:sign_basic",
	recipe = {
		{ "dye:green", "default:sign_wall_steel", "dye:green" },
		{ "dye:white", "default:steel_ingot",     ""          },
		{ "",          "default:steel_ingot",     ""          },
	}
})

end



