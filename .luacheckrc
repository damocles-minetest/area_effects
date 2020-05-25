
globals = {
	"area_effects",
	"epic_weather"
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
