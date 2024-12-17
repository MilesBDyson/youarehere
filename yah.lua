
local S = default.get_translator



local has_screwdriver_mod = minetest.get_modpath("screwdriver")

local sgroups = table.copy(signs_lib.standard_steel_groups)
sgroups.not_in_creative_inventory = 1



local flip_facedir = {
	[0] = 1,
	[2] = 1,
}


local function rotate(pos, node, user, mode)
	if not signs_lib.can_modify(pos, user) or (has_screwdriver_mod and mode ~= screwdriver.ROTATE_FACE) then
		return false
	end
	minetest.swap_node(pos, {name = node.name, param2 = flip_facedir[node.param2] or 0})
	signs_lib.delete_objects(pos)
	signs_lib.update_sign(pos)
	return true
end

local function disable_apn()
	return
end



local cbox = signs_lib.make_selection_boxes(36, 36)

signs_lib.register_sign("youarehere:xyz_sign", {
	description = S("W3-4"),
	selection_box = cbox,
	mesh = "street_signs_warning_36x36_wall.obj",
	tiles = {
		"street_signs_warning.png",
		"street_signs_sign_edge.png",
	},
	inventory_image = "street_signs_warning_3_line_inv.png",
	groups = signs_lib.standard_steel_groups,
	sounds = signs_lib.standard_steel_sign_sounds,
	number_of_lines = 3,
	horiz_scaling = 1.75,
	vert_scaling = 1.75,
	line_spacing = 1,
	font_size = 15,
	x_offset = 6,
	y_offset = 19,
	chars_per_line = 15,
	entity_info = {
		mesh = "street_signs_warning_36x36_entity_wall.obj",
		yaw = signs_lib.wallmounted_yaw
	},
	drop = "youarehere:xyz_sign",
	allow_widefont = true,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		meta:set_string("text", "X: "..pos.x.."\nY: "..pos.y.."\nZ: "..pos.z) 
	end,
	allow_onpole = true,
	allow_onpole_horizontal = true,
})




























