--addon name, addon namespace
local _, ans = ...;

-- To not have many digits in the number of a color value
local function ceilColor(color)
    return math.ceil(color*100)/100;
end

-- Transform three color numbers into a string for compare
local function colorToString(r, g, b, a)
    if (not a) then a = 1 end;
    return ceilColor(r) ..",".. ceilColor(g) ..",".. ceilColor(b) ..",".. ceilColor(a);
end

-- Util function to not duplicate frames
local function isFrameExist(name)
    local frame = _G[name];
    local result = false;

    if (frame and frame:GetObjectType() == "Frame") then
        result = true;
    end

    return result;
end

ans.isFrameExist = isFrameExist;