title = TextGeode{
	"Welcome to METaL \nMETal is our 3D immersion lab \nA long time ago in a Galaxy far far away... \nIt is a period of civil war \nRebel spaceships,striking \nfrom a hidden base, have won \ntheir first victory against \nthe evil Galactic Empire \nDuring the battle, rebel \nspies managed to steal secret \nplans to the Empire's \nUltimate weapons the DEATH STAR \nnow go help Luke fight Darth Vader \nand defeat the death star",
	position = {0, 0, 0},
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