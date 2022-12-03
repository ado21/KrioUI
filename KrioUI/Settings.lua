--addon name, addon namespace
local _, ans = ...;
local krioUiPanelName = "KrioMods";
local r,g,b,a = 1, 0, 0, 1;

r = rG;
g = gG;
b = bG;
a = aG;

classColors = false;
nameBackgroundColor = false;
prestigeIcons = false;
outlineNameplates = false;
combatIndicator = false;
restedGlowFX = false;
restedZZZFx = false;
redFlashInCombat = false;
cornerIcon = false;
combatIndicatorPlayer = false;
classIconPortrait = false;
hideQuestTracker = false;

local function Setings_Load()
    if  (not ans.isFrameExist(krioUiPanelName)) then
        
        local panel = CreateFrame("Frame")
        panel.name = "KrioUI"
        InterfaceOptions_AddCategory(panel)

        local title = panel:CreateFontString("ARTWORK", nil, "GameFontNormalLarge")
        title:SetPoint("TOPLEFT", 0, -10)
        title:SetText("|cffed8428Krio|rUI Settings")


        local settingsFrame = CreateFrame("Frame", "settingsFrame", panel)
        settingsFrame:SetPoint("TOPLEFT")
        settingsFrame:SetSize(600, 300)

            local classColorText = CreateFrame("MessageFrame", "classColorText", settingsFrame)
            classColorText:SetPoint("TOPLEFT")
            classColorText:SetSize(100, 150)
            classColorText.text = classColorText:CreateFontString("ARTWORK", nil, "GameFontNormal")
            classColorText.text:SetPoint("LEFT",0,10)
            classColorText.text:SetText("Add Class Colors to UnitFrames")

            local outlineOnNameplatesText = CreateFrame("MessageFrame", "outlineOnNameplatesText", settingsFrame)
            outlineOnNameplatesText:SetPoint("TOPLEFT")
            outlineOnNameplatesText:SetSize(100, 150)
            outlineOnNameplatesText.text = outlineOnNameplatesText:CreateFontString("ARTWORK", nil, "GameFontNormal")
            outlineOnNameplatesText.text:SetPoint("LEFT",0, -25)
            outlineOnNameplatesText.text:SetText("Add Outline to Nameplates")

            local combatIndicatorText = CreateFrame("MessageFrame", "combatIndicatorText", settingsFrame)
            combatIndicatorText:SetPoint("TOPLEFT")
            combatIndicatorText:SetSize(100, 150)
            combatIndicatorText.text = combatIndicatorText:CreateFontString("ARTWORK", nil, "GameFontNormal")
            combatIndicatorText.text:SetPoint("LEFT",0, -65)
            combatIndicatorText.text:SetText("Add Combat Indicator to Target/Focus")

            local combatIndicatorPlayerText = CreateFrame("MessageFrame", "combatIndicatorText", settingsFrame)
            combatIndicatorPlayerText:SetPoint("TOPLEFT")
            combatIndicatorPlayerText:SetSize(100, 150)
            combatIndicatorPlayerText.text = combatIndicatorPlayerText:CreateFontString("ARTWORK", nil, "GameFontNormal")
            combatIndicatorPlayerText.text:SetPoint("LEFT",0, -105)
            combatIndicatorPlayerText.text:SetText("Add Combat Indicator to PlayerFrame")

            local classIconsPortraitText = CreateFrame("MessageFrame", "combatIndicatorText", settingsFrame)
            classIconsPortraitText:SetPoint("TOPLEFT")
            classIconsPortraitText:SetSize(100, 150)
            classIconsPortraitText.text = classIconsPortraitText:CreateFontString("ARTWORK", nil, "GameFontNormal")
            classIconsPortraitText.text:SetPoint("LEFT",0, -145)
            classIconsPortraitText.text:SetText("Add Class Icons to Target/Focus Frame")

            local nameBackgroundColorText = CreateFrame("MessageFrame", "nameBackgroundColorText", settingsFrame)
            nameBackgroundColorText:SetPoint("TOPLEFT")
            nameBackgroundColorText:SetSize(100, 150)
            nameBackgroundColorText.text = nameBackgroundColorText:CreateFontString("ARTWORK", nil, "GameFontNormal")
            nameBackgroundColorText.text:SetPoint("LEFT",0, -185)
            nameBackgroundColorText.text:SetText("Remove Backround Behind PlayerNames")

            local prestigeIconsText = CreateFrame("MessageFrame", "prestigeIconsText", settingsFrame)
            prestigeIconsText:SetPoint("TOPLEFT")
            prestigeIconsText:SetSize(100, 150)
            prestigeIconsText.text = prestigeIconsText:CreateFontString("ARTWORK", nil, "GameFontNormal")
            prestigeIconsText.text:SetPoint("LEFT",0, -225)
            prestigeIconsText.text:SetText("Remove Prestige Icons on UnitFrames")

            local restedGlowEffectText = CreateFrame("MessageFrame", "restedGlowEffectText", settingsFrame)
            restedGlowEffectText:SetPoint("TOPLEFT")
            restedGlowEffectText:SetSize(100, 150)
            restedGlowEffectText.text = restedGlowEffectText:CreateFontString("ARTWORK", nil, "GameFontNormal")
            restedGlowEffectText.text:SetPoint("LEFT",0, -265)
            restedGlowEffectText.text:SetText("Remove rested GlowFX on PlayerFrame ")
            
            local restedZZZEffectText = CreateFrame("MessageFrame", "restedZZZEffectText", settingsFrame)
            restedZZZEffectText:SetPoint("TOPLEFT")
            restedZZZEffectText:SetSize(100, 150)
            restedZZZEffectText.text = restedZZZEffectText:CreateFontString("ARTWORK", nil, "GameFontNormal")
            restedZZZEffectText.text:SetPoint("LEFT",0, -305)
            restedZZZEffectText.text:SetText("Remove rested \"zzZ\" FX on PlayerFrame ")

            local portraitCornerIconText = CreateFrame("MessageFrame", "restedZZZEffectText", settingsFrame)
            portraitCornerIconText:SetPoint("TOPLEFT")
            portraitCornerIconText:SetSize(100, 150)
            portraitCornerIconText.text = portraitCornerIconText:CreateFontString("ARTWORK", nil, "GameFontNormal")
            portraitCornerIconText.text:SetPoint("LEFT",0, -345)
            portraitCornerIconText.text:SetText("Remove portrait corner icon (arrow) on PlayerFrame ")

            local redFlashInCombatText = CreateFrame("MessageFrame", "redFlashInCombatText", settingsFrame)
            redFlashInCombatText:SetPoint("TOPLEFT")
            redFlashInCombatText:SetSize(100, 150)
            redFlashInCombatText.text = redFlashInCombatText:CreateFontString("ARTWORK", nil, "GameFontNormal")
            redFlashInCombatText.text:SetPoint("LEFT",0, -385)
            redFlashInCombatText.text:SetText("Remove red flash while in combat on PlayerFrame")

            local hideQuestTrackerInBGText = CreateFrame("MessageFrame", "hideQuestTrackerInBGText", settingsFrame)
            hideQuestTrackerInBGText:SetPoint("TOPLEFT")
            hideQuestTrackerInBGText:SetSize(100, 150)
            hideQuestTrackerInBGText.text = hideQuestTrackerInBGText:CreateFontString("ARTWORK", nil, "GameFontNormal")
            hideQuestTrackerInBGText.text:SetPoint("LEFT",0, -425)
            hideQuestTrackerInBGText.text:SetText("Collapse Quest tracker on entering battleground")
            
            local frameColorText = CreateFrame("MessageFrame", "frameColorText", settingsFrame)
            frameColorText:SetPoint("TOPLEFT")
            frameColorText:SetSize(100, 150)
            frameColorText.text = frameColorText:CreateFontString("ARTWORK", nil, "GameFontNormal")
            frameColorText.text:SetPoint("LEFT",0, -465)
            frameColorText.text:SetText("Change color of frames to your preference")
            
            
            local classColorCheckBox = CreateFrame("CheckButton", nil, settingsFrame, "UICheckButtonTemplate")
            classColorCheckBox:SetPoint("TOPRIGHT", 0, -45)
            classColorCheckBox:SetChecked(classColors)
            classColorCheckBox:HookScript("OnClick", function()
                if classColors == true then
                    classColors = false
                else
                    classColors = true
                end
            end)

            local nameplateOutline = CreateFrame("CheckButton", nil, settingsFrame, "UICheckButtonTemplate")
            nameplateOutline:SetPoint("TOPRIGHT", 0, -85)
            nameplateOutline:SetChecked(outlineNameplates)
            nameplateOutline:HookScript("OnClick", function()
                if outlineNameplates == true then
                    outlineNameplates = false
                else
                    outlineNameplates = true
                end
            end)

            local combatIndicatorCheckbox = CreateFrame("CheckButton", nil, settingsFrame, "UICheckButtonTemplate")
            combatIndicatorCheckbox:SetPoint("TOPRIGHT", 0, -125)
            combatIndicatorCheckbox:SetChecked(combatIndicator)
            combatIndicatorCheckbox:HookScript("OnClick", function()
                if combatIndicator == true then
                    combatIndicator = false
                else
                    combatIndicator = true
                end
            end)

            local combatIndicatorPlayerCheckbox = CreateFrame("CheckButton", nil, settingsFrame, "UICheckButtonTemplate")
            combatIndicatorPlayerCheckbox:SetPoint("TOPRIGHT", 0, -165)
            combatIndicatorPlayerCheckbox:SetChecked(combatIndicatorPlayer)
            combatIndicatorPlayerCheckbox:HookScript("OnClick", function()
                if combatIndicatorPlayer == true then
                    combatIndicatorPlayer = false
                else
                    combatIndicatorPlayer = true
                end
            end)

            local classIconsPortraitCheckbox = CreateFrame("CheckButton", nil, settingsFrame, "UICheckButtonTemplate")
            classIconsPortraitCheckbox:SetPoint("TOPRIGHT", 0, -205)
            classIconsPortraitCheckbox:SetChecked(classIconPortrait)
            classIconsPortraitCheckbox:HookScript("OnClick", function()
                if classIconPortrait == true then
                    classIconPortrait = false
                else
                    classIconPortrait = true
                end
            end)

            local nameBackgroundColorCheckbox = CreateFrame("CheckButton", nil, settingsFrame, "UICheckButtonTemplate")
            nameBackgroundColorCheckbox:SetPoint("TOPRIGHT", 0, -245)
            nameBackgroundColorCheckbox:SetChecked(nameBackgroundColor)
            nameBackgroundColorCheckbox:HookScript("OnClick", function()
                if nameBackgroundColor == true then
                    nameBackgroundColor = false
                else
                    nameBackgroundColor = true
                end
            end)

            local prestigeIconsCheckbox = CreateFrame("CheckButton", nil, settingsFrame, "UICheckButtonTemplate")
            prestigeIconsCheckbox:SetPoint("TOPRIGHT", 0, -285)
            prestigeIconsCheckbox:SetChecked(prestigeIcons)
            prestigeIconsCheckbox:HookScript("OnClick", function()
                if prestigeIcons == true then
                    prestigeIcons = false
                else
                    prestigeIcons = true
                end
            end)

            local restedGlowEffectCheckbox = CreateFrame("CheckButton", nil, settingsFrame, "UICheckButtonTemplate")
            restedGlowEffectCheckbox:SetPoint("TOPRIGHT", 0, -325)
            restedGlowEffectCheckbox:SetChecked(restedGlowFX)
            restedGlowEffectCheckbox:HookScript("OnClick", function()
                if restedGlowFX == true then
                    restedGlowFX = false
                else
                    restedGlowFX = true
                end
            end)

            local restedZZZEffectCheckbox = CreateFrame("CheckButton", nil, settingsFrame, "UICheckButtonTemplate")
            restedZZZEffectCheckbox:SetPoint("TOPRIGHT", 0, -365)
            restedZZZEffectCheckbox:SetChecked(restedZZZFx)
            restedZZZEffectCheckbox:HookScript("OnClick", function()
                if restedZZZFx == true then
                    restedZZZFx = false
                else
                    restedZZZFx = true
                end
            end)

            local portraitCornerIconCheckbox = CreateFrame("CheckButton", nil, settingsFrame, "UICheckButtonTemplate")
            portraitCornerIconCheckbox:SetPoint("TOPRIGHT", 0, -405)
            portraitCornerIconCheckbox:SetChecked(cornerIcon)
            portraitCornerIconCheckbox:HookScript("OnClick", function()
                if cornerIcon == true then
                    cornerIcon = false
                else
                    cornerIcon = true
                end
            end)

            local redFlashInCombatCheckbox = CreateFrame("CheckButton", nil, settingsFrame, "UICheckButtonTemplate")
            redFlashInCombatCheckbox:SetPoint("TOPRIGHT", 0, -445)
            redFlashInCombatCheckbox:SetChecked(redFlashInCombat)
            redFlashInCombatCheckbox:HookScript("OnClick", function()
                if redFlashInCombat == true then
                    redFlashInCombat = false
                else
                    redFlashInCombat = true
                end
            end)
            local hideQuestTrackerInBGCheckbox = CreateFrame("CheckButton", nil, settingsFrame, "UICheckButtonTemplate")
            hideQuestTrackerInBGCheckbox:SetPoint("TOPRIGHT", 0, -485)
            hideQuestTrackerInBGCheckbox:SetChecked(hideQuestTracker)
            hideQuestTrackerInBGCheckbox:HookScript("OnClick", function()
                if hideQuestTracker == true then
                    hideQuestTracker = false
                else
                    hideQuestTracker = true
                end
            end)

            local frameColorButton = CreateFrame("Button", nil, settingsFrame, "UIPanelButtonTemplate")
            frameColorButton:SetPoint("TOPRIGHT",-200, -525)
            frameColorButton:SetSize(100 ,30)
            frameColorButton:SetText("Change Color")
            frameColorButton:SetPoint("CENTER")
            frameColorButton:HookScript("OnClick", function()
                ShowColorPicker(r,g,b);
            end)

            local applyColorButton = CreateFrame("Button", nil, settingsFrame, "UIPanelButtonTemplate")
            applyColorButton:SetPoint("TOPRIGHT",-100, -525)
            applyColorButton:SetSize(100 ,30)
            applyColorButton:SetText("Apply Color")
            applyColorButton:SetPoint("CENTER")
            applyColorButton:HookScript("OnClick", function()
                rG, gG, bG =  ColorPickerFrame:GetColorRGB();
                PlayerFrame.PlayerFrameContainer.FrameTexture:SetDesaturated(true)
                PlayerFrame.PlayerFrameContainer.FrameTexture:SetVertexColor(rG,gG,bG)
                PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerPortraitCornerIcon:SetVertexColor(rG,gG,bG)
                TargetFrame.TargetFrameContainer.FrameTexture:SetVertexColor(rG,gG,bG)
                TargetFrameToT.FrameTexture:SetVertexColor(rG,gG,bG)
                FocusFrame.TargetFrameContainer.FrameTexture:SetVertexColor(rG,gG,bG)
                FocusFrameToT.FrameTexture:SetVertexColor(rG,gG,bG)
                PetFrameTexture:SetVertexColor(rG,gG,bG)
            end)

            local defaultColorButton = CreateFrame("Button", nil, settingsFrame, "UIPanelButtonTemplate")
            defaultColorButton:SetPoint("TOPRIGHT",-0, -525)
            defaultColorButton:SetSize(100 ,30)
            defaultColorButton:SetText("Default Color")
            defaultColorButton:SetPoint("CENTER")
            defaultColorButton:HookScript("OnClick", function()
                PlayerFrame.PlayerFrameContainer.FrameTexture:SetDesaturated(false)
                PlayerFrame.PlayerFrameContainer.FrameTexture:SetVertexColor(1,1,1)
                PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerPortraitCornerIcon:SetVertexColor(1,1,1)
                TargetFrame.TargetFrameContainer.FrameTexture:SetVertexColor(1,1,1)
                TargetFrameToT.FrameTexture:SetVertexColor(1,1,1)
                FocusFrame.TargetFrameContainer.FrameTexture:SetVertexColor(1,1,1)
                FocusFrameToT.FrameTexture:SetVertexColor(1,1,1)
                PetFrameTexture:SetVertexColor(1,1,1)
                rG,gG,bG = 1,1,1;
            end)

            local reloadButton = CreateFrame("Button", nil, settingsFrame, "UIPanelButtonTemplate")
            reloadButton:SetPoint("BOTTOMLEFT",0, -296)
            reloadButton:SetSize(135, 42)
            reloadButton:SetText("Save Settings")
            reloadButton:SetPoint("CENTER")
            reloadButton:HookScript("OnClick", function()
                ReloadUI();
            end)
    end
end

local function nameBackgroundColor()
    -- remove colors on top of unit frame
    TargetFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetTexture(nil)
    FocusFrame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetTexture(nil)
end

local function removePrestigeIcons()
    -- remove prestigeIcons on unit frames
    PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PrestigeBadge:SetAlpha(
        0)
    PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PrestigePortrait:SetAlpha(
        0)
    TargetFrame.TargetFrameContent.TargetFrameContentContextual.PrestigePortrait:SetAlpha(
        0)
    TargetFrame.TargetFrameContent.TargetFrameContentContextual.PrestigeBadge:SetAlpha(
        0)
    FocusFrame.TargetFrameContent.TargetFrameContentContextual.PrestigePortrait:SetAlpha(
        0)
    FocusFrame.TargetFrameContent.TargetFrameContentContextual.PrestigeBadge:SetAlpha(
        0)
end

local function SetFont(obj, optSize)
    local fontName= obj:GetFont()
    obj:SetFont(fontName,optSize,"OUTLINE")
end

local function outlineOnNamePlates()
    SetFont(SystemFont_LargeNamePlate,11)
    SetFont(SystemFont_NamePlate,11)
    SetFont(SystemFont_LargeNamePlateFixed,11)
    SetFont(SystemFont_NamePlateFixed,11) 
end

local function combatIndicatorYPosition_byPrestige() 
    return prestigeIcons and 0 or 15
end

local function combatIndicator()
    if combatIndicator then
        local function combatIndicatorXPosition_byUnitClassification(unitClassification)
            local x = -20
           
            -- If unit is a elite
            local uC = UnitClassification(unitClassification)
            if ( uC == "elite" or uC == "rareelite" or uC == "rare" ) then
                x = -13
            end

            return x
        end

        local targetFrame = CreateFrame("Frame", nil , TargetFrame)
        targetFrame:SetPoint("LEFT", TargetFrame, "RIGHT", combatIndicatorXPosition_byUnitClassification("target"), combatIndicatorYPosition_byPrestige() + 1)
        targetFrame:SetSize(26,26)
        targetFrame.icon = targetFrame:CreateTexture(nil, "BORDER")
        targetFrame.icon:SetAllPoints()
        targetFrame.icon:SetTexture([[Interface\Icons\ABILITY_DUALWIELD]])
        targetFrame:Hide()

        local focusFrame = CreateFrame("Frame", nil , FocusFrame)
        focusFrame:SetPoint("LEFT", FocusFrame, "RIGHT", combatIndicatorXPosition_byUnitClassification("focus"), combatIndicatorYPosition_byPrestige())
        focusFrame:SetSize(26,26)
        focusFrame.icon = focusFrame:CreateTexture(nil, "BORDER")
        focusFrame.icon:SetAllPoints()
        focusFrame.icon:SetTexture([[Interface\Icons\ABILITY_DUALWIELD]])
        focusFrame:Hide()

        local UnitAffectingCombat = UnitAffectingCombat

        local function CombatIndicators_Update()
            -- target
            targetFrame:SetPoint("LEFT", TargetFrame, "RIGHT", combatIndicatorXPosition_byUnitClassification("target"), combatIndicatorYPosition_byPrestige() + 1)
            targetFrame:SetShown(UnitAffectingCombat("target"))
            -- focus
            focusFrame:SetPoint("LEFT", FocusFrame, "RIGHT", combatIndicatorXPosition_byUnitClassification("focus"), combatIndicatorYPosition_byPrestige())
            focusFrame:SetShown(UnitAffectingCombat("focus"))
        end

        C_Timer.NewTicker(0.01, CombatIndicators_Update)
    end
end

local function combatIndicatorPlayer() 
    if combatIndicatorPlayer then
        local playerFrame = CreateFrame("Frame", nil , PlayerFrame)
     
        playerFrame:SetPoint("LEFT", PlayerFrame, "LEFT", -10, combatIndicatorYPosition_byPrestige())
        playerFrame:SetSize(26,26)
        playerFrame.icon = playerFrame:CreateTexture(nil, "BORDER")
        playerFrame.icon:SetAllPoints()
        playerFrame.icon:SetTexture([[Interface\Icons\ABILITY_DUALWIELD]])
        playerFrame:Hide()

        local UnitAffectingCombat = UnitAffectingCombat

        local function CombatIndicator_Update()
            playerFrame:SetShown(UnitAffectingCombat("player"))
        end

        C_Timer.NewTicker(0.01, CombatIndicator_Update)
    end
end

local function cornerIcon()
    local playerFrameTargetContextual = PlayerFrame_GetPlayerFrameContentContextual();
    local playerPortraitCornerIcon = playerFrameTargetContextual.PlayerPortraitCornerIcon;
    playerPortraitCornerIcon:Hide();
end

--Show RGB pallete to pick players favorite color
function ShowColorPicker(r, g, b)
    ColorPickerFrame:SetColorRGB(r,g,b);
    ColorPickerFrame.previousValues = {r,g,b};
    ColorPickerFrame:Hide(); -- Need to run the OnShow handler.
    ColorPickerFrame:Show();
end

ans.removeRestedGlowEffect = removeRestedGlowEffect;
ans.combatIndicator = combatIndicator;
ans.outlineOnNamePlates = outlineOnNamePlates;
ans.removePrestigeIcons = removePrestigeIcons;
ans.nameBackgroundColor = nameBackgroundColor;
ans.Setings_Load = Setings_Load;
ans.cornerIcon = cornerIcon;
ans.combatIndicatorPlayer = combatIndicatorPlayer;