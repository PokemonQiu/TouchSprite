-- remote.lua

local sz = require("sz")
local http = sz.i82.http
local json = sz.json

local remote = {}

function remote.getRemoteString(URL)
	local status,header,body = http.get(URL, 50, {})
	
	if status == 200 then
		return body,200
	else
		return nil,status
	end
end

function remote.getRemoteJSON(URL)
	local res,code = remote.getRemoteString(URL)
	if type(res) == "string" then
		return json.decode(res),200
	else
		return res,code
	end
end

function remote.getWANIP()
	local URL = "http://ip.taobao.com/service/getIpInfo.php?ip=myip"
	local res,code = remote.getRemoteJSON(URL)
	if code == 200 and type(res) == "table" then
		local ret = {}
		ret.region = res.data.region
		ret.city = res.data.city
		ret.ip = res.data.ip
		return ret
	end
end

local function _getHTTPDelegate()
	--local url = "http://www.tkdaili.com/api/getiplist.aspx?vkey=0AD5347076807FAC3B7DA844E2A47F05&num=1&password=tongbucom&country=CN&https=1&style=3" 过期
	--local url = "http://www.tkdaili.com/api/getiplist.aspx?vkey=0AD5347076807FAC3B7DA844E2A47F05&num=1&password=tongbucom&country=NN&https=1&style=3" 过期
	local url = "http://www.tkdaili.com/api/getiplist.aspx?vkey=0AD5347076807FAC3B7DA844E2A47F05&num=1&password=tongbu&style=3"
	local res,code = remote.getRemoteString(url)
	
	if code == 200 then
		local index = string.find(res, ":")
		if index > 1 then
			local addr = string.sub(res, 1, index - 1)
			local port = string.sub(res, index + 1)
			return addr,port
		end
	end
	
	return nil,nil
	
end

function remote.getHTTPDelegate()
	for i=1,100 do
		address,port = _getHTTPDelegate()
		if address and port then
			return address,port
		end
		mSleep(2000)
	end
	return nil,nil
end

local function _getUnusedEmail()
	--[[
	account : {
		"email" : "xxxxxx@xxx.com"
		"pwd" : "xxxxxx"
		"birthday" : "YYYY/mm/dd h:mm:ss"
		"emailPWD" : "xxxxxxxx"
	}

]]
	if DEBUG then
		mSleep(3000)
		local account = {}
		account.email = random.email()
		account.pwd = random.password()
		account.birthday = random.year().."/"..random.month().."/"..random.day().." 1:1:1"
		account.emailPWD = account.pwd
		return account
	else
		local url = "http://192.168.40.237:5007/index0.aspx?t=0"
		local res,code = remote.getRemoteJSON(url)
		if code == 200 then
			return res.List[1]
		else
			return nil
		end
	end
end

function remote.getUnusedEmail()
	for i=1,100 do
		account = _getUnusedEmail()
		if type(account) == "table" then
			return account
		end
	end
	return nil
end

function remote.setEmailStatus( email, status )
	if status then
		status = "1"
	else
		status = "-1"
	end
	if DEBUG then
		mSleep(3000)
	else
		local url = "http://192.168.40.237:5007/index0.aspx?t=10&email="..email.."&status="..status
		remote.getRemoteString(url)
	end
end

local accountIndex = 0
local function _newAccount()
	accountIndex = accountIndex + 1
	return string.format("TBMU1%06d", accountIndex)
end

function remote.getApplicationInfomation()
	--[[
		task : {
			TaskId : [number] -- 任务编号
			Channel : "Haima" -- 渠道平台
			Sku : "xxx.xxx.xxx" -- Bundle ID
			Source : [number] -- 系统平台， 5:iOS; 1005:Android
			Url : "http://xxx.xxx/xxx/xxx.plist" -- 下载地址
			G_partner : 1608001 -- 游戏编号
			G_Area : "1" -- 服务器区
			G_Server : "Server" -- 服务器服
			SurplusCount : [number] -- 账号数量
			AccountGame : [
				{
					Uid : [number] -- 账号ID
					Account : "xxxxxx" -- 账号
					PassWord : "xxxxxx" -- 密码
					LoginType : [number] -- 登录方式，1:注册; 2:直接登录
				},
				{},{}...
			] -- 账号列表
		}
	]]
	local urldata = "https://tbsq.tongbu.com/plist/tbsharedownloadurl_game/20160802/150021849_10012535_184731.plist"
	--local url = "http://gm.api.tongbu.com/pf?TaskStart&source=5&surpluscount=1"
	
	--local res = remote.getRemoteJSON(url)
	
	local res = {}
		res.TaskId = 10086
		res.Channel = "Tongbu"
		res.Sku = "com.tongbu.wushuang.TB_CO_LTD.Z2H3GSNJHN"
		res.Source = 5
		res.Url = urldata
		res.G_partner = 1608001
		res.G_Area = 1
		res.G_Server = "server"
		res.SurplusCount = 1
		res.AccountGame = {}
			res.AccountGame[1] = {}
				res.AccountGame[1].Uid = 10000
				res.AccountGame[1].Account = _newAccount()
				res.AccountGame[1].PassWord = "unique123456"
				res.AccountGame[1].LoginType = 2
	
	--[[
	local res = {}
	res.account = "TBU000001"
	res.password = "unique123456"
	res.platform = "tongbu"
	res.action = "new"
	res.bundleid = "com.tongbu.wushuang"
	
	mSleep(3000)
	]]
	
	return res
end

function remote.feedBackScriptResult(uid, taskid, ifsuccess, des, g_partner, g_area, g_server)
	if not	uid			then return false,"Uid is nil."			end
	if not	taskid		then return false,"Taskid is nil."		end
	
	if ifsuccess == nil	then return false,"Ifsuccess is nil."	end
	local url = "http://gm.api.tongbu.com/pf?TaskComplete&uid=%d&taskid=%d&g_partner=1608001&g_area=1区&g_server=天地&ifsuccess=%s&des=%s"
	url = string.format(url, uid, taskid, tostring(ifsuccess), tostring(des))
	local json,code = remote.getRemoteJSON(url)
	if code == 200 then
		return json.Data
	else
		return false
	end
end


return remote
