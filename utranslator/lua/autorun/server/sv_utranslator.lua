-- Some variables
local translation_url = "http://devmentality.com:1313/translate"
local translation_key_url = "http://devmentality.com:1313/authenticate"
local translation_key = nil
local translation_id = "HG Zombie Survival Official"
local version = "1.0.0b"

-- Fetches the translation key from the translation server
function GetTranslationKey()
    hook.Remove("Think", "TranslatorGetKey")
    print("Getting translation key from translation server...")
    http.Post(translation_key_url, {id = translation_id}, function(result)
        if result then
            local _table = util.JSONToTable(result)
            --if(table.HasValue(_table, "key")) then
                translation_key = _table["key"]
                print("Translation key recieved from translation server")
            --end
            --if (table.HasValue(_table, "error")) then
               -- PrintTable(_table)
           -- end
        else
            print("No result")
        end
    end, function(failed)
        print("Failed to fetch translation key from server")
        local err = util.JSONToTable(failed)
		if err ~= nil and istable(err) then
			PrintTable(err)
		end
    end )
end

-- Send the translation server key and address to the player
function SendInfoToClient(ply)
    if IsValid(ply) and ply:IsBot() == false and translation_key ~= nil and translation_url ~= nil and translation_id ~= nil then
        net.Start("SendTranslationKey")
        net.WriteString(translation_key)
        net.Send(ply)

        net.Start("SendTranslationUrl")
        net.WriteString(translation_url)
        net.Send(ply)

        net.Start("SendTranslationId")
        net.WriteString(translation_id)
        net.Send(ply)
    end
end

-- Allows these network events to be used
util.AddNetworkString("SendTranslationKey")
util.AddNetworkString("SendTranslationUrl")
util.AddNetworkString("SendTranslationId")

-- Get the translation key from the translation server when this server starts
hook.Add("Think", "TranslatorGetKey", GetTranslationKey)

-- Send the translation server information to the clients when they join the server
hook.Add("PlayerInitialSpawn", "TranslatorSendInfo", SendInfoToClient)

print("UTranslator v" .. version)
