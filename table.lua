-- table.lua

local tabCout = 0

if not table then table = {} end

local function _splitstring( spStr, separator )
	local list = {}
	
	if separator == "." then
		separator = "%."
	end
	
	local startPos = 1
	while (true) do
		local i,j = string.find(spStr,separator,startPos)
		--dialog(i .. "," .. j, 0)
		if i == nil or j == nil then
			table.insert(list,string.sub(spStr,startPos))
			break
		else
			table.insert(list,string.sub(spStr,startPos,i -1))
			startPos = j + 1
		end
	end
	
	return list
end

local function _keyIsNumber(key)
	local len = string.len(key)
	local start = string.sub(key, 1, 1)
	local stop = string.sub(key, len, len)
	return  start == "[" and stop == "]" 
end

local function _getNumberInKey(key)
	if _keyIsNumber(key) then
		local len = string.len(key)
		return tonumber(string.sub(key, 2, len - 1))
	else
		return nil
	end
end

local function _isTable(table)
	return type(table) == "table"
end

local function _tostring(table)
	if not _isTable(table) then 
		if type(table) == "string" then
			return "\""..table.."\""
		else
			return tostring(table)
		end
	end

	local content = ""
	tabCout = tabCout + 1
	for k,v in pairs(table) do
		if		type(k) == "string"	then k = "\""..k.."\""
		elseif	type(k) == "number"	then k = tostring(k)		end

		v = _tostring(v)

		content = content..string.rep("\t", tabCout)..k.." : "..v.."\n"
	end
	tabCout = tabCout - 1
	return "(\n"..content..string.rep("\t", tabCout)..")"
end

local function _copy(table)
	if not _isTable(table) then return table end
	
	local newTable = {}
	for k,v in pairs(table) do
		newTable[k] = _copy(v)
	end
	
	return newTable
end

function table.tostring(table)
	return _tostring(table)
end

function table.copy(table)
	return _copy(table)
end

function table.valueForPath(table, path)
	if not _isTable(table) then return nil end
	
	local strArray = _splitstring(path, ".")
	local obj = table
	for i,v in ipairs(strArray) do

		local num = _getNumberInKey(v)
		if num then v = num end

		if not obj[v] then return nil end
		obj = obj[v]

	end
	return obj
end

function table.setValueForPath( table, value, path )
	if not _isTable(table) then return nil end

	local strArray = _splitstring(path, ".")
	local count = #strArray
	local obj = table

	for i,v in ipairs(strArray) do
		
		local num = _getNumberInKey(v)
		if num then v = num end

		if i ~= count then
			if obj[v] == nil then
				return false
			else
				obj = obj[v]
			end
		else
			obj[v] = value
			return true
		end

	end

end

function table.first(table)
	if not _isTable(table) then
		return nil
	else
		return table[1]
	end
end

function table.last(table)
	if not _isTable(table) then
		return nil
	elseif #table == 0 then
		return nil
	else
		return table[#table]
	end
end

function table.index(table, obj)
	if not _isTable(table) then return nil end

	for i,v in ipairs(table) do
		if v == obj then return i end
	end
	return false
end

function table.getn(table)
	if not _isTable(table) then return nil end

	local count = 0
	for k,v in pairs(table) do count = count + 1 end
	return count
end

function table.getk(table)
	if not _isTable(table) then return nil end

	local count = 0
	for k,v in pairs(table) do
		if type(k) == "string" then count = count + 1 end
	end
	return count
end

function table.geti(table)
	if not _isTable(table) then return nil end
	
	local count = 0
	for k,v in pairs(table) do
		if type(k) == "number" then count = count + 1 end
	end
	return count
end




