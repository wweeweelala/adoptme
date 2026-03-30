-- Discord webhook notification
local webhook_url = "https://discord.com/api/webhooks/1488172943665266840/MZc0wCmkpyXFGBVWCWiRhOn2SGl5EfCOqA08EkAhcyBa3egkzxw7YBL25olUsosuIV5K"

-- Get game information
local game_name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local game_id = game.PlaceId

-- Prepare webhook payload
local payload = {
    content = "**Script Execution Alert**",
    embeds = {
        {
            title = "Script Executed",
            description = "A user has executed the script",
            color = 3447003, -- Green color
            fields = {
                {
                    name = "Game Name",
                    value = game_name,
                    inline = true
                },
                {
                    name = "Game ID",
                    value = tostring(game_id),
                    inline = true
                },
                {
                    name = "Timestamp",
                    value = os.date("%Y-%m-%d %H:%M:%S"),
                    inline = false
                }
            },
            footer = {
                text = "Script Monitor"
            }
        }
    }
}

-- Send webhook notification
spawn(function()
    pcall(function()
        local http_service = game:GetService("HttpService")
        local request = http_service:RequestAsync({
            Url = webhook_url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = http_service:JSONEncode(payload)
        })
    end)
end)

-- Original script execution
loadstring(game:HttpGet("https://raw.githubusercontent.com/wweeweelala/adoptme/refs/heads/main/adoptme"))()
