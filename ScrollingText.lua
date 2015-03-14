function changeNodeColor(xform, color)
	local mat = osg.Material()
	mat:setColorMode(0x1201);
	mat:setAmbient (0x0408, osg.Vec4(color[1], color[2], color[3], 1.0))
	mat:setDiffuse (0x0408, osg.Vec4(0.2, 0.2, 0.2, 1.0))
	mat:setSpecular(0x0408, osg.Vec4(0.2, 0.2, 0.2, 1.0))
	mat:setShininess(0x0408, 1)
	local ss = xform:getOrCreateStateSet()
	ss:setAttributeAndModes(mat, osg.StateAttribute.Values.ON+osg.StateAttribute.Values.OVERRIDE);
end

title = TextGeode{
	"A long time ago in a Galaxy far far away... \n\nIt is a period of civil war \n\nRebel spaceships,striking \n\nfrom a hidden base, have won \n\ntheir first victory against \n\nthe evil Galactic Empire \n\nDuring the battle, rebel \n\nspies managed to steal secret \n\nplans to the Empire's \n\nUltimate weapons the DEATH STAR \n\nnow go help Luke fight Darth Vader \n\nand defeat the death star",
	position = {0, 0, -10},
	font = Font("DroidSansBold"),
	}



TextXForm = Transform{
	position = {0, 0, 0},
	-- set the transform orientation to -90 on the x (first element of Axis values)
	orientation = AngleAxis(Degrees(-45), Axis{1.0, 0.0, 0.0}),
}


-- 3) Add the model object "m" to the transform node "xform", using the 'addChild' method, the orientation
--will be inherted by the children of xform 
TextXForm:addChild(title)
changeNodeColor(TextXForm, {1,1,0})
RelativeTo.World:addChild(TextXForm)

Actions.addFrameAction(
	function()
		while true do
			dt = Actions.waitForRedraw()
			current_pos = TextXForm:getPosition()
			TextXForm:setPosition(Vec(current_pos:x(),current_pos:y()+(1/8*dt),current_pos:z()-(1/8*dt)))
		end
	end
)