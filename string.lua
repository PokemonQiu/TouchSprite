-- string.lua

function string.split( spStr, separator )
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

function string.subTo(str, index)
	return string.sub(str, 1, index)
end

function string.subFrom(str, index)
	return string.sub(str, index, string.len(str))
end

function string.superPath(path, sepStr)
	if sepStr == nil then
		local s,_ = string.find(path, "/")
		local t,_ = string.find(path, "\\")
		if s then
			sepStr = "/"
		elseif t then
			sepStr = "\\"
		else
			sepStr = "/"
		end
	end
	
	local list = string.split(path, sepStr)
	if #list < 2 then return nil end
	
	local res = ""
	for i=1,(#list-1) do
		res = res..sepStr..list[i]
	end
	return string.subFrom(res, 2)
end

function string.getIP( ipStr )
	if string.find(ipStr, ":", 0) then 
		local table = string.split(ipStr, ":")
		return table[1]
	else
		return nil
	end
end

function string.getPort( ipStr )
	if string.find(ipStr, ":", 0) then
		local table = string.split(ipStr, ":")
		return tonumber(table[2])
	else
		return nil
	end
end

function string.splitAddress( ipStr )
	if string.find(ipStr, ":", 0) then
		local table = string.split(ipStr, ":")
		return table[1], tonumber(table[2])
	else
		return nil, nil
	end
end

