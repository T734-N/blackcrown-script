-- ==============================
-- PLACE ID CONFIG
-- ==============================

local SCRIPT_BY_PLACE = {
    [9412214742] = function()
        -- Script ตัวที่ 1
        loadstring(game:HttpGet("https://raw.githubusercontent.com/T734-N/blackcrown-script/refs/heads/main/main.lua"))()
    end,

    [9876543210] = function()
        -- Script ตัวที่ 2
        loadstring(game:HttpGet(
            "https://raw.githubusercontent.com/T734-N/blackcrown-script/refs/heads/main/obby%20Zombie.lua"
        ))()
    end
}

-- ==============================
-- PLACE CHECK
-- ==============================

local runScript = SCRIPT_BY_PLACE[game.PlaceId]

if not runScript then
    warn("PlaceId นี้ไม่รองรับ")
    return
end

-- ==============================
-- RUN SCRIPT
-- ==============================
runScript()
