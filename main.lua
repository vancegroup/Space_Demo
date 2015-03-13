-- This is a Demo for the star wars death star
-- by: John Danielson
require("Text")
require("AddAppDirectory")
AddAppDirectory()

runfile[[lights.lua]]
runfile[[navigation.lua]]
runfile[[ScrollingText.lua]]
runfile[[solarSystem.lua]]
local function CenterTransformAtPosition(xform, pos)
	local bound = xform:getBound()
	return Transform{
		position = -bound:center() + Vec(unpack(pos)),
		xform,
	}
end

dome = Transform{
	position = {0, 0, 0},
	Model("models/dome.osg"),
	scale=50,
}
RelativeTo.World:addChild(dome)


local shuttle_sw = Transform{
	Transform{
		Model("models/shuttle_sw.ive"),
		orientation = AngleAxis(Degrees(-90), Axis{1.0, 0.0, 0.0}),
	},
	orientation = AngleAxis(Degrees(180), Axis{0.0, 1.0, 0.0}),
	scale = .00005,
}
shuttle_sw = CenterTransformAtPosition(shuttle_sw,{4, -2, -10})
RelativeTo.World:addChild(shuttle_sw)

starwars = Transform{
	position = {4, -2, -25},
	Model("models/deathstar.osg"),
	scale=2.5,
	orientation = AngleAxis(Degrees(180), Axis{0.0, 1.0, 0.0}),
}
RelativeTo.World:addChild(starwars)

lightsaber = Transform{
	position = {1.35, 0.0, 0.45},
	Model("models/lightsaber.osg"),
	scale = 0.5,
}

local xform = osg.MatrixTransform()
RelativeTo.Room:addChild(xform)
xform:addChild(lightsaber)

Actions.addFrameAction(
	function()
		local device = gadget.PositionInterface("VJWand")
		while true do
			xform:setMatrix(device.matrix)
			Actions.waitForRedraw()
		end
	end
)




