
globals = {
	"area_effects"
}

read_globals = {
	-- Stdlib
	string = {fields = {"split"}},
	table = {fields = {"copy", "getn"}},

	-- Minetest
	"minetest",
	"vector", "ItemStack",
	"dump", "VoxelArea",

	-- deps
	"epic", "epic_skybox",
	"screwdriver", "areas"
}
