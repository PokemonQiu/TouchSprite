-- TBSDK.lua
--[[
	Infomation map for TongbuSDK.
	
	local temp = {}
		temp.color = 
		temp.posandcolor = ""
	target[""] = temp
]]

local screen = require "screen"
local loop = require "loop"
require "system"

local TBSDK = {}

local target = {}
	local temp = {}
		temp.color = 0xf3f5f8
		temp.posandcolor = "30|-51|0x0d7aff,1|-57|0x0e7aff,17|11|0xf8f8f8,-23|8|0x0d7aff,-1|19|0x61a8fd,58|-40|0x090909,127|-19|0x000000,191|-16|0xf8f8f8,23|-6|0xf8f8f8"
	target["标识符"] = temp
	
	--[[local temp = {}
		temp.color = 0x0a7fff
		temp.posandColor = "19|-1|0xf8f9f9,29|-17|0x52a3fd,28|-35|0x61abfc,-17|-37|0x007aff,13|-194|0x070807,3|-100|0xd2d6da,-113|-191|0x010101,138|-197|0x000000,154|-197|0x000000"
		temp.position = {}
			temp.position.x = 601
			temp.position.y = 1242
	target["自动登录-取消"] = temp]]
	
	local temp = {}
		temp.degree = 95
		temp.color = 0x1c87fe
		temp.posandcolor = "-23|-15|0x057dff,-50|-17|0x007aff,-33|33|0x1986fe,16|35|0x007aff,64|1|0x007aff,68|-21|0xf8f8f8,32|36|0x99c7fb,48|16|0xf8f8f8,-3|19|0xf9f9f9"
		temp.position = {}
			temp.position.x = 613
			temp.position.y = 1222
	target["自动登录-取消"] = temp
	
	local temp = {}
		temp.color = 0xffffff
		temp.posandcolor = "63|-10|0x5d6172,84|10|0x575b6c,106|-12|0x7b7e8b,86|-9|0xffffff,62|5|0xffffff,102|7|0xffffff,-272|79|0xebebeb,-278|-76|0xdedede,181|-9|0xd6d6d6"
	target["登录账号输入框"] = temp
	
	local temp = {}
		temp.color = 0xffffff
		temp.posandcolor = "-437|317|0xfafafa,-998|9|0xffffff,114|14|0xffffff,47|-143|0x5d6171,67|-162|0x717483,26|-164|0x7c7f8c,-239|443|0x27b269,-695|441|0x27b269,-475|80|0xd6d6d6"
	target["登录密码输入框"] = temp
	
	local temp = {}
		temp.color = 0x0d7aff
		temp.posandcolor = "-8|-9|0xecf3fa,-14|-26|0x0d7aff,-462|-1|0x0d7aff,64|-10|0x2e2e2e,-207|-10|0x2e2e2e,146|-26|0x2e2e2e,202|-25|0x3f3f3f,137|-17|0xfafafa,165|-6|0xfafafa"
		temp.position = {}
			temp.position.x = 740
			temp.position.y = 739
	target["自动登录-开"] = temp

	local temp = {}
		temp.color = 0xfafafa
		temp.posandcolor = "7|-28|0xcbcbcf,-21|29|0xceced3,-481|-8|0x0d7aff,-387|4|0x383838,78|0|0x2e2e2e,141|-2|0x757575,197|7|0x6c6c6c,233|8|0xfafafa,254|-4|0x2e2e2e"
		temp.position = {}
			temp.position.x = 740
			temp.position.y = 739
	target["自动登录-关"] = temp
	
	local temp = {}
		temp.color = 0x27b269
		temp.posandcolor = "-74|-7|0xffffff,-79|-20|0xb0e3c8,-51|-7|0x68c996,-87|15|0xfefefe,49|9|0x35b773,82|-11|0xffffff,66|18|0x80d2a7,72|-28|0xffffff,62|-18|0xe3f5ec"
	target["登录按钮"] = temp
	
	local temp = {}
		temp.color = 0xfafafa
		temp.posandcolor = "-4|3|0x000000,-16|1|0x040404,-40|5|0x343434,-54|7|0xfafafa,-59|8|0x000000,-65|7|0xfafafa,-75|9|0x848484,-186|6|0x1c1c1c,72|25|0x010101"
	target["注册入口按钮"] = temp
	
	local temp = {}
		temp.color = 0xf8f8f8
		temp.posandcolor = "-84|-17|0x1980ff,-87|4|0x0d7aff,-86|19|0x1980ff,83|20|0x117cff,84|-16|0x167fff,121|-2|0xf8f8f8,-109|12|0xf8f8f8,-217|12|0x157efb,-498|-20|0x157efb"
		temp.position = {}
			temp.position.x = 801
			temp.position.y = 85
	target["账号注册"] = temp
	
	local temp = {}
		temp.color = 0xffffff
		temp.posandcolor = "-779|-11|0x000000,-779|6|0x000000,-860|-6|0xffffff,-904|-8|0xffffff,-908|9|0xffffff,-871|12|0xffffff,-803|6|0x464646,-828|-19|0xa1a1a1,-939|-4|0x0c0c0c"
	target["注册账号输入框"] = temp
	
	local temp = {}
		temp.color = 0xffffff
		temp.posandcolor = "-761|-12|0x000000,-761|5|0x000000,-926|-19|0x171717,-814|-4|0x010101,-778|-20|0xcbcbcb,-794|-14|0x020202,-811|13|0x000000,-839|-7|0xffffff,-886|0|0xffffff"
	target["注册密码输入框"] = temp
	
	local temp = {}
		temp.color = 0xffffff
		temp.posandcolor = "-766|-11|0x020202,-766|8|0x030303,-786|-18|0x000000,-801|-1|0x000000,-833|-17|0x0c0c0c,-862|10|0x000000,-892|16|0x0c0c0c,-941|-14|0x000000,-873|-2|0xffffff"
	target["重复密码输入框"] = temp
	
	local temp = {}
		temp.color = 0x27b269
		temp.posandcolor = "-66|2|0xffffff,68|14|0xe4f6ed,80|-17|0xffffff,-87|22|0x4ec084,-74|4|0x4fc085,-93|4|0xffffff,-149|-17|0x27b269,246|13|0x27b269,21|96|0xfafafa"
	target["注册按钮"] = temp
	
	local temp = {}
		temp.color = 0x007aff
		temp.posandcolor = "31|-31|0x007aff,-66|23|0x047cff,-133|-327|0x000000,283|-184|0x343435,-304|-183|0x3e3e3e,35|-91|0xd6dade,60|6|0xf8f8f8,-25|-477|0x176b3f,-20|110|0x969696"
		temp.position = {}
			temp.position.x = 630
			temp.position.y = 1274
	target["网络不通畅，请检查后再试"] = temp
	
	local temp = {}
		temp.color = 0xebebeb
		temp.posandcolor = "-8|-26|0x3f93f8,-45|-8|0x2385fa,11|21|0x368ef9,72|17|0x157efb,93|0|0x3c92f8,-65|18|0x2b89fa,-78|21|0xebebeb,-19|20|0x2a89fa,31|22|0xebebeb"
	target["跳过验证按钮"] = temp
	
	local temp = {}
		temp.color = 0xb9aea3
		temp.posandcolor = "16|-17|0xa99e95,16|17|0xada299,-19|17|0x9e938b,-19|-18|0xaba097,-684|-21|0xffffff,-707|-16|0xffffff,-716|-5|0xffffff,8|66|0xffffff,-1126|72|0xffffff"
		temp.position = {}
			temp.position.x = 1177
			temp.position.y = 745
	target["关闭平台消息"] = temp


local function _login(account, password)
	--local target = TBSDK.target
	-- ====== 用户名 ======
	screen.tap(target["登录账号输入框"])
	mSleep(1000)
	clearText(20)
	mSleep(500)
	inputText(account)
	mSleep(500)
	-- ====== 密  码 ======
	screen.tap(target["登录密码输入框"])
	mSleep(1000)
	clearText(20)
	mSleep(500)
	inputText(password)
	mSleep(500)
	-- ====== 取消自动登录 ======
	screen.safeTap(target["自动登录-开"])
	mSleep(1000)
	-- ====== 登  录 ======
	screen.tap(target["登录按钮"])
	mSleep(3000)
	
	if screen.find(target["跳过验证按钮"]) then
		screen.tap(target["跳过验证按钮"])
	end
	return true,nil
end

local function _register(account, password)
	--local target = TBSDK.target
	-- ====== 进入口 ======
	toast("注册入口按钮")
	local res = screen.tap(target["注册入口按钮"])
	toast(tostring(res))
	mSleep(2000)
	
	toast("账号注册")
	res = screen.tap(target["账号注册"])
	toast(tostring(res))
	mSleep(1000)

	toast("注册账号输入框")
	screen.tap(target["注册账号输入框"])
	mSleep(1000)
	clearText(20)
	inputText(account)
	mSleep(500)
	
	toast("注册密码输入框")
	screen.tap(target["注册密码输入框"])
	mSleep(1000)
	clearText(20)
	inputText(password)
	mSleep(500)
	
	toast("重复密码输入框")
	screen.tap(target["重复密码输入框"])
	mSleep(1000)
	clearText(20)
	inputText(password)
	mSleep(500)
	

	toast("注册按钮")
	screen.tap(target["注册按钮"])
	mSleep(1000)
	
	local res = loop.waitShowOne(target["网络不通畅，请检查后再试"], target["跳过验证按钮"])
	if not res then
		return false, "wait register timeout."
	elseif res == 1 then
		return false, "register error: Alert(\"网络不通畅，请稍候再试\")"
	end
	
	toast("跳过验证按钮")
	loop.waitShow(target["跳过验证按钮"])
	screen.tap(target["跳过验证按钮"])
	mSleep(3000)

	toast("关闭平台消息")
	screen.safeTap(target["关闭平台消息"])
	mSleep(500)
	return true,nil
end

local function _enter(account, password, register, timeoutTarget)
	init("0", 0)
	local list = {target["自动登录-取消"], target["登录按钮"]}
	local list = {"自动登录-取消", "登录按钮"}
	if timeoutTarget then
		list[3] = timeoutTarget
	end
	
	local res = loop.waitShowOneOfList(list, 150, 100)
	if not res then
		return false, "Loading failed."
	end
	
	mSleep(800)
	
	local res = loop.waitShowOneOfList(list, 150, 100)
	
	if res == false then
	elseif res == 1 then
		screen.tap(target["自动登录-取消"])
		mSleep(500)
	elseif res == 3 then
		return false, "Load timeout."
	end
	
	local res,errMsg
	
	if not register then
		return _login(account, password)
	else
		return _register(account, password)
	end
end

function TBSDK.login(account, password, register, timeoutTarget)
	if register == nil then register = false end
	
	screen.pushTargetList(target)
	
	local res,errMsg = _enter(account, password, register, timeoutTarget)
	
	screen.popTargetList()
	
	return res,errMsg
end

return TBSDK