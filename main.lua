-- BlackCrown Main Script

-- ===== Key System Placeholder =====
local function CheckKey()
    -- ตอนนี้ยังไม่เปิดใช้คีย์
    return true
end

if not CheckKey() then
    return
end

-- ===== Basic Protection =====
if not identifyexecutor then
    return
end

-- ===== Script Start =====
local a = "Black" .. "Crown"
print(a .. " Script Loaded Successfully")
