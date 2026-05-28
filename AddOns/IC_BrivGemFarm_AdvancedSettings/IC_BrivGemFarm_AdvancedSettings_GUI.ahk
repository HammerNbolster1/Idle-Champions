; ############################################################
;                    Add tab to the GUI
; ############################################################
GUIFunctions.AddTab("BrivGF Advanced")

; ############################################################
;               Create the Gui of the tab here
; ############################################################
; Select the tab you created above
Gui, ICScriptHub:Tab, BrivGF Advanced

;g_BrivUserSettings[ "IgnoreBrivHaste" ]
;g_BrivUserSettings[ "ForceOfflineGemThreshold" ]
;g_BrivUserSettings[ "ForceOfflineRunThreshold" ]
;g_BrivUserSettings[ "BrivJumpBuffer" ]
;g_BrivUserSettings[ "DashWaitBuffer" ]
;g_BrivUserSettings[ "HiddenFarmWindow" ]
;g_BrivUserSettings[ "RestoreLastWindowOnGameOpen" ]
;g_BrivUserSettings[ "WindowXPosition" ]
;g_BrivUserSettings[ "WindowYPosition" ]
;g_BrivUserSettings[ "BrivLevelingThresholdsCount" ] 
;g_BrivUserSettings[ "BrivLevelingThresholds" ]
Class IC_BrivGemFarm_AdvancedSettings_GUI
{
    Init()
    {
        global
        Gui, ICScriptHub:Add, Checkbox, vOptionSettingCheck_HiddenFarmWindow x15 y+5, HiddenFarmWindow
        Gui, ICScriptHub:Add, Checkbox, vOptionSettingCheck_RestoreLastWindowOnGameOpen x15 y+5, RestoreLastWindowOnGameOpen
        Gui, ICScriptHub:Add, Checkbox, vOptionSettingEdit_IgnoreBrivHaste x15 y+5, IgnoreBrivHaste

        GUIFunctions.UseThemeTextColor("InputBoxTextColor")

        Gui, ICScriptHub:Add, Edit, vOptionSettingEdit_ForceOfflineGemThreshold Section x15 y+5 w50, % g_BrivUserSettings[ "ForceOfflineGemThreshold" ]
        Gui, ICScriptHub:Add, Edit, vOptionSettingEdit_ForceOfflineRunThreshold x15 y+10 w50, % g_BrivUserSettings[ "ForceOfflineRunThreshold" ]
        Gui, ICScriptHub:Add, Edit, vOptionSettingEdit_BrivJumpBuffer x15 y+10 w50, % g_BrivUserSettings[ "BrivJumpBuffer" ]
        Gui, ICScriptHub:Add, Edit, vOptionSettingEdit_DashWaitBuffer x15 y+10 w50, % g_BrivUserSettings[ "DashWaitBuffer" ]
        Gui, ICScriptHub:Add, Edit, vOptionSettingEdit_WindowXPosition x15 y+10 w50, % g_BrivUserSettings[ "WindowXPosition" ]
        Gui, ICScriptHub:Add, Edit, vOptionSettingEdit_WindowYPosition x15 y+10 w50, % g_BrivUserSettings[ "WindowYPosition" ]

        GUIFunctions.UseThemeTextColor()

        GuiControlGet, xyVal, ICScriptHub:Pos, OptionSettingEdit_ForceOfflineGemThreshold
        xyValX += 55
        xyValY += 5
        Gui, ICScriptHub:Add, Text, x%xyValX% y%xyValY%+10 vOptionSettingText_ForceOfflineGemThreshold, ForceOfflineGemThreshold
        Gui, ICScriptHub:Add, Text, x%xyValX% y+18 vOptionSettingText_ForceOfflineRunThreshold, ForceOfflineRunThreshold
        Gui, ICScriptHub:Add, Text, x%xyValX% y+18 vOptionSettingText_BrivJumpBuffer, BrivJumpBuffer
        Gui, ICScriptHub:Add, Text, x%xyValX% y+18 vOptionSettingText_DashWaitBuffer, DashWaitBuffer
        Gui, ICScriptHub:Add, Text, x%xyValX% y+18 vOptionSettingText_WindowXPosition, WindowXPosition
        Gui, ICScriptHub:Add, Text, x%xyValX% y+18 vOptionSettingText_WindowYPosition, WindowyPosition

        ; ############ Preferred Briv Jump Zones #####################

        GuiControlGet, xyVal, ICScriptHub:Pos, OptionSettingText_WindowYPosition
        xyValY += 35
        xyValX := 10

        Gui, ICScriptHub:Font, w700
        Gui, ICScriptHub:Add, Text, x10 y%xyValY% vOptionSettingText_TitlePreferredJump, Preferred Briv Jump Zones
        Gui, ICScriptHub:Font, w400

        local controlLoc := IC_BrivGemFarm_AdvancedSettings_Functions.BuildModTables(xyValX+20, xyValY)
        IC_BrivGemFarm_AdvancedSettings_Component.LoadAdvancedSettings()

        ; TODO preferred jump zones addon test
        ; Briv Leveling by Zone
        GuiControlGet, pos, ICScriptHub:Pos, PreferredBrivJumpSettingMod_50_50
        ySpacing := 10
        newW := 440
        ctrlH:= 21
        maxY := posY + posH + ySpacing
        newH := maxY - controlLoc[2]
        newH := maxY - posY
        levelingY := posY + newH + 10
        Gui, ICScriptHub:Add, Groupbox, Section xs y%levelingY% w%newW% vBrivLevelingGroup, Briv Leveling by Zone
        GUIFunctions.UseThemeTextColor("InputBoxTextColor")
        Gui, ICScriptHub:Add, Edit, w40 xs+%xSection% ys+20 Limit2 vBrivLevelingCount gBrivLevelingCount
        GUIFunctions.UseThemeTextColor()
        Gui, ICScriptHub:Add, Text, x+5 h%ctrlH% 0x200 vBrivLevelingCountText, Number of leveling zones (up to 15)
        Loop, 15
        {
            GUIFunctions.UseThemeTextColor("InputBoxTextColor")
            Gui, ICScriptHub:Add, Edit, w40 Hidden vBrivLevelingZone%A_Index% gBrivLevelingThresholds
            GUIFunctions.UseThemeTextColor()
            Gui, ICScriptHub:Add, Text, h%ctrlH% 0x200 Hidden vBrivLevelingZoneText%A_Index%, Zone
            GUIFunctions.UseThemeTextColor("InputBoxTextColor")
            Gui, ICScriptHub:Add, Edit, w40 Hidden vBrivLevelingLevel%A_Index% gBrivLevelingThresholds
            GUIFunctions.UseThemeTextColor()
            Gui, ICScriptHub:Add, Text, h%ctrlH% 0x200 Hidden vBrivLevelingLevelText%A_Index%, Lvl
        }
        ; Initial layout
        this.UpdateBrivLevelingRows(g_BrivUserSettings[ "BrivLevelingThresholdsCount" ] ? g_BrivUserSettings[ "BrivLevelingThresholdsCount" ] : 5)
        this.LoadBrivLevelingThresholds(g_BrivUserSettings[ "BrivLevelingThresholds" ], g_BrivUserSettings[ "BrivLevelingThresholdsCount" ])
        GuiControlGet, pos, ICScriptHub:Pos, BrivLevelingGroup
        posY := posY + posH + 15
        if(IsObject(IC_BrivGemFarm_Component))
        {
            Gui, ICScriptHub:Add, Picture, x15 y%posY% h50 w50 gBrivGemFarmAdvancedUpdateStatusAndClick vBrivGemFarmAdvancedSaveButton, %g_SaveButton%
            Gui, ICScriptHub:Add, Text, x+10 y+-33 w250 vBrivGemFarmAdvancedStatusText,
        }
        else
        {
            Gui, ICScriptHub:Add, Text, x10 y+30 w250 vBrivGemFarmAdvancedStatusText, Save settings using main Briv Gem Farm tab.
        }
    }

    LoadBrivLevelingThresholds(thresholds, count)
    {
        GuiControl, ICScriptHub:, BrivLevelingCount, % count
        Loop, 15
        {
            zone := thresholds[A_Index].zone
            level := thresholds[A_Index].level
            GuiControl, ICScriptHub:, BrivLevelingZone%A_Index%, % zone
            GuiControl, ICScriptHub:, BrivLevelingLevel%A_Index%, % level
        }
        this.UpdateBrivLevelingRows(count)
    }

    UpdateBrivLevelingRows(count)
    {
        GuiControlGet, b, ICScriptHub:Pos, BrivLevelingGroup
        if (!bW)
            return
        
        count := count == "" ? 0 : count
        countX := bX + 10
        countY := bY + 18
        
        ; Bug when using Move in a Tab control
        GuiControl, ICScriptHub:MoveDraw, BrivLevelingCount, x%countX% y%countY%
        GuiControlGet, bug, ICScriptHub:Pos, BrivLevelingCount
        offX := bugX - countX
        offY := bugY - countY
        
        countX -= offX
        countY -= offY
        
        GuiControl, ICScriptHub:MoveDraw, BrivLevelingCount, x%countX% y%countY%
        GuiControl, ICScriptHub:MoveDraw, BrivLevelingCountText, % "x" (countX + 45) " y" countY

        gridStartY := countY + 28
        maxY := gridStartY

        Loop, 15
        {
            if (A_Index <= count)
            {
                row := Ceil(A_Index / 3)
                col := Mod(A_Index - 1, 3)

                colX := bX + 10 + (col * 142) - offX
                rowY := gridStartY + (row - 1) * 28

                GuiControl, ICScriptHub:MoveDraw, BrivLevelingZone%A_Index%, x%colX% y%rowY%
                GuiControl, ICScriptHub:MoveDraw, BrivLevelingZoneText%A_Index%, % "x" (colX + 42) " y" rowY
                GuiControl, ICScriptHub:MoveDraw, BrivLevelingLevel%A_Index%, % "x" (colX + 75) " y" rowY
                GuiControl, ICScriptHub:MoveDraw, BrivLevelingLevelText%A_Index%, % "x" (colX + 117) " y" rowY                
                GuiControl, ICScriptHub:Show, BrivLevelingZone%A_Index%
                GuiControl, ICScriptHub:Show, BrivLevelingZoneText%A_Index%
                GuiControl, ICScriptHub:Show, BrivLevelingLevel%A_Index%
                GuiControl, ICScriptHub:Show, BrivLevelingLevelText%A_Index%
                
                maxY := rowY + 22
            }
            else
            {
                GuiControl, ICScriptHub:Hide, BrivLevelingZone%A_Index%
                GuiControl, ICScriptHub:Hide, BrivLevelingZoneText%A_Index%
                GuiControl, ICScriptHub:Hide, BrivLevelingLevel%A_Index%
                GuiControl, ICScriptHub:Hide, BrivLevelingLevelText%A_Index%
            }
        }
        
        if (count > 0)
            newH := maxY - (bY - offY) + 10
        else
            newH := countY + 28 - (bY - offY)
            
        GuiControl, ICScriptHub:MoveDraw, BrivLevelingGroup, h%newH%


        verticalDistance := newH - bH
		GUIFunctions.VerticalReposition("BrivGemFarmAdvancedStatusText", verticalDistance)
		GUIFunctions.VerticalReposition("BrivGemFarmAdvancedSaveButton", verticalDistance)
        if (isObject(IC_Advanced_PresetRoutes_Component))
        {
		    GUIFunctions.VerticalReposition("Advanced_PresetRoutes", verticalDistance)
		    GUIFunctions.VerticalReposition("APR_Header", verticalDistance)
		    GUIFunctions.VerticalReposition("APR_Set", verticalDistance)
		    GUIFunctions.VerticalReposition("APR_FeatSwapNote", verticalDistance)
        }
    }
}

IC_BrivGemFarm_AdvancedSettings_GUI.Init()

BrivLevelingThresholds()
{
    global
    thresholds := []
    GuiControlGet, count,, BrivLevelingCount
    Loop, % count
    {
        GuiControlGet, zone,, BrivLevelingZone%A_Index%
        GuiControlGet, level,, BrivLevelingLevel%A_Index%
        if (zone != "" AND level != "")
            thresholds.Push({"zone": zone, "level": level})
    }
    g_BrivUserSettings[ "BrivLevelingThresholds" ] := thresholds
}

BrivLevelingCount()
{
    global
    if ((value := GUIFunctions.ValidateIntegerInput(1, 15)) != "RETURN")
    {
        g_BrivUserSettings[ "BrivLevelingThresholdsCount" ] := value
        IC_BrivGemFarm_AdvancedSettings_GUI.UpdateBrivLevelingRows(value)
    }
}

BrivGemFarmAdvancedUpdateStatusAndClick()
{
    global BrivGemFarmAdvancedStatusText
    Briv_Save_Clicked()
    GUIFunctions.UpdateStatusTextWithClear(BrivGemFarmAdvancedStatusText, "Saved...", timer := 3000)
}

; ############################################################

IC_BrivGemFarm_AdvancedSettings_Component.AddToolTips()