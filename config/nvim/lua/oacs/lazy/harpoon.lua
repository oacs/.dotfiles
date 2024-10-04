-- Harpoon quick terminal jumps
return {
	"ThePrimeagen/harpoon",
	config = function()
		-- Terminal commands
		require("oacs.maps.maps").add_harpoon_maps()
	end,
}
