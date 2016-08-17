-- installer.lua

require "system"
local loop = require "loop"
local screen = require "screen"

local installer = {}

local target = {}
	local temp = {}
		temp.color = 0xe0f3f8
		temp.posandColor = "-29|-27|0x007aff,-44|14|0x007aff,45|15|0x007aff,45|-23|0x007aff,30|-32|0xe2f3f8,-63|1|0xdff3f9,87|5|0xddf2f8,10|-46|0xe5f4f8,-10|43|0xddf2f9"
		temp.position = {}
			temp.position.x = 825
			temp.position.y = 1235
target["安装按钮"] = temp

local CONST_URL_FORMAT = "itms-services://?action=download-manifest&url="
	
function installer.installApp(url, bid)
	local itms = CONST_URL_FORMAT..url
	cleanProgress()
	
	mSleep(1000)
	openURL(itms)
	loop.waitShow(target["安装按钮"])
	screen.tap(target["安装按钮"])

	loop.doUntilTrue(function ()
		--toast("doing")
		mSleep(3000)
	end, function ()
		return installer.bundleCompleted(bid)
	end)
end

function installer.bundleExist(bid)
	local bidList = getInstalledApps()
	for k,v in pairs(bidList) do
		if v == bid then
			return true
		end
	end
	return false
end

function installer.bundleCompleted(bid)
	-- 7 => downloading or not exist; 9 => download completed and require checking.
	local res = runApp(bid)
	if res == 0 then
		home.tap()
		cleanProgress()
		return true
	elseif res == 9 then
		return true
	else
		toast(res)
		return false
	end
end

return installer
