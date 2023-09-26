Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.MaxInventoryWeight = 200000000-- Max weight a player can carry (default 120kg, written in grams)
Config.MaxInventorySlots = 64 -- Max inventory slots for a player

Config.KeyBinds = {
    Inventory = 'TAB',
    HotBar = 'I'
}

Config.CleanupDropTime = 15 * 60 -- How many seconds it takes for drops to be untouched before being deleted
Config.MaxDropViewDistance = 12.5 -- The distance in GTA Units that a drop can be seen
Config.UseItemDrop = true -- This will enable item object to spawn on drops instead of markers
Config.ItemDropObject = `prop_nigel_bag_pickup` -- if Config.UseItemDrop is true, this will be the prop that spawns for the item

Config.VendingObjects = {
    "prop_vend_soda_01",
    "prop_vend_soda_02",
    "prop_vend_water_01"
}

Config.BinObjects = {
    "prop_bin_05a",
}

Config.CraftingObject = `prop_toolchest_05`

Config.VendingItem = {
    [1] = {
        name = "water",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 1,
    },
    [2] = {
        name = "ecola",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 2,
    },
    [3] = {
        name = "sprunk",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 3,
    },
    [4] = {
        name = "orangotang",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 4,
    },
    [5] = {
        name = "eggsandwich",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 5,
    },
    [6] = {
        name = "hamsandwich",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 6,
    },
    [7] = {
        name = "tunasandwich",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 7,
    },
}

Config.CraftingItems = {
}

Config.AttachmentCraftingLocation = vector3(88.91, 3743.88, 40.77)

Config.AttachmentCrafting = {
}

BackEngineVehicles = {
    [`ninef`] = true,
    [`adder`] = true,
    [`vagner`] = true,
    [`t20`] = true,
    [`infernus`] = true,
    [`zentorno`] = true,
    [`reaper`] = true,
    [`comet2`] = true,
    [`comet3`] = true,
    [`jester`] = true,
    [`jester2`] = true,
    [`cheetah`] = true,
    [`cheetah2`] = true,
    [`prototipo`] = true,
    [`turismor`] = true,
    [`pfister811`] = true,
    [`ardent`] = true,
    [`nero`] = true,
    [`nero2`] = true,
    [`tempesta`] = true,
    [`vacca`] = true,
    [`bullet`] = true,
    [`osiris`] = true,
    [`entityxf`] = true,
    [`turismo2`] = true,
    [`fmj`] = true,
    [`re7b`] = true,
    [`tyrus`] = true,
    [`italigtb`] = true,
    [`penetrator`] = true,
    [`monroe`] = true,
    [`ninef2`] = true,
    [`stingergt`] = true,
    [`surfer`] = true,
    [`surfer2`] = true,
    [`gp1`] = true,
    [`autarch`] = true,
    [`tyrant`] = true
}

Config.MaximumAmmoValues = {
    ["pistol"] = 250,
    ["smg"] = 250,
    ["shotgun"] = 200,
    ["rifle"] = 250,
}
