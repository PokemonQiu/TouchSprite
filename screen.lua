-- screen.lua

require "TSLib"

require "./table"

local stack = require "./stack"

local screen = {}

screen.width,screen.height = getScreenSize()

--nLog("targetListStack.beforeNew: "..table.tostring(targetListStack))
local_var_target_list_stack = local_var_target_list_stack or stack.new()
--nLog("targetListStack.new")

local FIND_DEGREE = 90

function screen.pushTargetList(targetList)
	stack.push(local_var_target_list_stack, targetList)
	nLog("after screen.push("..table.tostring(local_var_target_list_stack)..")")
end

function screen.popTargetList()
	stack.pop(local_var_target_list_stack)
end

function screen.topTargetList()
	return local_var_target_list_stack.top
end

--[[
	table : {
		degree : 0~100			// 模糊度，默认80；color 和 image 都有效

		// 搜索范围，最多只能一个，在多个共存的情况下默认使用bounds，在都没有的情况下默认使用全屏；color 和 image 都有效
		bounds : {
			x : [number]
			y : [number]
			width : [number]
			height : [number]
		}						// Rect型搜索范围

		margin : {
			top : [number]
			left : [number]
			right : [number]
			bottom : [number]
		}						// Margin型搜索范围

		image : "image.png"		// 对象是图片的话，该属性为图片名；与 color 不能共存，共存时默认使用 image
		alpha = 0xffffff		// 对象是图片的话，该属性为透明色；只有在有 image 时候有效，默认为 0
		size : {
			width : [number]
			height : [number]
		}						// 对象是图片的话，该属性为尺寸；只有在有 image 时候有效

		color : 0xffffff		// 对象是颜色的话，该属性为中心色；与 image 不能共存，共存时默认使用 image
		position : {
			x : [number]
			y : [number]
		}						// 对象是颜色的话，该属性为中心坐标；只有该值存在的时候才可使用 screen.tap() 函数
		posandcolor : "||,||"	// 对象是颜色的话，该属性为特征值；该值存在则会自动调用高级查找
		ext : [bool]			// 对象是颜色的话，该属性为扩展标记；只有 posandcolor 存在才有效，默认为 false；为 true 时会调用高级扩展查找
	}
]]

local function _pointExist( point )
	if type(point) ~= "table" then point = nil end
	point = point or {x=-1, y=-1}
	point.x = point.x or -1
	point.y = point.y or -1
	if point.x ~= -1 and point.y ~= -1 then
		return true
	else
		return false
	end
end

local function _makePoint( x, y )
	return {["x"] = x, ["y"] = y}
end

local function _unmakePoint( point )
	return point.x,point.y
end

local function _getRegion( table )
	--return {x1 = 0, y1 = 0, x2 = screen.width - 1, y2 = screen.height - 1}
	if type(table.bounds) == "table" then
		local x			= table.bounds.x or 0
		local y			= table.bounds.y or 0
		local width		= table.bounds.width or (screen.width - x - 1)
		local height	= table.bounds.height or (screen.height - y - 1)
		return {x1 = x, y1 = y, x2 = x + width, y2 = y + height}
	elseif type(table.margin) == "table" then
		local top		= table.margin.top or 0
		local left		= table.margin.left or 0
		local right 	= table.margin.right or 0
		local bottom	= table.margin.bottom or 0
		return {x1 = left, y1 = top, x2 = screen.width - right, y2 = screen.height - bottom}
	else
		return {x1 = 0, y1 = 0, x2 = screen.width - 1, y2 = screen.height - 1}
	end
end

local function _findImage(imageTable)
	local image = imageTable.image
	local degree = imageTable.degree or FIND_DEGREE
	local alpha = imageTable.alpha or 0
	local region = _getRegion(imageTable)

	local x,y = findImageInRegionFuzzy(image, degree, region.x1, region.y1, region.x2, region.y2, alpha)
	
	local position = _makePoint(x, y)

	if _pointExist(position) then
		return position
	else
		return false
	end
end

local function _isColor( colorTable )
	local color = tonumber(colorTable.color)
	local x,y = colorTable.position.x,colorTable.position.y
	local degree = colorTable.degree or FIND_DEGREE

	local fl,abs = math.floor,math.abs
    degree = fl(0xff*(100-degree)*0.01)
    local r,g,b = fl(color/0x10000),fl(color%0x10000/0x100),fl(color%0x100)
    local rr,gg,bb = getColorRGB(x, y)
    if abs(r-rr)<degree and abs(g-gg)<degree and abs(b-bb)<degree then
        return colorTable.position
    else
    	return false
    end
end

local function _findColor( colorTable )
	local color = tonumber(colorTable.color)
	local degree = colorTable.degree or FIND_DEGREE
	local region = _getRegion(colorTable)

	local x,y = findColorInRegionFuzzy(color, degree, region.x1, region.y1, region.x2, region.y2)
	local position = _makePoint(x, y)
	if _pointExist(position) then
		return position
	else
		return false
	end
end

local function _findMultiColor( colorTable )
	local color = tonumber(colorTable.color)
	local posandcolor = colorTable.posandcolor
	local degree = colorTable.degree or FIND_DEGREE
	local region = _getRegion(colorTable)
	
	--[[toast(color)
	mSleep(2000)
	toast(posandcolor)
	mSleep(2000)
	toast(degree)
	mSleep(2000)
	toast(region)
	mSleep(2000)]]
	
	if colorTable.ext then
		--toast("ext")
		local ext = colorTable.ext
		ext.value = ext.value or "MIN"
		local path = ext.path or "y"
		local array = findMultiColorInRegionFuzzyExt(color, posandcolor, degree, region.x1, region.y1, region.x2, region.y2)
		if type(array) == "table" then
			--toast(Table.tostring(array))
			mSleep(5000)
			local res = {["x"] = -1, ["y"] = -1}
			if ext.value == "MIN" then
				for i,v in ipairs(array) do
					if i == 1 then 
						res = v
					elseif v[path] < res[path] then
						res = v
					end
				end
				return res
			elseif ext.value == "MAX" then
				for i,v in ipairs(array) do
					if i == 1 then
						res = v
					elseif v[path] > res[path] then
						res = v
					end
				end
				return res
			end
		else
			return false
		end
	else
		local x,y = findMultiColorInRegionFuzzy(color, posandcolor, degree, region.x1, region.y1, region.x2, region.y2)
		local position = _makePoint(x,y)
		--toast(Table.tostring(position))
		if _pointExist(position) then
			return position
		else 
			return false
		end
	end
end

local function _getTarget(targetName)
	if not type(screen.targetList) == "table" then return nil end
	return screen.targetList[targetName]
end

local function _tableName2TableTarget(tableName)
	local targetList = screen.topTargetList()
	if type(targetList) ~= "table" then
		dialog("Can not find table: ["..tableName.."]", 2)
		mSleep(2000)
		return nil
	end
	return targetList[tableName]
end

function screen.find(table)
	if type(table) == "string" then
		table = _tableName2TableTarget(table)
	end
	if type(table) ~= "table" then
	--	toast("table is not a table")
		return false
	end
	--toast(tostring(table.posandcolor))
	if type(table.image) == "string" then
		return _findImage(table)								-- 模糊找图
	elseif table.color and type(table.posandcolor) == "string" then
		--toast("_findMultiColor")
		return _findMultiColor(table)						-- 模糊多点找色（Ext）
	elseif table.color and _pointExist(table.position) then
		return _isColor(table)								-- 比较色
	elseif table.color then
		return _findColor(table)								-- 模糊找色
	end
	return false
end

function screen.tap(table)
	if type(table) == "string" then
		table = _tableName2TableTarget(table)
	end
	if type(table) ~= "table" then
		return false
	end
	
	if _pointExist(table.position) then 
		local x,y = table.position.x,table.position.y
		tap(x, y)
		if table.delay then mSleep(table.delay) end
		return true
	else
		return screen.safeTap(table)
	end
end

function screen.randomTap(table)
	if type(table) ~= "table" then table = {} end
	local region = _getRegion(table)
	local x = math.random(region.x1, region.x2)
	local y = math.random(region.y1, region.y2)
	tap(x, y)
	if table.delay then mSleep(table.delay) end
end

function screen.centerTap(delay)
	local x = screen.width / 2
	local y = screen.height / 2
	tap(x, y)
	if type(delay) == "number" then mSleep(delay) end
end

function screen.safeTap(table)
	local position = screen.find(table)
	if _pointExist(position) then
		tap(position.x, position.y)
		if table.delay then mSleep(table.delay) end
		return true
	else
		return false
	end
end

function screen.tapIfExist(table, complete, before)
	if table then
		if type(before) == "function" then
			before()
		end
		
		local res = screen.tap(table)
		
		if type(complete) == "function" then
			complete(res)
		end
	end
end

function screen.safeTapIfExist(table, complete, before)
	if table then
		if type(before) == "function" then
			before()
		end
		
		local res = screen.safeTap(table)
		
		if type(complete) == "function" then
			complete(res)
		end
	end
end

function screen.choose(table1, table2)
	if screen.find(table1) then
		return 1
	elseif screen.find(table2) then
		return 2
	else
		return false
	end
end

function screen.selecte(tableList)
	for i,v in ipairs(tableList) do
		if screen.find(v) then
			return i
		end
	end
	return false
end

function screen.pan(x, y, dire, dist)
	
end

function screen.slideDown(  )
	local x = screen.width / 2;
	local x = 3
	local endY = screen.height / 3;
	local beginY = endY * 2 
	touchDown(1, x, beginY)
	mSleep(30)
	for i=1,endY do
		touchMove(1, x, beginY - i)
		mSleep(2)
	end
	-- mSleep(30)
	touchUp(1, x, endY)
end

return screen
