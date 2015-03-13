

runfile[[simpleLights.lua]]

local function CenterTransformAtPosition(xform, pos)
	local bound = xform:getBound()
	return Transform{
		position = -bound:center() + Vec(unpack(pos)),
		xform,
	}
end

local vortex = Transform{
	Model[[models/vortex.ive]],
	orientation = AngleAxis(Degrees(30), Axis{1.0, 0.0, 0.0}),
	scale = .01,
}
vortex = CenterTransformAtPosition(vortex,{-30,-5,-14})

local solarSystem = Transform{
	Model[[models/solarsystem.ive]],
	position = {-25,0,-25},
	orientation = AngleAxis(Degrees(-90), Axis{0.0, 1.0, 0.0}),
	scale = 0.01,
}


local shuttle = Transform{
	Model[[models/shuttle.ive]],
	orientation = AngleAxis(Degrees(-25), Axis{1.0, 0.0, 0.0}),
	scale = 0.0025,
}
shuttle = CenterTransformAtPosition(shuttle,{-25,0,-13.3})

local iss = Transform{
	Model[[models/iss.ive]],
	orientation = AngleAxis(Degrees(20), Axis{1.0, 0.0, 0.0}),
	scale = 1,
}
iss = CenterTransformAtPosition(iss,{-25,0,-13})


RelativeTo.World:addChild(vortex)
RelativeTo.World:addChild(solarSystem)
RelativeTo.World:addChild(shuttle)

RelativeTo.World:addChild(iss)