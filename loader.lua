local placeId = game.PlaceId

if placeId == 79311273910901 then
    loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/T734-N/blackcrown-script/main/main.lua"
    ))()

elseif placeId == 135016292071266 or placeId == 97112073739947 then
    loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/T734-N/blackcrown-script/main/obby%20Zombie.lua"
    ))()

else
    warn("PlaceId ไม่รองรับ:", placeId)
end
