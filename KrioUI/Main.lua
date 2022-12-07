--addon name, addon namespace
local _, ans = ...;
local isFrameExist = ans.isFrameExist;
local krioUiFrameName = "KrioUiMainFrame";
local pveInstances = {"scenario", "party", "raid"};
local nonPvpInstances = {"scenario", "party", "raid", "none"};
rG,gG,bG,aG = 1,1,1,1;

local function arrayContainsItem(array, item)
    for key, value in pairs(array) do
        if value == item then return true end
    end
    return false
end

if  (not isFrameExist(krio)) then
    local frame = CreateFrame("Frame", krioUiFrameName);
    frame:RegisterEvent("PLAYER_ENTERING_WORLD");

    local function onEvent(self, event, ...)
        --Tracking when player log into the world (logging in, /reload-ing)
        if (event == "PLAYER_ENTERING_WORLD" or event) then
            local initialLogin, reloadingUI = ...;
            local inInstance, instanceType = IsInInstance();
            ans.setPlayerIsInPVEInstance(arrayContainsItem(pveInstances, instanceType));
            if hideQuestTracker == true and isInBattleground == true then
                ans.returnQuestTrackerToPreviousState(arrayContainsItem(nonPvpInstances, instanceType)); 
            end

            if (initialLogin or reloadingUI) then

                -- Load class colors
                ans.Setings_Load();
                -- Style unit frames with class color
                if (classColors == true) then
                    ans.classColor();
                end
                if (nameBackgroundColor == true) then
                    ans.nameBackgroundColor();
                end
                if (prestigeIcons == true) then
                    ans.removePrestigeIcons();
                                end
                if (outlineNameplates == true) then
                    ans.outlineOnNamePlates();
                end
                if (combatIndicator == true) then
                    ans.combatIndicator();
                end
                if (combatIndicatorPlayer == true) then
                    ans.combatIndicatorPlayer();
                end
                if (cornerIcon == true) then
                    ans.cornerIcon();
                end
                -- change color of Frames
                if (rG == 1 and gG == 1 and bG == 1) then
                    PlayerFrame.PlayerFrameContainer.FrameTexture:SetDesaturated(false)
                end
                
                PlayerFrame.PlayerFrameContainer.FrameTexture:SetVertexColor(rG,gG,bG)
                PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerPortraitCornerIcon:SetVertexColor(rG,gG,bG)
                TargetFrame.TargetFrameContainer.FrameTexture:SetVertexColor(rG,gG,bG)
                TargetFrameToT.FrameTexture:SetVertexColor(rG,gG,bG)
                FocusFrame.TargetFrameContainer.FrameTexture:SetVertexColor(rG,gG,bG)
                FocusFrameToT.FrameTexture:SetVertexColor(rG,gG,bG)
                PetFrameTexture:SetVertexColor(rG,gG,bG)
            end
        end
    end
    frame:SetScript("OnEvent", onEvent); 

    local bgQueuePopFrame = CreateFrame("Frame", "bgQueuePopFrame");
    bgQueuePopFrame:RegisterEvent("UPDATE_BATTLEFIELD_STATUS");

    local function onBGQueuePop(self, event, ...)
        if (hideQuestTracker == true) then
            -- ObjectiveTrackerFrame.collapsed returns true or nil
            isQuestTrackerCollapsed = ObjectiveTrackerFrame.collapsed
        end
    end

    bgQueuePopFrame:SetScript("OnEvent", onBGQueuePop);

    --Tracking event PLAYER_ENTERING_BATTLEGROUND to be able to specify if player enters battleground
    local changeAreaFrame = CreateFrame("Frame", "KrioUiAreaChangeFrame");
    changeAreaFrame:RegisterEvent("PLAYER_ENTERING_BATTLEGROUND");

    local function onEnterBattleground(self, event, ...)
        --collapse quest tracker on entering battleground
        if (hideQuestTracker == true) then
            isInBattleground = true;
            ObjectiveTracker_Collapse()
        end
    end

    changeAreaFrame:SetScript("OnEvent", onEnterBattleground);

end

-- Remove PlayerFrame glow effect in rested area
hooksecurefunc("PlayerFrame_UpdateStatus", function(self)
    local statusTexture = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.StatusTexture;
    if (IsResting() and restedGlowFX == true) then
        statusTexture:Hide();
        PlayerFrame_UpdatePlayerRestLoop(true);
    end
    if (cornerIcon == true) then
        ans.cornerIcon();
    end    
end)

-- Remove "zZZ" effect on PlayerFrame
hooksecurefunc("PlayerFrame_UpdatePlayerRestLoop", function(state)
    local playerRestLoop = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerRestLoop;
    if(state and restedZZZFx) then
        playerRestLoop:Hide();
        playerRestLoop.PlayerRestLoopAnim:Stop();
    end
end)

-- Remove red flash on Playerframe while in combat (melee)
hooksecurefunc("PlayerFrame_UpdateStatus", function(self)
    local combatStatusTexture = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.StatusTexture;
    local playerFrameTargetContextual = PlayerFrame_GetPlayerFrameContentContextual();
    local playerPortraitCornerIcon = playerFrameTargetContextual.PlayerPortraitCornerIcon;
    local attackIcon = playerFrameTargetContextual.AttackIcon;
    if (PlayerFrame.inCombat and redFlashInCombat == true) then
        combatStatusTexture:Hide();
    end
    --attackIcon:Hide();
end)

-- Add ClassIcons to target and focus frame
local TEXTURE_NAME = "Interface\\AddOns\\KrioUI\\Textures\\%s.tga"
hooksecurefunc("UnitFramePortrait_Update", function(self)
    if (classIconPortrait == true) then
        if self.portrait then
            if UnitIsPlayer(self.unit) then
                local _, class = UnitClass(self.unit)
                if (class) then
                    TargetFrame.portrait:SetTexture(TEXTURE_NAME:format(class))
                    FocusFrame.portrait:SetTexture(TEXTURE_NAME:format(class))
                end
            end
        end
    end
end)