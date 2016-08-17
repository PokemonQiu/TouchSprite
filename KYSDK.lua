-- KYSDK.lua

local screen = require "screen"
local loop = require "loop"
require "system"

local KYSDK = {}

local target = {}
	local temp = {}
		temp.color = 0xe6463c
		temp.posandcolor = "15|25|0xffffff,48|62|0xffffff,144|22|0x1c1c25,192|44|0x181821,-378|498|0x2da4e9,-406|717|0x28a2e8,-65|931|0x28a3e9,89|943|0xffffff,-278|1106|0x2da4e8"
	target["标识符"] = temp
	
	--[[
	local temp = {}
		temp.color = 0xffffff
		temp.posandcolor = "26|-25|0xfafdfe,34|5|0x42aeec,-42|4|0xfbfdfe,-71|-19|0xc9e8f9,-76|-28|0x28a3e9,65|15|0xffffff,97|16|0xfbfdff,159|14|0x28a3e9,173|-9|0x83caf2"
		temp.position = {}
			temp.position.x = 591
			temp.position.y = 1177
	target["自动登录-取消"] = temp
	]]
	
	local temp = {}
		temp.color = 0x28a3e9
		temp.posandcolor = "-7|-25|0x28a3e9,-145|9|0x28a3e9,134|-27|0x77c4f1,130|17|0x28a3e9,-8|-52|0xffffff,-1|36|0xffffff,13|-149|0x84ccf5,-4|93|0xececec,15|-102|0xececec"
		temp.position = {}
			temp.position.x = 627
			temp.position.y = 1177
	target["自动登录-取消"] = temp

	local temp = {}
		temp.color = 0xffffff
		temp.posandcolor = "80|4|0xffffff,-68|-91|0xececec,-977|-42|0x2da4e9,-1002|-16|0x51b4ec,-966|17|0x3baaea,-992|14|0x28a2e8,-1007|39|0x28a2e8,-1023|61|0xffffff,-1034|-31|0xffffff"
	target["登录账号输入框"] = temp
	
	local temp = {}
		temp.color = 0xffffff
		temp.posandcolor = "100|-2|0xffffff,-978|-25|0x28a2e8,-983|7|0x2ba3e8,-975|4|0x4cb2ec,-967|15|0xffffff,-644|236|0x28a3e9,-277|235|0x28a3e9,-437|232|0xe3f3fc,-458|147|0xececec"
	target["登录密码输入框"] = temp
	
	local temp = {}
		temp.color = 0x28a3e9
		temp.posandcolor = "-5|-1|0xffffff,-38|-3|0xffffff,-79|7|0xffffff,93|-9|0xf8fcfe,83|-1|0x28a3e9,57|2|0x28a3e9,30|1|0x28a3e9,-4|52|0x28a3e9,-7|123|0xececec"
	target["登录按钮"] = temp
	
	local temp = {}
		temp.color = 0xececec
		temp.posandcolor = "-98|-17|0x2aa2e8,-80|18|0xececec,-56|12|0xececec,90|20|0x28a2e8,97|-5|0xbbd9eb,30|-24|0x32a5e8,30|21|0x67b9e9,-23|23|0xd1e1eb,-99|23|0xc1dceb"
	target["注册入口按钮"] = temp
	
	local temp = {}
		temp.color = 0x28a2e8
		temp.posandcolor = "25|3|0x28a2e8,-41|16|0xf0f0f0,-84|-10|0x44ade9,-105|-2|0xf0f0f0,-93|-15|0xf0f0f0,81|22|0xf0f0f0,65|-25|0x28a2e8,118|-6|0x29a2e8,127|21|0xc1deee"
		temp.degree = 100
		temp.margin = {}
			temp.margin.top = 1100
			temp.margin.left = 25
			temp.margin.right = 0
			temp.margin.bottom = 0
	target["账号注册"] = temp
	
	local temp = {}
		temp.color = 0xffffff
		temp.posandcolor = "-981|-45|0x39a9ea,-963|45|0x28a2e8,-998|44|0x28a2e8,-999|9|0x29a2e8,-960|8|0x4db2ec,-59|-87|0xf0f0f0,-27|86|0xf0f0f0,-1029|-45|0xffffff,-1035|52|0xffffff"
		temp.position = {}
			temp.position.x = 1089
			temp.position.y = 566
	target["注册账号输入框"] = temp
	
	local temp = {}
		temp.color = 0xffffff
		temp.posandcolor = "88|-36|0xffffff,92|28|0xffffff,-972|-9|0x28a2e8,-972|4|0x28a2e8,-956|-8|0xffffff,-988|-8|0xffffff,-972|-34|0x28a2e8,-938|-6|0x28a2e8,-1005|-9|0x28a2e8"
		temp.position = {}
			temp.position.x = 1090
			temp.position.y = 772
	target["注册密码输入框"] = temp
	
	local temp = {}
		temp.color = 0x28a3e9
		temp.posandcolor = "-1|11|0x28a3e9,-14|-22|0xf4f4f4,11|-22|0xf4f4f4,-21|28|0xedf1f3,9|26|0xf4f4f4,-125|-2|0x28a3e9,-98|-3|0x28a3e9,-67|20|0xf4f4f4,186|31|0x28a3e9"
		temp.position = {}
			temp.position.x = 619
			temp.position.y = 998
	target["注册按钮"] = temp
	
	local temp = {}
		temp.color = 0x268cfb
		temp.posandcolor = "-55|-24|0x1081fd,65|27|0x007aff,-49|28|0x0e80fe,37|-28|0x017aff,48|1|0xe4e5e5,42|-16|0xe4e5e5,28|15|0xe4e6e6,17|31|0xe6e6e7,-32|2|0xdfe2e5"
		temp.position = {}
			temp.position.x = 615
			temp.position.y = 1229
	target["跳过验证按钮"] = temp
	
	local temp = {}
		temp.color = 0xe52b42
		temp.posandcolor = "-76|60|0xe3186a,-130|-14|0xe53039,-86|-5|0xffffff,-40|-32|0xffffff,-16|57|0xfdffff,-38|64|0xd81d69,-76|-60|0xffffff,-89|3|0xfafeff,-50|-77|0xe74310"
		temp.position = {}
			temp.position.x = 145
			temp.position.y = 98
	target["悬浮按钮"] = temp

local function _login(account, password)
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
	-- ====== 登  录 ======
	screen.tap(target["登录按钮"])
	mSleep(500)
	
	loop.waitShow(target["悬浮按钮"])
end

local function _register(account, password)
	-- ====== 进入口 ======
	screen.tap(target["注册入口按钮"])
	mSleep(500)
	
	screen.tap(target["账号注册"])
	mSleep(1000)

	screen.tap(target["注册账号输入框"])
	mSleep(1000)
	clearText(20)
	inputText(account)
	
	screen.tap(target["注册密码输入框"])
	mSleep(1000)
	clearText(20)
	inputText(password)

	screen.tap(target["注册按钮"])
	mSleep(1000)
	
	loop.waitShow(target["跳过验证按钮"])
	screen.tap(target["跳过验证按钮"])
	mSleep(500)
	loop.waitShow(target["悬浮按钮"])
end

function KYSDK.login(account, password, register, timeoutTarget)
	if register == nil then register = false end
	
	screen.pushTargetList(target)
	
	loop.doUntilTrue(function ()
		screen.tap("自动登录-取消")
	end, function ()
		return screen.find("登录账号输入框")
	end, 100, 5)
	
	--[[
	local res = loop.waitShow(target["自动登录"], 500, 1)
	if res then
		screen.tap(target["自动登录"])
	end]]
	
	--[[
	mSleep(1000)
	screen.tap(target["自动登录-取消"])
	mSleep(1000)
	]]
	if register then
		_register(account, password)
	else
		_login(account, password)
	end
	
	screen.popTargetList(target)
end

	local temp = {}
		temp.color = 0x431e31
		temp.posandcolor = "-88|-17|0xf3e218,-89|18|0xe3a710,87|17|0xf4c50f,93|-15|0x987d22,104|-22|0xf67f7e,105|23|0xd83c35,86|41|0x762f17,-113|14|0xd5392a,-129|23|0x431d11"
		temp.position = {}
			temp.position.x = 1088
			temp.position.y = 80
	target["切换账号"] = temp
	
screen.tap("切换账号")
mSleep(3500)
screen.tap(target["切换账号"])
KYSDK.login("TBU000006", "unique123456", false)

return KYSDK
