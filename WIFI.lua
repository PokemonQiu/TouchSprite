-- WIFI.lua

local screen = require "screen"
local loop = require "loop"
require "system"

local WIFI = {}

local target = {}

	-- 选中的 WiFi
	local WF_Item_Selected = {}
		WF_Item_Selected.color = 0x007aff
		WF_Item_Selected.posandcolor = "-1|20|0x007aff,0|-14|0x007aff,-25|-16|0x007aff,21|27|0x007aff,-1077|13|0x007aff,-1087|6|0x007aff,-1055|-8|0x007aff,-14|9|0xffffff,14|5|0xffffff"
		WF_Item_Selected.position = {}
			WF_Item_Selected.position.x = 1150
			WF_Item_Selected.position.y = 495
	target["选中的WIFI"] = WF_Item_Selected

	local temp = {}
		temp.color = 0x007aff
		temp.posandcolor = "-26|-15|0x6bb2ff,-32|18|0xffffff,-2|17|0x7abaff,-55|3|0x007aff,47|5|0x007aff,13|-31|0x007aff,4|32|0x007aff,348|7|0xffffff,673|12|0xffffff"
	target["代理-关闭状态下的关闭位置"] = temp
	
	local temp = {}
		temp.color = 0xffffff
		temp.posandcolor = "-27|-13|0x007aff,-7|-5|0x057cff,-31|16|0x0b7fff,13|-29|0xffffff,-1|34|0xffffff,-75|3|0xffffff,51|2|0xffffff,402|19|0x007aff,806|32|0xffffff"
	target["代理-手动状态下的关闭位置"] = temp
	
	local temp = {}
		temp.color = 0xffffff
		temp.posandcolor = "-27|-20|0x007aff,-5|12|0x007aff,-7|-31|0xffffff,-5|29|0xffffff,-43|3|0xffffff,63|3|0xffffff,403|16|0xffffff,814|24|0x007aff,23|-8|0x007aff"
	target["代理-自动状态下的关闭位置"] = temp

	-- 代理关闭
	local WF_Delegate_Close = {}
		WF_Delegate_Close.color = 0x007aff
		WF_Delegate_Close.posandcolor = "-1|25|0x007aff,25|13|0xdfeeff,52|5|0x007aff,42|28|0xe2efff,-78|6|0xffffff,-288|-6|0x007aff,286|30|0xffffff,633|6|0xffffff,-596|0|0xffffff"
	target["代理-关闭状态下的手动位置"] = WF_Delegate_Close

	-- 代理手动
	local WF_Delegate_Manual = {}
		WF_Delegate_Manual.color = 0x007aff
		WF_Delegate_Manual.posandcolor = "-16|-11|0xecf5ff,-18|2|0xa5d0ff,34|5|0xffffff,-24|21|0xffffff,29|21|0xffffff,-104|2|0x007aff,145|9|0x007aff,299|9|0xffffff,-572|-2|0xffffff"
	target["代理-手动状态下的手动位置"] = WF_Delegate_Manual

	-- 代理自动
	local WF_Delegate_Automatic = {}
		WF_Delegate_Automatic.color = 0xffffff
		WF_Delegate_Automatic.posandcolor = "-15|-4|0x007aff,-16|11|0x5aa8ff,33|0|0x5aa8ff,31|27|0x007aff,-19|28|0x7cbaff,-59|5|0xffffff,59|14|0xffffff,-585|15|0xffffff,583|6|0x007aff"
	target["代理-自动状态下的手动位置"] = WF_Delegate_Automatic

	-- 服务器标题
	local DL_Automatic_Address = {}
		DL_Automatic_Address.color = 0x000000
		DL_Automatic_Address.posandcolor = "16|-8|0xffffff,46|1|0xffffff,4|29|0x797979,-72|27|0x090909,-66|-11|0xb7b7b7,48|4|0x000000,74|13|0x000000,-32|-11|0x000000,309|-112|0x007aff"
	target["服务器标题"] = DL_Automatic_Address

	-- 端口标题
	local DL_Automatic_Port = {}
		DL_Automatic_Port.color = 0xffffff
		DL_Automatic_Port.posandcolor = "9|-20|0x020202,41|-14|0x000000,42|13|0x000000,-5|15|0xffffff,-37|-7|0x000000,-19|-11|0x000000,-43|-25|0x000000,41|-9|0x000000,398|-264|0x007aff"
	target["端口标题"] = DL_Automatic_Port

	local NV_Item_Back = {}
		NV_Item_Back.position = {}
			NV_Item_Back.position.x = 100
			NV_Item_Back.position.y = 125
	target["导航-返回"] = NV_Item_Back

local function _changeHTTPDelegate(address, port)
	
	local success = false
	
	--[[
	openURL("prefs:root=TWITTER")
	mSleep(1000)
	]]
	openURL("prefs:root=WIFI")
	init("0", 0)
	mSleep(5000)

	success = loop.whileFalseToDo(function ()
		return screen.find(target["选中的WIFI"])
	end, function ()
		mSleep(2000)
	end, 5, 1000)
	if not success then return false,"Can not find selected wifi item." end

	screen.safeTap(target["选中的WIFI"])
	mSleep(2000)
	
	local tableList = {target["代理-关闭状态下的手动位置"], target["代理-手动状态下的手动位置"], target["代理-自动状态下的自动位置"]}
	success = loop.doUntilTrue(function ()
		screen.slideDown()
	end, function ()
		return screen.selecte(tableList) ~= 0
	end, 3, 0)
	if not success then return false,"Can not find wifi delegate settings" end
	--screen.slideDown()

	mSleep(2000)
	local selected = screen.selecte(tableList)
	if selected ~= 2 then
		screen.safeTap(tableList[selected])
	end
	mSleep(1000)
	screen.slideDown()
	mSleep(1000)
	
	
	screen.safeTap(target["端口标题"])
	mSleep(1500)
	clearText(8)
	mSleep(1500)
	inputText(tostring(port))
	mSleep(1500)

	screen.safeTap(target["服务器标题"])
	mSleep(1500)
	clearText(15)
	mSleep(1500)
	inputText(address)
	mSleep(1500)


	screen.tap(target["导航-返回"])
	mSleep(1000)
	return true,nil
end

local function _closeHTTPDelegate()
	local success = false
	
	--[[
	openURL("prefs:root=TWITTER")
	mSleep(1000)
	]]
	openURL("prefs:root=WIFI")
	init("0", 0)
	mSleep(5000)

	success = loop.whileFalseToDo(function ()
		return screen.find(target["选中的WIFI"])
	end, function ()
		mSleep(2000)
	end, 5, 1000)
	if not success then return false,"Can not find selected wifi item." end

	screen.safeTap(target["选中的WIFI"])
	mSleep(2000)
	
	local tableList = {target["代理-关闭状态下的关闭位置"], target["代理-手动状态下的关闭位置"], target["代理-自动状态下的关闭位置"]}
	success = loop.doUntilTrue(function ()
		screen.slideDown()
	end, function ()
		return screen.selecte(tableList) ~= 0
	end, 3, 0)
	if not success then return false,"Can not find wifi delegate settings" end
	--screen.slideDown()

	mSleep(2000)
	local selected = screen.selecte(tableList)
	if selected ~= 1 then
		screen.safeTap(tableList[selected])
	end
	mSleep(1000)
	screen.tap(target["导航-返回"])
	return true,nil
end

local function __closeHTTPDelegate()
	local success = false
	
	--[[
	openURL("prefs:root=TWITTER")
	mSleep(1000)
	]]
	openURL("prefs:root=WIFI")
	init("0", 0)
	mSleep(5000)

	success = loop.whileFalseToDo(function ()
		return screen.find("选中的WIFI")
	end, function ()
		mSleep(2000)
	end, 5, 1000)
	if not success then return false,"Can not find selected wifi item." end

	screen.safeTap("选中的WIFI")
	mSleep(2000)
	
	local tableList = {"代理-关闭状态下的关闭位置", "代理-手动状态下的关闭位置", "代理-自动状态下的关闭位置"}
	success = loop.doUntilTrue(function ()
		screen.slideDown()
	end, function ()
		return screen.selecte(tableList) ~= 0
	end, 3, 0)
	if not success then return false,"Can not find wifi delegate settings" end
	--screen.slideDown()

	mSleep(2000)
	local selected = screen.selecte(tableList)
	if selected ~= 1 then
		screen.safeTap(tableList[selected])
	end
	mSleep(1000)
	screen.tap("导航-返回")
	return true,nil
end

function WIFI.changeHTTPDelegate(address, port)
	local success,errMsg = 0,0
	
	screen.pushTargetList(target)
	if not address then
		local IDFA = require "IDFA"
		IDFA.newRefreshIDFA()
		success,errMsg = __closeHTTPDelegate()
	else
		success,errMsg = _changeHTTPDelegate(address, port)
	end
	screen.popTargetList()
	
	return success,errMsg
end

return WIFI
