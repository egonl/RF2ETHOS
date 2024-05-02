
local labels = {}
local fields = {}

local onOff = {
    [0] = "On",
    "Off"
}


labels[#labels + 1] = { t = "Scorpion ESC",            }



fields[#fields + 1] = { t = "Soft Start Time (s)",    min = 0, max = 60000, scale = 1000, mult = 1000, vals = { 61, 62 } }
fields[#fields + 1] = { t = "Runup Time (s)",         min = 0, max = 60000, scale = 1000, mult = 1000, vals = { 63, 64 } }
fields[#fields + 1] = { t = "Bailout (s)",            min = 0, max = 100000, scale = 1000, mult = 1000, vals = { 65, 66 } }

-- dont appear to be populated
-- fields[#fields + 1] = { t = "Stick Zero (us)",        x = x + indent, y = inc.y(lineSpacing * 2), sp = x + sp, vals = { 79, 80, 81, 82 } }
-- fields[#fields + 1] = { t = "Stick Max (us)",         x = x + indent, y = inc.y(lineSpacing), sp = x + sp, vals = { 75, 76, 77, 78 } }

-- data types are IQ22 - decoded/encoded by FC - regual scaled integers here
fields[#fields + 1] = { t = "Gov Proportional",       min = 30, max = 180, scale = 100, vals = { 67, 68, 69, 70 } }
fields[#fields + 1] = { t = "Gov Integral",           min = 150, max = 250, scale = 100, vals = { 71, 72, 73, 74 } }

fields[#fields + 1] = { t = "Motor Startup Sound",    min = 0, max = #onOff, vals = { 53, 54 }, table = onOff }

return {
    read        = 217, -- MSP_ESC_PARAMETERS
    write       = 218, -- MSP_SET_ESC_PARAMETERS
    eepromWrite = true,
    reboot      = false,
    title       = "Advanced Setup",
    minBytes    = mspBytes,
    labels      = labels,
    fields      = fields,

    svFlags     = 0,

    postLoad = function(self)
        -- esc type
        local l = self.labels[1]
        l.t = getEscType(self)

        -- SN
        l = self.labels[2]
        l.t = string.format("%08X", getUInt(self, { 55, 56, 57, 58 }))

        -- FW version
        l = self.labels[3]
        l.t = "v"..getUInt(self, { 59, 60 })
    end,
}
