local util = {}

-- generate_quads generates all the quads from the spritesheet given
function generate_quads(sheet)
	local quads = {}
	if sheet ~= nil then
		local xx, yy = sheet:getDimensions()
		local quad 
		for i = 0, xx - TILE_W, TILE_W do
			for j = 0, yy - TILE_H, TILE_H do
				quad = love.graphics.newQuad(j, i, j+TILE_W, i+TILE_H, xx, yy)
				table.insert(quads, quad)
			end
		end
	end
	return quads
end

--[[
    Recursive table printing function.
    https://coronalabs.com/blog/2014/09/02/tutorial-printing-table-contents/
]]
function print_r (t)
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end

return {
	generate_quads = generate_quads,
	print_r = print_r
}
