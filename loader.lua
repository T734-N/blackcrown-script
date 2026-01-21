-- ==============================
-- PLACE ID CONFIG
-- ==============================
local SCRIPT_BY_PLACE = {

    -- สคริปต์เดียวกัน แต่รันได้หลาย PlaceId
    [79311273910901] = "blade spin",

    -- อีกสคริปต์
    [135016292071266] = "zombie obby",
    [97112073739947] = "zombie obby"
}

local SCRIPTS = {
    blade spin = function()
        -- Script blade spin
        loadstring(game:HttpGet("https://raw.githubusercontent.com/T734-N/blackcrown-script/refs/heads/main/main.lua"))()
    end,

    zombie obby = function()
        -- Script zombie obby
        loadstring(game:HttpGet(
            "https://raw.githubusercontent.com/T734-N/blackcrown-script/refs/heads/main/obby%20Zombie.lua"
        ))()
    end
}

-- ==============================
-- PLACE CHECK
-- ==============================

local scriptKey = SCRIPT_BY_PLACE[game.PlaceId]
if not scriptKey then
    warn("❌ PlaceId นี้ไม่รองรับ:", game.PlaceId)
    return
end

SCRIPTS[scriptKey]()
