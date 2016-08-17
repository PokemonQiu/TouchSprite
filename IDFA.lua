-- IDFA.lua

local loop = require "./loop"
local screen = require "./screen"

local IDFA = {}

local target = {}

-- 广告
local TC_Title_iAd = {}
	TC_Title_iAd.color = 0xc7c7cc
	TC_Title_iAd.posandcolor = "-1113|23|0x000000,-1092|-21|0x000000,-1019|-1|0x000000,-1109|-14|0x000000,-1039|-1|0x000000,-1009|-5|0xffffff,-974|4|0xffffff,-911|3|0xffffff,-938|10|0xffffff"
target["广告"] = TC_Title_iAd

-- 开关 - 开
local CI_Switch_ON = {}
	CI_Switch_ON.color = 0xffffff
	CI_Switch_ON.posandcolor = "-55|-32|0x4cd964,-24|-32|0x4bd763,22|-28|0xffffff,-71|-2|0x4cd964,-34|-3|0x4ad562,48|-4|0xffffff,-56|27|0x4cd964,-31|26|0x4ad462,23|22|0xffffff"
target["开关开"] = CI_Switch_ON

-- 开关 - 关
local CI_Switch_OFF = {}
	CI_Switch_OFF.color = 0xffffff
	CI_Switch_OFF.posandcolor = "-67|-26|0xe1e1e1,53|-32|0xe6e6e6,-76|4|0xd9d9d9,70|6|0xe6e6e6,-62|34|0xbcbcbc,-9|42|0xdadada,-3|45|0xd8d8d8,-747|-7|0x000000,-25|46|0xc0c0c0"
target["开关关"] = CI_Switch_OFF


local function _clickSwitch(position)
	touchDown(1, position.x, position.y)
	mSleep(100)
	touchUp(1, position.x, position.y)
end

function IDFA.refreshIDFA()
	openURL("prefs:root=Privacy")
	mSleep(1000)
	loop.doUntilTrue(screen.slideDown, function ()
		return screen.find(target["广告"])
	end)
	screen.safeTap(target["广告"])
	mSleep(2000)
	if screen.find(target["开关关"]) then
		local point = screen.find(target["开关关"])
		mSleep(3000)
		_clickSwitch(point)
	end
	loop.doUntilTrue(function ()
		mSleep(1000)
	end, function ()
		return screen.find(target["开关开"])
	end)
	_clickSwitch(screen.find(target["开关开"]))
	loop.doUntilTrue(function ()
		mSleep(1000)
	end, function ()
		return screen.find(target["开关关"])
	end)
	toast("end")
end

function IDFA.newRefreshIDFA()
	screen.pushTargetList(target)
	
	openURL("prefs:root=Privacy")
	mSleep(1000)
	loop.doUntilTrue(screen.slideDown, function ()
		return screen.find("广告")
	end)
	screen.safeTap("广告")
	mSleep(2000)
	if screen.find("开关关") then
		local point = screen.find("开关关")
		mSleep(3000)
		_clickSwitch(point)
	end
	loop.doUntilTrue(function ()
		mSleep(1000)
	end, function ()
		return screen.find("开关开")
	end)
	_clickSwitch(screen.find("开关开"))
	loop.doUntilTrue(function ()
		mSleep(1000)
	end, function ()
		return screen.find("开关关")
	end)
	toast("end")
	
	screen.popTargetList()
end

return IDFA
