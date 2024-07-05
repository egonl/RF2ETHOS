local function calibrate(callback, callbackParam)
    local message =
    {
        command = 205, -- MSP_ACC_CALIBRATION
        processReply = function(self, buf)
            print("Accelerometer calibrated.")
            if callback then callback(callbackParam) end
        end,
        simulatorResponse = {}
    }
    rf2ethosmsp.mspQueue:add(message)
end

return {
    calibrate = calibrate
}