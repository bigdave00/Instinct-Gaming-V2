# t3_warrantcards

> Add this function anywhere into *qb-policejob/client/job.lua*

```lua
local function SetWarrantData()
    for k,v in pairs(Config.Items.items) do
        if v.name == "warrant_card" then
            math.randomseed(GetGameTimer())
            PlayerData = QBCore.Functions.GetPlayerData()
            Config.Items.items[k].info = {
                number = math.random(10101,19999),
                firstname = PlayerData.charinfo.firstname,
                lastname = PlayerData.charinfo.lastname,
                jobgrade = PlayerData.job.grade.name
            }
        end
    end
end
```

> In the same file, edit this event...

```lua
RegisterNetEvent('qb-police:client:openArmoury', function()
    local authorizedItems = {
        label = Lang:t('menu.pol_armory'),
        slots = 30,
        items = {}
    }
    local index = 1
    for _, armoryItem in pairs(Config.Items.items) do
        for i=1, #armoryItem.authorizedJobGrades do
            if armoryItem.authorizedJobGrades[i] == PlayerJob.grade.level then
                authorizedItems.items[index] = armoryItem
                authorizedItems.items[index].slot = index
                index = index + 1
            end
        end
    end
    SetWeaponSeries()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "police", authorizedItems)
end)
```

> To this...

```lua
RegisterNetEvent('qb-police:client:openArmoury', function()
    SetWarrantData()
    local authorizedItems = {
        label = Lang:t('menu.pol_armory'),
        slots = 30,
        items = {}
    }
    local index = 1
    for _, armoryItem in pairs(Config.Items.items) do
        for i=1, #armoryItem.authorizedJobGrades do
            if armoryItem.authorizedJobGrades[i] == PlayerJob.grade.level then
                authorizedItems.items[index] = armoryItem
                authorizedItems.items[index].slot = index
                index = index + 1
            end
        end
    end
    SetWeaponSeries()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "police", authorizedItems)
end)
```

> In your *config.lua*, add this you your armoury items:

```lua
        [18] = {
            name = "warrant_card",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 18,
            authorizedJobGrades = {0, 1, 2, 3, 4}
        },
```
    
> Add this to your *qb-core/shared/items.lua*

```lua
	['warrant_card'] 				 = {['name'] = 'warrant_card', 				  	['label'] = 'Warrant Card', 			['weight'] = 0, 		['type'] = 'item', 		['image'] = 'warrant_card.png', 		['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Police Warrant Card'},
```