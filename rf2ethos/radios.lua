local LCD_W, LCD_H = rf2ethos.getWindowSize()
local resolution = LCD_W .. "x" .. LCD_H

local supportedRadios = {
    -- TANDEM X20, TANDEM XE (800x480)
    ["784x406"] = {msp = {template = "/scripts/rf2ethos/templates/784x406.lua", inlinesize_mult = 1, text=1, helpQrCodeSize=100, navbuttonHeight=40, text = 1, buttonsPerRow = 5, buttonsPerRowSmall = 6, buttonWidth = 135, buttonHeight = 140, buttonPadding = 23, buttonWidthSmall = 120, buttonHeightSmall = 110, buttonPaddingSmall = 10, linePaddingTop = 8}},
    -- TANDEM X18, TWIN X Lite (480x320)
    ["472x288"] = {msp = {template = "/scripts/rf2ethos/templates/472x288.lua", inlinesize_mult = 1.28, text=2, helpQrCodeSize=70,  navbuttonHeight=30, navButtonOffset = 47, buttonsPerRow = 4, buttonsPerRowSmall = 5, buttonWidth = 110, buttonHeight = 110, buttonPadding = 8, buttonWidthSmall = 87, buttonHeightSmall = 97, buttonPaddingSmall = 7, linePaddingTop = 6}},
    -- Horus X10, Horus X12 (480x272)
    ["472x240"] = {msp = {template = "/scripts/rf2ethos/templates/472x240.lua", inlinesize_mult = 1.0715, text=1,  helpQrCodeSize=70,  navbuttonHeight=30, text = 2, buttonsPerRow = 4, buttonsPerRowSmall = 5, buttonWidth = 110, buttonHeight = 110, buttonPadding = 8, buttonWidthSmall = 87, buttonHeightSmall = 97, buttonPaddingSmall = 7, linePaddingTop = 6}},
   -- Twin X14 (632x314)
    ["632x314"] = {msp = {template = "/scripts/rf2ethos/templates/632x314.lua", inlinesize_mult = 1.11, text=2,helpQrCodeSize=100, navbuttonHeight=30, navButtonOffset = 47, buttonWidth = 95, text = 2, buttonsPerRow = 5, buttonsPerRowSmall = 6, buttonWidth = 112, buttonHeight = 120, buttonPadding = 15, buttonWidthSmall = 97, buttonHeightSmall = 97, buttonPaddingSmall = 8, linePaddingTop = 6}} 
}

local radio = assert(supportedRadios[resolution], resolution .. " not supported")

return radio
