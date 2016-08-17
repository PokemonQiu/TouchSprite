local game = require "game"
local SDK = require "SDK"
local screen = require "screen"
local IDFA = require "IDFA"
local installer = require "installer"
local table = require "table"
local codesign = require "codesign"

local loop = require "loop"

--SDK.register("TBU000002", "unique123456")

local target = {}

local temp = {} -- 同步平台的悬浮按钮
		temp.color = 0xfefefe
		temp.posandColor = "-33|-7|0xffffff,-57|12|0xffffff,-65|41|0xffffff,-60|64|0xffffff,-44|71|0xffffff,-33|72|0xffffff,-27|23|0xffffff,-43|33|0xffffff,-52|52|0xffffff"
		temp.degree = 95
		
local temp = {} -- 海马平台的大悬浮按钮
		temp.color = 0xffffff
		temp.posandColor = "-18|46|0xffffff,31|85|0xffffff,-31|80|0xffffff,65|-20|0xffffff,77|-14|0xffffff,-49|-16|0xffffff,-53|10|0xffffff,35|46|0xffffff,32|86|0xffffff"
		temp.degree = 95

local temp = {} -- 海马平台的小悬浮按钮（左边）
		temp.color = 0xffffff
		temp.posandColor = "-2|-7|0xffffff,40|5|0xffffff,-11|28|0xffffff,24|30|0xffffff,15|50|0xffffff,-19|50|0xffffff,-29|15|0xffffff,-38|-4|0xffffff,-26|-21|0xffffff"
		temp.degree = 97
		
local temp = {} -- 海马平台的小悬浮按钮（右边）
		temp.color = 0xffffff
		temp.posandcolor = "6|-6|0xffffff,12|29|0xffffff,24|24|0xffffff,-14|50|0xffffff,-23|29|0xffffff,-38|15|0xffffff,-42|-21|0xffffff,-19|-21|0xffffff,28|-22|0xffffff"
		temp.degree = 97
		
local temp = {} -- 同步自动登录的Alert的取消按钮
		temp.color = 0xf8f8f9
		temp.posandColor = "-14|2|0x007aff,-14|-14|0xf8f8f9,-39|-9|0x1986fe,-48|-7|0xc7e0fa,-33|13|0xcce1fa,32|18|0x1384ff,40|-1|0xedf2f8,50|2|0xf8f8f8,45|-11|0xf8f8f8"
		temp.position = {}
			temp.position.x = 619
			temp.position.y = 1237
		
local temp = {} -- 快用图标
		temp.color = 0xffffff
		temp.posandColor = "15|-28|0xe6463c,25|4|0xe6463c,12|-10|0xffffff,19|20|0xffffff,8|30|0xe6463c,-30|32|0xe6463c,-22|-24|0xe6463c,-7|-29|0xffffff,23|0|0xe6463c"
		temp.bounds = {}
			temp.bounds.x = 0
			temp.bounds.y = 0
			temp.bounds.width = screen.width
			temp.bounds.height = 170
			
local temp = {} -- 快用巨坑型一秒钟注销按钮
		temp.color = 0x28a3e9
		temp.posandColor = "-1|-6|0x2ba4e9,-47|-16|0x28a3e9,-54|-4|0xf6fbfe,-110|-18|0xffffff,-122|18|0x28a3e9,49|7|0x40adeb,81|4|0x28a3e9,123|-30|0x43afec,153|17|0x55b7ee"
		temp.position = {}
			temp.position.x = 613
			temp.position.y = 1177

local temp = {} -- 进入游戏
		temp.color = 0xf3912a
		temp.posandColor = "7|-79|0x376182,4|66|0x597697,78|27|0xa44714,-59|-43|0xf9c107,-155|22|0xf97604,-251|-2|0xdda250,181|77|0xad7242,294|-57|0xebbc5d,203|32|0xb57c44"
		temp.position = {}
			temp.position.x = 612
			temp.position.y = 2053
	target["进入游戏"] = temp

local temp = {}
		temp.color = 0x2e7b89
		temp.posandColor = "-15|-14|0xf0e018,-42|25|0xe2a30e,-51|24|0xc58e18,34|-36|0xfffd21,53|-38|0x1e2942,30|-20|0x1e2a41,29|11|0x434438,-58|-2|0x998b26,-63|-25|0x283240"
		temp.position = {}
			temp.position.x = 625
			temp.position.y = 1688
	target["系统消息-确定"] = temp

local temp = {}
		temp.color = 0x000000
		temp.posandColor = "-14|-23|0x000000,12|-23|0x000000,-21|11|0x000000,21|11|0x0f0f0f,59|9|0x000000,-118|-30|0x000000,-123|10|0x000000,-35|-31|0x010101,-72|10|0x000000"
		temp.position = {}
			temp.position.x = 188
			temp.position.y = 1784
	target["描述文件"] = temp

cleanProgress()

function xuegaogod(account, password, register)
	--runApp("com.tongbu.xuegao.god") -- 同步
	--runApp("com.xuegao.god.haima") -- 海马
	runApp("com.xuegao.god.7659") -- 快用
	
	local res = loop.waitShowOne(target["系统消息-确定"], target["进入游戏"])
	if res == false then
		return
	elseif res == 1 then
		screen.tap(target["系统消息-确定"])
		mSleep(500)
	end
	
	screen.tap(target["进入游戏"])
	mSleep(100)

	KYSDK.login(account, password, register)
end

function wushuang(account, password, register)
	runApp("com.tongbu.wushuang")
	
	mSleep(2500)
	
	TBSDK.login(account, password, register)
end

codesign.sign()

--local bid = "com.tongbu.wushuang.TB_CO_LTD.Z2H3GSNJHN"
--local res = runApp(bid)
--local res = installer.bundleExist(bid)
--toast(tostring(res))
--IDFA.newRefreshIDFA()

--[[
local res = installer.installApp("https://tbsq.tongbu.com/plist/tbsharedownloadurl_game/20160802/150021849_10012535_184731.plist", bid)
if res then
	toast("success!")
else
	toast("failed")
end]]


--xuegaogod("TBU000006", "unique123456", false)

--mSleep(2000)
--dofile("/var/mobile/Media/TouchSprite/lua/record1470290458.lua")