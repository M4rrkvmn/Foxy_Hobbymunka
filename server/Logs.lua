local FOXY_WEBBHOK = 'https://discord.com/api/webhooks/00000/'

function logToDiscord (message)
    local connect = {
        ["color"] = 16711680,
        ["title"] = "Foxy_HobbyMunka",
        ["description"] = message,
        ["fotter"] = {
            ["text"] = os.date("%Y-%m-%d %X"),
        }
    }
    PerformHttpRequest(FOXY_WEBBHOK, function (err,text,headers) end, 'POST',
    json.encode({username = "Foxy HobbyMunka - LOG", embeds = connect, avatar_url = ""}),
    { ['Content-Type'] = 'application/json'})
end