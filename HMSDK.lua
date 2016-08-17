-- HMSDK.lua

local screen = require "screen"
local loop = require "loop"
require "system"

local HMSDK = {}

local target = {}
	local temp = {}
		temp.color = 0xf8302b
		temp.posandcolor = "-253|-6|0xf8302b,-205|120|0xfc8f19,-506|155|0xfc8f19,-22|145|0xf8302b,243|124|0xf8302b,171|58|0xffffff,-121|-114|0xffffff,193|-260|0xeeeeee,206|-418|0xeeeeee"
	target["标识符"] = temp
	
	local temp = {}
		temp.color = 0xeeeeee
		temp.posandcolor = "-695|-38|0xeeeeee,-692|44|0xeeeeee,157|38|0xeeeeee,155|-33|0xeeeeee,-22|-76|0xffffff,-23|-122|0xffffff,121|9|0x666666,141|-6|0x676767,105|-9|0x666666"
		temp.position = {}
			temp.position.x = 885
			temp.position.y = 792
	target["登录账号输入框"] = temp
	
	local passwordTF = {}
		passwordTF.color = 0xeeeeee
		passwordTF.posandcolor = "-759|-23|0xeeeeee,-768|42|0xeeeeee,-573|224|0xf8302b,-136|264|0xf8302b,-391|403|0xfc8f19,77|411|0xf8302b,-180|98|0xffffff,149|33|0xffffff,-16|-104|0xeeeeee"
	target["登录密码输入框"] = passwordTF
	
	local temp = {}
		temp.color = 0xf8302b
		temp.posandcolor = "-29|-32|0xffffff,-18|-15|0xffffff,27|-27|0xf8413d,35|-18|0xfedfde,35|-4|0xfffcfc,29|5|0xfed7d6,-54|116|0xfc8f19,68|117|0xf8302b,7|61|0xffffff"
	target["登录按钮"] = temp
	
	local temp = {}
		temp.color = 0xfc8f19
		temp.posandcolor = "-44|3|0xfc8f19,-54|15|0xfc8f19,-66|-5|0xfc8f19,-110|-8|0xffffff,-117|19|0xfc8f19,-87|26|0xfc8f19,-40|11|0xfc8f19,-6|-6|0xfdb96f,18|-9|0xfffefd"
	target["注册入口按钮"] = temp
	
	local temp = {}
		temp.color = 0xeeeeee
		temp.posandcolor = "-769|-40|0xeeeeee,-764|35|0xeeeeee,99|1|0xeeeeee,125|-4|0xfafafa,-817|0|0xfafafa,84|157|0xeeeeee,-355|-157|0x939393,-231|-118|0x919191,-449|-118|0x5a5a5a"
	target["注册账号输入框"] = temp
	
	local temp = {}
		temp.color = 0xeeeeee
		temp.posandcolor = "85|-35|0xeeeeee,84|36|0xeeeeee,-775|-36|0xeeeeee,-780|35|0xeeeeee,2|-115|0xeeeeee,-779|-206|0xeeeeee,-310|-277|0x5a5a5a,-257|-299|0x5a5a5a,-430|-312|0x5a5a5a"
	target["注册密码输入框"] = temp
	
	local temp = {}
		temp.color = 0xf8302b
		temp.posandcolor = "1|-16|0xf8302b,-63|-32|0xf8302b,-59|30|0xf8302b,-45|74|0xfafafa,8|68|0xfafafa,-55|-75|0xfafafa,-67|4|0xffffff,-112|-67|0xfafafa,-113|6|0xf8302b"
		temp.degree = 90
		temp.position = {}
			temp.position.x = 619
			temp.position.y = 1064
		temp.margin = {}
			temp.margin.top = 500
			temp.margin.left = 300
			temp.margin.right = 300
			temp.margin.bottom = 500
	target["注册按钮"] = temp
	
	local temp = {}
		temp.color = 0xbbbbbb
		temp.posandcolor = "-23|-21|0xbbbbbb,19|21|0xbbbbbb,19|-19|0xbcbcbc,-20|19|0xbbbbbb,-116|329|0xf8302b,-119|462|0xf8302b,-4|-16|0xfdfefe,-27|0|0xfdfefe,28|-1|0xfafdfd"
	target["跳过验证按钮"] = temp
	
local function _login(account, password, timeoutTarget)
	
	-- ====== 用户名 ======
	local success = screen.safeTap(target["登录账号输入框"])
	if not success then return false,"Can not find LoginAccountInput(HM)." end
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
end	

local function _register(account, password)
	-- ====== 进入口 ======
	local success = screen.safeTap(target["注册入口按钮"])
	if not success then return false,"Can not find RegisterAccountInput(HM)." end
	mSleep(500)

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
end

local function __login(account, password)
	
	-- ====== 用户名 ======
	local success = screen.safeTap("登录账号输入框")
	if not success then return false,"Can not find LoginAccountInput(HM)" end
	
	mSleep(1000)
	clearText(20)
	mSleep(500)
	inputText(account)
	mSleep(500)
	-- ====== 密  码 ======
	screen.tap("登录密码输入框")
	mSleep(1000)
	clearText(20)
	mSleep(500)
	inputText(password)
	mSleep(500)
	-- ====== 登  录 ======
	screen.tap("登录按钮")
	mSleep(500)
	return true,nil
end

function HMSDK.login(account, password, register, timeoutTarget)
	if register == nil then register = false end
	
	local success,errMsg = 0,0
	
	screen.pushTargetList(target)
	
	loop.waitShow("标识符", 10000/500, 500)
	
	if register then
		success,errMsg = _register(account, password)
	else
		success,errMsg = __login(account, password)
	end
	
	screen.popTargetList(target)
	
	return success,errMsg
end

HMSDK.login("TBU000005", "unique123456", false, nil)

return HMSDK
