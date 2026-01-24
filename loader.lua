-- ==============================
-- PLACE ID CONFIG
-- ==============================
local SCRIPT_BY_PLACE = {
    [79311273910901] = "blade spin",
    [135016292071266] = "zombie obby",
    [97112073739947] = "zombie obby"
}

local SCRIPTS = {
    ["blade spin"] = function()
        loadstring(game:HttpGet(
            "https://raw.githubusercontent.com/T734-N/blackcrown-script/main/main.lua"
        ))()
    end,

    ["zombie obby"] = function()
        loadstring(game:HttpGet(
            "https://raw.githubusercontent.com/T734-N/blackcrown-script/main/obby%20Zombie.lua"
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
SCRIPTS[scriptKey]()
