-- game.lua
--[[
	Infomation map for Game.
	
	local temp = {}
		temp.color = 
		temp.posandcolor = ""
	target[""] = temp
]]

require "./screen"
require "./table"
require "loop"
require "system"

local SDK = require "./SDK"

local game = {}

local target = {}
	local temp = {}
		temp.color = 0x1296f3
		temp.posandcolor = "-8|-35|0x4eb0f3,-12|34|0x1296f3,-85|5|0xf8fcff,-59|2|0xc7e6fd,-23|-7|0xf5fbff,10|23|0xf1f9fe,97|11|0x2da2f5,113|16|0x29a0f4,123|18|0x1296f3"
	target["进入游戏"] = temp
	
	local temp = {}
		temp.color = 0x903b55
		temp.posandcolor = "-15|49|0xfffcfa,-40|78|0xffb49d,29|100|0xffa3d4,31|141|0xbc33b1,-10|146|0xe84bcd,-67|119|0xb8138c,6|110|0xffc2e1,51|95|0xffb2e4,67|77|0xc80a44"
	target["新建角色-性别女"] = temp
	
	local temp = {}
		temp.color = 0xa44529
		temp.posandcolor = "26|-30|0xfdfdfc,33|-36|0xe4e5f3,56|-23|0xa2410d,25|33|0x9c2e05,-60|2|0x9e3609,-44|28|0xe5e6f3,-46|-3|0xfcfdfc,-25|30|0xa13a1b,-39|45|0x482704"
	target["新建角色-随机昵称"] = temp
	
	local temp = {}
		temp.color = 0x0690ef
		temp.posandcolor = "-13|0|0xfdfeff,-17|2|0x81c7f6,-45|15|0xb4defa,-40|-1|0x1195ee,25|2|0x55b3f4,38|-13|0xfafdff,40|21|0xfbfeff,16|19|0xffffff,-51|2|0x9ad2f8"
	target["新建角色-确定"] = temp
	
	local temp = {}
		temp.color = 0xffc53a
		temp.posandcolor = "-49|-59|0xffec73,-11|-59|0xffeb72,-22|-60|0xffc53a,-16|46|0x04e809,31|56|0x04e809,47|-5|0xffc53a,-70|-9|0xffc53a,-71|98|0x7c4000,73|90|0x170b04"
	target["新手引导-跳过"] = temp
	
	local temp = {}
		temp.color = 0xfaa0c7
		temp.posandcolor = "-107|-112|0x844b88,-178|39|0xc81a63,-216|113|0xfff5f2,-302|225|0xd9d4d9,-92|160|0x920843,-42|171|0xfff0ea,151|-80|0xb76c62,195|148|0xbb6e64,12|-165|0x7b113e"
	target["新手引导-貂蝉"] = temp
	
	local temp = {}
		temp.color = 0x979a9a
		temp.posandcolor = "16|12|0x285d19,18|22|0xf4f5aa,-38|23|0x5c8d44,-40|31|0xcbbcaa,72|50|0xf0ebe7,55|61|0x69c409,66|-74|0x774303,-56|-82|0x713d03,19|-59|0xf1f7f3"
	target["新手引导-江湖术士图标"] = temp
	
	local temp = {}
		temp.color = 0x22ab79
		temp.posandcolor = "24|15|0x0f9159,-55|-1|0x0a864a,-42|-10|0xf4f9f6,-58|16|0x82c0a2,53|21|0xb2d9c6,52|-18|0xf8fbfa,20|-23|0xffffff,77|-21|0x22ab79,130|-47|0xfdd365"
	target["新手引导-挑战按钮"] = temp
	
	local temp = {}
		temp.color = 0xdcb412
		temp.posandcolor = "-4|-39|0xeb0000,-27|-10|0xde0000,-38|11|0xc40101,-11|-24|0xffffdb,-36|-4|0xffffdb,42|8|0xffd60e,45|3|0xab871e,55|2|0x4b140a,62|27|0xfadd31"
	target["新手引导-自动大招开关"] = temp
	
	local temp = {}
		temp.color = 0xb8a046
		temp.posandcolor = "-21|-44|0x610e25,-28|-71|0xacb5c1,-56|-67|0x4d2d2e,-22|-111|0x4d2421,-16|-151|0xc2a645,-15|-126|0x633e3a,126|-66|0x1e355d,-91|-52|0x5a2a26,174|-38|0x1f263b"
	target["新手引导-主公放大招"] = temp
	
	local temp = {}
		temp.color = 0x22ab79
		temp.posandcolor = "-37|-23|0xffffff,67|14|0x0c874c,17|13|0x1fa272,-36|17|0xffffff,-69|14|0xf2f9f6,-23|-21|0xffffff,-112|-5|0x22ab79,54|-57|0xffd164,2|34|0x1d9368"
	target["新手引导-胜利后的确定"] = temp
	
	local temp = {}
		temp.color = 0x3bab75
		temp.posandcolor = "3|-21|0xcfa10f,1|46|0x852105,3|18|0xcfa10f,31|0|0xfde462,35|-31|0x20835d,10|61|0xffdfb6,32|83|0x620202,-46|94|0xddb593,-25|75|0x7d2e25"
	target["商店"] = temp
	
	local temp = {}
		temp.color = 0xdee3e6
		temp.posandcolor = "-91|-45|0xeef1f4,-86|43|0xd7dcdf,-16|42|0xd7dce0,-22|-38|0xdbdfe3,104|-24|0xe2e6ea,124|45|0xdee3e6,40|58|0x0847d8,70|4|0x0748d9,23|3|0x5894e8"
	target["卧龙"] = temp
	
	local temp = {}
		temp.color = 0xe2a43f
		temp.posandcolor = "-1|-19|0xfe441a,41|-39|0x4ab3b5,-20|-43|0xc93d6b,-33|30|0xecc7a3,28|66|0xca9f81,11|41|0x8f473a,-46|14|0xdfae8e,18|16|0xdfae8e,31|4|0xbb8465"
	target["阵容"] = temp
	
	local temp = {}
		temp.color = 0x7d4f0c
		temp.posandcolor = "-28|-55|0x6b3903,-35|-44|0x804c03,-42|-40|0x6b3903,-43|-29|0x814d03,-43|-17|0x6c3a03,-20|28|0x865304,23|56|0x7f4b03,74|18|0x764303,52|-63|0x754103"
		temp.ext = {}
			temp.ext.path = "x"
			temp.ext.value = "MIN"
	target["阵容中的空位"] = temp
	
	local temp = {}
		temp.color = 0xffeeda
		temp.posandcolor = "-12|14|0x2b2846,65|-46|0x514d67,43|-74|0x4e4a65,-13|-81|0x4d3043,-43|-77|0xcf6dc5,-50|17|0xffffff,-42|45|0x7587b6,20|49|0xf5e0ae,17|-17|0x262432"
	target["郭嘉头像"] = temp
	
	local temp = {}
		temp.color = 0x22ab79
		temp.posandcolor = "-1|44|0x1d9569,12|55|0x1d9469,34|37|0xbaddcc,44|-2|0xffffff,61|9|0xe4f2eb,-68|33|0xffffff,-85|10|0x22ab79,-99|46|0x209e70,-34|10|0x088549"
	target["选英雄后的确定"] = temp
	
	local temp = {}
		temp.margin = {}
			temp.margin.top = 0
			temp.margin.left = 200
			temp.margin.right = 200
			temp.margin.bottom = 0
	target["随机点"] = temp
	
function game.newStart()
	loop.waitShow(target["进入游戏"])
	screen.safeTap(target["进入游戏"])
	if screen.find(target["新建角色-性别女"]) then
		if not random.male() then
			screen.safeTap(target["新建角色-性别女"])
			mSleep(2000)
		end
		for i=1,math.random(1,10) do
			screen.safeTap(target["新建角色-随机昵称"])
			mSleep(500)
		end
		screen.safeTap(target["新建角色-确定"])
	end
	mSleep(6000)
	screen.safeTap(target["新手引导-跳过"])
	mSleep(1000)
	screen.randomTap(target["随机点"])
	mSleep(500)
	screen.safeTap(target["新手引导-江湖术士图标"])
	mSleep(500)
	screen.safeTap(target["新手引导-挑战按钮"])
	mSleep(5000)
	screen.randomTap(target["随机点"])
	mSleep(3000)
	screen.randomTap(target["随机点"])
	mSleep(10000)
	screen.safeTap(target["新手引导-主公放大招"])
	mSleep(4000)
	screen.safeTap(target["新手引导-自动大招开关"])
	mSleep(3000)
	screen.randomTap(target["随机点"])
	mSleep(500)
	screen.safeTap(target["新手引导-胜利后的确定"])
	mSleep(500)
	screen.randomTap(target["随机点"])
	mSleep(500)
	screen.safeTap(target["商店"])
	mSleep(500)
	screen.safeTap(target["卧龙"])
	mSleep(3000)
	screen.randomTap(target["随机点"])
	mSleep(500)
	screen.safeTap(target["阵容"])
	mSleep(500)
	screen.safeTap(target["阵容中的空位"])
	mSleep(500)
	screen.safeTap(target["郭嘉头像"])
	mSleep(500)
	screen.safeTap(target["选英雄后的确定"])
	mSleep(1000)
	screen.randomTap(target["随机点"])
	mSleep(500)
	screen.randomTap(target["随机点"])
	mSleep(500)
	--screen.safeTap(target[""])
end

function game.runAndLogin()
	local username = "TBU0000001"
	local password = "unique123456"
	
	local bid_tb = "com.tongbu.xuegao.god"
	local bid_hm = "com.xuegao.god.haima"
	local bid_ky = "com.xuegao.god.7659"
	
	local bid = bid_tb
	
	cleanProgress();
	
	runApp(bid)
	
	loop.waitShow()
end


return game

--[[

进入游戏 6秒 [跳过] 随机位置 - 图标 0.5秒 挑战 5秒 随机位置 3秒 随机位置 10 秒 
英雄放大招 4秒 关闭 3秒 随机 - 确定 - 随机 - 商店 0.5秒 卧龙 3秒 随机 - 阵容 0.5秒
阵容中的空英雄 0.5秒 郭嘉 0.5秒 确定 1秒 随机 - 随机 - 阵容中的郭嘉


]]
--toast(x.."\n"..y)
