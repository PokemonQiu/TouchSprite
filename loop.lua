-- loop.lua

local screen = require "./screen"

local loop = {}

local LOOP_MAXTIMES = 60 * 3
local LOOP_DELAY	= 1000

--[[
	延迟直到隐藏table对象

	@param	table		table对象
	@param	maxTimes	最大尝试次数
	@param	delay		每次延迟时间
	
	@return	true为在最大尝试时间内结束循环，false是用完所有尝试次数都没有返回真（一般指“超时”）
]]
function loop.waitHide( table, maxTimes, delay )
	maxTimes =	maxTimes or LOOP_MAXTIMES -- 最大尝试次数默认值
	delay =	delay or LOOP_DELAY		-- 每次延迟时间默认值

	local currentTime = 0
	for i=1,maxTimes do
		currentTime = i
		if not screen.find(table) then
			return currentTime
		end
		mSleep(delay)
	end
	return false
end



--[[
	延迟直到显示table对象

	@param	table		table对象
	@param	maxTimes	最大尝试次数
	@param	delay		每次延迟时间

	@return	true为在最大尝试时间内结束循环，false是用完所有尝试次数都没有返回真（一般指“超时”）
]]
function loop.waitShow( table, maxTimes, delay )
	maxTimes = maxTimes or LOOP_MAXTIMES
	delay = delay or LOOP_DELAY

	local currentTime = 0
	for i=1,maxTimes do
		currentTime = i
		if screen.find(table) then
			return currentTime
		end
		mSleep(delay)
	end
	return false
end

--[[
	Delay until show one of tables.
	
	@param	table1		the first table
	@param	table2		the second table
	@param	maxTimes	Max try times
	@param	delay		Delay every time
	
	@return	number	1=>show table1; 2=>show table2; 0=>timeout
]]
function loop.waitShowOne( table1, table2, maxTimes, delay )
	maxTimes = maxTimes or LOOP_MAXTIMES
	delay = delay or LOOP_DELAY

	for i=1,maxTimes do
		local res = screen.choose(table1, table2)
		if res then return res end
		mSleep(delay)
	end
	return false
end

function loop.waitShowOneOfList( tableList, maxTimes, delay )
	maxTimes = maxTimes or LOOP_MAXTIMES
	delay = delay or LOOP_DELAY

	local currentTime = 0
	for i=1,maxTimes do
		local res = screen.selecte(tableList)
		if res then return res end
		mSleep(delay)
	end
	return false
end

--[[
	重复执行某一函数，直到另一个函数返回真

	@param	doFunc		要重复执行的函数 参数为当前执行次数
	@param	boolFunc	判断函数，返回值必须为bool,[bool]型；第一个bool表示判断结果；第二个bool表示继续循环，默认为true，当false为出现错误提前终止循环，函数返回false；参数为当前执行次数
	@param	maxTimes	最大尝试次数
	@param	delay		每次延迟时间

	@return	true为在最大尝试时间内结束循环，false是用完所有尝试次数都没有返回真（一般指“超时”）
]]
function loop.doUntilTrue( doFunc, boolFunc, maxTimes, delay )
	maxTimes = maxTimes or LOOP_MAXTIMES
	delay = delay or LOOP_DELAY

	for i=1,maxTimes do
		doFunc(i)
		local bool,continue = boolFunc(i)
		if continue == nil then continue = true end
		if bool then
			return i
		elseif not continue then
			return false
		end
		mSleep(delay)
	end
	return false
end

function loop.doUntilFalse( doFunc, boolFunc, maxTimes, delay )
	maxTimes = maxTimes or LOOP_MAXTIMES
	delay = delay or LOOP_DELAY
	for i=1,maxTimes do
		doFunc(i)
		local bool,continue = boolFunc(i)
		if continue == nil then continue = true end
		if not bool then
			return i
		elseif not continue then
			return false
		end
		mSleep(delay)
	end
end

function loop.whileTrueToDo( boolFunc, doFunc, maxTimes, delay )
	maxTimes = maxTimes or LOOP_MAXTIMES
	delay = delay or 1000
	
	for i=1,maxTimes do
		local bool continue = boolFunc(i)
		if continue == nil then continue = true end
		if not bool then
			return i
		elseif not continue then
			return false
		end
		doFunc(i)
		mSleep(delay)
	end
	return false
end

function loop.whileFalseToDo( boolFunc, doFunc, maxTimes, delay )
	maxTimes = maxTimes or LOOP_MAXTIMES
	delay = delay or 1000

	for i=1,maxTimes do
		local bool,continue = boolFunc(i)
		if continue == nil then continue = true end
		if bool then
			return i
		elseif not continue then
			return false
		end
		doFunc(i)
		mSleep(delay)
	end
	return false
end


return loop













