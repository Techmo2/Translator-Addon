local supported = util.JSONToTable([[
    [
    {
     "language": "af",
     "name": "Afrikaans"
    },
    {
     "language": "sq",
     "name": "Albanian"
    },
    {
     "language": "am",
     "name": "Amharic"
    },
    {
     "language": "ar",
     "name": "Arabic"
    },
    {
     "language": "hy",
     "name": "Armenian"
    },
    {
     "language": "az",
     "name": "Azerbaijani"
    },
    {
     "language": "eu",
     "name": "Basque"
    },
    {
     "language": "be",
     "name": "Belarusian"
    },
    {
     "language": "bn",
     "name": "Bengali"
    },
    {
     "language": "bs",
     "name": "Bosnian"
    },
    {
     "language": "bg",
     "name": "Bulgarian"
    },
    {
     "language": "ca",
     "name": "Catalan"
    },
    {
     "language": "ceb",
     "name": "Cebuano"
    },
    {
     "language": "ny",
     "name": "Chichewa"
    },
    {
     "language": "zh",
     "name": "Chinese (Simplified)"
    },
    {
     "language": "zh-TW",
     "name": "Chinese (Traditional)"
    },
    {
     "language": "co",
     "name": "Corsican"
    },
    {
     "language": "hr",
     "name": "Croatian"
    },
    {
     "language": "cs",
     "name": "Czech"
    },
    {
     "language": "da",
     "name": "Danish"
    },
    {
     "language": "nl",
     "name": "Dutch"
    },
    {
     "language": "en",
     "name": "English"
    },
    {
     "language": "eo",
     "name": "Esperanto"
    },
    {
     "language": "et",
     "name": "Estonian"
    },
    {
     "language": "tl",
     "name": "Filipino"
    },
    {
     "language": "fi",
     "name": "Finnish"
    },
    {
     "language": "fr",
     "name": "French"
    },
    {
     "language": "fy",
     "name": "Frisian"
    },
    {
     "language": "gl",
     "name": "Galician"
    },
    {
     "language": "ka",
     "name": "Georgian"
    },
    {
     "language": "de",
     "name": "German"
    },
    {
     "language": "el",
     "name": "Greek"
    },
    {
     "language": "gu",
     "name": "Gujarati"
    },
    {
     "language": "ht",
     "name": "Haitian Creole"
    },
    {
     "language": "ha",
     "name": "Hausa"
    },
    {
     "language": "haw",
     "name": "Hawaiian"
    },
    {
     "language": "iw",
     "name": "Hebrew"
    },
    {
     "language": "hi",
     "name": "Hindi"
    },
    {
     "language": "hmn",
     "name": "Hmong"
    },
    {
     "language": "hu",
     "name": "Hungarian"
    },
    {
     "language": "is",
     "name": "Icelandic"
    },
    {
     "language": "ig",
     "name": "Igbo"
    },
    {
     "language": "id",
     "name": "Indonesian"
    },
    {
     "language": "ga",
     "name": "Irish"
    },
    {
     "language": "it",
     "name": "Italian"
    },
    {
     "language": "ja",
     "name": "Japanese"
    },
    {
     "language": "jw",
     "name": "Javanese"
    },
    {
     "language": "kn",
     "name": "Kannada"
    },
    {
     "language": "kk",
     "name": "Kazakh"
    },
    {
     "language": "km",
     "name": "Khmer"
    },
    {
     "language": "ko",
     "name": "Korean"
    },
    {
     "language": "ku",
     "name": "Kurdish (Kurmanji)"
    },
    {
     "language": "ky",
     "name": "Kyrgyz"
    },
    {
     "language": "lo",
     "name": "Lao"
    },
    {
     "language": "la",
     "name": "Latin"
    },
    {
     "language": "lv",
     "name": "Latvian"
    },
    {
     "language": "lt",
     "name": "Lithuanian"
    },
    {
     "language": "lb",
     "name": "Luxembourgish"
    },
    {
     "language": "mk",
     "name": "Macedonian"
    },
    {
     "language": "mg",
     "name": "Malagasy"
    },
    {
     "language": "ms",
     "name": "Malay"
    },
    {
     "language": "ml",
     "name": "Malayalam"
    },
    {
     "language": "mt",
     "name": "Maltese"
    },
    {
     "language": "mi",
     "name": "Maori"
    },
    {
     "language": "mr",
     "name": "Marathi"
    },
    {
     "language": "mn",
     "name": "Mongolian"
    },
    {
     "language": "my",
     "name": "Myanmar (Burmese)"
    },
    {
     "language": "ne",
     "name": "Nepali"
    },
    {
     "language": "no",
     "name": "Norwegian"
    },
    {
     "language": "ps",
     "name": "Pashto"
    },
    {
     "language": "fa",
     "name": "Persian"
    },
    {
     "language": "pl",
     "name": "Polish"
    },
    {
     "language": "pt",
     "name": "Portuguese"
    },
    {
     "language": "pa",
     "name": "Punjabi"
    },
    {
     "language": "ro",
     "name": "Romanian"
    },
    {
     "language": "ru",
     "name": "Russian"
    },
    {
     "language": "sm",
     "name": "Samoan"
    },
    {
     "language": "gd",
     "name": "Scots Gaelic"
    },
    {
     "language": "sr",
     "name": "Serbian"
    },
    {
     "language": "st",
     "name": "Sesotho"
    },
    {
     "language": "sn",
     "name": "Shona"
    },
    {
     "language": "sd",
     "name": "Sindhi"
    },
    {
     "language": "si",
     "name": "Sinhala"
    },
    {
     "language": "sk",
     "name": "Slovak"
    },
    {
     "language": "sl",
     "name": "Slovenian"
    },
    {
     "language": "so",
     "name": "Somali"
    },
    {
     "language": "es",
     "name": "Spanish"
    },
    {
     "language": "su",
     "name": "Sundanese"
    },
    {
     "language": "sw",
     "name": "Swahili"
    },
    {
     "language": "sv",
     "name": "Swedish"
    },
    {
     "language": "tg",
     "name": "Tajik"
    },
    {
     "language": "ta",
     "name": "Tamil"
    },
    {
     "language": "te",
     "name": "Telugu"
    },
    {
     "language": "th",
     "name": "Thai"
    },
    {
     "language": "tr",
     "name": "Turkish"
    },
    {
     "language": "uk",
     "name": "Ukrainian"
    },
    {
     "language": "ur",
     "name": "Urdu"
    },
    {
     "language": "uz",
     "name": "Uzbek"
    },
    {
     "language": "vi",
     "name": "Vietnamese"
    },
    {
     "language": "cy",
     "name": "Welsh"
    },
    {
     "language": "xh",
     "name": "Xhosa"
    },
    {
     "language": "yi",
     "name": "Yiddish"
    },
    {
     "language": "yo",
     "name": "Yoruba"
    },
    {
     "language": "zu",
     "name": "Zulu"
    }
   ]
   ]])

local langmenu_open = false

-- Update our language on the server
function ChangeLanguage(lang)
    net.Start("ChangePlayerLanguage")
    net.WriteString(LocalPlayer():SteamID())
    net.WriteString(lang)
    net.SendToServer()
end

-- Create console vars if they dont exist, these will be saved on the user's local pc automatically
CreateClientConVar("translator_language", "en", true, false, "The language to use for the translator")
CreateClientConVar("translator_autodetect", "0", true, false, "Let the translation server determine the origional language of the text when it is translated")
CreateClientConVar("translator_enabled", "1", true, false, "Determines if the translator will translate or not")
LocalPlayer():SetNWString("language", GetConVar("translator_language"):GetString())

-- Be sure the server, and all clients know our language
--ChangeLanguage(GetConVar("translator_language"):GetString())

-- When the convar is changed, update the network var
cvars.AddChangeCallback("translator_language", function( cvar_name, old_value, new_value)
    ChangeLanguage(new_value)
    print("Language changed to '" .. new_value .. "'")
end )

-- Encodes a character as a percent encoded string
local function char_to_pchar(c)
	return string.format("%%%02X", c:byte(1,1))
end

-- Encodes special characters in a URI to make them valid
function encodeURI(text)
    return (text:gsub("[^%;%,%/%?%:%@%&%=%+%$%w%-%_%.%!%~%*%'%(%)%#]", char_to_pchar))
end

-- Translates a chat message then puts it in chat
-- Returns true on an error
function TranslatedChat(sender, bDead, bTeam, text, lang_from, lang_to)
    local err = false
    local req = "http://translate.googleapis.com/translate_a/single?client=gtx&sl=" .. lang_from .. "&tl=" .. lang_to .. "&dt=t&q=" .. encodeURI(text)
    --print("REQUEST: " .. req)
    http.Fetch(req, function(body, size, headers, code)
        local translated = util.JSONToTable(body)[1][1][1]
        --print(body)
        --print("------------------")
        --PrintTable(util.JSONToTable(body))
        local pieces, messageColor, nameColor = sender:getChatTag()
        local message = {}

        if bDead then
            table.insert(message, Color(255, 0, 0))
            table.insert(message, "*DEAD* ")
        end

        if bTeam then
            table.insert(message, Color(20, 160, 35))
            table.insert(message, " (TEAM) ")
        end

        if ATAG.Gamemode_TeamTag then
            table.insert(message, GAMEMODE:GetTeamColor(sender))
            table.insert(message, "(" .. team.GetName(sender:Team()) .. ") ")
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
            table.insert( message, GAMEMODE:GetTeamColor( sender ) )
        end
                    
        if atlaschat then
            table.insert(message, sender)
        else
            table.insert(message, sender:Nick())
        end

        if(translated ~= nil) then
            table.insert(message, Color(11, 97, 164))
            table.insert(message, " (")
            table.insert(message, Color(73, 171, 130))
            table.insert(message, lang_from)
            table.insert(message, Color(11, 97, 164))
            table.insert(message, ")")
        end

        if messageColor and messageColor ~= "" then
            table.insert( message, messageColor )
        else
            table.insert( message, Color( 255, 255, 255 ) )
        end
        
        if translated ~= nil then
            table.insert( message, ": " .. translated )
        else
            table.insert(message, ": " .. text)
        end

        chat.AddText( unpack( message ) )
    end, function(error)
        err = true
    end )
    return err
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
        LangList:AddLine(v["language"], v["name"])
    end

    LangList.OnRowSelected = function(first, index, pnl)
        GetConVar("translator_language"):SetString(pnl:GetColumnText(1))
        print("Language changed to '" .. pnl:GetColumnText(1) .. "'")
    end

    --[[
    local OptionEnabled = vgui.Create("DCheckBoxLabel", f)
    OptionEnabled:SetText("Enabled")
    OptionEnabled:SetConVar("translator_enabled")
    OptionEnabled:SetValue(GetConVar("translator_enabled"):GetInt())
    OptionEnabled:SizeToContents()
    ]]

    f.OnClose = function()
        langmenu_open = false
    end
end

hook.Add("OnPlayerChat", "TranslatorChat", function(ply, text, bTeam, bDead)
    local lang = LocalPlayer():GetNWString("language")
    local other_lang = ply:GetNWString("language")

    -- Don't translate if the translator is disabled
    if GetConVar("translator_enabled"):GetInt() == 0 then return end
    
    -- Don't translate your own messages
    if(ply == LocalPlayer()) then return end

    -- Don't translate if they speak the same language as you
    if lang == other_lang then return end

    -- Don't translate commands
    if(string.StartWith(text, "!")) then return end


    if(ply:IsValid()) then
        if TranslatedChat(ply, bDead, bTeam, text, other_lang, lang) == false then
            return true
        end
    end
end )

-- Open the language selection menu when f8 is pressed (key 99)
hook.Add("Think", "LangMenuOpen", function()
    if input.IsKeyDown(99) and langmenu_open == false then
        LanguageSelect(supported)
    end
end )

net.Receive("RequestLanguage", function()
    net.Start("ProvideLanguage")
    net.WriteString(LocalPlayer():SteamID())
    net.WriteString(GetConVar("translator_language"):GetString())
    net.SendToServer()
end )