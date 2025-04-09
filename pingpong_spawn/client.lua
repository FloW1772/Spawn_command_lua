RegisterCommand("pingpong", function()
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    --[[local model = GetHashKey("prop_patio_table_03")]] -- modèle d'une table verte
    local model = GetHashKey("prop_pingpong_table_01")

    -- Demande de chargement du modèle
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end

    -- Création de l'objet
    local tableObj = CreateObject(model, pos.x + 1.0, pos.y, pos.z - 1.0, true, true, true)

    -- Orientation et positionnement correct
    SetEntityHeading(tableObj, GetEntityHeading(playerPed))
    PlaceObjectOnGroundProperly(tableObj)

    -- Libère la mémoire du modèle
    SetModelAsNoLongerNeeded(model)

    -- Optionnel : message dans le chat
    TriggerEvent('chat:addMessage', {
        color = { 0, 255, 0 },
        multiline = true,
        args = { "[PingPong]", "Une table de ping-pong a été posée." }
    })
end, false)
