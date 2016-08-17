-- game.lua

local TBSDK = require "TBSDK"
local HMSDK = require "HMSDK"
local KYSDK = require "KYSDK"

local loop = require "loop"
local screen = require "screen"

local GameTask = {}

local task = {}

local target = {}
	
	local temp = {}
		temp.color = 0xfff3d0
		temp.posandcolor = "-415|-164|0x8b5a21,341|-136|0x8b5a21,-363|-71|0x9e723d,-417|-66|0xb4905f,-23|76|0x22ab79,88|153|0xfee275,370|246|0xf6ddb9,-385|241|0xdfcbab,486|-304|0xffc53a"
		temp.position = {}
			temp.position.x = 636
			temp.position.y = 1122
	target["超时"] = temp

local function _mainTask()
	local res = 0
	
	res = runApp(task.bid)
	if res ~= 0 then
		return false,"Can not run app: "..res
	end
	
	if type(task.loadingFunc) == "function" then
		task.loadingFunc()
	end
	
	local SDK = 0
	
	if task.channel == "Tongbu" then
		SDK = TBSDK
	elseif task.channel == "Haima" then
		SDK = HMSDK
	elseif task.channel == "Kuaiyong" then
		SDK = KYSDK
	end
	
	local res,errMsg = SDK.login(task.account, task.password, task.isSign, target["超时"])
	
	if not res then
		toast(errMsg)
		return res,errMsg
	end
	
	if type(task.loadedFunc) == "function" then
		task.loadedFunc()
	end
	return true,nil
end

function GameTask.startTask(loadingFunc, loadedFunc)
	local remote = require "remote"
	local WIFI = require "WIFI"
	local IDFA = require "IDFA"
	local installer = require "installer"
	require "system"
	
	-- 关闭代理
	--WIFI.changeHTTPDelegate()
	cleanProgress()
	
	local taskInfo = remote.getApplicationInfomation()
	--local address,port = remote.getHTTPDelegate()
	
	-- 初始化账户信息
	local bid = taskInfo.Sku
	local url = taskInfo.Url
	local channel = taskInfo.Channel
	
	local account = taskInfo.AccountGame[1].Account
	local password = taskInfo.AccountGame[1].PassWord
	local isSign = taskInfo.AccountGame[1].LoginType == 1
	
	task.loadingFunc = loadingFunc
	task.loadedFunc = loadedFunc
	task.account = account
	task.password = password
	task.channel = channel
	task.isSign = isSign
	task.bid = bid
	
	-- 安装应用程序
	--if not installer.bundleCompleted(bid) then
	--	local res = installer.installApp(url)
	--end
	
	-- 修改IDFA
	--IDFA.refreshIDFA()
	
	-- 修改代理
	--WIFI.changeHTTPDelegate(address, port)
	
	mSleep(1000)
	local res,errMsg = _mainTask()
	if not res then
		toast(errMsg)
	else
		toast("success")
	end
end

for _=1,3 do
	GameTask.startTask(function ()
		mSleep(2500)
	end, function ()
		local target = {}
			local temp = {}
				temp.color = 0x1296f4
				temp.posandcolor = "-191|-58|0xffffff,-231|4|0xffffff,-195|67|0xebe8ec,217|64|0xffffff,252|3|0xffffff,213|-56|0xffffff,-163|-33|0x44a8f3,-151|32|0x0a90f2,180|-33|0x4cadf3"
				temp.position = {}
					temp.position.x = 610
					temp.position.y = 2010
			target["进入游戏"] = temp
					
			local temp = {}
				temp.color = 0xffffff
				temp.posandcolor = "-20|0|0xffffff,-6|19|0xffffff,14|33|0xf2f5f7,-21|40|0xffffff,19|46|0xf8fafb,47|-1|0xfefefe,46|4|0xffffff,480|-26|0xffffff,476|15|0x24b8fe"
				temp.position = {}
					temp.position.x = 589
					temp.position.y = 529
			target["更新标题"] = temp
					
			local temp = {}
				temp.color = 0x24b9ff
				temp.posandcolor = "-32|-31|0xbdeaff,-50|15|0xbae9ff,54|15|0xb1e6ff,61|-12|0xbceaff,60|-32|0xc1eaff,20|17|0x9adeff,-5|19|0x70d1ff,-48|-24|0xe1f6ff,-51|-8|0x80d6ff"
				temp.position = {}
					temp.position.x = 617
					temp.position.y = 1152
			target["更新按钮"] = temp
					
		screen.tap(target["进入游戏"])
		
		mSleep(3000)
		if screen.find(target["更新标题"]) then 
			screen.safeTap(target["更新按钮"])
			loop.waitHide(target["更新标题"])
		end
		
	end, target["超时"])
end

return GameTask
