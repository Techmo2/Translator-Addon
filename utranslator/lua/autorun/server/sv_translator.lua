local lang_table = {}

util.AddNetworkString("ChangePlayerLanguage")
util.AddNetworkString("RequestLanguage")
util.AddNetworkString("ProvideLanguage")


-- If a player changes their language, tell all other clients about the change
net.Receive("ChangePlayerLanguage", function()
    local ply = player.GetBySteamID(net.ReadString())
    local lang = net.ReadString()
    if IsValid(ply) and lang ~= nil and lang ~= "" then
        -- print(ply:Nick() .. " set language to " .. lang)
        ply:SetNWString("language", lang)
    end
end )

-- When the client sends its language, refresh languages
net.Receive("ProvideLanguage", function()
    local ply = player.GetBySteamID(net.ReadString())
    local lang = net.ReadString()

    ply:SetNWString("language", lang)
    --print("Client " .. ply:Nick() .. " provided language, refreshing NW vars")

    local num_players = table.Count(player.GetAll())
    if num_players > 0 then
        for k, v in pairs(player.GetAll()) do
            local _lang = v:GetNWString("language")

            if _lang == "" or _lang == nil then _lang = "en" end

            v:SetNWString("language", _lang)
        end
    end

    ply:ChatPrint("Translator Init Complete")

end )

-- When a player joins, request their language
hook.Add("PlayerInitialSpawn", "TranslatorPlayerJoined", function(ply)
    print("Player spawned, requesting language")
    timer.Simple(10, function()
        net.Start("RequestLanguage")
        net.Send(ply)
    end )
end )