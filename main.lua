-- This is a Demo for the star wars death star
-- by: John Danielson
require("Text")
require("AddAppDirectory")
AddAppDirectory()

runfile[[lights.lua]]
runfile[[ScrollingText.lua]]
runfile[[solarSystem.lua]]
runfile[[Navigation.lua]]

myNav = FlyOrWalkNavigation{
	start = "flying",
	switchButton = gadget.DigitalInterface("WMButtonPlus"),
	initiateRotationButton1 = gadget.DigitalInterface("WMButtonRight"),
	initiateRotationButton2 = gadget.DigitalInterface("WMButtonLeft"),
}

local function CenterTransformAtPosition(xform, pos)
	local bound = xform:getBound()
	return Transform{
		position = -bound:center() + Vec(unpack(pos)),
		xform,
	}
end

big = Transform{
	position = {8,10,-25},
	scale = .00005,
	orientation = AngleAxis(Degrees(25), Axis{1.0, 0.0, 0.0}),
	CenterTransformAtPosition(Transform{Model[[models/big.ive]]}, {0,0,0})
}
RelativeTo.World:addChild(big)


ships3 = Transform{
	position = {-3,7,-15},
	scale = .005,
	orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
	CenterTransformAtPosition(Transform{Model[[models/3ships.ive]]}, {0,0,0})
}
RelativeTo.World:addChild(ships3)

tie1 = Transform{
	position = {0,0,-10},
	scale = .1,
	orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
	CenterTransformAtPosition(Transform{Model[[models/tie.ive]]}, {0,0,0})
}
RelativeTo.World:addChild(tie1)

tie2 = Transform{
	position = {2,0,-8},
	scale = .1,
	orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
	CenterTransformAtPosition(Transform{Model[[models/tie.ive]]}, {0,0,0})
}
RelativeTo.World:addChild(tie2)

tie3 = Transform{
	position = {1,0,-5},
	scale = .1,
	orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
	CenterTransformAtPosition(Transform{Model[[models/tie.ive]]}, {0,0,0})
}
RelativeTo.World:addChild(tie3)


tie4 = Transform{
	position = {1,5,-4},
	scale = .1,
	orientation = AngleAxis(Degrees(90), Axis{0.0, 1.0, 0.0}),
	CenterTransformAtPosition(Transform{Model[[models/tie.ive]]}, {0,0,0})
}
RelativeTo.World:addChild(tie4)


shootable_objects = {tie1,tie2,tie3,tie4}


runfile[[shoot_and_explode.lua]]
--define a table called "shootable_objects" and list our objects we want to be shootable


dome = Transform{
	position = {0, 0, 0},
	Model("models/dome.osg"),
	scale=100,
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




