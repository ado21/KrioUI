--addon name, addon namespace
local _, ans = ...;
local defaultColor = {r = 0, g = 0.9, b = 0.3};

local function updateColor(unit, frame)
    if UnitIsPlayer(unit) then
        classColor = RAID_CLASS_COLORS[select(2, UnitClass(unit))];
        frame:SetStatusBarDesaturated(true);
        frame:SetStatusBarColor(classColor.r, classColor.g, classColor.b);
    else
        frame:SetStatusBarDesaturated(false);
        frame:SetStatusBarColor(defaultColor.r, defaultColor.g, defaultColor.b);
    end
end 

--[[
    Change the text of target and focus frame name.
    Change the player, target and focus color.
]]--
local function classColor()
    -- player
    local classColor = RAID_CLASS_COLORS[select(2, UnitClass("player"))];
    local playerFrameHealthBar = PlayerFrame_GetHealthBar();
    playerFrameHealthBar:SetStatusBarDesaturated(true);
    playerFrameHealthBar:SetStatusBarColor(classColor.r, classColor.g, classColor.b);

    -- target and focus
    local frame = CreateFrame('Frame');
    frame:RegisterEvent("PLAYER_TARGET_CHANGED");
    frame:RegisterEvent("PLAYER_FOCUS_CHANGED");
    frame:SetScript("OnEvent", function(self, event, ...)
        if (event == "PLAYER_TARGET_CHANGED") then
            updateColor("target", TargetFrame.TargetFrameContent.TargetFrameContentMain.HealthBar);
        elseif (event == "PLAYER_FOCUS_CHANGED") then
            updateColor("focus", FocusFrame.TargetFrameContent.TargetFrameContentMain.HealthBar);
        end
    end)

    -- targettarget and focustarget
    hooksecurefunc("UnitFramePortrait_Update", function(self) 
        if self.unit == "targettarget" then
            updateColor("targettarget", TargetFrameToT.HealthBar);
        end
        if self.unit == "focustarget" then
            updateColor("focustarget", FocusFrameToT.HealthBar);
        end
    end);
end

ans.classColor = classColor;