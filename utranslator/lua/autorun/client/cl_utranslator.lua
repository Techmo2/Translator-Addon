local translation_key = nil
local supported_languages = nil
local server_id = nil
local langmenu_open = false

CreateClientConVar("translator_address", "", true, false, "The url of the translation server's translation api")
CreateClientConVar("translator_language", "en", true, false, "The language to use for the translator")
CreateClientConVar("translator_autodetect", "0", true, false, "Let the translation server determine the origional language of the text when it is translated")
LocalPlayer():SetNWString("language", GetConVar("translator_language"):GetString())

-- When the convar is changed, update the network var
cvars.AddChangeCallback("translator_language", function( cvar_name, old_value, new_value)
    LocalPlayer():SetNWString("language", new_value)
    print("Language changed to '" .. LocalPlayer():GetNWString("language") .. "'")
end )

-- Helper function, easily get the boolean of translator_autodetect
function ShouldAutoDetect()
    if(GetConVar("translator_autodetect"):GetBool()) then return false else return true end
end

-- Fetch the supported languages from microsoft
function GetSupportedLanguages()
    http.Fetch('https://api.cognitive.microsofttranslator.com/languages?api-version=3.0', function(body, len, headers, code)
        supported_languages = util.JSONToTable(body)["translation"]
    end, function(error) 
        print('[ERR] UniversalTranslator: Failed to fetch language list from microsoft.')
    end )
end

-- Send a translation request to the translation server, then print the message to chat when a translation is recieved
function PrintTranslation(_text, _language_to, _language_from, _sender, _team, _dead)
    if translation_key ~= nil and GetConVar("translator_address"):GetString() ~= "" and supported_languages ~= nil then
        http.Post(GetConVar("translator_address"):GetString(), {id = server_id, key = translation_key, text = _text, to = _language_to, from = _language_from, auto = --[[GetConVar("translator_autodetect"):GetString()]]"0"}, function(result)
            if result then
                -- Print translated chat message
                local _table = util.JSONToTable(result)
                --PrintTable(_table)
                local pieces, messageColor, nameColor = _sender:getChatTag()

                local message = {}

                if _dead then
                    table.insert(message, Color(255, 0, 0))
                    table.insert(message, "*DEAD* ")
                end

                if _team then
                    table.insert(message, Color(20, 160, 35))
                    table.insert(message, " (TEAM) ")
                end

                if ATAG.Gamemode_TeamTag then
                    table.insert(message, GAMEMODE:GetTeamColor(_sender))
                    table.insert(message, "(" .. team.GetName(_sender:Team()) .. ") ")
                end

                if pieces then
                if ( #pieces > 0 ) then
                    for k, v in pairs( pieces ) do
                        table.insert( message, v.color or Color( 255, 255, 255 ) )
                        table.insert( message, v.name or "" )
                    end
                else
                    table.insert( message, Color( 255, 255, 255 ) )
                end
                end
                            
                if nameColor and nameColor ~= "" then
                    table.insert( message, nameColor )
                elseif ATAG.Gamemode_TeamColor then
                    table.insert( message, GAMEMODE:GetTeamColor( _sender ) )
                end
                            
                if atlaschat then
                    table.insert(message, _sender)
                else
                    table.insert(message, _sender:Nick())
                end

                table.insert(message, Color(255, 50, 200))
                table.insert(message, " (")
                table.insert(message, Color(50, 50, 255))
                table.insert(message, _language_from)
                table.insert(message, Color(255, 50, 200))
                table.insert(message, ")")

                if messageColor and messageColor ~= "" then
                    table.insert( message, messageColor )
                else
                    table.insert( message, Color( 255, 255, 255 ) )
                end
                
                table.insert( message, ": " .. _table[1]["translations"][1]["text"] )

                print("Message Table:")
                --PrintTable(message) 
                chat.AddText( unpack( message ) )
            end
        end, function(failed)
            print("Translation failed")
            local pieces, messageColor, nameColor = _sender:getChatTag()

            local message = {}

            if _dead then
                table.insert(message, Color(255, 0, 0))
                table.insert(message, "*DEAD* ")
            end

            if _team then
                table.insert(message, Color(20, 160, 35))
                table.insert(message, " (TEAM) ")
            end

            if ATAG.Gamemode_TeamTag then
                table.insert(message, GAMEMODE:GetTeamColor(_sender))
                table.insert(message, "(" .. team.GetName(_sender:Team()) .. ") ")
            end

            if pieces then
            if ( #pieces > 0 ) then
                for k, v in pairs( pieces ) do
                    table.insert( message, v.color or Color( 255, 255, 255 ) )
                    table.insert( message, v.name or "" )
                end
            else
                table.insert( message, Color( 255, 255, 255 ) )
            end
            end
                        
            if nameColor and nameColor ~= "" then
                table.insert( message, nameColor )
            elseif ATAG.Gamemode_TeamColor then
                table.insert( message, GAMEMODE:GetTeamColor( _sender ) )
            end
                        
            if atlaschat then
                table.insert(message, _sender)
            else
                table.insert(message, _sender:Nick())
            end

            if messageColor and messageColor ~= "" then
                table.insert( message, messageColor )
            else
                table.insert( message, Color( 255, 255, 255 ) )
            end
            
            table.insert( message, ": " .. _text )
            
            print("Message Table:")
            --PrintTable(message) 
            chat.AddText( unpack( message ) )
        end )        
    else
        print("Translation info missing, translations disabled")
        if(translation_key == nil) then
            print("Missing translation key")
        end

        if(GetConVar("translator_address"):GetString() == "") then
            print("Missing translation url")
        end

        if(supported_languages == nil) then
            print("Missing supported languages")
        end

        local pieces, messageColor, nameColor = _sender:getChatTag()
        --if not pieces then 
            --print("no pieces") 
            --return 
        --end

        local message = {}

        if _dead then
            table.insert(message, Color(255, 0, 0))
            table.insert(message, "*DEAD* ")
        end

        if _team then
            table.insert(message, Color(20, 160, 35))
            table.insert(message, " (TEAM) ")
        end

        if ATAG.Gamemode_TeamTag then
            table.insert(message, GAMEMODE:GetTeamColor(_sender))
            table.insert(message, "(" .. team.GetName(_sender:Team()) .. ") ")
        end

        if pieces then
        if ( #pieces > 0 ) then
            for k, v in pairs( pieces ) do
                table.insert( message, v.color or Color( 255, 255, 255 ) )
                table.insert( message, v.name or "" )
            end
        else
            table.insert( message, Color( 255, 255, 255 ) )
        end
        end
                    
        if nameColor and nameColor ~= "" then
            table.insert( message, nameColor )
        elseif ATAG.Gamemode_TeamColor then
            table.insert( message, GAMEMODE:GetTeamColor( _sender ) )
        end
                    
        if atlaschat then
            table.insert(message, _sender)
        else
            table.insert(message, _sender:Nick())
        end

        if messageColor and messageColor ~= "" then
            table.insert( message, messageColor )
        else
            table.insert( message, Color( 255, 255, 255 ) )
        end
        
        table.insert( message, ": " .. _text )
        
        print("Message Table:")
        --PrintTable(message) 
        chat.AddText( unpack( message ) )
    end
end

-- Open the language selection menu
function LanguageSelect(_supported)
    langmenu_open = true
    local f = vgui.Create("DFrame")
    f:SetSize(500, 500)
    f:Center()
    f:MakePopup()

    local LangList = vgui.Create("DListView", f)
    LangList:Dock(FILL)
    LangList:SetMultiSelect(false)
    LangList:AddColumn("Code")
    LangList:AddColumn("Language")

    for k, v in pairs(_supported) do
        LangList:AddLine(k, v["name"] .. " (" .. v["nativeName"] .. ")")
    end

    LangList.OnRowSelected = function(first, index, pnl)
        GetConVar("translator_language"):SetString(pnl:GetColumnText(1))
        LocalPlayer():SetNWString("language", pnl:GetColumnText(1))
        print("Language changed to '" .. LocalPlayer():GetNWString("language") .. "'")
    end

    f.OnClose = function()
        langmenu_open = false
    end
end

-- When the server sends the translator security key, store it
net.Receive("SendTranslationKey", function()
    translation_key = net.ReadString()
    print("Translation key recieved")
end )

-- When the server sends the translator url, store it
net.Receive("SendTranslationUrl", function()
    GetConVar("translator_address"):SetString(net.ReadString())
    print("Translation URL recieved")
end )

-- When the server sends it's translation id, store it
net.Receive("SendTranslationId", function()
    server_id = net.ReadString()
    print("Translation Id recieved")
end )

GetSupportedLanguages()

hook.Add("OnPlayerChat", "TranslatorChat", function(ply, text, bTeam, bDead)
    -- Don't translate your own messages
    if(ply == LocalPlayer()) then return end

    -- Don't translate if they speak the same language as you
    if(ply:GetNWString("language") == GetConVar("translator_language"):GetString()) then return end

    -- Don't translate commands
    if(string.StartWith(text, "!")) then return end

    if(ply:IsValid()) then

        --if(lang == ply:GetNWString("language")) then return end
        --if(GetConVar("translator_autodetect") == "1") then
            PrintTranslation(text, GetConVar("translator_language"):GetString(), ply:GetNWString("language"), ply, bTeam, bDead)
            return true
        --else
            --PrintTranslation(text, GetConVar("translator_language"):GetString(), "", ply, bTeam, bDead)
            --return true
        --end
    end
end )

-- Open the language selection menu when f8 is pressed (key 99)
hook.Add("Think", "LangMenuOpen", function()
    if input.IsKeyDown(99) and supported_languages ~= nil and langmenu_open == false then
        LanguageSelect(supported_languages)
    end
end )