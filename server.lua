local heist = {}

RegisterServerEvent("JustHeist:startheist")
AddEventHandler("JustHeist:startheist", function()
    heist[source] = 1
end)

RegisterServerEvent("JustHeist:checkifstarted")
AddEventHandler("JustHeist:checkifstarted", function()
    TriggerClientEvent("JustHeist:loadifstarted", source, heist)
    TriggerClientEvent("JustHeist:loadPolice", source, CountPolice())
end)

RegisterServerEvent("JustRigHeist:stopHeist")
AddEventHandler("JustRigHeist:stopHeist", function()
    heist[source] = nil
end)

RegisterServerEvent("JustRigHeist:pdAnnounce")
AddEventHandler("JustRigHeist:pdAnnounce", function(typeNotif)
    AnnouncePolice(typeNotif)
end)

RegisterServerEvent("JustRigHeist:complete")
AddEventHandler("JustRigHeist:complete", function()        
    if heist[source] ~= 1 then 
        return DropPlayer(source, "Injection Detected #1") 
    end

    heist = {}

    for i = 1, #Settings.Items do
        AddItem(source, Settings.Items[i].name, Settings.Items[i].count)
    end
end)

AddEventHandler('playerDropped', function()
    heist[source] = nil
end)
