-- Variable to track auto-run state
local isAutoRunning = false

-- Function to toggle brightness effects
local function toggleBrightnessEffects(enabled)
    game:GetService("Lighting").ColorCorrection.Enabled = enabled
    game:GetService("Workspace").Camera.ColorCorrection.Enabled = enabled
    game:GetService("Workspace").Camera.Blur.Enabled = enabled
    game:GetService("Lighting").DepthOfField.Enabled = enabled
end

-- Function to handle player chat
local function onChatted(message)
    local prefixBrightness = ".brightness "
    local arg = message:sub(#prefixBrightness + 1):lower()
    
    if message:sub(1, #prefixBrightness) == prefixBrightness then
        if arg == "false" then
            if not isAutoRunning then
                isAutoRunning = true
                while isAutoRunning do
                    toggleBrightnessEffects(true)
                    wait(0.5)
                end
            end
        elseif arg == "true" then
            isAutoRunning = false
            toggleBrightnessEffects(false)
        else
            print("Invalid argument. Usage: .brightness true/false")
        end
    end
end

game:GetService("Players").LocalPlayer.Chatted:Connect(onChatted)
