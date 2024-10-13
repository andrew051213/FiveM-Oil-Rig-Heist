local heist = {}

RegisterServerEvent("JustHeist:startHeist")
AddEventHandler("JustHeist:startHeist", function()
    heist[source] = 1
end)

RegisterServerEvent("JustHeist:checkIfStarted")
AddEventHandler("JustHeist:checkIfStarted", function()
    TriggerClientEvent("JustHeist:loadIfStarted", source, heist)
        
    TriggerClientEvent("JustHeist:loadPolice", source, CountPolice())
end)

RegisterServerEvent("JustHeist:stopHeist")
AddEventHandler("JustHeist:stopHeist", function()
    heist[source] = nil
end)

RegisterServerEvent("JustHeist:pdAnnounce")
AddEventHandler("JustHeist:pdAnnounce", function(typeNotif)
    AnnouncePolice(typeNotif)
end)

RegisterServerEvent("JustHeist:complete")
AddEventHandler("JustHeist:complete", function()        
    if heist[source] ~= 1 then 
        return DropPlayer(source, "Injection Detected #1") 
    end

    heist[source] = nil
        
    for i = 1, #Settings.Items do
        AddItem(source, Settings.Items[i].name, Settings.Items[i].count)
    end
end)

AddEventHandler('playerDropped', function()
    heist[source] = nil
end)
