-- codesign.lua

require "system"
local screen = require "screen"
local loop = require "loop"

local codesign = {}

local target = {}
	local temp = {}
		temp.color = 0x000000
		temp.posandcolor = "-14|-23|0x000000,12|-23|0x000000,-21|11|0x000000,21|11|0x0f0f0f,59|9|0x000000,-118|-30|0x000000,-123|10|0x000000,974|-29|0xc7c7cc,989|-13|0xc7c7cc"
		temp.degree = 98
	target["描述文件"] = temp

	local temp = {}
		temp.color = 0x4c4c4c
		temp.posandcolor = "317|2|0x000000,561|-13|0x000000,517|-13|0x000000,157|19|0x000000,41|48|0x8e9196,48|-45|0xd5d7d8,-47|-45|0xd6d6d9,-44|44|0x919398,1058|1|0xc7c7cc"
		temp.position = {}
			temp.position.x = 120
			temp.position.y = 1426
	target["描述项"] = temp

	local temp = {}
		temp.color = 0x007aff
		temp.posandcolor = "81|38|0x007aff,80|0|0x007aff,31|39|0x007aff,-5|39|0x007aff,54|18|0x298fff,20|-15|0xffffff,30|-67|0xefeff4,23|67|0xffffff,19|119|0xefeff4"
		temp.position = {}
			temp.position.x = 273
			temp.position.y = 542
	target["信任按钮"] = temp
	
	local temp = {}
		temp.color = 0xff3b30
		temp.posandcolor = "3|21|0xfacecc,37|37|0xfbc9c5,62|39|0xff3b30,60|-1|0xff3b30,-22|40|0xff3b30,-30|17|0xff3b30,19|29|0xf9f9f9,6|19|0xff3b30,-3|20|0xff3b30"
		temp.position = {}
			temp.position.x = 805
			temp.position.y = 1327
	target["确定信任"] = temp
	
local function _sign(signTarget)
	cleanProgress()
	openURL("prefs:root=General")
	mSleep(1000)
	local success = loop.doUntilTrue(screen.slideDown, function ()
		return screen.find(target["描述文件"])
	end)
	if not success then return false,"Can not find the enter of sign." end
	
	screen.safeTap(target["描述文件"])
	mSleep(1000)
	local success = loop.whileFalseToDo(function ()
		return screen.find(signTarget)
	end, screen.slideDown)
	if not success then return false,"Can not find the sign target." end
	
	screen.safeTap(signTarget)
	mSleep(1000)
	screen.safeTap(target["信任按钮"])
	mSleep(1000)
	screen.safeTap(target["确定信任"])
	home.tap()
	return true,nil
end
	
function codesign.sign(signTarget)
	return _sign(signTarget)
end

return codesign
