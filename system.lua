-- system.lua

home = {}

mainVersion = tonumber(string.sub(getOSVer(), 1, 1)) -- 主要

function sSleep(sec)
	mSleep(sec * 1000)
end

function isFlat()
	return os.mainVersion() > 6
end

local function _tapHome()
	pressHomeKey(0)
	mSleep(50)
	pressHomeKey(1)
	mSleep(500)
end

function home.tap(count)
	count = count or 1
	for i=1,count do
		_tapHome()
	end
end

function home.taps(count)
	count = count or 2
	home.tap(count)
end

function home.tap2()
	home.tap(2)
end

function home.tap3()
	home.tap(3)
end

function runPreferences()
	runApp("com.apple.Preferences")
	mSleep(3000)
	init("0", 0)
	openURL("prefs:root=WIFI")
	mSleep(3000)

	--tap(62, 84)
	toast(tostring(screen.tap(ScreenTarget.NV_Item_Back)))
	mSleep(2000)
	local scrw = getScreenSize()
	tap(scrw/2, 10)
	mSleep(1000)
end

function clearText(count)
	count = count or 15
	for i = 1,count,1 do
		-- screen.tap(ScreenTarget.KK_Key_Delete)
		inputText("\b")
		mSleep(50)
	end
end

function cleanProgress()
	closeApp("*", 1)
	closeApp("*", 0)
	mSleep(2000)
	closeApp("*", 1)
	closeApp("*", 0)
	mSleep(2000)
end

