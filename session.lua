-- session.lua

--[[m
	task = {
		targetList = {
			target1, target2, target3, ...
		}
		itemList = {
			{
				target = [ScreenTarget] or [DelayMS] or [TargetKeyInTargetList]
				times = [number] -- times
				func = [string]
				nextIndex = [number]
			},
			{}, {}, {}, ...
		}
		currentIndex,
	}
]]

local session = {}

session.targetListStack = {}

function session.pushTargetList(targetList)
	table.insert(session.targetListStack, targetList)
end

function session.popTargetList()
	table.remove(session.targetListStack, #session.targetListStack)
end

function session.currentTargetList()
	return session.targetListStack[#(session.targetListStack)]
end

local function _tableName2TableTarget(tableName)
	local targetList = session.currentTargetList()
	if type(targetList) ~= "table" then return nil end
	for k,v in pairs(targetList) do
		if k == tableName then return v end
	end
	return nil
end

local function _task_sleep(taskItem)
	local times = time * count
	mSleep(times)
end

function session.doTask(task)
	local itemList = task.itemList
	local targetList = task.targetList
	
	for i,v in itemList do
		if type(v) == "table" then
			local target = v.target
			local times = v.times
			local func = v.func
			for _=1,times do
				if type(target) == "number" then
					mSleep(target)
				end
				if type(target) == "string" then
					target = _tableName2TableTarget(target)
				end
				if type(target) == "table" then
					
				end
			end
		elseif type(v) == "number" then
			mSleep(v)
		elseif type(v) == "string" then
			-- tap target name
		end
		
	end
end