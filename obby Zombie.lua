local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

getgenv().killAura = false
getgenv().killAuraDelay = 1

local player = Players.LocalPlayer
local ZombieFolder = workspace:WaitForChild("AliveZombies")

-- อัปเดตตัวละครเสมอ
local function getChar()
    local char = player.Character or player.CharacterAdded:Wait()
    return char, char:WaitForChild("HumanoidRootPart"), char:WaitForChild("Humanoid")
end

local function kill()
    local char, rootPart = getChar()
    local backpack = player.Backpack

    for _, zombie in pairs(ZombieFolder:GetChildren()) do
        for _, tool in pairs(backpack:GetChildren()) do
            if tool:IsA("Tool") then
                local args = {
                    tool,                 -- ปืน
                    { zombie },           -- เป้าหมาย
                    true,                 -- ยิงโดน
                    rootPart.CFrame       -- ตำแหน่งผู้เล่น
                }

                ReplicatedStorage
                    :WaitForChild("Remotes")
                    :WaitForChild("Gunshot")
                    :FireServer(unpack(args))
            end
        end
    end
end
local WindUI = loadstring(game:HttpGet(
    "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
))()
local Window = WindUI:CreateWindow({
    Title = "BlackCrown-X",
    Icon = "door-open",
    Author = "by wdashsuicnsc and timxq_n.",
    KeySystem = {
        Key = { "" },                   -- กำหนดคีย์ที่ใช้ได้
        Note = "Enter your unlock key to open UI.",    -- ข้อความเตือน
        URL = "https://discord.gg/FzdCqV22Y",   -- ลิงก์ขอคีย์
        SaveKey = true,                                -- จดจำคีย์อัตโนมัติ
    },

    OpenButton = {
        Title = "Open UI",
        Icon = "monitor",
        CornerRadius = UDim.new(0, 16),
        StrokeThickness = 2,
        Color = ColorSequence.new(
            Color3.fromHex("FF0F7B"),
            Color3.fromHex("F89B29")
        ),
        OnlyMobile = false,
        Enabled = true,
        Draggable = true
    }
})

local Tab = Window:Tab({
    Title = "Main",
    Icon = "bird",
    Locked = false
})

local Input = Tab:Input({
    Title = "second",
    Value = "1",
    InputIcon = "bird",
    Type = "Input",
    Placeholder = "Enter seconds...",
    Callback = function(input)
        local num = tonumber(input)
        if num and num > 0 then
            getgenv().killAuraDelay = num
            print("Kill Aura delay set to:", num)
        else
            warn("กรุณาใส่ตัวเลขมากกว่า 0")
        end
    end
})

-- Toggle Kill Aura
Tab:Toggle({
    Title = "Kill Aura",
    Default = false,
    Callback = function(v)
        getgenv().killAura = v

        if v then
            task.spawn(function()
                while getgenv().killAura do
                    pcall(kill)
                    task.wait(getgenv().killAuraDelay)
                end
            end)
        end
    end
})
