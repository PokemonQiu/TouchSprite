-- stack.lua

--[[
	stack : {
		list : [
			item1,
			item2,
			...
		],
		top : item
		count : [COUNT]
	}
]]

local stack = {}

local function _refreshBuff(stack)
	local count = #(stack.list)
	if count ~= 0 then
		stack.count = count
		stack.top = stack.list[count]
	else
		stack.count = 0
		stack.top = nil
	end
end

function stack.new()
	local newStack = {}
	newStack.list = {}
	newStack.count = 0
	newStack.top = nil
	return newStack
end

function stack.push(stackItem, data)
	table.insert(stackItem.list, data)
	_refreshBuff(stackItem)
end

function stack.pop(stackItem)
	table.remove(stackItem.list)
	_refreshBuff(stackItem)
end

function stack.top(stackItem)
	return stackItem.top
end

return stack
